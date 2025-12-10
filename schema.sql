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
('Paisaje Relajante 4K', 'https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800', 'https://www.w3schools.com/html/mov_bbb.mp4', 12050),
('Tutorial de Python en 5 min', 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=800', 'https://www.w3schools.com/html/movie.mp4', 5340),
('Increible Atardecer', 'https://images.unsplash.com/photo-1495616811223-4d98c6e9d856?w=800', 'https://www.w3schools.com/html/mov_bbb.mp4', 8900);
