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
('Paisaje Relajante 4K', 'IMG-20251216-WA0001.jpg', 'grok_video_2025-12-17-08-25-34.mp4', 12050),
('Tutorial de Python en 5 min', 'IMG-20251216-WA0006.jpg', 'https://www.w3schools.com/html/movie.mp4', 5340),
('Increible Atardecer', 'IMG-20251216-WA0008.jpg', 'https://www.w3schools.com/html/mov_bbb.mp4', 8900);
