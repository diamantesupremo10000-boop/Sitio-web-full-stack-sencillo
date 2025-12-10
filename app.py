import sqlite3
from flask import Flask, render_template, jsonify, request, g

app = Flask(__name__)
DATABASE = 'database.db'

# --- Configuración DB ---
def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
        db.row_factory = sqlite3.Row # Para obtener dicts en lugar de tuplas
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

def init_db():
    with app.app_context():
        db = get_db()
        with open('schema.sql', mode='r') as f:
            db.cursor().executescript(f.read())
        db.commit()
        print("Base de datos inicializada.")

# --- Rutas Frontend ---
@app.route('/')
def index():
    return render_template('index.html')

# --- Rutas API (Backend) ---
@app.route('/api/videos', methods=['GET'])
def get_videos():
    cur = get_db().cursor()
    cur.execute("SELECT * FROM videos ORDER BY id DESC")
    # Convertir filas a lista de diccionarios
    videos = [dict(row) for row in cur.fetchall()]
    return jsonify(videos)

@app.route('/api/videos', methods=['POST'])
def add_video():
    data = request.json
    db = get_db()
    db.execute(
        'INSERT INTO videos (title, thumbnail, url, views) VALUES (?, ?, ?, ?)',
        (data['title'], data['thumbnail'], data['url'], 0)
    )
    db.commit()
    return jsonify({'status': 'success'}), 201

if __name__ == '__main__':
    # Inicializa la DB si no existe al arrancar (solo para dev)
    import os
    if not os.path.exists(DATABASE):
        init_db()
    app.run(debug=True, port=5000)
