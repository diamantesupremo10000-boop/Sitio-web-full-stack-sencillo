const API_URL = window.ENV?.API_URL || 'http://localhost:5000';

document.addEventListener('DOMContentLoaded', () => {
    const grid = document.getElementById('videoGrid');
    const playerSection = document.getElementById('playerSection');
    const mainVideo = document.getElementById('mainVideo');
    const uploadModal = document.getElementById('uploadModal');

    async function loadVideos() {
        try {
            const res = await fetch(`${API_URL}/api/videos`);
            const videos = await res.json();
            renderGrid(videos);
        } catch (error) {
            console.error("Error cargando videos:", error);
            grid.innerHTML = '<p style="color: #aaa; text-align: center; padding: 2rem;">Error al cargar videos</p>';
        }
    }

    function renderGrid(videos) {
        if (!videos || videos.length === 0) {
            grid.innerHTML = '<p style="color: #aaa; text-align: center; padding: 2rem;">No hay videos disponibles</p>';
            return;
        }
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

    window.playVideo = (url, title, views) => {
        playerSection.classList.remove('hidden');
        mainVideo.src = url;
        document.getElementById('videoTitle').innerText = title;
        document.getElementById('videoViews').innerText = `${views} visualizaciones`;
        window.scrollTo({ top: 0, behavior: 'smooth' });
    };

    document.getElementById('uploadForm').addEventListener('submit', async (e) => {
        e.preventDefault();
        const formData = new FormData(e.target);
        const data = Object.fromEntries(formData.entries());

        try {
            const response = await fetch(`${API_URL}/api/videos`, {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(data)
            });

            if (response.ok) {
                uploadModal.classList.add('hidden');
                e.target.reset();
                loadVideos();
            } else {
                alert('Error al subir el video');
            }
        } catch (error) {
            console.error("Error subiendo video:", error);
            alert('Error al subir el video');
        }
    });

    document.getElementById('closePlayer').onclick = () => {
        playerSection.classList.add('hidden');
        mainVideo.pause();
    };
    document.getElementById('uploadBtn').onclick = () => uploadModal.classList.remove('hidden');
    document.getElementById('closeModal').onclick = () => uploadModal.classList.add('hidden');

    loadVideos();
});
