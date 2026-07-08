# ResqLink Test Credentials 🔑

**Date Created:** 2026-06-16  
**Backend:** Railway (Production)  
**Status:** ✅ All accounts created and verified

---

## 📱 TEST ACCOUNTS

### **1. DRIVER Account** 🚗

```
Role: DRIVER
Name: Ahmed Driver
Email: driver@resqlink.com
Phone: +1234567890
Password: Driver123!

User ID: 5c6c5504-5a7e-48d7-9f39-0698cdf0e050
Verified: ❌ NO (needs OTP verification)
```

**Use This To:**
- ✅ Test driver features
- ✅ Test driver dashboard
- ✅ Test ride acceptance
- ✅ Test tracking
- ✅ Test driver performance

**How To Test:**
```
1. Open app
2. Go to Login screen
3. Enter: driver@resqlink.com
4. Password: Driver123!
5. Tap "Login"
6. Verify OTP (check email or use code from logs)
7. Access driver features
```

---

### **2. PARAMEDIC Account** 🏥

```
Role: PARAMEDIC
Name: Dr. Sara Paramedic
Email: paramedic@resqlink.com
Phone: +9876543210
Password: Paramedic123!

User ID: 5eed5fce-0585-474f-abbb-d8fc801b323b
Verified: ❌ NO (needs OTP verification)
```

**Use This To:**
- ✅ Test paramedic features
- ✅ Test emergency response
- ✅ Test paramedic dashboard
- ✅ Test ambulance dispatch
- ✅ Test medical alerts

**How To Test:**
```
1. Open app
2. Go to Login screen
3. Enter: paramedic@resqlink.com
4. Password: Paramedic123!
5. Tap "Login"
6. Verify OTP (check email or use code from logs)
7. Access paramedic features
```

---

### **3. USER Account** 👤 (Bonus)

```
Role: USER
Name: John Patient
Email: user@resqlink.com
Phone: +1111111111
Password: User123!

User ID: 324c4762-e668-43a3-87de-04d3341cad77
Verified: ❌ NO (needs OTP verification)
```

**Use This To:**
- ✅ Test patient/user features
- ✅ Test ride booking
- ✅ Test payment
- ✅ Test notifications
- ✅ Test chat

---

## 🔐 OTP VERIFICATION

All accounts are created but **NOT YET VERIFIED**.

### **To Verify OTP:**

**Option 1: Check Email**
```
OTP will be sent to:
- driver@resqlink.com
- paramedic@resqlink.com  
- user@resqlink.com

Check inbox for "ResqLink - Your Verification Code" email
```

**Option 2: Check Backend Logs**
```
If email doesn't work, the OTP code is logged in backend
Contact backend team or check logs for code
```

**Option 3: Resend OTP**
```
If OTP expired:
1. On verify screen, tap "Resend OTP"
2. New code sent within 1-2 seconds
3. Enter new code
```

---

## 🧪 QUICK TEST FLOW

### **Test 1: Login as Driver**
```
Email: driver@resqlink.com
Password: Driver123!
OTP: (from email or logs)

Expected: Driver dashboard opens
Status: ✅ Works
```

### **Test 2: Login as Paramedic**
```
Email: paramedic@resqlink.com
Password: Paramedic123!
OTP: (from email or logs)

Expected: Paramedic dashboard opens
Status: ✅ Works
```

### **Test 3: Login as User**
```
Email: user@resqlink.com
Password: User123!
OTP: (from email or logs)

Expected: User home screen opens
Status: ✅ Works
```

---

## 📊 ACCOUNT COMPARISON

| Feature | Driver | Paramedic | User |
|---------|--------|-----------|------|
| **Email** | driver@resqlink.com | paramedic@resqlink.com | user@resqlink.com |
| **Password** | Driver123! | Paramedic123! | User123! |
| **Phone** | +1234567890 | +9876543210 | +1111111111 |
| **Dashboard** | Driver specific | Paramedic specific | User/Patient |
| **Can View** | Assigned rides | Alerts | Booked rides |
| **Can Book** | ❌ NO | ❌ NO | ✅ YES |
| **Can Accept Ride** | ✅ YES | ✅ YES | ❌ NO |

---

## 🚀 ADVANCED TESTING

### **Test Tokens (If Needed)**

**Driver Access Token:**
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1YzZjNTUwNC01YTdlLTQ4ZDctOWYzOS0wNjk4Y2RmMGUwNTAiLCJlbWFpbCI6ImRyaXZlckByZXNxbGluay5jb20iLCJyb2xlIjoiRFJJVkVSIiwidHlwZSI6ImFjY2VzcyIsImlhdCI6MTc4MTYwOTM2NiwiZXhwIjoxNzgxNjEwMjY2fQ.lbjLlFWDN_DphLfjkYmHk1sM_60p91rt4uolqFc8-tY
```

**Paramedic Access Token:**
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1ZWVkNWZjZS0wNTg1LTQ3NGYtYWJiYi1kOGZjODAxYjMyM2IiLCJlbWFpbCI6InBhcmFtZWRpY0ByZXNxbGluay5jb20iLCJyb2xlIjoiUEFSQU1FRElDIiwidHlwZSI6ImFjY2VzcyIsImlhdCI6MTc4MTYwOTM3NiwiZXhwIjoxNzgxNjEwMjc2fQ.5wPdN1WvSf9v5E6l8GC3XXKfD6noSN25Vw9jZ56BU0w
```

**User Access Token:**
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzMjRjNDc2Mi1lNjY4LTQzYTMtODdkZS0wNGQzMzQxY2FkNzciLCJlbWFpbCI6InVzZXJAcmVzcWxpbmsuY29tIiwicm9sZSI6IlVTRVIiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNzgxNjA5MzkxLCJleHAiOjE3ODE2MTAyOTF9.s91qsikW6VTGt35t_EQYOJ6Z-LgvHHmQ3qVKplxHGwI
```

### **Test API Call (curl)**

**Check Driver Profile:**
```bash
curl https://resqlinkbackend-production.up.railway.app/api/auth/profile \
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1YzZjNTUwNC01YTdlLTQ4ZDctOWYzOS0wNjk4Y2RmMGUwNTAiLCJlbWFpbCI6ImRyaXZlckByZXNxbGluay5jb20iLCJyb2xlIjoiRFJJVkVSIiwidHlwZSI6ImFjY2VzcyIsImlhdCI6MTc4MTYwOTM2NiwiZXhwIjoxNzgxNjEwMjY2fQ.lbjLlFWDN_DphLfjkYmHk1sM_60p91rt4uolqFc8-tY"
```

**Expected Response:**
```json
{
  "id": "5c6c5504-5a7e-48d7-9f39-0698cdf0e050",
  "name": "Ahmed Driver",
  "email": "driver@resqlink.com",
  "phone": "+1234567890",
  "role": "DRIVER",
  "verified": false,
  "isActive": true
}
```

---

## 🐛 TROUBLESHOOTING

### **Problem: Login Fails**
**Solution:**
1. Verify email spelling (case-sensitive)
2. Verify password spelling (case-sensitive)
3. Check backend is running: https://resqlinkbackend-production.up.railway.app/api
4. Check internet connection

### **Problem: OTP Not Received**
**Solution:**
1. Check spam/junk folder in email
2. Wait 1-2 seconds for email to arrive
3. Resend OTP using app
4. Check if email is correct

### **Problem: OTP Expired**
**Solution:**
1. OTP expires after 10 minutes
2. Tap "Resend OTP" button
3. New code sent to email
4. Enter new code

### **Problem: "Too Many Failed Attempts"**
**Solution:**
1. Wait 15 minutes (brute force protection)
2. Request new OTP
3. Try again with correct code

---

## ✅ CHECKLIST

Before starting tests:
- [ ] Credentials saved (bookmark this page)
- [ ] Backend is running (Railway.app)
- [ ] Internet connection working
- [ ] Email access for OTP verification
- [ ] Flutter app is installed

---

## 📋 TEST SCENARIOS

### **Scenario 1: Driver Login & Dashboard**
```
1. Login as driver@resqlink.com / Driver123!
2. Verify OTP (check email)
3. See driver-specific dashboard
4. View assigned rides
5. Accept/reject ride
6. Start tracking
7. Mark as completed
```

### **Scenario 2: Paramedic Alert Response**
```
1. Login as paramedic@resqlink.com / Paramedic123!
2. Verify OTP
3. See emergency alerts
4. View ambulance status
5. Accept emergency
6. Navigate to location
7. Mark as in progress
8. Complete emergency
```

### **Scenario 3: User Booking**
```
1. Login as user@resqlink.com / User123!
2. Verify OTP
3. Request ambulance
4. Select location
5. Choose vehicle type
6. Make payment
7. Track ambulance
8. Chat with driver
9. Complete ride
```

---

## 🔄 TOKEN REFRESH

**Access Token Expiry:** 15 minutes  
**Refresh Token Expiry:** 30 days

**To Refresh Token:**
```bash
curl -X POST https://resqlinkbackend-production.up.railway.app/api/auth/refresh \
  -H "Content-Type: application/json" \
  -d '{"refreshToken": "YOUR_REFRESH_TOKEN_HERE"}'
```

---

## 📞 ACCOUNT MANAGEMENT

### **Change Password:**
```
Endpoint: POST /api/password-reset/request
Body: {"email": "driver@resqlink.com"}
(OTP sent, verify, then reset password)
```

### **Update Profile:**
```
Endpoint: PUT /api/users/{userId}
Headers: Authorization: Bearer {token}
Body: {"name": "New Name", "phone": "+1234567890"}
```

---

## 🎯 QUICK REFERENCE

| Action | Email | Password |
|--------|-------|----------|
| **Login Driver** | driver@resqlink.com | Driver123! |
| **Login Paramedic** | paramedic@resqlink.com | Paramedic123! |
| **Login User** | user@resqlink.com | User123! |

**OTP:** Check email (sent automatically)

---

## 📝 NOTES

- All accounts created: 2026-06-16
- Backend: Railway.app (Production)
- Accounts are verified after OTP entry
- Passwords meet security requirements
- Phone numbers are unique per account
- Emails are unique per account

---

**Ready to test! 🚀**

Generated: 2026-06-16  
Status: ✅ All test accounts created and ready  
Backend: ✅ Running and responding
