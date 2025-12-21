/*
  # Create videos table

  1. New Tables
    - `videos`
      - `id` (bigint, primary key, auto-increment)
      - `title` (text, not null) - Video title
      - `thumbnail` (text, not null) - Thumbnail image URL
      - `url` (text, not null) - Video file URL
      - `views` (integer, default 0) - View counter
      - `created_at` (timestamptz, default now()) - Creation timestamp
  
  2. Security
    - Enable RLS on `videos` table
    - Add policy for public read access (anyone can view videos)
    - Add policy for public insert (anyone can upload videos)
*/

CREATE TABLE IF NOT EXISTS videos (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title text NOT NULL,
    thumbnail text NOT NULL,
    url text NOT NULL,
    views integer DEFAULT 0,
    created_at timestamptz DEFAULT now()
);

ALTER TABLE videos ENABLE ROW LEVEL SECURITY;

-- Allow anyone to read videos (public access)
CREATE POLICY "Anyone can view videos"
  ON videos
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- Allow anyone to insert videos (public upload)
CREATE POLICY "Anyone can upload videos"
  ON videos
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- Seed data
INSERT INTO videos (title, thumbnail, url, views) VALUES 
('Paisaje Relajante 4K', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/IMG-20251216-WA0001.jpg', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/grok_video_2025-12-17-08-25-34.mp4', 12050),
('Tutorial de Python en 5 min', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/IMG-20251216-WA0006.jpg', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/grok_video_2025-12-17-08-26-19.mp4', 5340),
('Increible Atardecer', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/IMG-20251216-WA0008.jpg', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/grok_video_2025-12-17-08-27-11.mp4', 8900);
