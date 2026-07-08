# Admin Credentials & Dashboard Access

**Status:** 🔴 Admin account needs to be created  
**Date:** 2026-06-16  
**Verified:** ✅ Checked on Railway database - account DOES NOT EXIST

---

## 🔐 ADMIN LOGIN CREDENTIALS

### **✅ VERIFIED WORKING CREDENTIALS:**
```
Email:    shakoor.laar@gmail.com
Password: Pa$$word123
Name:     Abdul Shakoor
Phone:    +923323037905
Role:     DRIVER (Current)
Status:   ✅ ACTIVE & VERIFIED
```

### **Alternative Admin Account (Not Yet Created):**
```
Email: admin@resqlink.com
Password: Admin123!
Status: ❌ NOT YET IN DATABASE
```

---

## 🛠️ HOW TO CREATE ADMIN ACCOUNT

### **Option 1: Direct Database Insert (Recommended)**

Connect to PostgreSQL and run:

```sql
-- First, get bcrypt hash of password "Admin123!"
-- Hash: $2b$10$YOUR_BCRYPT_HASH_HERE

INSERT INTO "User" (
  id,
  name,
  email,
  phone,
  "passwordHash",
  role,
  verified,
  "isActive",
  "createdAt",
  "updatedAt"
) VALUES (
  gen_random_uuid(),
  'Admin User',
  'admin@resqlink.com',
  '+1111111112',
  '$2b$10$HASHED_PASSWORD_HERE',
  'ADMIN',
  true,
  true,
  NOW(),
  NOW()
);
```

---

### **Option 2: Backend API (Create Endpoint)**

Create a protected endpoint in NestJS:

**File:** `src/modules/auth/auth.controller.ts`

```typescript
@Post('create-admin')
@UseGuards(AuthGuard)
@Roles('ADMIN')
async createAdmin(@Body() dto: CreateAdminDto) {
  return this.authService.createAdmin(dto);
}
```

**File:** `src/modules/auth/auth.service.ts`

```typescript
async createAdmin(dto: CreateAdminDto) {
  const passwordHash = await bcrypt.hash(dto.password, 10);
  
  return await this.prisma.user.create({
    data: {
      name: dto.name,
      email: dto.email,
      phone: dto.phone,
      passwordHash,
      role: 'ADMIN',
      verified: true,
      isActive: true,
    },
  });
}
```

Then call:
```bash
curl -X POST https://resqlinkbackend-production.up.railway.app/api/auth/create-admin \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ADMIN_TOKEN" \
  -d '{
    "name": "Admin User",
    "email": "admin@resqlink.com",
    "phone": "+1111111112",
    "password": "Admin123!"
  }'
```

---

### **Option 3: Raw SQL via Railway Console**

1. Go to Railway dashboard: https://railway.app
2. Select your PostgreSQL database
3. Open Query Editor
4. Run the INSERT statement above

---

## 📋 SUGGESTED ADMIN CREDENTIALS

```
Email:    admin@resqlink.com
Password: Admin123!
Name:     Admin User
Phone:    +1111111112
Role:     ADMIN
Verified: YES
Active:   YES
```

---

## ✅ AFTER CREATING ADMIN

### **Test Login:**
```bash
curl -X POST https://resqlinkbackend-production.up.railway.app/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin@resqlink.com",
    "password": "Admin123!"
  }'
```

**Expected Response:**
```json
{
  "user": {
    "id": "admin-id",
    "name": "Admin User",
    "email": "admin@resqlink.com",
    "role": "ADMIN",
    "verified": true,
    "isActive": true
  },
  "accessToken": "your-token-here",
  "refreshToken": "your-refresh-token-here"
}
```

---

## 🚀 ACCESS ADMIN DASHBOARD

After creating admin account:

1. **URL:** Your Admin Dashboard URL (from screenshot)
2. **Email:** admin@resqlink.com
3. **Password:** Admin123!
4. **Click:** Sign In

---

## 📊 ADMIN DASHBOARD FEATURES (Available)

Based on your screenshot, the admin dashboard includes:

- ✅ User Management (created)
- ✅ Ambulance Management (created)
- ✅ Admin Dashboard (created)
- ✅ Driver Performance (created)
- ✅ Role-based access control
- ✅ Notifications settings
- ✅ Language preferences
- ✅ Privacy policy

---

## 🔒 ADMIN SECURITY

### **What Admin Can Do:**
- Manage all users
- Manage ambulances
- View statistics
- View action logs
- Manage drivers/paramedics
- View performance metrics

### **What Admin Cannot Do:**
- Self-register as ADMIN (blocked by backend)
- Use USER/DRIVER/PARAMEDIC account to access admin

### **Backend Protection:**
```typescript
// Line 37-39 of auth.service.ts
if (dto.role === Role.ADMIN) {
  throw new ForbiddenException('Cannot self-register as ADMIN');
}
```

---

## 📝 STEPS TO COMPLETE SETUP

### **Step 1: Create Admin Account**
Choose one method above (Database insert or API endpoint)

### **Step 2: Verify Admin Login**
```bash
curl -X POST https://resqlinkbackend-production.up.railway.app/api/auth/login \
  -d '{"email":"admin@resqlink.com","password":"Admin123!"}'
```

### **Step 3: Access Admin Dashboard**
Navigate to your admin dashboard URL with credentials

### **Step 4: Test Admin Features**
- Manage users
- View ambulances
- Check statistics
- Review action logs

---

## 🆘 TROUBLESHOOTING

### **Problem: "Invalid credentials" error**
**Solution:** Admin account doesn't exist yet. Create it using one of the methods above.

### **Problem: "Cannot self-register as ADMIN"**
**Solution:** This is expected. You CANNOT register as admin via the normal signup flow. Must use database insert or special endpoint.

### **Problem: Admin dashboard shows "Failed to fetch"**
**Solution:** 
1. Check backend is running
2. Verify admin account exists
3. Check API endpoint is correct
4. Verify token is being sent

---

## 🎯 SUMMARY

| Item | Status | Details |
|------|--------|---------|
| **Admin Email** | Ready | admin@resqlink.com |
| **Admin Password** | Ready | Admin123! (suggested) |
| **Admin Account** | ❌ Needs Creation | Not in database yet |
| **Admin Endpoints** | ✅ Ready | Backend configured |
| **Admin Dashboard** | ✅ Ready | UI created |
| **Protected Routes** | ✅ Ready | Roles guard active |

---

## 🚀 RECOMMENDED ACTION

**Create admin account using direct database insert:**

1. Go to Railway PostgreSQL console
2. Run SQL INSERT with credentials above
3. Test with curl login command
4. Access admin dashboard

---

**Generated:** 2026-06-16  
**Priority:** HIGH - Admin needed for testing  
**Time to Complete:** 5 minutes
