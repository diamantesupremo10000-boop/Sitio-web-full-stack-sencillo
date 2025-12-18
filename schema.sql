DROP TABLE IF EXISTS videos;

CREATE TABLE videos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    thumbnail TEXT NOT NULL,
    url TEXT NOT NULL,
    views INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Datos semilla (para que no esté vacío al inicio)
INSERT INTO videos (title, thumbnail, url, views) VALUES 
('Paisaje Relajante 4K', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/IMG-20251216-WA0001.jpg', 'grok_video_2025-12-17-08-25-34.mp4', 12050),
('Tutorial de Python en 5 min', 'https://github.com/diamantesupremo10000-boop/Sitio-web-full-stack-sencillo/blob/main/IMG-20251216-WA0006.jpg', 'grok_video_2025-12-17-08-26-19.mp4', 5340),
('Increible Atardecer', 'IMG-20251216-WA0008.jpg', 'grok_video_2025-12-17-08-27-11.mp4', 8900);
