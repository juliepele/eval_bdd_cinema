-- Validation CRUD

-- Le Create est contenu dans le fichier 'B_CREATE_BDD_TABLES.sql'

-- Test du 'READ'

-- Affiche toutes les séances du jour d'un cinéma
SELECT film_show.date_film_show AS 'Date de la séance',
       movie.name_movie AS 'Nom du film',
       genre.name_genre AS 'Genre du film',
       film_show.startTime_film_show AS 'Heure début séance',
       movie_room.id_movie_room AS 'Salle de projection',
       hall.hallType_hall AS 'Nom du hall',
       cinema_complex.name_cinema_complex AS 'Complexe'
FROM film_show
JOIN movie ON film_show.movie_id = movie.id_movie
JOIN genre ON movie.genre_id = genre.id_genre
JOIN movie_room ON film_show.movie_room_id = movie_room.id_movie_room
JOIN hall ON movie_room.hall_id = hall.id_hall
JOIN cinema_complex ON movie_room.cinema_complex_id = cinema_complex.id_cinema_complex
WHERE cinema_complex.name_cinema_complex = 'Pathé-Gaumont' and film_show.date_film_show = '20211221'
ORDER BY film_show.startTime_film_show;

-- Affiche le passage du même film au même horaire dans plusieurs salles différentes (dans un meme complexe ou differents complexes)
SELECT movie.name_movie AS 'Nom du film',
       film_show.date_film_show AS 'Date séance',
       film_show.startTime_film_show AS 'Heure début de séance',
       movie_room.id_movie_room AS 'N° salle',
       cinema_complex.name_cinema_complex AS 'Complex'
FROM film_show
JOIN movie_room ON film_show.movie_room_id = movie_room.id_movie_room
JOIN movie ON film_show.movie_id = movie.id_movie
JOIN cinema_complex ON movie_room.cinema_complex_id = cinema_complex.id_cinema_complex
ORDER BY movie.name_movie;

-- Possibilité de réserver dans plusieurs complexes
SELECT booking.id_booking AS 'Numéro de réservation',
       CONCAT(costumer.firstName_Costumer, ' ', costumer.lastName_Costumer) AS 'Prénom & Nom du client',
       film_show.date_film_show AS 'Date de la séance',
       cinema_complex.name_cinema_complex AS 'Complex',
       movie_room.id_movie_room AS 'N° salle'
FROM booking
JOIN film_show ON booking.film_show_id = film_show.id_film_show
JOIN costumer ON booking.costumer_id = costumer.id_costumer
JOIN movie_room ON film_show.movie_room_id = movie_room.id_movie_room
JOIN cinema_complex ON movie_room.cinema_complex_id = cinema_complex.id_cinema_complex
WHERE costumer.firstName_costumer = 'Mack'
   OR costumer.firstName_costumer = 'Micah'
   OR costumer.firstName_costumer = 'Orland'
ORDER BY costumer.firstName_costumer;

-- Affiche le nombre de places disponibles dans une salle pour une séance donnée
SELECT cinema_complex.name_cinema_complex AS 'Complexe',
       film_show.id_film_show AS 'N° séance',
       CONCAT(film_show.date_film_show, ' ', film_show.startTime_film_show) AS 'Date et heure de la séance',
       movie_room.id_movie_room AS 'N° de la salle',
       movie_room.seats_movie_room AS 'Nombre de places dans la salle',
       COUNT(booking.id_booking) AS 'Nombre de réservation',
       movie_room.seats_movie_room - COUNT(booking.id_booking) AS 'Nombre de places disponibles'
FROM booking
JOIN film_show ON booking.film_show_id = film_show.id_film_show
JOIN movie_room ON film_show.movie_room_id = movie_room.id_movie_room
JOIN cinema_complex ON movie_room.cinema_complex_id = cinema_complex.id_cinema_complex
WHERE film_show.id_film_show = 9;

-- Affiche la liste des tarifs disponibles
SELECT * FROM price_list;

-- Affiche si le paiement est réalisé sur place ou en ligne et si la réservation est payée
SELECT is_paid.booking_id AS 'N° de réservation',
       booking.createdAt_booking AS 'Date de la réservation',
       payment.paymentType_payment AS 'Paiement en ligne/sur place',
       is_paid.payment_is_Paid AS 'paiement effectué oui(1)/non(0)',
       payment.paymentMethod_payment AS 'Moyen de paiement',
       is_paid.date_is_paid AS 'Date de paiement'
FROM is_paid
JOIN payment ON is_paid.payment_id = payment.id_payment
JOIN booking ON is_paid.booking_id = booking.id_booking;

-- Affiche les Admin des complexes ayant une vue sur tout
SELECT manage.user_id AS 'Identifiant utilisateur',
       CONCAT(user.firstName_user, ' ', user.lastName_user) AS 'Prénom et Nom de l''utilisateur',
       user.pseudo_user AS 'Pseudo de connexion',
       role.roleType_role AS 'Rôle',
       manage.cinema_complex_id AS 'Identifiant Complex',
       cinema_complex.name_cinema_complex AS 'Nom Complex'
FROM manage
JOIN user ON manage.user_id = user.id_user
JOIN role ON user.role_id = role.id_role
JOIN cinema_complex ON manage.cinema_complex_id = cinema_complex.id_cinema_complex
WHERE role.id_role = 1;

-- Affiche les Managers des complexes ne pouvant ajouter des séances que dans leur complexe
SELECT manage.user_id AS 'Identifiant utilisateur',
       CONCAT(user.firstName_user, ' ', user.lastName_user) AS 'Prénom et Nom de l''utilisateur',
       user.pseudo_user AS 'Pseudo de connexion',
       role.roleType_role AS 'Rôle',
       manage.cinema_complex_id AS 'Identifiant Complex',
       cinema_complex.name_cinema_complex AS 'Nom Complex'
FROM manage
         JOIN user ON manage.user_id = user.id_user
         JOIN role ON user.role_id = role.id_role
         JOIN cinema_complex ON manage.cinema_complex_id = cinema_complex.id_cinema_complex
WHERE role.id_role = 2;


-- Test du UPDATE

-- Modification de l'horaire de la séance 25 concernant le film BlackPink (passage de 22h30 à 20h30)
UPDATE film_show
SET film_show.startTime_film_show = '20:30:00'
WHERE film_show.id_film_show = 25;

SELECT film_show.id_film_show, film_show.startTime_film_show
FROM film_show
WHERE film_show.id_film_show = 25;


-- Test du DELETE

-- Suppression de la séance 15 en date du 12/12/21 à 20h00.
DELETE FROM film_show
WHERE film_show.id_film_show = 15;

SELECT * FROM film_show;



