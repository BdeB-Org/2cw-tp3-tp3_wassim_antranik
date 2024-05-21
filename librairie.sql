-- Création des tables

CREATE TABLE auteur (
    id_auteur      NUMBER NOT NULL,
    nom            VARCHAR2(50) NOT NULL,
    livre_id_livre NUMBER NOT NULL
);

ALTER TABLE auteur ADD CONSTRAINT auteur_pk PRIMARY KEY (id_auteur);

CREATE TABLE emprunt (
    id_emprunt               NUMBER NOT NULL,
    id_livre                 NUMBER NOT NULL,
    date_emprunt             DATE NOT NULL,
    date_retour              DATE,
    livre_id_livre           NUMBER NOT NULL,
    emprunteur_id_emprunteur NUMBER NOT NULL
);

CREATE UNIQUE INDEX emprunt__idx ON emprunt (emprunteur_id_emprunteur ASC);

CREATE UNIQUE INDEX emprunt__idxv1 ON emprunt (livre_id_livre ASC);

ALTER TABLE emprunt ADD CONSTRAINT emprunt_pk PRIMARY KEY (id_emprunt);

CREATE TABLE emprunteur (
    id_emprunteur NUMBER NOT NULL,
    nom           VARCHAR2(30) NOT NULL,
    email         VARCHAR2(50) NOT NULL
);

ALTER TABLE emprunteur ADD CONSTRAINT emprunteur_pk PRIMARY KEY (id_emprunteur);

CREATE TABLE genre (
    id_genre       NUMBER NOT NULL,
    nom            VARCHAR2(15) NOT NULL,
    livre_id_livre NUMBER NOT NULL
);

ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY (id_genre);

CREATE TABLE livre (
    id_livre      NUMBER NOT NULL,
    titre         VARCHAR2(50) NOT NULL,
    auteur_id     NUMBER NOT NULL,
    genre_id      NUMBER NOT NULL,
    disponibilite CHAR(1) NOT NULL
);

ALTER TABLE livre ADD CONSTRAINT livre_pk PRIMARY KEY (id_livre);

-- Définition des relations entre les tables

ALTER TABLE auteur
    ADD CONSTRAINT auteur_livre_fk FOREIGN KEY (livre_id_livre)
        REFERENCES livre (id_livre);

ALTER TABLE emprunt
    ADD CONSTRAINT emprunt_emprunteur_fk FOREIGN KEY (emprunteur_id_emprunteur)
        REFERENCES emprunteur (id_emprunteur);

ALTER TABLE emprunt
    ADD CONSTRAINT emprunt_livre_fk FOREIGN KEY (livre_id_livre)
        REFERENCES livre (id_livre);

ALTER TABLE genre
    ADD CONSTRAINT genre_livre_fk FOREIGN KEY (livre_id_livre)
        REFERENCES livre (id_livre);

-- Insertion des livres
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (1, 'Le Petit Prince', 1, 1, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (2, '1984', 2, 2, 'N');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (3, 'Les Misérables', 3, 3, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (4, 'LEtranger', 4, 4, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (5, 'Crime et Châtiment', 5, 5, 'N');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (6, 'Don Quichotte', 6, 6, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (7, 'Moby Dick', 7, 7, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (8, 'Germinal', 8, 8, 'N');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (9, 'La Métamorphose', 9, 9, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (10, 'Le Comte de Monte-Cristo', 10, 10, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (11, 'Bel-Ami', 11, 11, 'N');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (12, 'Le Rouge et le Noir', 12, 12, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (13, 'La Peste', 13, 13, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (14, 'LIle mystérieuse', 14, 14, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (15, 'Madame Bovary', 15, 15, 'N');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (16, 'Les Fleurs du mal', 16, 16, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (17, 'LOdyssée', 17, 17, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (18, 'La Divine Comédie', 18, 18, 'N');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (19, 'Le Seigneur des Anneaux', 19, 19, 'Y');
INSERT INTO livre (id_livre, titre, auteur_id, genre_id, disponibilite) VALUES (20, 'Harry Potter à lEcole des sorciers', 20, 20, 'N');

-- Insertion des genres uniques
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (1, 'Fiction', 1);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (2, 'Science-Fiction', 2);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (3, 'Classique', 3);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (4, 'Aventure', 4);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (5, 'Fantasy', 5);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (6, 'Poésie', 6);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (7, 'Épopée', 7);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (8, 'Horreur', 8);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (9, 'Mystère', 9);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (10, 'Autobiographie', 10);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (11, 'Théâtre', 11);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (12, 'Western', 12);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (13, 'Jeunesse', 13);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (14, 'Bande dessinée', 14);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (15, 'Philosophie', 15);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (16, 'Romance', 16);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (17, 'Science-Fantasy', 17);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (18, 'Historique', 18);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (19, 'Aventure', 19);
INSERT INTO genre (id_genre, nom, livre_id_livre) VALUES (20, 'Humour', 20);

-- Insertion des auteurs uniques
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (1, 'Antoine de Saint-Exupéry', 1);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (2, 'George Orwell', 2);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (3, 'Victor Hugo', 3);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (4, 'Albert Camus', 4);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (5, 'Fiodor Dostoïevski', 5);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (6, 'Miguel de Cervantes', 6);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (7, 'Herman Melville', 7);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (8, 'Émile Zola', 8);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (9, 'Franz Kafka', 9);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (10, 'Alexandre Dumas', 10);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (11, 'Guy de Maupassant', 11);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (12, 'Stendhal', 12);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (13, 'Albert Camus', 13);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (14, 'Jules Verne', 14);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (15, 'Gustave Flaubert', 15);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (16, 'Charles Baudelaire', 16);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (17, 'Homère', 17);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (18, 'Dante Alighieri', 18);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (19, 'J.R.R. Tolkien', 19);
INSERT INTO auteur (id_auteur, nom, livre_id_livre) VALUES (20, 'J.K. Rowling', 20);

-- Insertion des emprunteurs uniques
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (1, 'John Doe', 'john.doe@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (2, 'Jane Smith', 'jane.smith@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (3, 'Michael Johnson', 'michael.johnson@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (4, 'Emily Davis', 'emily.davis@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (5, 'David Wilson', 'david.wilson@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (6, 'Sarah Brown', 'sarah.brown@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (7, 'James Miller', 'james.miller@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (8, 'Patricia Taylor', 'patricia.taylor@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (9, 'Robert Anderson', 'robert.anderson@example.com');
INSERT INTO emprunteur (id_emprunteur, nom, email) VALUES (10, 'Linda Thomas', 'linda.thomas@example.com');

-- Insertion des emprunts uniques
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (1, 1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2023-06-01', 'YYYY-MM-DD'), 1, 1);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (2, 2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), TO_DATE('2023-06-02', 'YYYY-MM-DD'), 2, 2);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (3, 3, TO_DATE('2023-05-03', 'YYYY-MM-DD'), TO_DATE('2023-06-03', 'YYYY-MM-DD'), 3, 3);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (4, 4, TO_DATE('2023-05-04', 'YYYY-MM-DD'), TO_DATE('2023-06-04', 'YYYY-MM-DD'), 4, 4);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (5, 5, TO_DATE('2023-05-05', 'YYYY-MM-DD'), TO_DATE('2023-06-05', 'YYYY-MM-DD'), 5, 5);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (6, 6, TO_DATE('2023-05-06', 'YYYY-MM-DD'), TO_DATE('2023-06-06', 'YYYY-MM-DD'), 6, 6);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (7, 7, TO_DATE('2023-05-07', 'YYYY-MM-DD'), TO_DATE('2023-06-07', 'YYYY-MM-DD'), 7, 7);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (8, 8, TO_DATE('2023-05-08', 'YYYY-MM-DD'), TO_DATE('2023-06-08', 'YYYY-MM-DD'), 8, 8);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (9, 9, TO_DATE('2023-05-09', 'YYYY-MM-DD'), TO_DATE('2023-06-09', 'YYYY-MM-DD'), 9, 9);
INSERT INTO emprunt (id_emprunt, id_livre, date_emprunt, date_retour, livre_id_livre, emprunteur_id_emprunteur) VALUES (10, 10, TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2023-06-10', 'YYYY-MM-DD'), 10, 10);
