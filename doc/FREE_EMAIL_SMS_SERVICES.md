# Free Email & SMS Services for OTP

**Purpose:** Find and compare free services for sending OTP codes  
**Updated:** 2026-06-15

---

## 📧 FREE EMAIL SERVICES

### **1. Gmail SMTP (BEST - Completely Free)**

**Cost:** Free ✅  
**Limit:** 500 emails/day  
**Setup Time:** 5 minutes  
**Reliability:** Very High (Google)

#### **How to Set Up:**

**Step 1: Create Gmail Account**
```
1. Go to gmail.com
2. Create new account (or use existing)
3. Example: resqlink.noreply@gmail.com
```

**Step 2: Enable Less Secure Apps**
```
1. Go to: myaccount.google.com/apppasswords
2. Select: Mail → Windows Computer
3. Generate 16-character password
4. Copy this password
```

**Step 3: Configure in Backend**

**.env file:**
```
SMTP_HOST=smtp.gmail.com
SMTP_PORT=465
SMTP_USER=resqlink.noreply@gmail.com
SMTP_PASSWORD=your-16-char-app-password
SMTP_FROM=ResqLink <resqlink.noreply@gmail.com>
```

**Step 4: Install Nodemailer**
```bash
npm install nodemailer
npm install --save-dev @types/nodemailer
```

**Step 5: Create Service**

**File: src/services/email.service.ts**
```typescript
import { Injectable } from '@nestjs/common';
import * as nodemailer from 'nodemailer';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class EmailService {
  private transporter;

  constructor(private configService: ConfigService) {
    this.transporter = nodemailer.createTransport({
      host: 'smtp.gmail.com',
      port: 465,
      secure: true,
      auth: {
        user: this.configService.get('SMTP_USER'),
        pass: this.configService.get('SMTP_PASSWORD'),
      },
    });
  }

  async sendOtpEmail(email: string, code: string) {
    const htmlContent = `
      <!DOCTYPE html>
      <html>
        <body style="font-family: Arial, sans-serif;">
          <div style="max-width: 600px; margin: 0 auto; padding: 20px;">
            <h1 style="color: #333;">ResqLink Verification</h1>
            <p>Your one-time password is:</p>
            <div style="background: #f0f0f0; padding: 20px; text-align: center; margin: 20px 0; border-radius: 5px;">
              <h2 style="font-size: 36px; letter-spacing: 5px; color: #007bff; margin: 0;">${code}</h2>
            </div>
            <p style="color: #666;">
              This code expires in <strong>10 minutes</strong>.
            </p>
            <p style="color: #999; font-size: 12px;">
              If you didn't request this code, please ignore this email.
            </p>
            <hr style="border: none; border-top: 1px solid #ddd; margin: 20px 0;">
            <p style="color: #999; font-size: 11px;">
              © 2026 ResqLink. All rights reserved.
            </p>
          </div>
        </body>
      </html>
    `;

    await this.transporter.sendMail({
      from: this.configService.get('SMTP_FROM'),
      to: email,
      subject: 'ResqLink - Your Verification Code',
      html: htmlContent,
    });
  }
}
```

**Pros:**
- ✅ Completely free
- ✅ No credit card needed
- ✅ 500 emails/day (enough for development)
- ✅ Easy to set up
- ✅ Reliable (Google infrastructure)

**Cons:**
- ❌ May be blocked by corporate firewalls
- ❌ Not ideal for production with brand email

---

### **2. Mailtrap (Free Tier)**

**Cost:** Free (100 emails/month)  
**Limit:** 100 emails/month  
**Setup Time:** 3 minutes  
**Reliability:** High

#### **Perfect For:** Development/Testing Only

**Step 1: Sign Up**
```
Go to: mailtrap.io
Sign up with email/GitHub
Free account created
```

**Step 2: Get SMTP Credentials**
```
1. Click "Demo Inbox"
2. Click "Integrations"
3. Select "Nodemailer"
4. Copy credentials
```

**Step 3: Configure .env**
```
SMTP_HOST=smtp.mailtrap.io
SMTP_PORT=2525
SMTP_USER=your-mailtrap-user
SMTP_PASSWORD=your-mailtrap-password
```

**Step 4: All emails go to inbox**
```
Check mailtrap.io Dashboard → Inbox
All OTP emails appear there (not sent to real user)
```

**Pros:**
- ✅ Free for 100/month
- ✅ Easy setup
- ✅ View all emails in dashboard
- ✅ Perfect for testing

**Cons:**
- ❌ Limited to 100 emails/month
- ❌ Emails don't reach real users
- ❌ Only for development
- ❌ Not suitable for production

---

### **3. SendGrid (Free Tier)**

**Cost:** Free (100 emails/day)  
**Limit:** 100 emails/day  
**Setup Time:** 10 minutes  
**Reliability:** Very High

#### **How to Set Up:**

**Step 1: Sign Up**
```
Go to: sendgrid.com
Sign up (no credit card for free tier)
Verify email
```

**Step 2: Create API Key**
```
1. Settings → API Keys
2. Create new key
3. Copy key (you'll need it)
```

**Step 3: Configure .env**
```
SENDGRID_API_KEY=your-sendgrid-api-key
SENDGRID_FROM_EMAIL=noreply@resqlink.com
SENDGRID_FROM_NAME=ResqLink
```

**Step 4: Install SendGrid SDK**
```bash
npm install @sendgrid/mail
```

**Step 5: Create Service**

**File: src/services/email.service.ts**
```typescript
import { Injectable } from '@nestjs/common';
import * as sgMail from '@sendgrid/mail';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class EmailService {
  constructor(private configService: ConfigService) {
    sgMail.setApiKey(this.configService.get('SENDGRID_API_KEY'));
  }

  async sendOtpEmail(email: string, code: string) {
    const msg = {
      to: email,
      from: this.configService.get('SENDGRID_FROM_EMAIL'),
      subject: 'ResqLink - Your Verification Code',
      html: `
        <h1>ResqLink Verification</h1>
        <p>Your one-time password is:</p>
        <h2 style="font-size: 36px; letter-spacing: 5px;">${code}</h2>
        <p>This code expires in 10 minutes.</p>
      `,
    };

    await sgMail.send(msg);
  }
}
```

**Pros:**
- ✅ 100 emails/day (free)
- ✅ Professional service
- ✅ Good reliability
- ✅ Easy to scale to paid tier

**Cons:**
- ❌ Limit of 100/day
- ❌ More complex setup
- ❌ Requires verification

---

### **4. Resend (Free Tier - React Emails)**

**Cost:** Free (100 emails/day)  
**Limit:** 100 emails/day  
**Setup Time:** 5 minutes  
**Reliability:** High

**Step 1: Sign Up**
```
Go to: resend.com
Sign up with email
```

**Step 2: Get API Key**
```
Dashboard → API Keys
Copy your API key
```

**Step 3: Install SDK**
```bash
npm install resend
```

**Step 4: Create Service**
```typescript
import { Resend } from 'resend';
import { ConfigService } from '@nestjs/config';

export class EmailService {
  private resend: Resend;

  constructor(private configService: ConfigService) {
    this.resend = new Resend(this.configService.get('RESEND_API_KEY'));
  }

  async sendOtpEmail(email: string, code: string) {
    await this.resend.emails.send({
      from: 'ResqLink <noreply@resqlink.resend.dev>',
      to: email,
      subject: 'Your OTP Code',
      html: `<h2>${code}</h2>`,
    });
  }
}
```

**Pros:**
- ✅ Modern API
- ✅ 100 emails/day free
- ✅ Easy integration
- ✅ Good for startups

**Cons:**
- ❌ Newer service (less established)
- ❌ Limited features on free tier

---

## 📱 FREE SMS SERVICES

### **1. Twilio (BEST - Free Trial)**

**Cost:** Free $20 trial (lasts ~1 month)  
**Limit:** Depends on message cost  
**Setup Time:** 10 minutes  
**Reliability:** Very High

#### **How to Set Up:**

**Step 1: Sign Up**
```
Go to: twilio.com
Create free account
Verify phone number
Get $20 credit
```

**Step 2: Get Credentials**
```
1. Go to: console.twilio.com
2. Copy Account SID
3. Copy Auth Token
4. Buy phone number ($1.15/month)
   OR use trial number (limited)
```

**Step 3: Configure .env**
```
TWILIO_ACCOUNT_SID=your-account-sid
TWILIO_AUTH_TOKEN=your-auth-token
TWILIO_PHONE_NUMBER=+1234567890  // Your Twilio number
```

**Step 4: Install Twilio SDK**
```bash
npm install twilio
```

**Step 5: Create Service**

**File: src/services/sms.service.ts**
```typescript
import { Injectable } from '@nestjs/common';
import * as twilio from 'twilio';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class SmsService {
  private client;

  constructor(private configService: ConfigService) {
    const accountSid = this.configService.get('TWILIO_ACCOUNT_SID');
    const authToken = this.configService.get('TWILIO_AUTH_TOKEN');
    this.client = twilio(accountSid, authToken);
  }

  async sendOtpSms(phone: string, code: string) {
    await this.client.messages.create({
      body: `Your ResqLink OTP is: ${code}. Valid for 10 minutes. Do not share with anyone.`,
      from: this.configService.get('TWILIO_PHONE_NUMBER'),
      to: phone,
    });
  }
}
```

**Step 6: Verify Phone Numbers**
```
For trial account, must verify recipient numbers:
1. Go to: console.twilio.com/phone-numbers
2. Add verified phone number
3. Twilio sends code to verify
4. Enter code to confirm
```

**Pricing:**
- Account SID & Auth Token: Free
- Phone number: ~$1.15/month (after trial)
- SMS: ~$0.0075 per message (varies by country)
- Trial: $20 credit (free)

**Pros:**
- ✅ $20 free trial
- ✅ Very reliable
- ✅ Works worldwide
- ✅ Easy setup
- ✅ Cheap per message after trial

**Cons:**
- ❌ Requires payment after trial
- ❌ Per-message cost adds up
- ❌ Trial number limited for testing

---

### **2. Firebase Cloud Messaging (Free)**

**Cost:** Free ✅  
**Limit:** Unlimited  
**Setup Time:** 20 minutes  
**Reliability:** High (Google)

#### **Note:** This sends SMS via Firebase, not traditional SMS

**Step 1: Set Up Firebase Project**
```
Go to: firebase.google.com
Create new project
Add app (select Android/iOS)
```

**Step 2: Enable Phone Auth**
```
Authentication → Sign-in methods
Enable "Phone"
```

**Step 3: Configure in Backend**
```
Download service account JSON
Set GOOGLE_APPLICATION_CREDENTIALS environment variable
```

**Pros:**
- ✅ Completely free
- ✅ Unlimited usage
- ✅ Google infrastructure
- ✅ Good for mobile apps

**Cons:**
- ❌ Complex setup
- ❌ Firebase-specific
- ❌ Limited to Firebase ecosystem

---

### **3. AWS SNS (Free Tier)**

**Cost:** Free tier (1,000 SMS/month free)  
**Limit:** 1,000 SMS/month  
**Setup Time:** 15 minutes  
**Reliability:** Very High

**Step 1: Create AWS Account**
```
Go to: aws.amazon.com
Create account with credit card
Free tier eligible
```

**Step 2: Access SNS**
```
AWS Console → SNS (Simple Notification Service)
Create topic
Add SMS endpoint
```

**Step 3: Configure .env**
```
AWS_ACCESS_KEY_ID=your-access-key
AWS_SECRET_ACCESS_KEY=your-secret-key
AWS_REGION=us-east-1
AWS_SNS_TOPIC_ARN=arn:aws:sns:us-east-1:...
```

**Step 4: Install AWS SDK**
```bash
npm install aws-sdk
```

**Step 5: Create Service**
```typescript
import { Injectable } from '@nestjs/common';
import * as AWS from 'aws-sdk';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class SmsService {
  private sns;

  constructor(private configService: ConfigService) {
    AWS.config.update({
      accessKeyId: this.configService.get('AWS_ACCESS_KEY_ID'),
      secretAccessKey: this.configService.get('AWS_SECRET_ACCESS_KEY'),
      region: this.configService.get('AWS_REGION'),
    });
    this.sns = new AWS.SNS();
  }

  async sendOtpSms(phone: string, code: string) {
    await this.sns.publish({
      Message: `Your ResqLink OTP is: ${code}. Valid for 10 minutes.`,
      PhoneNumber: phone,
    }).promise();
  }
}
```

**Pros:**
- ✅ 1,000 free SMS/month
- ✅ AWS infrastructure (reliable)
- ✅ Scales well

**Cons:**
- ❌ Requires credit card
- ❌ Complex setup
- ❌ Limited to 1,000/month

---

## 🏆 MY RECOMMENDATION

### **For Development (Completely Free)**
1. **Email:** Gmail SMTP ✅
   - Setup: 5 minutes
   - Cost: Free
   - Limit: 500/day
   - Perfect for dev/testing

2. **SMS:** Twilio Free Trial ✅
   - Setup: 10 minutes
   - Cost: Free ($20 trial)
   - Limit: Until trial runs out
   - Great for initial testing

---

### **For Production (Low Cost)**
1. **Email:** Gmail SMTP or SendGrid ✅
   - Gmail: Free, 500/day
   - SendGrid: Free 100/day, then $0.10 per extra

2. **SMS:** Twilio or AWS SNS ✅
   - Twilio: ~$0.0075 per SMS
   - AWS SNS: Free 1,000/month, then $0.00645 per SMS

---

## 🚀 QUICK START - Gmail + Twilio Free Trial

### **Easiest Setup (15 minutes)**

#### **Part 1: Gmail SMTP (5 minutes)**

1. **Get Gmail App Password**
   ```
   Go to: myaccount.google.com/apppasswords
   Select: Mail → Windows Computer
   Copy password
   ```

2. **Update .env**
   ```
   SMTP_HOST=smtp.gmail.com
   SMTP_PORT=465
   SMTP_USER=your-email@gmail.com
   SMTP_PASSWORD=app-password-from-step-1
   SMTP_FROM=ResqLink <your-email@gmail.com>
   ```

3. **Install package**
   ```bash
   npm install nodemailer
   ```

4. **Test**
   ```bash
   # Run test and check if email arrives
   ```

---

#### **Part 2: Twilio Free Trial (10 minutes)**

1. **Sign Up**
   ```
   Go to: twilio.com
   Sign up with email
   Verify phone
   Get $20 credit
   ```

2. **Get Phone Number**
   ```
   Dashboard → Phone Numbers
   Buy number ($1.15/month, covered by trial)
   Copy number
   ```

3. **Get Credentials**
   ```
   Account menu → Account SID (copy)
   Account menu → Auth Token (copy)
   ```

4. **Update .env**
   ```
   TWILIO_ACCOUNT_SID=your-sid
   TWILIO_AUTH_TOKEN=your-token
   TWILIO_PHONE_NUMBER=your-twilio-number
   ```

5. **Install package**
   ```bash
   npm install twilio
   ```

6. **Add Verified Phone**
   ```
   For testing, go to:
   console.twilio.com/phone-numbers/verified
   Add your personal phone
   Verify with code SMS
   ```

---

## 📊 COMPARISON TABLE

| Service | Type | Cost | Limit | Setup | Production |
|---------|------|------|-------|-------|------------|
| **Gmail** | Email | Free | 500/day | 5 min | ✅ Good |
| **Twilio** | SMS | Free trial | $20 credit | 10 min | ✅ Good |
| **SendGrid** | Email | Free | 100/day | 10 min | ✅ Good |
| **AWS SNS** | SMS | Free tier | 1000/month | 15 min | ✅ Good |
| **Mailtrap** | Email | Free | 100/month | 3 min | ❌ Dev only |
| **Firebase** | SMS | Free | Unlimited | 20 min | ⚠️ Complex |

---

## 💾 ENVIRONMENT VARIABLES TEMPLATE

**Create .env file:**
```
# Email Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=465
SMTP_USER=your-email@gmail.com
SMTP_PASSWORD=your-app-password
SMTP_FROM=ResqLink <your-email@gmail.com>

# SMS Configuration
TWILIO_ACCOUNT_SID=your-account-sid
TWILIO_AUTH_TOKEN=your-auth-token
TWILIO_PHONE_NUMBER=+1234567890

# Add to .gitignore
# .env
# .env.local
```

---

## ✅ TESTING AFTER SETUP

### **Test Email**
```bash
# In your backend, create test route
npm run dev

# Call in browser:
GET http://localhost:3000/test-email?email=youremail@gmail.com

# Check Gmail inbox for test email
```

### **Test SMS**
```bash
# In your backend, create test route
GET http://localhost:3000/test-sms?phone=+1234567890

# Check your phone for SMS
```

---

## 🎯 RECOMMENDED STACK

**Best for your ResqLink app:**

```
Development Phase:
├─ Email: Gmail SMTP (free)
├─ SMS: Twilio Free Trial ($20 free)
└─ Total cost: $0

After Trial Ends:
├─ Email: Gmail SMTP (free, 500/day)
├─ SMS: Twilio ($0.0075 per message)
└─ Monthly cost: ~$20-50 (depending on SMS volume)

Alternative (Lower Cost):
├─ Email: SendGrid (free 100/day)
├─ SMS: AWS SNS (free 1000/month)
└─ Monthly cost: $0-5
```

---

**Ready to implement? I can help set up Gmail SMTP + Twilio for your backend!**

Generated: 2026-06-15
