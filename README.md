# StreamLite - Plataforma de Videos

Aplicación full-stack para compartir y visualizar videos, similar a YouTube.

## Tecnologías

- **Backend**: Flask + Supabase
- **Frontend**: HTML/CSS/JavaScript
- **Base de datos**: Supabase (PostgreSQL)

## Características

- Visualización de videos en grid
- Reproductor de video integrado
- Subida de videos (URL)
- Contador de visualizaciones
- Diseño responsive y moderno

## Estructura del Proyecto

```
.
├── app.py              # Backend Flask API
├── requirements.txt    # Dependencias Python
├── render.yaml         # Configuración para Render
├── frontend/           # Aplicación frontend
│   ├── index.html
│   ├── style.css
│   ├── main.js
│   ├── env.js         # Configuración de API URL
│   └── vercel.json    # Configuración para Vercel
└── DEPLOY.md          # Guía completa de despliegue
```

## Despliegue

- [QUICKSTART.md](./QUICKSTART.md) - Guía rápida de 15 minutos
- [DEPLOY.md](./DEPLOY.md) - Guía detallada paso a paso

## Desarrollo Local

1. Instalar dependencias del backend:
```bash
pip install -r requirements.txt
```

2. Configurar variables de entorno en `.env`:
```
SUPABASE_URL=tu_url
SUPABASE_ANON_KEY=tu_key
```

3. Ejecutar el backend:
```bash
python app.py
```

4. Abrir el frontend en un navegador local
