document.addEventListener("DOMContentLoaded", function() {
    const booksList = document.getElementById('booksList');
    const searchInput = document.getElementById('searchInput');

    let bibliotheque = [];

    // Fonction pour charger les livres depuis le fichier JSON
    async function loadBooks() {
        try {
            const response = await fetch('bibliotheque.json');
            const data = await response.json();
            bibliotheque = data.bibliotheque.livres;
        } catch (error) {
            console.error('Erreur lors du chargement des livres:', error);
        }
    }

    // Fonction pour afficher les livres
    function displayBooks(books) {
        booksList.innerHTML = '';
        books.forEach(book => {
            const bookElement = document.createElement('div');
            bookElement.className = 'book-item';
            bookElement.innerHTML = `
                <img src="${book.photo}" alt="${book.titre}">
                <h3>${book.titre}</h3>
                <p>Auteur: ${book.auteur}</p>
                <p>Catégorie: ${book.categorie}</p>
                <p>Disponible: ${book.disponible ? 'Oui' : 'Non'}</p>
                <p>Date de publication: ${book.date_publication}</p>
            `;
            booksList.appendChild(bookElement);
        });
    }

    // Fonction pour rechercher les livres
    function searchBooks(query) {
        const results = bibliotheque.filter(book =>
            book.titre.toLowerCase().includes(query.toLowerCase())
        );
        displayBooks(results);
    }

    // Charger les livres au chargement initial de la page
    loadBooks();

    // Événement pour le champ de recherche
    searchInput.addEventListener('keydown', (e) => {
        if (e.key === 'Enter') {
            searchBooks(searchInput.value);
        }
    });
});