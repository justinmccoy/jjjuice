# GitHub Setup Guide

Complete guide to push your JJ's Juice Rating App to GitHub as a new repository.

> **Note:** This guide is for the `jjjuice-rate` repository (rating subdomain). For information about the multi-repository structure, see [REPOSITORY_STRUCTURE.md](./REPOSITORY_STRUCTURE.md).

## Prerequisites

- Git installed on your computer
- GitHub account (free at github.com)

## Step 1: Initialize Git Repository

Open your terminal in the project directory and run:

```bash
# Navigate to your project directory
cd /Users/sholmes/JDevelops/jjjuice-rate

# Initialize git repository
git init

# Check git status (see all files)
git status
```

## Step 2: Create Initial Commit

```bash
# Add all files to staging
git add .

# Create your first commit
git commit -m "Initial commit: JJ's Juice Rating App (subdomain) with Supabase integration"

# Verify commit was created
git log --oneline
```

## Step 3: Create GitHub Repository

### Option A: Using GitHub Website (Easiest)

1. Go to [github.com](https://github.com)
2. Click the **"+"** icon in top-right corner
3. Select **"New repository"**
4. Fill in the details:
   - **Repository name**: `jjjuice-rate`
   - **Description**: "Chili pepper rating subdomain application with Supabase database"
   - **Visibility**: Choose **Public** or **Private**
   - **DO NOT** check "Initialize with README" (we already have one)
   - **DO NOT** add .gitignore or license (we already have them)
5. Click **"Create repository"**
6. You'll see a page with setup instructions - keep it open!

### Option B: Using GitHub CLI (Advanced)

```bash
# Install GitHub CLI if not installed
brew install gh

# Login to GitHub
gh auth login

# Create repository
gh repo create jjjuice-rate --public --source=. --remote=origin --push
```

## Step 4: Connect Local Repository to GitHub

After creating the repository on GitHub, you'll see commands like these. Copy YOUR actual URL:

```bash
# Add GitHub as remote origin
git remote add origin https://github.com/justinmccoy/jjjuice-rate.git

# Verify remote was added
git remote -v

# Rename branch to main (if needed)
git branch -M main
```

## Step 5: Push to GitHub

```bash
# Push your code to GitHub
git push -u origin main

# You may be prompted to login - follow the instructions
```

## Step 6: Verify Upload

1. Go to your GitHub repository URL: `https://github.com/justinmccoy/jjjuice-rate`
2. You should see all your files!
3. Check that README.md displays nicely on the main page

## Complete Command Sequence

Here's the full sequence in one place:

```bash
# 1. Initialize and commit
cd /Users/sholmes/JDevelops/jjjuice-rate
git init
git add .
git commit -m "Initial commit: JJ's Juice Rating App (subdomain)"

# 2. Connect to GitHub
git remote add origin https://github.com/justinmccoy/jjjuice-rate.git
git branch -M main

# 3. Push to GitHub
git push -u origin main
```

## Troubleshooting

### "remote origin already exists"
```bash
# Remove existing remote and add new one
git remote remove origin
git remote add origin https://github.com/justinmccoy/jjjuice-rate.git
```

### Authentication Issues
```bash
# Use GitHub CLI for easier authentication
gh auth login

# Or use personal access token
# Go to GitHub Settings > Developer settings > Personal access tokens
# Generate new token with 'repo' scope
# Use token as password when prompted
```

### "failed to push some refs"
```bash
# Pull first, then push
git pull origin main --allow-unrelated-histories
git push -u origin main
```

## What Gets Pushed to GitHub

✅ **Included:**
- All source code (`src/`)
- Configuration files (`package.json`, `vite.config.js`)
- Documentation (`README.md`, `SUPABASE_SETUP.md`, `REPOSITORY_STRUCTURE.md`, etc.)
- Database schema (`supabase-schema.sql`)
- `.gitignore` file
- `.env.example` template

❌ **Excluded (by .gitignore):**
- `node_modules/` (dependencies)
- `dist/` (build output)
- `.env` (your actual credentials - NEVER commit this!)
- `.DS_Store` (Mac system files)

## After Pushing to GitHub

### Enable GitHub Pages (Optional)
To host a static preview:
1. Go to repository Settings
2. Click "Pages" in sidebar
3. Source: Deploy from branch
4. Branch: main, folder: / (root)
5. Save

Note: This won't work fully without Supabase setup, but shows the UI.

### Add Repository Topics
Make your repo discoverable:
1. Click "⚙️ Settings" gear icon near "About"
2. Add topics: `react`, `vite`, `supabase`, `food`, `rating-app`, `chili-peppers`
3. Save changes

### Add Repository Description
1. Click "⚙️ Settings" gear icon near "About"
2. Description: "Chili pepper rating subdomain application (rate.jjjuice.de) with Supabase database"
3. Website: `https://rate.jjjuice.de` (add after deployment)
4. Save changes

## Next Steps After GitHub Push

1. **Deploy to Vercel:**
   ```bash
   vercel
   # Select your GitHub repository
   # Add environment variables
   ```

2. **Share Your Repository:**
   - URL: `https://github.com/justinmccoy/jjjuice-rate`
   - Share with collaborators
   - Add to your portfolio

3. **Set Up Main Repository:**
   - Follow [REPOSITORY_STRUCTURE.md](./REPOSITORY_STRUCTURE.md) to create `jjjuice-main`
   - Link both repositories together

3. **Future Updates:**
   ```bash
   # Make changes to your code
   git add .
   git commit -m "Description of changes"
   git push
   ```

## Useful Git Commands

```bash
# Check status
git status

# View commit history
git log --oneline

# Create a new branch
git checkout -b feature-name

# Switch branches
git checkout main

# Pull latest changes
git pull origin main

# View remote URL
git remote -v

# Undo last commit (keep changes)
git reset --soft HEAD~1

# Discard all local changes
git reset --hard HEAD
```

## GitHub Repository Settings Recommendations

### Branch Protection (Optional)
For collaborative work:
1. Settings > Branches
2. Add rule for `main` branch
3. Enable "Require pull request reviews"

### Secrets (For Vercel Deployment)
If using GitHub Actions:
1. Settings > Secrets and variables > Actions
2. Add `VITE_SUPABASE_URL`
3. Add `VITE_SUPABASE_ANON_KEY`

## Success Checklist

- ✅ Repository created on GitHub
- ✅ All files pushed successfully
- ✅ README.md displays correctly
- ✅ `.env` file NOT in repository (check!)
- ✅ Repository description added
- ✅ Topics/tags added
- ✅ Ready to deploy to Vercel

## Your Repository URLs

After setup, your repositories will be at:

**Rating App (this repo):**
```
https://github.com/justinmccoy/jjjuice-rate
```

**Main App (to be created):**
```
https://github.com/justinmccoy/jjjuice-main
```

See [REPOSITORY_STRUCTURE.md](./REPOSITORY_STRUCTURE.md) for complete multi-repository setup.

## Need Help?

- GitHub Docs: https://docs.github.com
- Git Basics: https://git-scm.com/book/en/v2/Getting-Started-Git-Basics
- GitHub Support: https://support.github.com

---

**Ready to deploy?**
1. After pushing to GitHub, follow [SUPABASE_SETUP.md](./SUPABASE_SETUP.md) to set up your database
2. See [REPOSITORY_STRUCTURE.md](./REPOSITORY_STRUCTURE.md) for deployment to subdomain
3. Deploy to Vercel with custom domain `rate.jjjuice.de`