# TEES - Premium T-Shirt E-Commerce Store

A modern, full-stack e-commerce application built with Next.js 15, TypeScript, Tailwind CSS, Three.js, and Supabase. Features smooth 3D animations, SEO optimization, and a minimalist black and white theme.

## 🚀 Features

- **Modern Stack**: Built with Next.js 15, TypeScript, and Tailwind CSS
- **3D Animations**: Interactive 3D product showcases using Three.js and React Three Fiber
- **Database**: Supabase (PostgreSQL) for scalable data storage
- **State Management**: Zustand for lightweight and efficient cart management
- **SEO Optimized**: Server-side rendering, meta tags, structured data, sitemap, and robots.txt
- **Responsive Design**: Mobile-first design that works on all devices
- **Shopping Cart**: Persistent cart with local storage
- **Smooth Animations**: Framer Motion for delightful user interactions
- **Toast Notifications**: React Hot Toast for user feedback

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- Node.js 18.18.0 or higher
- npm or yarn package manager
- A Supabase account (free tier available at [supabase.com](https://supabase.com))

## 🛠️ Installation

### 1. Clone or Navigate to the Project

```bash
cd ecommerce
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Set Up Supabase

1. Go to [Supabase](https://supabase.com) and create a new project
2. Once your project is ready, go to **Settings** → **API**
3. Copy your **Project URL** and **anon/public API key**
4. In the Supabase dashboard, go to **SQL Editor**
5. Copy the contents of `supabase-setup.sql` and run it in the SQL Editor

This will create:

- `products` table with sample products
- `orders` table for customer orders
- `order_items` table for order details
- Necessary indexes and Row Level Security (RLS) policies

### 4. Configure Environment Variables

Create a `.env.local` file in the root directory:

```env
# Supabase Configuration
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key

# Site Configuration
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

Replace `your_supabase_project_url` and `your_supabase_anon_key` with your actual Supabase credentials.

### 5. Run the Development Server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🎨 Customization

### Adding Your Logo

Replace the template logo by adding your logo files to the `public` folder:

- `public/logo.png` - Main logo
- `public/og-image.jpg` - Open Graph image for social media sharing (1200x630px recommended)

### Modifying Products

You can add or modify products directly in the Supabase dashboard:

1. Go to **Table Editor** → **products**
2. Add, edit, or delete products as needed

### Styling

The app uses a black and white theme. To customize colors:

- Edit `app/globals.css` for global styles
- Tailwind classes are used throughout components
- The theme is defined in CSS custom properties in `globals.css`

## 📦 Project Structure

```
ecommerce/
├── app/                    # Next.js app directory
│   ├── cart/              # Shopping cart page
│   ├── checkout/          # Checkout page
│   ├── product/[id]/      # Dynamic product pages
│   ├── layout.tsx         # Root layout with SEO metadata
│   ├── page.tsx           # Homepage
│   ├── globals.css        # Global styles
│   ├── sitemap.ts         # Dynamic sitemap
│   └── robots.ts          # Robots.txt configuration
├── components/            # React components
│   ├── 3d/               # Three.js 3D components
│   ├── CartItem.tsx      # Cart item component
│   ├── Footer.tsx        # Footer component
│   ├── Navbar.tsx        # Navigation component
│   ├── ProductCard.tsx   # Product card component
│   └── StructuredData.tsx # SEO structured data
├── lib/                   # Utility libraries
│   ├── store.ts          # Zustand cart store
│   ├── supabase.ts       # Supabase client and types
│   └── utils.ts          # Utility functions
├── public/               # Static assets
├── supabase-setup.sql    # Database schema
└── package.json          # Dependencies
```

## 🚀 Deployment

### Deploy to Vercel (Recommended)

1. Push your code to GitHub
2. Go to [Vercel](https://vercel.com)
3. Click "New Project" and import your repository
4. Add environment variables:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_ANON_KEY`
   - `NEXT_PUBLIC_SITE_URL` (your production URL)
5. Click "Deploy"

Vercel will automatically deploy your app and provide you with a production URL.

### Other Platforms

You can also deploy to:

- **Netlify**: Similar process to Vercel
- **Railway**: Great for full-stack apps
- **Digital Ocean**: Using App Platform

## 🔧 Environment Variables

| Variable                        | Description                 | Required |
| ------------------------------- | --------------------------- | -------- |
| `NEXT_PUBLIC_SUPABASE_URL`      | Your Supabase project URL   | Yes      |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Your Supabase anonymous key | Yes      |
| `NEXT_PUBLIC_SITE_URL`          | Your site URL (for SEO)     | Yes      |

## 📱 Features Breakdown

### 3D Product Visualization

- Interactive 3D t-shirt models on homepage and product pages
- Smooth rotations and animations
- Floating geometric shapes for visual interest

### Shopping Cart

- Add/remove items
- Update quantities
- Persistent storage (saved in browser)
- Real-time total calculations

### Checkout Process

- Contact information form
- Shipping address collection
- Payment information (ready for Stripe integration)
- Order summary

### SEO Optimization

- Server-side rendering (SSR)
- Dynamic meta tags for each page
- Structured data (Schema.org)
- Sitemap.xml
- Robots.txt
- Open Graph tags for social sharing
- Twitter Card tags

## 🎯 Future Enhancements

Consider adding:

- [ ] Stripe payment integration
- [ ] User authentication
- [ ] Order history and tracking
- [ ] Product reviews and ratings
- [ ] Wishlist functionality
- [ ] Admin dashboard for product management
- [ ] Email notifications
- [ ] Advanced filtering and search
- [ ] Multiple product images
- [ ] Size guide
- [ ] Newsletter subscription

## 🐛 Troubleshooting

### Database Connection Issues

- Verify your Supabase credentials in `.env.local`
- Check that your Supabase project is active
- Ensure RLS policies are properly set

### 3D Models Not Loading

- Check browser console for errors
- Ensure WebGL is supported in your browser
- Try clearing cache and refreshing

### Cart Not Persisting

- Check browser local storage settings
- Ensure JavaScript is enabled

## 📄 License

This project is open source and available for personal and commercial use.

## 🤝 Support

For questions or issues, please open an issue on the repository or contact support.

---

Built with ❤️ using Next.js, Three.js, and Supabase
