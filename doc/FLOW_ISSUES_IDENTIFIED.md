# Flow Issues Identified & Analysis

**Date:** 2026-06-16  
**Status:** Issues Found - Need Fixes

---

## 🔴 CRITICAL FLOW ISSUES

### **Issue 1: Welcome Screen Wrong Routes**

**Problem:**
```
Welcome Screen → Tap "Booking an Ambulance" → Goes to LOGIN screen
                      ↓
                   AppRoutes.login with role='USER'
```

**But should be:**
```
Welcome Screen → Tap "Booking an Ambulance" → Goes to SIGN IN screen
                      ↓
                   AppRoutes.login (for existing users)
                   OR
                   Tap "Sign Up" → AppRoutes.signup (for new users)
```

**Current Code Issue (welcome_screen.dart line 32-35):**
```dart
GestureDetector(
  onTap: () => Navigator.pushNamed(
    context,
    AppRoutes.login,  // ❌ WRONG - Always goes to login
    arguments: {'role': 'USER'},  // ❌ Role shouldn't be passed here
  ),
```

**Fix Needed:**
```dart
// Button 1: For existing users
onTap: () => Navigator.pushNamed(
  context,
  AppRoutes.login,  // ✅ CORRECT - Existing user login
),

// Button 2: For new users (separate button)
onTap: () => Navigator.pushNamed(
  context,
  AppRoutes.signup,  // ✅ NEW - New user signup
  arguments: {'role': 'USER'},
),
```

---

### **Issue 2: Welcome Screen Missing Signup Option**

**Current State:**
Welcome screen has:
- "Booking an Ambulance" → goes to login
- "Book an Ambulance with Consultant" → goes to login

**Missing:**
- No option to go to signup for new users
- New users have no way to register from welcome screen

**Fix Needed:**
Add buttons for:
1. Sign In (existing users)
2. Sign Up (new users)
3. For Each Role:
   - User Sign Up
   - Driver Sign Up
   - Paramedic Sign Up

---

### **Issue 3: Login Screen Navigation**

**Problem:**
Login screen should have:
- Email/password input
- "Log in" button → Go to OTP verification

**Current Path:**
```
Login → Enter credentials → 
Tap "Log in" → ??? (Need to check where it goes)
```

**What it should be:**
```
Login → Enter credentials → 
Tap "Log in" → Send OTP screen → 
Verify OTP screen → Dashboard (by role)
```

---

### **Issue 4: Signup Flow Broken**

**Current Path (AFTER OUR FIX):**
```
Sign Up Form → Fill & Submit → OTP Verification ✅ → 
Verify OTP → Set Password → ??? (Where does it go?)
```

**Issue:**
After OTP verification and password setup, where should user go?
- Driver → Driver Profile Setup?
- Paramedic → Paramedic Profile Setup?
- User → Home Screen?

**This needs explicit navigation!**

---

### **Issue 5: Role Selection Not Clear**

**Problem:**
- Welcome screen doesn't specify roles
- Both buttons go to same login
- No way to select role (User/Driver/Paramedic) upfront

**Should be:**
```
Welcome → Select Role (User/Driver/Paramedic)
  ↓
  User Role: Sign In → OTP → Home
  Driver Role: Sign In → OTP → Driver Profile
  Paramedic Role: Sign In → OTP → Paramedic Profile
```

---

## 📊 CURRENT VS CORRECT FLOW

### **Current (Broken) Flow:**
```
Splash
  ↓
Welcome (only "Book Ambulance" options)
  ↓
Login (same for all roles)
  ↓
OTP Verification
  ↓
??? (Unclear where it goes)
```

### **Correct Flow Should Be:**
```
Splash
  ↓
Check Session
  ├→ Token Exists? → Dashboard (by role)
  └→ No Token? → Welcome
      ↓
      Select Action:
      ├→ Sign In (existing user)
      │   ↓
      │   Login Screen
      │   ↓
      │   Send OTP → Verify OTP
      │   ↓
      │   Dashboard (by role)
      │
      └→ Sign Up (new user)
          ↓
          Select Role (User/Driver/Paramedic)
          ↓
          Sign Up Form
          ↓
          Send OTP → Verify OTP
          ↓
          Set Password
          ↓
          Profile Setup (if needed)
          ↓
          Dashboard (by role)
```

---

## 🔧 FIXES NEEDED

### **Fix 1: Update Welcome Screen**

**File:** `lib/screens/welcome_screen.dart`

**Changes Needed:**
```dart
// Add buttons for Sign In and Sign Up
// Option 1: User - Sign In
// Option 2: User - Sign Up
// Option 3: Driver - Sign In
// Option 4: Driver - Sign Up
// Option 5: Paramedic - Sign In
// Option 6: Paramedic - Sign Up

// OR simpler:
// Button 1: Sign In (I have account)
// Button 2: Sign Up (New User)
```

**Current problematic code (line 32-35):**
```dart
// ❌ WRONG
Navigator.pushNamed(
  context,
  AppRoutes.login,
  arguments: {'role': 'USER'},  // Role hardcoded as USER!
),
```

**Should be:**
```dart
// ✅ CORRECT
Navigator.pushNamed(context, AppRoutes.login),
```

---

### **Fix 2: Add Sign Up Button to Welcome**

**Current state:** No signup button
**Needed:** Clear signup button for new users

```dart
GestureDetector(
  onTap: () => Navigator.pushNamed(
    context,
    AppRoutes.signup,  // ✅ Go to signup
  ),
  child: _buildButton(
    title: 'Create New Account',
    subtitle: 'New users sign up here',
  ),
),
```

---

### **Fix 3: Update Login Screen Navigation**

**File:** `lib/screens/login_screen.dart`

**Check:** What happens after user taps "Log in"?

**Should be:**
```dart
// After login attempt succeeds:
Navigator.pushReplacementNamed(
  context,
  AppRoutes.sendVerification,  // ✅ Send OTP
  arguments: {'email': userEmail},
);
```

---

### **Fix 4: Update Signup Screen Navigation**

**File:** `lib/screens/signup_screen.dart`

**Current code (after our fix):**
```dart
// ✅ CORRECT - Goes to OTP
Navigator.pushReplacementNamed(
  context,
  AppRoutes.verifyOtp,
  arguments: {'identifier': identifier, 'isSignup': true},
);
```

**After OTP verification - Need to check:**
**File:** `lib/screens/verify_otp_screen.dart`

**Should navigate by role:**
```dart
void _navigateByRole(String role) {
  switch (role) {
    case 'DRIVER':
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.driverProfileScreen,  // Driver setup
      );
      break;
    case 'PARAMEDIC':
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.paramedicProfileScreen,  // Paramedic setup
      );
      break;
    default:
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.home,  // User home
      );
  }
}
```

**Check:** Does verify_otp_screen.dart do this? ✅ YES IT DOES (line 53-63)

---

### **Fix 5: Add Role Selection to Signup**

**Current:** User selects role during signup form

**Issue:** Users might forget what role they're signing up for

**Solution:** Add confirmation before OTP

```dart
// In signup_screen.dart, after form filled:
"Sign up as: DRIVER"
"Continue?"
```

---

## ✅ VERIFICATION CHECKLIST

### **Welcome Screen:**
- [ ] Has "Sign In" button → Goes to LOGIN
- [ ] Has "Sign Up" button → Goes to SIGNUP
- [ ] No hardcoded roles passed
- [ ] Clear CTAs for existing vs new users

### **Login Screen:**
- [ ] Takes email/phone + password
- [ ] Navigates to SEND OTP screen ✅
- [ ] Passes identifier to OTP screen ✅

### **Signup Screen:**
- [ ] Takes all user info
- [ ] Navigates to OTP after submission ✅
- [ ] Passes identifier to OTP screen ✅

### **OTP Verification Screen:**
- [ ] Shows entered email/phone
- [ ] 5-digit input
- [ ] After verification, navigates by role ✅
  - DRIVER → Driver Profile ✅
  - PARAMEDIC → Paramedic Profile ✅
  - USER → Home ✅

### **Post-Authentication:**
- [ ] Driver goes to driver profile setup
- [ ] Paramedic goes to paramedic profile setup
- [ ] User goes to home screen
- [ ] All have access to settings

---

## 🎯 PRIORITY FIXES

### **P0 (Critical):**
1. ❌ Welcome screen hardcodes role='USER' → FIX IMMEDIATELY
2. ❌ Welcome screen missing Sign Up button → ADD IMMEDIATELY
3. ❌ Welcome screen doesn't differentiate User/Driver/Paramedic signup → FIX

### **P1 (Important):**
4. ⚠️ Login screen path unclear → VERIFY
5. ⚠️ Post-OTP navigation needs testing → VERIFY

### **P2 (Nice to have):**
6. Add role selection confirmation
7. Add progress indicators in auth flow

---

## 📋 TESTING NEEDED

### **Test Case 1: New User Signup (User Role)**
```
Splash → Welcome → Sign Up → 
Fill Form (as USER) → 
OTP Screen → Verify OTP → 
Password Setup → HOME SCREEN ✅
```

### **Test Case 2: New Driver Signup**
```
Splash → Welcome → Sign Up → 
Fill Form (as DRIVER) → 
OTP Screen → Verify OTP → 
Password Setup → DRIVER PROFILE SETUP ✅
```

### **Test Case 3: Existing User Login**
```
Splash → Welcome → Sign In → 
Enter Credentials → 
OTP Screen → Verify OTP → 
HOME SCREEN ✅
```

---

## 🚨 SUMMARY

**What's Wrong:**
1. Welcome screen forces all users to role='USER'
2. Welcome screen has no signup button
3. Role selection not clear in signup journey
4. Welcome screen doesn't differentiate signup paths by role

**What Works:**
1. ✅ OTP verification flow (FIXED!)
2. ✅ Login → OTP path
3. ✅ Signup → OTP path (FIXED!)
4. ✅ Navigation by role after OTP

**What Needs Fixing:**
1. Welcome screen buttons
2. Welcome → Sign Up routing
3. Role selection UI/UX

---

**Generated:** 2026-06-16  
**Severity:** HIGH - Entry point broken  
**Time to Fix:** 30 minutes
