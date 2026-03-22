# Main Application Setup Guide (jjjuice-main)

This guide explains where and how to create the main domain application code for `jjjuice.de`.

## Directory Structure

You'll create a **separate directory** alongside your current `jjjuice-rate` directory:

```
/Users/sholmes/JDevelops/
├── jjjuice-rate/          # ✅ Current repository (rating subdomain)
│   ├── src/
│   ├── package.json
│   └── ...
│
└── jjjuice-main/          # 📝 New directory to create (main domain)
    ├── src/
    ├── package.json
    └── ...
```

## Step-by-Step Setup

### Step 1: Create Main Application Directory

```bash
# Navigate to your projects directory
cd /Users/sholmes/JDevelops

# Create new directory for main application
mkdir jjjuice-main
cd jjjuice-main
```

### Step 2: Initialize New React Project

Choose one of these options:

#### Option A: Using Vite (Recommended - Same as rating app)

```bash
# Create Vite React project in current directory
npm create vite@latest . -- --template react

# Install dependencies
npm install

# Test it works
npm run dev
```

#### Option B: Using Create React App

```bash
# Create React app in current directory
npx create-react-app .

# Test it works
npm start
```

#### Option C: Using Next.js (For SEO and server-side rendering)

```bash
# Create Next.js app in current directory
npx create-next-app@latest . --typescript --tailwind --app

# Test it works
npm run dev
```

### Step 3: Create Basic Landing Page Structure

Here's a suggested structure for your main application:

```
jjjuice-main/
├── public/
│   └── favicon.ico
├── src/
│   ├── components/
│   │   ├── Header.jsx          # Navigation with link to rate.jjjuice.de
│   │   ├── Hero.jsx            # Landing page hero section
│   │   ├── Features.jsx        # Feature highlights
│   │   ├── About.jsx           # About section
│   │   └── Footer.jsx          # Footer
│   ├── pages/
│   │   ├── Home.jsx            # Main landing page
│   │   ├── About.jsx           # About page
│   │   └── Contact.jsx         # Contact page
│   ├── App.jsx                 # Main app component
│   ├── main.jsx                # Entry point
│   └── index.css               # Global styles
├── package.json
├── vite.config.js
└── README.md
```

### Step 4: Create Basic Landing Page

Create a simple landing page that links to your rating app:

**src/App.jsx:**
```jsx
import { useState } from 'react'
import './App.css'

function App() {
  return (
    <div className="App">
      <header className="header">
        <nav>
          <h1>JJ's Juice</h1>
          <ul>
            <li><a href="#about">About</a></li>
            <li><a href="#features">Features</a></li>
            <li><a href="https://rate.jjjuice.de" className="cta-button">Rate Chilies →</a></li>
          </ul>
        </nav>
      </header>

      <main>
        <section className="hero">
          <h1>Welcome to JJ's Juice</h1>
          <p>Your ultimate guide to chili peppers</p>
          <a href="https://rate.jjjuice.de" className="cta-button-large">
            Start Rating Chilies
          </a>
        </section>

        <section id="about" className="about">
          <h2>About JJ's Juice</h2>
          <p>
            Discover, rate, and review different types of chili peppers. 
            Track flavor profiles, heat levels, and tasting notes for various 
            dried chilies used in Mexican cuisine.
          </p>
        </section>

        <section id="features" className="features">
          <h2>Features</h2>
          <div className="feature-grid">
            <div className="feature">
              <h3>🌶️ Rate Chilies</h3>
              <p>Evaluate chilies across multiple attributes</p>
            </div>
            <div className="feature">
              <h3>🔥 Heat Meter</h3>
              <p>Interactive heat level rating system</p>
            </div>
            <div className="feature">
              <h3>📊 Statistics</h3>
              <p>View aggregate ratings and trends</p>
            </div>
            <div className="feature">
              <h3>📝 Reviews</h3>
              <p>Share your tasting notes and experiences</p>
            </div>
          </div>
        </section>
      </main>

      <footer className="footer">
        <p>&copy; 2024 JJ's Juice. All rights reserved.</p>
        <nav>
          <a href="https://rate.jjjuice.de">Rating App</a>
          <a href="#about">About</a>
          <a href="#contact">Contact</a>
        </nav>
      </footer>
    </div>
  )
}

export default App
```

**src/App.css:**
```css
.App {
  min-height: 100vh;
  display: flex;
  flex-direction: column;
}

.header {
  background: #8b1a00;
  color: white;
  padding: 1rem 2rem;
}

.header nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
}

.header ul {
  display: flex;
  gap: 2rem;
  list-style: none;
}

.header a {
  color: white;
  text-decoration: none;
}

.hero {
  text-align: center;
  padding: 4rem 2rem;
  background: linear-gradient(135deg, #8b1a00 0%, #4a1a00 100%);
  color: white;
}

.hero h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.cta-button-large {
  display: inline-block;
  margin-top: 2rem;
  padding: 1rem 2rem;
  background: white;
  color: #8b1a00;
  text-decoration: none;
  border-radius: 8px;
  font-weight: bold;
  font-size: 1.2rem;
}

.about, .features {
  max-width: 1200px;
  margin: 0 auto;
  padding: 4rem 2rem;
}

.feature-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin-top: 2rem;
}

.feature {
  padding: 2rem;
  border: 2px solid #8b1a00;
  border-radius: 8px;
}

.footer {
  margin-top: auto;
  background: #333;
  color: white;
  padding: 2rem;
  text-align: center;
}

.footer nav {
  display: flex;
  gap: 2rem;
  justify-content: center;
  margin-top: 1rem;
}

.footer a {
  color: white;
  text-decoration: none;
}
```

### Step 5: Initialize Git Repository

```bash
# Make sure you're in jjjuice-main directory
cd /Users/sholmes/JDevelops/jjjuice-main

# Initialize git
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: JJ's Juice Main Application"
```

### Step 6: Create GitHub Repository

1. Go to [github.com](https://github.com)
2. Click "+" → "New repository"
3. Name: `jjjuice-main`
4. Description: "Main landing page for JJ's Juice (jjjuice.de)"
5. Click "Create repository"

```bash
# Connect to GitHub
git remote add origin https://github.com/justinmccoy/jjjuice-main.git
git branch -M main
git push -u origin main
```

### Step 7: Deploy to Vercel

```bash
# Install Vercel CLI (if not already installed)
npm install -g vercel

# Login to Vercel
vercel login

# Deploy
vercel

# Follow prompts:
# - Link to existing project? No
# - Project name: jjjuice-main
# - Directory: ./
# - Override settings? No

# Deploy to production
vercel --prod
```

### Step 8: Configure Custom Domain

In Vercel dashboard:
1. Go to your `jjjuice-main` project
2. Settings → Domains
3. Add domain: `jjjuice.de`
4. Add domain: `www.jjjuice.de`
5. Follow DNS configuration instructions

## Final Directory Structure

After setup, you'll have:

```
/Users/sholmes/JDevelops/
│
├── jjjuice-rate/                    # Rating subdomain
│   ├── .git/                        # Git repository
│   ├── src/
│   ├── package.json
│   └── README.md
│   └── REPOSITORY_STRUCTURE.md
│
└── jjjuice-main/                    # Main domain
    ├── .git/                        # Separate Git repository
    ├── src/
    ├── package.json
    └── README.md
```

## GitHub Repositories

You'll have two separate repositories:

1. **https://github.com/justinmccoy/jjjuice-rate**
   - Rating application
   - Deploys to: `rate.jjjuice.de`

2. **https://github.com/justinmccoy/jjjuice-main**
   - Main landing page
   - Deploys to: `jjjuice.de`

## Linking Between Applications

### In Main App (jjjuice-main)
Link to rating app:
```jsx
<a href="https://rate.jjjuice.de">Rate Chilies</a>
```

### In Rating App (jjjuice-rate)
Link back to main site:
```jsx
<a href="https://jjjuice.de">← Back to Main Site</a>
```

## Development Workflow

### Working on Main App
```bash
cd /Users/sholmes/JDevelops/jjjuice-main
npm run dev
# Make changes
git add .
git commit -m "Update landing page"
git push
```

### Working on Rating App
```bash
cd /Users/sholmes/JDevelops/jjjuice-rate
npm run dev
# Make changes
git add .
git commit -m "Update rating features"
git push
```

## Quick Start Commands

```bash
# Create main app directory
cd /Users/sholmes/JDevelops
mkdir jjjuice-main
cd jjjuice-main

# Initialize with Vite
npm create vite@latest . -- --template react
npm install

# Test locally
npm run dev

# Initialize git
git init
git add .
git commit -m "Initial commit: JJ's Juice Main Application"

# Push to GitHub (after creating repository)
git remote add origin https://github.com/justinmccoy/jjjuice-main.git
git branch -M main
git push -u origin main

# Deploy to Vercel
vercel
vercel --prod
```

## Summary

- **Location:** `/Users/sholmes/JDevelops/jjjuice-main/`
- **Repository:** Separate from jjjuice-rate
- **Domain:** `jjjuice.de`
- **Purpose:** Landing page and main navigation
- **Links to:** `rate.jjjuice.de` (your rating app)

The two applications are completely separate but linked together through navigation!