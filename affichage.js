// Fonction pour afficher les livres
function afficherLivres() {
    const searchInput = document.getElementById('searchInput').value.toLowerCase();
    const booksList = document.getElementById('booksList');

    const url = 'http://localhost:8080/ords/bibliotheque/livre/';

    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erreur HTTP ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            // Filtrer les livres selon le terme de recherche
            const filteredBooks = data.items.filter(book => 
                book.titre.toLowerCase().includes(searchInput)
            );

            // Vérifier s'il y a des résultats et les afficher
            if (filteredBooks.length > 0) {
                booksList.innerHTML = filteredBooks.map(book => `
                    <div class="card-content">
                        <li>
                            <h6>${book.titre}</h6>
                            <div>
                                <div class="infos">
                                    <p><strong>Auteur :</strong> ${book.auteur_nom}</p>
                                    <p><strong>Genre :</strong> ${book.genre_nom}</p>
                                    <p><strong>Disponible :</strong> ${book.disponibilite === 'Y' ? 'Oui' : 'Non'}</p>
                                </div>
                            </div>
                        </li>
                    </div>
                `).join('');
            } else {
                booksList.innerHTML = '<p>Aucun livre trouvé pour cette recherche.</p>';
            }
        })
        .catch(error => {
            console.error('Erreur lors du chargement des livres:', error);
            booksList.innerHTML = '<p>Erreur lors du chargement des livres. Veuillez réessayer plus tard.</p>';
        });
}

// Ajout de l'événement DOMContentLoaded pour s'assurer que le DOM est entièrement chargé avant d'ajouter des écouteurs d'événements
document.addEventListener('DOMContentLoaded', function() {
    const button = document.getElementById('searchButton');
    button.addEventListener('click', afficherLivres);
});
