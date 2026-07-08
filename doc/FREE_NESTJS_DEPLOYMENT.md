# Free NestJS Deployment Servers 2026

**Purpose:** Compare free hosting options for NestJS backend  
**Updated:** 2026-06-16

---

## 🏆 TOP FREE OPTIONS

### **1. Railway (BEST - Currently Used)**

**Cost:** Free ($5 trial credit, then free tier with 512MB)  
**Limit:** 500 hours/month free  
**Setup Time:** 5 minutes  
**Reliability:** Very High (Recommended)  
**Current Status:** ✅ Your backend already here!

#### **What You Get:**
```
✅ 512MB RAM (free)
✅ PostgreSQL database (free)
✅ Custom domain (.railway.app)
✅ Auto-deploy from GitHub
✅ Environment variables
✅ Logs & monitoring
✅ Health checks
```

#### **Pricing (After Free Trial):**
- Free tier: 500 hours/month (~$5 if exceeded)
- Pay-as-you-go: $5/month for your setup

**Your Current Setup:**
```
✅ Backend: resqlinkbackend-production.up.railway.app
✅ Database: PostgreSQL (Railway)
✅ Status: WORKING ✅
```

**To Keep Using:**
```
1. Project dashboard: https://railway.app
2. Check usage
3. Only pay if exceeding 500 hours/month
```

---

### **2. Render (FREE - BEST ALTERNATIVE)**

**Cost:** Free (free tier available)  
**Limit:** Sleeps after 15 min inactivity  
**Setup Time:** 5 minutes  
**Reliability:** High (Recommended for testing)  
**Free Tier:** Yes, with limitations

#### **What You Get:**
```
✅ 512MB RAM (free)
✅ PostgreSQL database (free, 90-day retention)
✅ Auto-deploy from GitHub
✅ Custom subdomain (.onrender.com)
✅ Let's Encrypt SSL
✅ Environment variables
✅ Logs available
```

#### **Pros:**
- ✅ True free tier (no credit card needed initially)
- ✅ No cold starts on paid plans
- ✅ Good for production ($7+/month)
- ✅ 90-day DB backup retention

#### **Cons:**
- ❌ Free tier: App sleeps after 15 min inactivity
- ❌ Takes 30 sec to wake up
- ❌ Database deleted after 90 days on free tier

#### **How to Deploy:**

**Step 1: Create Account**
```
Go to: render.com
Sign up with GitHub
```

**Step 2: Create New Web Service**
```
1. Dashboard → New +
2. Select "Web Service"
3. Connect GitHub repository
4. Choose NestJS branch (main)
5. Runtime: Node
```

**Step 3: Configure**
```
Build Command: npm run build
Start Command: node dist/main.js
Environment: production

Add these env variables:
- DATABASE_URL (PostgreSQL connection)
- JWT_ACCESS_SECRET (your secret)
- JWT_REFRESH_SECRET (your secret)
- BREVO_API_KEY (your Brevo key)
```

**Step 4: Create Database**
```
1. Dashboard → Databases
2. Create PostgreSQL
3. Copy connection URL
4. Add to web service env
```

**Result:**
```
Your API: https://yourapp.onrender.com/api
Database: PostgreSQL (90-day backup)
Status: Free tier ✅
```

---

### **3. Heroku (PAID - NOT RECOMMENDED)**

**Cost:** Stopped free tier (Nov 2022)  
**Minimum:** $5-7/month  
**Setup Time:** 10 minutes  
**Reliability:** Very High  

⚠️ **No longer free, but good paid option**

If you want a paid option:
- Hobby tier: $5/month
- Standard: $7/month
- Great dashboard & logs

---

### **4. Supabase (FREE - Database Focused)**

**Cost:** Free ($10/month after)  
**Limit:** Up to 500MB  
**Setup Time:** 10 minutes  
**Reliability:** High  

#### **What You Get:**
```
✅ PostgreSQL database (free)
✅ Auth service (free)
✅ Real-time subscriptions (free)
✅ REST API auto-generated (free)
✅ Up to 500MB storage
✅ 2 Projects free
```

#### **Use Case:**
- Perfect for database + auth
- Need separate server for NestJS
- Good for full-stack apps

#### **How to Use:**

```
1. Go to: supabase.com
2. Create free project
3. Get PostgreSQL URL
4. Use in Railway/Render for NestJS
```

---

### **5. Fly.io (FREE - GENEROUS)**

**Cost:** Free ($5/month after)  
**Limit:** 3 shared CPU cores, 3GB RAM  
**Setup Time:** 10 minutes  
**Reliability:** High  

#### **What You Get:**
```
✅ Shared CPU (free)
✅ 3GB RAM (free)
✅ Global edge network
✅ Custom domain
✅ SSL included
✅ CLI deployment
✅ Docker support
```

#### **How to Deploy:**

**Step 1: Install CLI**
```bash
npm install -g @fly.io/cli
```

**Step 2: Login**
```bash
fly auth login
```

**Step 3: Create App**
```bash
fly launch
# Follow prompts
# Choose region
# Add secrets/env variables
```

**Step 4: Deploy**
```bash
fly deploy
```

**Result:**
```
Your API: https://yourapp.fly.dev
Database: Configure separately
Status: Free tier ✅
```

---

### **6. Replit (FREE - EASY)**

**Cost:** Free  
**Limit:** For hobby/testing  
**Setup Time:** 2 minutes  
**Reliability:** Medium (development only)

#### **What You Get:**
```
✅ Free hosting
✅ Node.js runtime
✅ Easy deployment
✅ Shareable link
```

#### **Cons:**
- ❌ Slow performance
- ❌ Limited resources
- ❌ Not for production
- ❌ App sleeps after inactivity

**Only for:** Testing/hobby projects

---

## 📊 COMPARISON TABLE

| Service | Cost | RAM | DB | Domain | Sleep | Setup |
|---------|------|-----|----|---------|----|-------|
| **Railway** | Free 500h | 512MB | ✅ Free | .railway.app | ❌ No | 5min |
| **Render** | Free | 512MB | ✅ Free | .onrender.com | ✅ Yes | 5min |
| **Fly.io** | Free | 3GB | ❌ Separate | Custom | ❌ No | 10min |
| **Supabase** | Free DB | N/A | ✅ Free 500MB | N/A | N/A | 10min |
| **Heroku** | $5+/mo | 512MB | ✅ Paid | Custom | ❌ No | 10min |
| **Replit** | Free | Limited | ❌ No | .replit.dev | ✅ Yes | 2min |

---

## 🎯 MY RECOMMENDATION

### **For Your ResqLink Project:**

**Best Option: Keep Using Railway** ✅
```
Why:
✅ Already deployed and working
✅ Free 500 hours/month (enough for testing)
✅ No cold starts
✅ Built-in PostgreSQL
✅ Best performance
✅ $5/month if over limit (very cheap)

Current URL:
https://resqlinkbackend-production.up.railway.app/api/
```

**Backup Option: Render**
```
Why:
✅ True free tier
✅ Good performance
✅ 90-day database backup
✅ Easy migration from Railway

Cost: Free (with 15 min sleep)
For production: $7/month (remove sleep)
```

---

## 🚀 HOW TO SET UP RENDER (FREE ALTERNATIVE)

### **If You Want to Use Render Instead:**

**Step 1: Prepare Code**
```bash
cd d:\laragon\www\rsq

# Ensure package.json has start script
# package.json should have:
"scripts": {
  "build": "nest build",
  "start": "node dist/main.js",
  "dev": "nest start --watch"
}

# Commit to GitHub
git add .
git commit -m "Ready for Render deployment"
git push
```

**Step 2: Create Render Account**
```
1. Go to: render.com
2. Sign up with GitHub
3. Authorize Render
```

**Step 3: Create Web Service**
```
1. Click "New +" → "Web Service"
2. Connect your GitHub repo
3. Select main branch
4. Name: resqlink-backend
5. Runtime: Node
6. Build Command: npm run build
7. Start Command: node dist/main.js
```

**Step 4: Add Environment Variables**
```
DATABASE_URL=<your-postgres-url>
JWT_ACCESS_SECRET=<your-secret>
JWT_REFRESH_SECRET=<your-secret>
PORT=3001
NODE_ENV=production
BREVO_API_KEY=<your-key>
BREVO_SENDER_EMAIL=noreply@resqlink.com
BREVO_SENDER_NAME=ResqLink
```

**Step 5: Create Database**
```
1. Render Dashboard → Databases
2. New Database
3. Name: resqlink_db
4. Copy connection URL
5. Paste as DATABASE_URL
```

**Step 6: Deploy**
```
Click "Deploy"
Wait 2-3 minutes
Your API: https://resqlink-backend.onrender.com/api
```

---

## 💰 COST BREAKDOWN

### **Railway (Current)**
```
✅ Free: 500 hours/month
✅ $5/month: Overages
Estimated: $0-5/month
```

### **Render (Free Alternative)**
```
✅ Free: With 15 min sleep
✅ $7/month: Production (no sleep)
Estimated: $0-7/month
```

### **Fly.io (Generous Free)**
```
✅ Free: 3GB RAM, shared CPU
✅ $5/month: Dedicated CPU
Estimated: $0-5/month
```

### **All Together:**
```
Backend: $0-7/month (Render free or $7)
Database: $0 (included)
Email (Brevo): $0 (300/day free)
Total: $0-7/month ✅
```

---

## 🔧 MIGRATION GUIDE

### **If Moving from Railway to Render:**

**Step 1: Export Database**
```bash
# From Railway PostgreSQL
pg_dump --host=<host> --username=<user> \
  --password <dbname> > backup.sql
```

**Step 2: Import to Render**
```bash
psql <render-connection-url> < backup.sql
```

**Step 3: Update Environment**
```
In Render Dashboard:
Add DATABASE_URL with new Render URL
Keep other env variables same
```

**Step 4: Redeploy**
```
Render auto-deploys from GitHub
Just push new changes
```

**Step 5: Update Frontend**
```
Change API_CONSTANTS.dart:
From: resqlinkbackend-production.up.railway.app
To: resqlink-backend.onrender.com (example)
```

**Step 6: Delete Railway Project** (optional)
```
If no longer needed, delete to save credits
```

---

## ✅ TESTING EACH SERVICE

### **Test Railway (Current)**
```bash
curl https://resqlinkbackend-production.up.railway.app/api/auth/profile \
  -H "Authorization: Bearer YOUR_TOKEN"

Expected: User profile data ✅
```

### **Test Render**
```bash
curl https://resqlink-backend.onrender.com/api/auth/profile \
  -H "Authorization: Bearer YOUR_TOKEN"

Expected: User profile data ✅
(Wait 30 sec if first request)
```

### **Check Logs**
```
Railway: Dashboard → Logs
Render: Service → Logs
Fly.io: fly logs
```

---

## 🎯 QUICK DECISION GUIDE

**Choose Railway if:**
- ✅ You want best performance
- ✅ You don't want cold starts
- ✅ You're okay paying $5 occasionally
- ✅ You want reliability

**Choose Render if:**
- ✅ You want truly free tier
- ✅ You're okay with 15 min sleep
- ✅ You want $7/month production option
- ✅ You want simple setup

**Choose Fly.io if:**
- ✅ You want 3GB free RAM
- ✅ You want global deployment
- ✅ You want Docker support
- ✅ You're technical

---

## 📋 SETUP CHECKLIST

### **For Railway (Current - Keep)**
- [x] Account created
- [x] Project deployed
- [x] Database configured
- [x] Environment variables set
- [x] API working
- [x] Cost: ~$0-5/month

### **For Render (Backup)**
- [ ] Account created
- [ ] GitHub connected
- [ ] Web service created
- [ ] Database provisioned
- [ ] Environment variables added
- [ ] Deploy button clicked
- [ ] API tested
- [ ] Cost: Free (with sleep) or $7/month

---

## 🔐 SECURING YOUR DEPLOYMENT

### **For Any Free Service:**

**1. Use Environment Variables**
```
✅ Never commit secrets
✅ Use .env.local (not committed)
✅ Store in deployment platform
✅ Rotate monthly
```

**2. Enable HTTPS**
```
✅ Railway: Automatic
✅ Render: Automatic
✅ Fly.io: Automatic
```

**3. Rate Limiting**
```
✅ Already implemented in NestJS
✅ OTP rate limiting active
✅ Brute force protection on
```

**4. Monitor Logs**
```
✅ Check for errors daily
✅ Watch for suspicious activity
✅ Monitor resource usage
```

---

## 📊 MONTHLY COSTS COMPARISON

| Service | Dev | Production | Notes |
|---------|-----|------------|-------|
| **Railway** | $0 | $5-10 | Most reliable |
| **Render** | Free | $7+ | True free tier |
| **Fly.io** | Free | $5+ | Generous free |
| **Heroku** | ❌ No free | $5+ | Paid only |
| **Replit** | Free | ❌ Not for prod | Dev only |

---

## 🎓 BEST PRACTICES

### **For Free Tier:**
```
1. Monitor usage closely
2. Optimize database queries
3. Cache API responses
4. Use CDN for assets
5. Monitor email usage
```

### **For Production:**
```
1. Use paid tier ($5-10/month)
2. Enable auto-scaling
3. Set up monitoring
4. Daily backups
5. Performance optimization
```

---

## 💡 TROUBLESHOOTING

### **App Won't Deploy**
```
1. Check logs: Railway/Render dashboard
2. Verify npm start script exists
3. Check environment variables
4. Ensure PORT=3001 set
5. Check database connection
```

### **Database Connection Fails**
```
1. Get correct DATABASE_URL
2. Ensure DB is running
3. Check firewall rules
4. Verify credentials
5. Test locally first
```

### **API Timeout on Free Tier**
```
1. Optimize queries
2. Add caching
3. Move to paid tier
4. Use CDN
5. Monitor performance
```

---

## 📞 SUPPORT

**Railway Support:** railway.app/support  
**Render Support:** render.com/docs  
**Fly.io Support:** fly.io/docs  

---

## ✅ FINAL RECOMMENDATION

**Keep Using Railway Because:**
1. ✅ Already working perfectly
2. ✅ Free 500 hours/month
3. ✅ Only $5/month if exceeded
4. ✅ No cold starts
5. ✅ Best performance
6. ✅ Built-in database
7. ✅ Best for production

**Cost:** ~$0-5/month (very affordable)

**Your Current Status:**
```
✅ Backend: Working on Railway
✅ Database: PostgreSQL
✅ Email: Brevo (300/day free)
✅ Total Cost: $0-5/month
✅ Status: READY ✅
```

---

**Generated:** 2026-06-16  
**Recommendation:** Keep Railway (best option)  
**Backup:** Use Render (true free tier)
