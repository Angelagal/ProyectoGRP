document.addEventListener("DOMContentLoaded", function () {
    fetch('/partymgr/static/main.html')
        .then(response => response.text())
        .then(html => {
            document.getElementById('htmlContainer').innerHTML = html;
        })
        .catch(error => console.error('Error cargando HTML:', error));
});

