document.addEventListener('DOMContentLoaded', () => {
    const grid = document.getElementById('videoGrid');
    const playerSection = document.getElementById('playerSection');
    const mainVideo = document.getElementById('mainVideo');
    const uploadModal = document.getElementById('uploadModal');

    // 1. Cargar Videos desde la API
    async function loadVideos() {
        try {
            const res = await fetch('/api/videos');
            const videos = await res.json();
            renderGrid(videos);
        } catch (error) { console.error("Error cargando videos:", error); }
    }

    // 2. Renderizar Grid
    function renderGrid(videos) {
        grid.innerHTML = videos.map(video => `
            <div class="card" onclick="playVideo('${video.url}', '${video.title}', ${video.views})">
                <img src="${video.thumbnail}" class="thumbnail" alt="${video.title}" loading="lazy">
                <div class="card-info">
                    <h3 class="card-title">${video.title}</h3>
                    <p class="card-views">${video.views} visualizaciones</p>
                </div>
            </div>
        `).join('');
    }

    // 3. Reproducir Video (Función global)
    window.playVideo = (url, title, views) => {
        playerSection.classList.remove('hidden');
        mainVideo.src = url;
        document.getElementById('videoTitle').innerText = title;
        document.getElementById('videoViews').innerText = `${views} visualizaciones`;
        window.scrollTo({ top: 0, behavior: 'smooth' });
    };

    // 4. Manejo de Subida
    document.getElementById('uploadForm').addEventListener('submit', async (e) => {
        e.preventDefault();
        const formData = new FormData(e.target);
        const data = Object.fromEntries(formData.entries());

        await fetch('/api/videos', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)
        });
        
        uploadModal.classList.add('hidden');
        e.target.reset();
        loadVideos(); // Recargar grid
    });

    // UI Interactiva
    document.getElementById('closePlayer').onclick = () => {
        playerSection.classList.add('hidden');
        mainVideo.pause();
    };
    document.getElementById('uploadBtn').onclick = () => uploadModal.classList.remove('hidden');
    document.getElementById('closeModal').onclick = () => uploadModal.classList.add('hidden');

    loadVideos(); // Iniciar
});
