# Despliegue Rápido - StreamLite

## Resumen de Cambios

Tu aplicación ha sido refactorizada para despliegue en producción:

### Cambios Principales
- Migración de SQLite a Supabase
- Separación del frontend y backend
- Backend ahora es una API REST con Flask + CORS
- Frontend es estático y puede desplegarse en Vercel
- Agregado soporte para variables de entorno

## Pasos para Desplegar (15 minutos)

### 1. Backend en Render
1. Ve a [render.com](https://render.com)
2. New + → Web Service
3. Conecta tu repo
4. Configuración automática con `render.yaml`
5. Agrega variables de entorno:
   - `SUPABASE_URL`
   - `SUPABASE_ANON_KEY`
6. Deploy
7. **Copia la URL del backend**

### 2. Frontend en Vercel
1. Edita `frontend/env.js`:
   ```javascript
   window.ENV = {
       API_URL: 'https://TU-URL-DE-RENDER.onrender.com'
   };
   ```
2. Ve a [vercel.com](https://vercel.com)
3. New Project
4. Importa tu repo
5. Root Directory: `frontend`
6. Deploy

### 3. Listo
Tu aplicación estará en vivo en la URL de Vercel.

## Variables de Entorno Necesarias

Las credenciales de Supabase ya están configuradas en el proyecto. Puedes encontrarlas en el archivo `.env` del proyecto.

## Archivos Importantes

- `app.py` - Backend API
- `frontend/` - Código del frontend
- `frontend/env.js` - **DEBES EDITAR** con la URL de tu backend
- `render.yaml` - Configuración de Render
- `frontend/vercel.json` - Configuración de Vercel

## Solución Rápida de Problemas

**Frontend no carga videos:**
- Verifica que `frontend/env.js` tenga la URL correcta de tu backend
- Abre la consola del navegador (F12) para ver errores

**Error de CORS:**
- El backend ya tiene CORS configurado, verifica que esté desplegado correctamente

**Backend tarda en responder:**
- El plan gratuito de Render "duerme" después de inactividad
- Primera petición puede tardar 30-60 segundos
