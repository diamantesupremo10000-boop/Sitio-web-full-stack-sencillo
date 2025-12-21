# Guía de Despliegue - StreamLite

Esta aplicación está dividida en dos partes:
- **Backend**: Flask API con Supabase (Render)
- **Frontend**: HTML/CSS/JS estático (Vercel)

## Requisitos Previos

1. Cuenta de Supabase (gratis)
2. Cuenta de Render (gratis)
3. Cuenta de Vercel (gratis)

## Paso 1: Configurar Supabase

La base de datos ya está configurada con la migración incluida en el proyecto.

1. Ve a tu proyecto Supabase
2. Copia las credenciales:
   - Project URL (SUPABASE_URL)
   - Anon/Public Key (SUPABASE_ANON_KEY)

## Paso 2: Desplegar Backend en Render

1. Ve a [Render](https://render.com) y crea una cuenta
2. Click en "New +" → "Web Service"
3. Conecta tu repositorio de GitHub
4. Configura el servicio:
   - **Name**: streamlite-backend
   - **Region**: Elige la más cercana
   - **Branch**: main
   - **Root Directory**: deja vacío
   - **Runtime**: Python 3
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `gunicorn app:app`
   - **Plan**: Free

5. Agrega las variables de entorno:
   - `SUPABASE_URL`: Tu URL de Supabase
   - `SUPABASE_ANON_KEY`: Tu clave anon de Supabase

6. Click en "Create Web Service"
7. Espera a que termine el despliegue
8. Copia la URL de tu servicio (ejemplo: `https://streamlite-backend.onrender.com`)

## Paso 3: Desplegar Frontend en Vercel

1. Ve a [Vercel](https://vercel.com) y crea una cuenta
2. Click en "Add New..." → "Project"
3. Importa tu repositorio de GitHub
4. Configura el proyecto:
   - **Framework Preset**: Other
   - **Root Directory**: `frontend`
   - **Build Command**: deja vacío
   - **Output Directory**: `.`

5. ANTES de desplegar, edita el archivo `frontend/env.js`:
   ```javascript
   window.ENV = {
       API_URL: 'https://TU-BACKEND-URL.onrender.com'
   };
   ```
   Reemplaza `TU-BACKEND-URL` con la URL de tu backend de Render.

6. Click en "Deploy"
7. Espera a que termine el despliegue

## Paso 4: Verificar

1. Visita tu URL de Vercel
2. Deberías ver la aplicación funcionando
3. Prueba:
   - Cargar videos desde la base de datos
   - Subir un nuevo video
   - Reproducir videos

## Solución de Problemas

### Error de CORS
Si ves errores de CORS en la consola, verifica que:
- El backend tenga `flask-cors` instalado
- La URL del backend en `env.js` sea correcta

### Backend no responde
- Verifica que las variables de entorno estén configuradas en Render
- Revisa los logs en el dashboard de Render

### Frontend no carga videos
- Abre la consola del navegador (F12)
- Verifica que la URL de la API sea correcta
- Asegúrate de que el backend esté funcionando

## Desarrollo Local

### Backend
```bash
pip install -r requirements.txt
export SUPABASE_URL=tu_url
export SUPABASE_ANON_KEY=tu_key
python app.py
```

### Frontend
Simplemente abre `frontend/index.html` en tu navegador o usa un servidor local:
```bash
cd frontend
python -m http.server 8000
```

## Notas Importantes

- El plan gratuito de Render puede tardar 30-60 segundos en despertar si no hay tráfico
- Vercel ofrece CDN global para el frontend
- Supabase incluye 500MB de base de datos gratis
- Los videos deben estar alojados en URLs públicas (GitHub, Cloudinary, etc.)
