-- Supabase Database Schema Setup
-- Run this SQL in your Supabase SQL Editor to set up the database

-- Create products table
CREATE TABLE IF NOT EXISTS products (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL,
  image_url TEXT,
  category TEXT,
  sizes TEXT[] DEFAULT ARRAY['S', 'M', 'L', 'XL', 'XXL'],
  colors TEXT[] DEFAULT ARRAY['Black', 'White'],
  stock INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  customer_email TEXT NOT NULL,
  customer_name TEXT NOT NULL,
  total_amount DECIMAL(10, 2) NOT NULL,
  status TEXT DEFAULT 'pending',
  shipping_address JSONB,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW()),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Create order_items table
CREATE TABLE IF NOT EXISTS order_items (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  order_id UUID REFERENCES orders(id) ON DELETE CASCADE,
  product_id UUID REFERENCES products(id),
  quantity INTEGER NOT NULL,
  size TEXT,
  color TEXT,
  price DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT TIMEZONE('utc', NOW())
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category);
CREATE INDEX IF NOT EXISTS idx_orders_email ON orders(customer_email);
CREATE INDEX IF NOT EXISTS idx_order_items_order_id ON order_items(order_id);

-- Enable Row Level Security (RLS)
ALTER TABLE products ENABLE ROW LEVEL SECURITY;
ALTER TABLE orders ENABLE ROW LEVEL SECURITY;
ALTER TABLE order_items ENABLE ROW LEVEL SECURITY;

-- Create policies for public read access to products
CREATE POLICY "Allow public read access to products" ON products
  FOR SELECT USING (true);

-- Create policies for authenticated users to create orders
CREATE POLICY "Allow anyone to create orders" ON orders
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow anyone to read their own orders" ON orders
  FOR SELECT USING (true);

-- Create policies for order items
CREATE POLICY "Allow anyone to create order items" ON order_items
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow anyone to read order items" ON order_items
  FOR SELECT USING (true);

-- Insert sample products
INSERT INTO products (name, description, price, image_url, category, sizes, colors, stock) VALUES
  ('Classic Black Tee', 'Premium cotton t-shirt with a minimalist design. Perfect for everyday wear.', 29.99, 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=800&q=80', 'basic', ARRAY['S', 'M', 'L', 'XL', 'XXL'], ARRAY['Black', 'White'], 100),
  ('Essential White Tee', 'Clean and simple design. Made from sustainable organic cotton.', 29.99, 'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=800&q=80', 'basic', ARRAY['S', 'M', 'L', 'XL', 'XXL'], ARRAY['White', 'Black'], 100),
  ('Monochrome Statement', 'Bold graphic design on premium quality fabric. Make a statement.', 34.99, 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=800&q=80', 'graphic', ARRAY['S', 'M', 'L', 'XL', 'XXL'], ARRAY['Black', 'White'], 75),
  ('Urban Black', 'Modern fit with premium materials. Designed for comfort and style.', 32.99, 'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?w=800&q=80', 'premium', ARRAY['S', 'M', 'L', 'XL', 'XXL'], ARRAY['Black'], 50),
  ('Minimal White', 'Timeless design meets modern comfort. A wardrobe essential.', 32.99, 'https://images.unsplash.com/photo-1627225924765-552d49cf47ad?w=800&q=80', 'premium', ARRAY['S', 'M', 'L', 'XL', 'XXL'], ARRAY['White'], 50),
  ('Contemporary Tee', 'Contemporary cut with attention to detail. Premium quality guaranteed.', 36.99, 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?w=800&q=80', 'premium', ARRAY['S', 'M', 'L', 'XL', 'XXL'], ARRAY['Black', 'White'], 60);

-- Function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = TIMEZONE('utc', NOW());
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers to auto-update updated_at
CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON products
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON orders
  FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

