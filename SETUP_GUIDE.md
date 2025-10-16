# Quick Setup Guide for TEES E-Commerce Store

## Step-by-Step Setup Instructions

### Step 1: Install Dependencies ✅

Already completed! Your dependencies are installed.

### Step 2: Set Up Supabase Database 🗄️

1. **Create a Supabase Account**

   - Go to [https://supabase.com](https://supabase.com)
   - Click "Start your project"
   - Sign up with GitHub (recommended) or email

2. **Create a New Project**

   - Click "New Project"
   - Choose your organization
   - Enter project name: `tees-ecommerce` (or any name you prefer)
   - Enter a strong database password (save this!)
   - Choose a region closest to you
   - Click "Create new project"
   - Wait 2-3 minutes for setup to complete

3. **Get Your API Credentials**

   - In your Supabase dashboard, go to **Settings** (gear icon in sidebar)
   - Click **API**
   - You'll see two important values:
     - **Project URL**: `https://xxxxxxxxxxxxx.supabase.co`
     - **anon public key**: A long string starting with `eyJ...`
   - Keep this page open, you'll need these values

4. **Set Up the Database Schema**

   - In Supabase dashboard, click **SQL Editor** in the left sidebar
   - Click "New query"
   - Open the `supabase-setup.sql` file from this project
   - Copy ALL the contents
   - Paste into the SQL Editor
   - Click "Run" (or press Ctrl+Enter)
   - You should see "Success. No rows returned"

5. **Verify Your Data**
   - Click **Table Editor** in the left sidebar
   - You should see three tables: `products`, `orders`, `order_items`
   - Click on `products` - you should see 6 sample t-shirts
   - If you see the products, setup was successful! ✅

### Step 3: Configure Environment Variables 🔐

1. **Create Environment File**
   - In your project folder, create a file called `.env.local`
   - Add the following content:

```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=https://xxxxxxxxxxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGc...your-long-key-here

# Site Configuration
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

2. **Replace with Your Values**
   - Replace `https://xxxxxxxxxxxxx.supabase.co` with your Project URL from Step 2.3
   - Replace `eyJhbGc...your-long-key-here` with your anon public key from Step 2.3
   - Save the file

### Step 4: Run the Development Server 🚀

1. **Start the Server**

   ```bash
   npm run dev
   ```

2. **Open Your Browser**

   - Go to [http://localhost:3000](http://localhost:3000)
   - You should see your e-commerce store!

3. **Test the Features**
   - Browse the products on the homepage
   - Click on a product to see details
   - Try the 3D product viewer
   - Add items to cart
   - Go to cart and checkout pages

### Step 5: Customize Your Store 🎨

1. **Add Your Logo** (optional for now)

   - Add your logo file to `public/logo.png`
   - Add an Open Graph image to `public/og-image.jpg` (1200x630px)

2. **Modify Products**

   - Go to Supabase → Table Editor → products
   - Click on any product to edit
   - Add your own product images, names, prices
   - Click "Save"

3. **Update Site Information**
   - Edit `app/layout.tsx` to change site title and description
   - Edit `components/Footer.tsx` to update contact info

## Troubleshooting 🔧

### Problem: "Error fetching products"

**Solution:**

- Check your `.env.local` file has correct Supabase credentials
- Make sure you ran the SQL setup script
- Verify your Supabase project is active

### Problem: 3D models not showing

**Solution:**

- Make sure you're using a modern browser (Chrome, Firefox, Edge, Safari)
- Check browser console for errors (F12)
- Try hard refresh (Ctrl+Shift+R)

### Problem: Cart not saving

**Solution:**

- Check if cookies/local storage is enabled in browser
- Try incognito/private mode
- Clear browser cache

### Problem: Page shows "Module not found" error

**Solution:**

- Make sure you're in the project directory
- Run `npm install` again
- Restart the dev server

## Next Steps 🎯

1. **Test Everything**

   - Browse products
   - Add to cart
   - Complete checkout flow
   - Test on mobile device

2. **Customize Design**

   - Adjust colors in `app/globals.css`
   - Modify component styles
   - Add your branding

3. **Add More Products**

   - In Supabase Table Editor
   - Add product images (use Unsplash or your own)
   - Set correct prices and stock levels

4. **Deploy to Production**
   - See README.md for deployment instructions
   - Recommended: Deploy to Vercel (free)

## Quick Reference 📚

### Useful Commands

```bash
npm run dev          # Start development server
npm run build        # Build for production
npm start            # Run production server
```

### Important Files

- `.env.local` - Your environment variables (DO NOT commit to Git!)
- `supabase-setup.sql` - Database schema
- `app/page.tsx` - Homepage
- `lib/store.ts` - Shopping cart logic
- `lib/supabase.ts` - Database connection

### Supabase Dashboard Quick Links

- Table Editor: Manage products
- SQL Editor: Run database queries
- API Settings: Get credentials
- Logs: Debug issues

## Need Help? 💬

- Check the main README.md for detailed documentation
- Review the code comments in each file
- Check browser console for error messages
- Verify Supabase dashboard for database issues

---

**Congratulations! Your e-commerce store is ready! 🎉**

Start by customizing products in Supabase, then add your branding and logo. The application is fully functional and ready to use!
