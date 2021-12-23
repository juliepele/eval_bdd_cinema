-- Création de 2 utilisateurs ayant des droits différents

SHOW DATABASES;
USE eval_bdd_cinema;

-- L'utilisateur admin aura tous les droits sur la BDD
CREATE USER 'admin'@'%' IDENTIFIED BY 'Motdepasse123!';
GRANT ALL PRIVILEGES ON eval_bdd_cinema.* TO 'admin'@'%';
FLUSH PRIVILEGES;

-- L'utilisateur user aura seulement le droit de voir la BDD
CREATE USER 'user'@'%' IDENTIFIED BY 'Motdepasse321*';
GRANT SELECT ON eval_bdd_cinema.* TO 'user'@'%';
FLUSH PRIVILEGES;

