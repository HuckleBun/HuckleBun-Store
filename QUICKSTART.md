# 🚀 Quick Start Guide

Get your TEES e-commerce store running in 5 minutes!

## Prerequisites ✓

- [x] Node.js installed
- [x] Dependencies installed
- [ ] Supabase account (free)
- [ ] Environment variables configured

## 3-Step Setup

### 1️⃣ Set Up Supabase (2 minutes)

1. Visit [supabase.com](https://supabase.com) and create a free account
2. Click "New Project" and fill in:
   - Name: `tees-store`
   - Database Password: (create a strong password)
   - Region: (choose closest to you)
3. Wait for project to initialize (~2 minutes)
4. Go to **Settings** → **API** and copy:
   - Project URL
   - anon public key

### 2️⃣ Configure Environment Variables (1 minute)

1. Open `.env.local` in your project
2. Replace the placeholder values:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=paste_your_project_url_here
   NEXT_PUBLIC_SUPABASE_ANON_KEY=paste_your_anon_key_here
   NEXT_PUBLIC_SITE_URL=http://localhost:3000
   ```
3. Save the file

### 3️⃣ Set Up Database & Run (2 minutes)

1. In Supabase dashboard, go to **SQL Editor**
2. Click "New query"
3. Copy everything from `supabase-setup.sql` and paste it
4. Click "Run" button
5. In your terminal, run:
   ```bash
   npm run dev
   ```
6. Open [http://localhost:3000](http://localhost:3000)

## ✅ You're Done!

Your e-commerce store is now running with:

- ✅ 6 sample t-shirt products
- ✅ 3D product viewer
- ✅ Shopping cart
- ✅ Checkout flow
- ✅ SEO optimization
- ✅ Responsive design

## Next Steps

1. **Test the Store**

   - Browse products
   - Add items to cart
   - Try checkout

2. **Customize**

   - Add your logo to `public/logo.png`
   - Edit products in Supabase Table Editor
   - Modify colors in `app/globals.css`

3. **Deploy** (Optional)
   - Push to GitHub
   - Deploy to Vercel (free)
   - See `README.md` for details

## Common Issues

**Problem:** Can't connect to database

- Check `.env.local` has correct credentials
- Verify Supabase project is active

**Problem:** No products showing

- Make sure you ran `supabase-setup.sql`
- Check Supabase Table Editor → products table

**Problem:** 3D models not loading

- Use Chrome, Firefox, Edge, or Safari
- Clear cache and refresh

## Need Help?

- 📖 Read `SETUP_GUIDE.md` for detailed instructions
- 📚 Check `README.md` for full documentation
- 🔧 See `ENVIRONMENT_SETUP.md` for env variable help

---

**Happy Selling! 🛍️**
