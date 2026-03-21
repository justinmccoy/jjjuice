# Supabase Setup Guide for JJ's Juice

This guide will help you set up Supabase for persistent review storage.

## Step 1: Create a Supabase Account

1. Go to [supabase.com](https://supabase.com)
2. Click "Start your project"
3. Sign up with GitHub (recommended) or email
4. It's FREE - no credit card required!

## Step 2: Create a New Project

1. Click "New Project"
2. Fill in the details:
   - **Name**: `jjjuice` (or any name you prefer)
   - **Database Password**: Create a strong password (save it!)
   - **Region**: Choose closest to your users (e.g., US East, EU West)
   - **Pricing Plan**: Free (perfect for this app)
3. Click "Create new project"
4. Wait 2-3 minutes for setup to complete

## Step 3: Create the Database Table

1. In your Supabase dashboard, click on "SQL Editor" in the left sidebar
2. Click "New query"
3. Copy and paste the entire contents of `supabase-schema.sql` file
4. Click "Run" or press Cmd/Ctrl + Enter
5. You should see "Success. No rows returned"

## Step 4: Get Your API Credentials

1. Click on "Settings" (gear icon) in the left sidebar
2. Click on "API" under Project Settings
3. You'll see two important values:
   - **Project URL**: Something like `https://xxxxxxxxxxxxx.supabase.co`
   - **anon public key**: A long string starting with `eyJ...`
4. Keep this page open - you'll need these values next

## Step 5: Configure Your Local Environment

1. In your project root, create a `.env` file:
   ```bash
   cp .env.example .env
   ```

2. Open `.env` and add your credentials:
   ```env
   VITE_SUPABASE_URL=https://your-project-id.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   ```

3. Replace the values with your actual credentials from Step 4

## Step 6: Install Dependencies

```bash
npm install
```

## Step 7: Test Locally

```bash
npm run dev
```

1. Open the app in your browser
2. Submit a test review
3. Go back to Supabase dashboard
4. Click "Table Editor" in the left sidebar
5. Click on "reviews" table
6. You should see your test review!

## Step 8: Deploy to Vercel

### Option A: Using Vercel CLI

```bash
# Install Vercel CLI
npm install -g vercel

# Login
vercel login

# Deploy
vercel

# Add environment variables
vercel env add VITE_SUPABASE_URL
# Paste your Supabase URL when prompted

vercel env add VITE_SUPABASE_ANON_KEY
# Paste your anon key when prompted

# Deploy to production
vercel --prod
```

### Option B: Using Vercel Dashboard

1. Go to [vercel.com](https://vercel.com)
2. Click "Add New" → "Project"
3. Import your GitHub repository
4. In "Environment Variables" section, add:
   - `VITE_SUPABASE_URL` = your Supabase URL
   - `VITE_SUPABASE_ANON_KEY` = your anon key
5. Click "Deploy"
6. Wait 2-3 minutes
7. Your app is live! 🎉

## Verifying Everything Works

1. Visit your deployed site
2. Submit a review
3. Refresh the page - the review should still be there
4. Open the site in a different browser/device - you should see the same reviews
5. Check Supabase dashboard - all reviews should be visible in the table

## Troubleshooting

### "Error loading reviews"
- Check that your `.env` file has the correct credentials
- Verify the Supabase project is active (not paused)
- Check browser console for specific error messages

### "Error submitting review"
- Verify the `reviews` table exists in Supabase
- Check that Row Level Security policies are set up correctly
- Ensure your anon key is correct

### Reviews not persisting
- Check that environment variables are set in Vercel
- Verify the table schema matches `supabase-schema.sql`
- Check Supabase logs in the dashboard

## Database Management

### View all reviews:
1. Go to Supabase dashboard
2. Click "Table Editor"
3. Click "reviews" table

### Delete a review:
1. In Table Editor, hover over a row
2. Click the trash icon
3. Confirm deletion

### Export reviews:
1. In Table Editor, click "..." menu
2. Select "Download as CSV"

## Free Tier Limits

Supabase Free tier includes:
- ✅ 500 MB database storage
- ✅ 1 GB file storage
- ✅ 2 GB bandwidth per month
- ✅ 50,000 monthly active users
- ✅ Unlimited API requests

**This is more than enough for JJ's Juice!**

## Security Notes

- ✅ The `anon` key is safe to expose in frontend code
- ✅ Row Level Security (RLS) is enabled to protect data
- ✅ Only read and insert operations are allowed
- ⚠️ Never commit `.env` file to Git (it's in `.gitignore`)
- ⚠️ Never share your service_role key (we don't use it)

## Next Steps (Optional)

### Add Authentication
If you want users to edit/delete only their own reviews:
1. Enable Supabase Auth
2. Add login/signup UI
3. Update RLS policies to check `auth.uid()`

### Add Real-time Updates
To see reviews appear instantly across all users:
```javascript
supabase
  .channel('reviews')
  .on('postgres_changes', 
    { event: 'INSERT', schema: 'public', table: 'reviews' },
    (payload) => {
      setAllReviews(prev => [payload.new, ...prev]);
    }
  )
  .subscribe();
```

## Support

- Supabase Docs: https://supabase.com/docs
- Supabase Discord: https://discord.supabase.com
- Vercel Docs: https://vercel.com/docs

## Cost Estimate

- **Supabase**: $0/month (Free tier)
- **Vercel**: $0/month (Free tier)
- **Domain** (optional): $10-15/year
- **Total**: **$0-15/year** 🎉