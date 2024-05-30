// Fonction pour afficher les emprunts
function afficherEmprunts() {
    const bookId = document.getElementById('book-id').value;
    const userId = document.getElementById('user-id').value;
    const borrowList = document.getElementById('borrowList');

    const url = `http://localhost:8080/ords/bibliotheque/emprunt/?book_id=${bookId}&user_id=${userId}`;

    fetch(url)
        .then(response => {
            if (!response.ok) {
                throw new Error('Erreur HTTP ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            if (data.items.length > 0) {
                borrowList.innerHTML = data.items.map(borrow => `
                    <div class="borrow-item">
                        <p><strong>ID Emprunt :</strong> ${borrow.id_emprunt}</p>
                        <p><strong>Date Emprunt :</strong> ${borrow.date_emprunt}</p>
                        <p><strong>Date Retour :</strong> ${borrow.date_retour}</p>
                    </div>
                `).join('');
            } else {
                borrowList.innerHTML = '<p>Aucun emprunt trouvé pour cet utilisateur et ce livre.</p>';
            }
        })
        .catch(error => {
            console.error('Erreur lors du chargement des emprunts:', error);
            borrowList.innerHTML = '<p>Erreur lors du chargement des emprunts. Veuillez réessayer plus tard.</p>';
        });
}

// Ajout de l'événement DOMContentLoaded pour s'assurer que le DOM est entièrement chargé avant d'ajouter des écouteurs d'événements
document.addEventListener('DOMContentLoaded', function() {
    const button = document.getElementById('empruntButton');
    button.addEventListener('click', afficherEmprunts);
});

