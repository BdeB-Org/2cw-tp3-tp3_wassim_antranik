-- Généré par Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   à :        2024-05-20 20:35:24 HAE
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE auteur (
    id_auteur      NUMBER NOT NULL,
    nom            VARCHAR2(50) NOT NULL,
    livre_id_livre NUMBER NOT NULL
);

ALTER TABLE auteur ADD CONSTRAINT auteur_pk PRIMARY KEY ( id_auteur );

CREATE TABLE emprunt (
    id_emprunt               NUMBER NOT NULL,
    id_livre                 NUMBER NOT NULL,
    date_emprunt             DATE NOT NULL,
    date_retour              DATE,
    livre_id_livre           NUMBER NOT NULL,
    emprunteur_id_emprunteur NUMBER NOT NULL
);

CREATE UNIQUE INDEX emprunt__idx ON
    emprunt (
        emprunteur_id_emprunteur
    ASC );

CREATE UNIQUE INDEX emprunt__idxv1 ON
    emprunt (
        livre_id_livre
    ASC );

ALTER TABLE emprunt ADD CONSTRAINT emprunt_pk PRIMARY KEY ( id_emprunt );

CREATE TABLE emprunteur (
    id_emprunteur NUMBER NOT NULL,
    nom           VARCHAR2(30) NOT NULL,
    email         VARCHAR2(50) NOT NULL
);

ALTER TABLE emprunteur ADD CONSTRAINT emprunteur_pk PRIMARY KEY ( id_emprunteur );

CREATE TABLE genre (
    id_genre       NUMBER NOT NULL,
    nom            VARCHAR2(15) NOT NULL,
    livre_id_livre NUMBER NOT NULL
);

ALTER TABLE genre ADD CONSTRAINT genre_pk PRIMARY KEY ( id_genre );

CREATE TABLE livre (
    id_livre      NUMBER NOT NULL,
    titre         VARCHAR2(50) NOT NULL,
    auteur_id     NUMBER NOT NULL,
    genre_id      NUMBER NOT NULL,
    disponibilité CHAR(1) NOT NULL
);

ALTER TABLE livre ADD CONSTRAINT livre_pk PRIMARY KEY ( id_livre );

ALTER TABLE auteur
    ADD CONSTRAINT auteur_livre_fk FOREIGN KEY ( livre_id_livre )
        REFERENCES livre ( id_livre );

ALTER TABLE emprunt
    ADD CONSTRAINT emprunt_emprunteur_fk FOREIGN KEY ( emprunteur_id_emprunteur )
        REFERENCES emprunteur ( id_emprunteur );

ALTER TABLE emprunt
    ADD CONSTRAINT emprunt_livre_fk FOREIGN KEY ( livre_id_livre )
        REFERENCES livre ( id_livre );

ALTER TABLE genre
    ADD CONSTRAINT genre_livre_fk FOREIGN KEY ( livre_id_livre )
        REFERENCES livre ( id_livre );



-- Rapport récapitulatif d'Oracle SQL Developer Data Modeler : 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             2
-- ALTER TABLE                              9
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
