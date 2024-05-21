document.addEventListener('DOMContentLoaded', () => {
    // Charger et afficher les livres depuis l'API REST
    fetch('http://localhost:8080/ords/restscott/bibliotheque/livre/')
        .then(response => response.json())
        .then(data => {
            afficherLivres(data.items);
            // Ajouter la fonctionnalité de recherche
            document.getElementById('searchInput').addEventListener('input', event => {
                rechercherLivres(event.target.value, data.items);
            });
        })
        .catch(error => console.error('Erreur lors du chargement des livres:', error));
});

function afficherLivres(livres) {
    const booksList = document.getElementById('booksList');
    booksList.innerHTML = ''; // Vider la liste des livres
    livres.forEach(livre => {
        const bookItem = document.createElement('div');
        bookItem.className = 'book-item';
        bookItem.innerHTML = `
            <h3>${livre.titre}</h3>
            <p><strong>Auteur :</strong> ${livre.auteur_id}</p>
            <p><strong>Genre :</strong> ${livre.genre_id}</p>
            <p><strong>Disponible :</strong> ${livre.disponibilite === 'Y' ? 'Oui' : 'Non'}</p>
        `;
        booksList.appendChild(bookItem);
    });
}

function rechercherLivres(terme, livres) {
    const livresFiltres = livres.filter(livre => livre.titre.toLowerCase().includes(terme.toLowerCase()));
    afficherLivres(livresFiltres);
}
