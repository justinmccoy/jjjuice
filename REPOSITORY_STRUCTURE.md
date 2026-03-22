# Repository Structure Guide

This document explains the two-repository architecture for the JJ's Juice application ecosystem.

## Overview

The JJ's Juice application is split into two separate repositories:

1. **jjjuice-rate** (this repository) - Rating subdomain application
2. **jjjuice-main** - Main application and domain

This separation allows for:
- Independent deployment and scaling
- Focused development on specific features
- Better organization of codebase
- Separate CI/CD pipelines

## Repository Details

### 1. jjjuice-rate (Current Repository)

**Purpose:** Chili pepper rating and review application

**Domain:** `rate.jjjuice.de` (or subdomain of your choice)

**Technology Stack:**
- React 18
- Vite
- Supabase (PostgreSQL database)
- Vercel (deployment)

**Key Features:**
- Rate chilies across multiple attributes
- Interactive heat meter
- Color rating system
- Review history
- Aggregate statistics
- Detailed chili information

**Repository URL:** `https://github.com/justinmccoy/jjjuice-rate`

### 2. jjjuice-main (Separate Repository)

**Purpose:** Main application and landing page

**Domain:** `jjjuice.de` (main domain)

**Suggested Features:**
- Landing page
- About section
- Navigation to subdomain apps
- Blog/articles about chilies
- User authentication (if needed)
- Dashboard linking to rating app

**Repository URL:** `https://github.com/justinmccoy/jjjuice-main`

## Directory Structure

```
Your GitHub Account
├── jjjuice-rate/              # This repository
│   ├── src/
│   │   ├── App.jsx
│   │   ├── main.jsx
│   │   ├── supabaseClient.js
│   │   └── index.css
│   ├── package.json
│   ├── vite.config.js
│   ├── supabase-schema.sql
│   ├── README.md
│   ├── SUPABASE_SETUP.md
│   └── GITHUB_SETUP.md
│
└── jjjuice-main/              # To be created
    ├── src/
    ├── package.json
    ├── README.md
    └── ...
```

## Setup Instructions

### Step 1: Set Up jjjuice-rate (Current Repository)

This repository is already set up. Follow these steps to push it to GitHub:

```bash
# Navigate to project directory
cd /Users/sholmes/JDevelops/jjjuice-rate

# Initialize git (if not already done)
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: JJ's Juice Rating App"

# Create GitHub repository named 'jjjuice-rate'
# Then connect and push:
git remote add origin https://github.com/justinmccoy/jjjuice-rate.git
git branch -M main
git push -u origin main
```

### Step 2: Create jjjuice-main Repository

```bash
# Create new directory for main app
cd /Users/sholmes/JDevelops
mkdir jjjuice-main
cd jjjuice-main

# Initialize new project (example with Vite)
npm create vite@latest . -- --template react
npm install

# Initialize git
git init
git add .
git commit -m "Initial commit: JJ's Juice Main Application"

# Create GitHub repository named 'jjjuice-main'
# Then connect and push:
git remote add origin https://github.com/justinmccoy/jjjuice-main.git
git branch -M main
git push -u origin main
```

## Deployment Strategy

### jjjuice-rate Deployment (Subdomain)

**Platform:** Vercel

**Domain:** `rate.jjjuice.de`

**Steps:**
1. Push code to GitHub (jjjuice-rate repository)
2. Connect repository to Vercel
3. Add environment variables:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
4. Deploy
5. Configure custom domain in Vercel:
   - Add `rate.jjjuice.de` as custom domain
   - Update DNS records as instructed by Vercel

**Vercel Configuration:**
```json
{
  "buildCommand": "npm run build",
  "outputDirectory": "dist",
  "framework": "vite"
}
```

### jjjuice-main Deployment (Main Domain)

**Platform:** Vercel (or your preferred platform)

**Domain:** `jjjuice.de`

**Steps:**
1. Push code to GitHub (jjjuice-main repository)
2. Connect repository to Vercel
3. Add any required environment variables
4. Deploy
5. Configure custom domain in Vercel:
   - Add `jjjuice.de` as custom domain
   - Update DNS records as instructed by Vercel

## DNS Configuration

You'll need to configure DNS records for both domains:

### For Main Domain (jjjuice.de)
```
Type: A
Name: @
Value: 76.76.21.21 (Vercel IP)

Type: CNAME
Name: www
Value: cname.vercel-dns.com
```

### For Subdomain (rate.jjjuice.de)
```
Type: CNAME
Name: rate
Value: cname.vercel-dns.com
```

## Linking Between Applications

### From Main App to Rating App

In your main application, add navigation links:

```jsx
// In jjjuice-main
<nav>
  <a href="https://jjjuice.de">Home</a>
  <a href="https://rate.jjjuice.de">Rate Chilies</a>
</nav>
```

### From Rating App to Main App

In your rating application (this repo), you can add a header link:

```jsx
// In jjjuice-rate (App.jsx)
<header>
  <a href="https://jjjuice.de">← Back to Main Site</a>
  <h1>JJ's Juice - Chili Rating</h1>
</header>
```

## Shared Resources

### Shared Supabase Database

Both applications can share the same Supabase project:
- Use the same `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`
- Create separate tables for each app if needed
- Use Row Level Security (RLS) to manage access

### Shared Authentication (Optional)

If you implement user authentication:
- Use Supabase Auth in both applications
- Share the same Supabase project
- Users can log in once and access both apps

## Development Workflow

### Working on Rating App (jjjuice-rate)

```bash
cd /Users/sholmes/JDevelops/jjjuice-rate
npm run dev

# Make changes
git add .
git commit -m "Description of changes"
git push

# Vercel will auto-deploy to rate.jjjuice.de
```

### Working on Main App (jjjuice-main)

```bash
cd /Users/sholmes/JDevelops/jjjuice-main
npm run dev

# Make changes
git add .
git commit -m "Description of changes"
git push

# Vercel will auto-deploy to jjjuice.de
```

## Benefits of This Structure

✅ **Separation of Concerns**
- Rating app focuses solely on chili rating functionality
- Main app handles landing page, navigation, and other features

✅ **Independent Deployment**
- Deploy rating app without affecting main site
- Different deployment schedules

✅ **Scalability**
- Scale each application independently based on traffic
- Add more subdomains/apps in the future (e.g., recipes.jjjuice.de)

✅ **Team Collaboration**
- Different teams can work on different repositories
- Clearer code ownership

✅ **Performance**
- Smaller bundle sizes for each app
- Faster build and deployment times

## Future Expansion

You can easily add more subdomain applications:

```
jjjuice.de              → Main landing page
rate.jjjuice.de         → Rating application (this repo)
recipes.jjjuice.de      → Recipe collection
shop.jjjuice.de         → E-commerce store
blog.jjjuice.de         → Blog/articles
```

Each would be its own repository with independent deployment.

## Troubleshooting

### Subdomain Not Working
- Check DNS propagation (can take up to 48 hours)
- Verify CNAME record points to `cname.vercel-dns.com`
- Check Vercel domain configuration

### CORS Issues Between Apps
If you need to make API calls between apps:
```javascript
// Configure CORS headers in Vercel
// vercel.json
{
  "headers": [
    {
      "source": "/api/(.*)",
      "headers": [
        { "key": "Access-Control-Allow-Origin", "value": "https://jjjuice.de" }
      ]
    }
  ]
}
```

### Shared State Between Apps
- Use URL parameters to pass data
- Use Supabase database for shared data
- Implement shared authentication

## Quick Reference

| Repository | Domain | Purpose | Status |
|------------|--------|---------|--------|
| jjjuice-rate | rate.jjjuice.de | Rating app | ✅ Current repo |
| jjjuice-main | jjjuice.de | Main site | 📝 To be created |

## Next Steps

1. ✅ Push jjjuice-rate to GitHub
2. ⬜ Create jjjuice-main repository
3. ⬜ Deploy jjjuice-rate to Vercel
4. ⬜ Deploy jjjuice-main to Vercel
5. ⬜ Configure DNS for both domains
6. ⬜ Add navigation links between apps
7. ⬜ Test full user flow

## Support

- GitHub Docs: https://docs.github.com
- Vercel Docs: https://vercel.com/docs
- Supabase Docs: https://supabase.com/docs
- DNS Configuration: https://vercel.com/docs/concepts/projects/domains

---

**Ready to get started?** Follow the setup instructions above to push this repository to GitHub as `jjjuice-rate`!