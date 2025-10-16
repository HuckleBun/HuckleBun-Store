# Environment Variables Setup

Create a `.env.local` file in the root of your project with the following variables:

```env
# Supabase Configuration
# Get these from: https://app.supabase.com/project/_/settings/api
NEXT_PUBLIC_SUPABASE_URL=your_supabase_project_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key_here

# Site Configuration
# For development, use http://localhost:3000
# For production, use your actual domain (e.g., https://yourdomain.com)
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

## How to Get Supabase Credentials

1. Go to [https://supabase.com](https://supabase.com)
2. Create a new project or select an existing one
3. Navigate to **Settings** → **API** from the left sidebar
4. Copy the following values:
   - **Project URL** → Use for `NEXT_PUBLIC_SUPABASE_URL`
   - **anon public** key → Use for `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## Example

```env
NEXT_PUBLIC_SUPABASE_URL=https://abcdefghijklmnop.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiY2RlZmdoaWprbG1ub3AiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTYyMzQ1Njc4OSwiZXhwIjoxOTM5MDMyNzg5fQ.abcdefghijklmnopqrstuvwxyz1234567890
NEXT_PUBLIC_SITE_URL=http://localhost:3000
```

## For Production Deployment

When deploying to Vercel, Netlify, or another platform:

1. Add these environment variables in your hosting platform's dashboard
2. Update `NEXT_PUBLIC_SITE_URL` to your production domain
3. Keep the same Supabase credentials (or create a separate production project)

## Security Notes

- ✅ Never commit `.env.local` to Git (it's already in `.gitignore`)
- ✅ The `NEXT_PUBLIC_` prefix makes these variables available in the browser
- ✅ The Supabase `anon` key is safe to expose - Row Level Security (RLS) protects your data
- ⚠️ For production, consider using separate Supabase projects for development and production
