// Fonction pour afficher les livres
function afficherLivres() {
    const searchInput = document.getElementById('searchInput').value;
    const booksList = document.getElementById('booksList');

    // Appel à l'API REST pour récupérer les livres
    fetch('http://localhost:8080/ords/restscott/bibliotheque/livre/')
        .then(response => response.json())
        .then(data => {
            // Filtrer les livres selon le terme de recherche
            const filteredBooks = data.items.filter(book => 
                book.titre.toLowerCase().includes(searchInput.toLowerCase())
            );

            // Afficher les livres filtrés
            booksList.innerHTML = filteredBooks.map(book => `
                <div class="card-content">
                    <li>
                        <h6>${book.titre}</h6>
                        <div>
                            <div class="infos">
                                <p><strong>Auteur :</strong> ${book.auteur_id}</p>
                                <p><strong>Genre :</strong> ${book.genre_id}</p>
                                <p><strong>Disponible :</strong> ${book.disponibilite === 'Y' ? 'Oui' : 'Non'}</p>
                            </div>
                        </div>
                    </li>
                </div>
            `).join('');
        })
        .catch(error => console.error('Erreur lors du chargement des livres:', error));
}

// Ajout de l'événement DOMContentLoaded pour s'assurer que le DOM est entièrement chargé avant d'ajouter des écouteurs d'événements
document.addEventListener('DOMContentLoaded', function() {
    const button = document.querySelector('input[type="button"]');
    button.addEventListener('click', afficherLivres);
});
