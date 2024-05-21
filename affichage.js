function createNode(element) {
    return document.createElement(element);
}

function append(parent, el) {
    return parent.appendChild(el);
}

document.addEventListener("DOMContentLoaded", function() {
    const booksList = document.getElementById('booksList');
    const searchInput = document.getElementById('searchInput');
    const url = "bibliotheque.json"; // URL du fichier JSON local

    let bibliotheque = [];

    // Fonction pour charger les livres depuis le fichier JSON
    function loadBooks() {
        fetch(url)
            .then((resp) => resp.json())
            .then(function(data) {
                bibliotheque = data.bibliotheque.livres;
            })
            .catch(function(error) {
                console.log('Erreur lors du chargement des livres:', error);
            });
    }

    // Fonction pour afficher les livres
    function displayBooks(books) {
        booksList.innerHTML = '';
        books.forEach(book => {
            let li = createNode('li'),
                img = createNode('img'),
                h3 = createNode('h3'),
                p1 = createNode('p'),
                p2 = createNode('p'),
                p3 = createNode('p'),
                p4 = createNode('p');
                
            img.src = book.photo;
            img.alt = book.titre;
            h3.textContent = book.titre;
            p1.textContent = `Auteur: ${book.auteur}`;
            p2.textContent = `Catégorie: ${book.categorie}`;
            p3.textContent = `Disponible: ${book.disponible ? 'Oui' : 'Non'}`;
            p4.textContent = `Date de publication: ${book.date_publication}`;

            append(li, img);
            append(li, h3);
            append(li, p1);
            append(li, p2);
            append(li, p3);
            append(li, p4);
            append(booksList, li);
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