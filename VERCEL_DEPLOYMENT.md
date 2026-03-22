# Vercel Deployment Guide

Complete guide to deploy your JJ's Juice Rating App updates to Vercel.

## Quick Deploy (Automatic from GitHub)

If your project is already connected to Vercel, deployment is automatic:

### Step 1: Commit and Push to GitHub

```bash
# Navigate to your project
cd /Users/sholmes/JDevelops/jjjuice-rate

# Check current changes
git status

# Add all changes
git add .

# Commit with descriptive message
git commit -m "Configure two-repository structure with German domain (.de)"

# Push to GitHub
git push origin main
```

**That's it!** Vercel will automatically:
- Detect the push to GitHub
- Build your project
- Deploy to production
- Usually takes 2-3 minutes

### Step 2: Monitor Deployment

1. Go to [vercel.com/dashboard](https://vercel.com/dashboard)
2. Click on your `jjjuice-rate` project
3. You'll see the deployment in progress
4. Wait for "Ready" status

---

## Manual Deploy (Using Vercel CLI)

If you want to deploy manually or test before pushing to GitHub:

### Option A: Deploy Current Directory

```bash
# Make sure you're in the project directory
cd /Users/sholmes/JDevelops/jjjuice-rate

# Deploy to production
vercel --prod

# Or deploy to preview first
vercel
```

### Option B: Deploy Specific Commit

```bash
# Commit your changes first
git add .
git commit -m "Configure two-repository structure"

# Deploy to production
vercel --prod
```

---

## First Time Setup (If Not Connected Yet)

If this is your first deployment to Vercel:

### Step 1: Install Vercel CLI

```bash
# Install globally
npm install -g vercel

# Or use npx (no installation needed)
npx vercel
```

### Step 2: Login to Vercel

```bash
vercel login
```

Follow the prompts to authenticate.

### Step 3: Link Project to Vercel

```bash
# Navigate to project
cd /Users/sholmes/JDevelops/jjjuice-rate

# Initialize Vercel project
vercel

# Answer the prompts:
# ? Set up and deploy? Yes
# ? Which scope? (your account)
# ? Link to existing project? No
# ? What's your project's name? jjjuice-rate
# ? In which directory is your code located? ./
# ? Want to override settings? No
```

### Step 4: Add Environment Variables

```bash
# Add Supabase URL
vercel env add VITE_SUPABASE_URL production
# Paste your Supabase URL when prompted

# Add Supabase Anon Key
vercel env add VITE_SUPABASE_ANON_KEY production
# Paste your anon key when prompted
```

Or add them in the Vercel dashboard:
1. Go to your project settings
2. Click "Environment Variables"
3. Add:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`

### Step 5: Deploy to Production

```bash
vercel --prod
```

---

## Connect GitHub Repository (Recommended)

For automatic deployments on every push:

### Step 1: Push to GitHub First

```bash
cd /Users/sholmes/JDevelops/jjjuice-rate
git add .
git commit -m "Initial commit"
git push origin main
```

### Step 2: Import in Vercel Dashboard

1. Go to [vercel.com/new](https://vercel.com/new)
2. Click "Import Git Repository"
3. Select your GitHub account
4. Find `justinmccoy/jjjuice-rate`
5. Click "Import"
6. Configure:
   - **Framework Preset:** Vite
   - **Root Directory:** ./
   - **Build Command:** `npm run build`
   - **Output Directory:** `dist`
7. Add Environment Variables:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
8. Click "Deploy"

### Step 3: Configure Custom Domain

After deployment:
1. Go to Project Settings → Domains
2. Add domain: `rate.jjjuice.de`
3. Follow DNS configuration instructions
4. Add these DNS records at your domain provider:

```
Type: CNAME
Name: rate
Value: cname.vercel-dns.com
```

---

## Deployment Workflow

### For Future Updates

```bash
# 1. Make your changes to the code
# 2. Test locally
npm run dev

# 3. Commit changes
git add .
git commit -m "Description of changes"

# 4. Push to GitHub
git push origin main

# 5. Vercel automatically deploys! ✨
```

### Check Deployment Status

```bash
# Using Vercel CLI
vercel ls

# Or visit dashboard
open https://vercel.com/dashboard
```

---

## Troubleshooting

### Build Fails

Check build logs in Vercel dashboard:
1. Go to your project
2. Click on the failed deployment
3. View logs to see the error

Common issues:
```bash
# Missing dependencies
npm install

# Build locally to test
npm run build

# Check for TypeScript errors
npm run build
```

### Environment Variables Not Working

```bash
# List current environment variables
vercel env ls

# Pull environment variables locally
vercel env pull

# Re-add if needed
vercel env add VITE_SUPABASE_URL production
```

### Domain Not Working

1. Check DNS propagation (can take up to 48 hours):
   ```bash
   dig rate.jjjuice.de
   ```

2. Verify DNS records at your domain provider:
   ```
   Type: CNAME
   Name: rate
   Value: cname.vercel-dns.com
   TTL: 3600
   ```

3. Check domain status in Vercel dashboard

### Deployment Stuck

```bash
# Cancel current deployment
vercel cancel

# Redeploy
vercel --prod
```

---

## Deployment Commands Reference

```bash
# Deploy to preview (test environment)
vercel

# Deploy to production
vercel --prod

# List deployments
vercel ls

# View deployment logs
vercel logs [deployment-url]

# Cancel deployment
vercel cancel

# Remove deployment
vercel rm [deployment-url]

# Check project info
vercel inspect

# Pull environment variables
vercel env pull

# Add environment variable
vercel env add [name] [environment]

# List environment variables
vercel env ls
```

---

## Vercel Dashboard URLs

- **Dashboard:** https://vercel.com/dashboard
- **Your Project:** https://vercel.com/justinmccoy/jjjuice-rate
- **Deployments:** https://vercel.com/justinmccoy/jjjuice-rate/deployments
- **Settings:** https://vercel.com/justinmccoy/jjjuice-rate/settings

---

## Current Deployment Steps

For your current changes:

```bash
# 1. Commit documentation updates
cd /Users/sholmes/JDevelops/jjjuice-rate
git add .
git commit -m "Add two-repository structure documentation and update to .de domain"

# 2. Push to GitHub
git push origin main

# 3. Vercel will automatically deploy
# Monitor at: https://vercel.com/justinmccoy/jjjuice-rate

# 4. Verify deployment
# Visit: https://rate.jjjuice.de (or your current Vercel URL)
```

---

## Expected Timeline

- **Commit & Push:** Instant
- **Vercel Build:** 1-2 minutes
- **Deployment:** 30 seconds
- **DNS Propagation:** Up to 48 hours (for new domains)
- **Total:** ~3 minutes (if domain already configured)

---

## Success Checklist

- ✅ Changes committed to Git
- ✅ Pushed to GitHub
- ✅ Vercel build successful
- ✅ Deployment shows "Ready"
- ✅ Site accessible at URL
- ✅ Environment variables working
- ✅ Supabase connection working

---

## Need Help?

- Vercel Docs: https://vercel.com/docs
- Vercel Support: https://vercel.com/support
- Check build logs in dashboard
- Use `vercel logs` command for details