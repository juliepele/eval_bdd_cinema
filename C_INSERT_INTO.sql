-- Insertion de données fictives dans les tables de la BDD eval_bdd_cinema

INSERT INTO eval_bdd_cinema.cinema_complex (name_cinema_complex, phone_cinema_complex, address_cinema_complex, zipCode_cinema_complex, city_cinema_complex)
VALUES ('Cinéville LRSY', '02.51.22.25.00', 'rue François Cevert', '85000', 'La Roche-sur-Yon'),
       ('Pathé-Gaumont', '02.43.11.22.00', 'Bd Ferdinand de Lesseps', '76000', 'Rouen'),
       ('Cinéville Lorient', '02.97.56.85.62', '4 Bd Maréchal Joffre', '56100', 'Lorient'),
       ('Le Gulf Stream', '02.51.23.89.54', '52 av. du Général de Gaulle', '44500', 'La Baule-Escoublac'),
       ('UGC Ciné Cité Confluence', '01.46.85.69.34', '112 Cr Charlemagne', '62002', 'Lyon'),
       ('Pathé Angers', '02.51.36.28.12', '1 av. des Droits de l''homme','49100','Angers');

INSERT INTO eval_bdd_cinema.role (roleType_role)
VALUES ('Admin'),
       ('Complex_Manager');

INSERT INTO eval_bdd_cinema.user (firstName_user, lastName_user, pseudo_user, password_user, role_id)
VALUES ('Bernard', 'Pepin', 'Bigwolf', '$2y$10$K2ojMme9ex.y.xUolTdcLeYcYvBZO5VxQRQYeFqk6ruCn6i8lLS0u', 1),
       ('Bianca', 'Trippitt', 'Andalax', '$2y$10$9ECbhJsnFSBTlW416Ojjv.9C8lJFu9xf/5jEm1esi1tMGz/Gie9k.', 1),
       ('Jonathan', 'Hart', 'Fix San', '$2y$10$EB00IAVyc09JP0DUihuDzejhOc943GPd.QUtpyYTyTsF4bYfBwLnO', 1),
       ('Elsa', 'Lorimer', 'Y-Solowarm', '$2y$10$F1ObAuy6nnJOQKTrAfqDtu/y1StQqfhyG/142JMxEZ5mE/ASTP7rW', 2),
       ('Jasmine', 'Salong', 'Hatity', '$2y$10$m2a7UwS3YGO8yGRVoRxZr.791OCaci3vhbvK1eHCcw2jGwZpi.DLq', 2),
       ('Christophe', 'Iago', 'Ventosanzap', '$2y$10$zYyF2hqyGWUnztHwfi6UOu8gFOgXEUzv/B0dKkZIdUJEeoUqAskiq', 2),
       ('John', 'Cafe', 'Matsoft', '$2y$10$Bi4g/8EOxXim3tKEfV/k7ebIhwreNgltT3/BAFJVwoM7of7Rq4fMO', '2'),
       ('Gandalf', 'Legrand', 'Duobam', '$2y$10$cm6pHJyHrRU8oQ.7RSyNbuzn4NutcoyPW3BI3gyLdqHwu0P5Q8746', 2),
       ('Marguerite', 'Desprès', 'Alphazap', '$2y$10$g7kpHDRQVoSLLXMJcZNryefJ5RCT42CgKdqqtDP0D..6L8L4o/a4.', 2);

INSERT INTO eval_bdd_cinema.manage (cinema_complex_id, user_id)
VALUES (1, 1),
       (1, 2),
       (1, 3),
       (1, 4),
       (2, 1),
       (2, 2),
       (2, 3),
       (2, 5),
       (3, 1),
       (3, 2),
       (3, 3),
       (3, 6),
       (4, 1),
       (4, 2),
       (4, 3),
       (4, 7),
       (5, 1),
       (5, 2),
       (5, 3),
       (5, 8),
       (6, 1),
       (6, 2),
       (6, 3),
       (6, 9);

INSERT INTO eval_bdd_cinema.hall (hallType_hall)
VALUES ('Classique'),
       ('Confort'),
       ('3D'),
       ('Imax');

INSERT INTO eval_bdd_cinema.movie_room (seats_movie_room, cinema_complex_id, hall_id)
VALUES (70, 1, 1),
       (10, 1, 2),
       (113, 1, 3),
       (23, 1, 4),
       (29, 2, 1),
       (128, 2, 2),
       (32, 2, 3),
       (198, 2, 4),
       (10, 3, 1),
       (128, 3, 2),
       (152, 3, 3),
       (36, 3, 4),
       (114, 4, 1),
       (167, 4, 2),
       (57, 4, 3),
       (156, 4, 4),
       (50, 5, 1),
       (163, 5, 2),
       (17, 5, 3),
       (125, 5, 4),
       (54, 6, 1),
       (164, 6, 2),
       (93, 6, 3),
       (119, 6, 4);

INSERT INTO eval_bdd_cinema.genre (name_genre)
VALUES ('Comédie'),
       ('Fantastique - SF'),
       ('Action'),
       ('Animation'),
       ('Epouvante – Horreur'),
       ('Drame'),
       ('Film Documentaire');

INSERT INTO eval_bdd_cinema.movie (name_movie, director_movie, description_movie, duration_movie, genre_id)
VALUES ('Spider-Man : No Way Home', 'John Watts', 'Pour la première fois dans son histoire cinématographique, Spider-Man,
        le héros sympa du quartier est démasqué et ne peut désormais plus séparer sa vie normale de ses lourdes responsabilités
        de super-héros.', '02:29:00', 2),
       ('Tous en Scène 2', 'Garth Jennings & Christophe Lourdelet', 'Si Buster et sa troupe ont fait du Nouveau Théâtre Moon
        la salle de concert à la mode, il est temps de voir les choses en plus grand : monter un nouveau spectacle dans
        la prestigieuse salle du théâtre de la Crystal Tower à Redshore City.', '01:50:00', 4),
       ('Les Tuche 4', 'Olivier Baroux', 'Après avoir démissionné de son poste de président de la république, Jeff et sa
       famille sont heureux de retrouver leur village de Bouzolles. A l’approche des fêtes de fin d’année, Cathy demande
       un unique cadeau : renouer les liens avec sa sœur Maguy, et son mari Jean-Yves avec qui Jeff est fâché depuis 10 ans.',
       '01:41:00', 1),
       ('The Deep House', 'Alexandre Bustillo & Julien Maury', 'Un jeune couple américain spécialisé dans l''urbex
        (exploration urbaine) décide d’aller explorer une maison réputée hantée qui a été ensevelie sous un lac artificiel.
        Mais celle-ci semble se refermer sur eux et le couple se retrouve prisonnier de cet endroit chargé des plus
        sombres histoires…', '01:25:00', 5),
       ('Ice Road', 'Jonathan Hensleigh', 'Une mine de diamants s’effondre dans le Grand Nord canadien et piège près de
        trente mineurs. Pour mener une mission de sauvetage périlleuse, Jim Goldenrod engage Mike McCann, un conducteur
        de camion expérimenté. Ils vont mener un convoi qui va emprunter la route de glace, un océan gelé et instable
        qui couvre les presque 500 km du lac Winnipeg.', '01:49:00' , 3),
       ('Madeleine Collins', 'Antoine Barraud', 'Judith mène une double vie entre la Suisse et la France. D''un côté Abdel,
       avec qui elle élève une petite fille, de l''autre Melvil, avec qui elle a deux garçons plus âgés. Peu à peu,
       cet équilibre fragile fait de mensonges, de secrets et d''allers-retours se fissure dangereusement.
       Prise au piège, Judith choisit la fuite en avant, l''escalade vertigineuse.', '01:42:00', 6),
       ('Blackpink The Movie', 'Blackpink', 'BLACKPINK – composée de JISOO, JENNIE, ROSÉ et LISA - a connu une croissance
       explosive depuis leur première apparition dans le monde le 8 août 2016, avec son groupe de fans BLINK . A l’image
       de ces 5 dernières années frénétiques, tous les souvenirs, les joies sur scène et les moments brillants ont été
       emballés comme un cadeau pour tous les fans dans BLACKPINK THE MOVIE.', '01:19:00', 7);


INSERT INTO eval_bdd_cinema.film_show (date_film_show, startTime_film_show, movie_id, movie_room_id)
VALUES ('2021-12-21', '15:30:00', 1, 1),
       ('2021-12-21', '15:30:00', 1, 2),
       ('2021-12-21', '15:30:00', 1, 5),
       ('2021-12-21', '15:30:00', 1, 6),
       ('2021-12-21', '15:30:00', 1, 7),
       ('2021-12-21', '15:30:00', 1, 13),
       ('2021-12-21', '15:30:00', 1, 20),
       ('2021-12-21', '15:30:00', 1, 9),
       ('2021-12-07', '13:30:00', 2, 7),
       ('2021-12-07', '13:30:00', 2, 12),
       ('2021-12-07', '19:30:00', 2, 8),
       ('2021-12-12', '20:00:00', 3, 1),
       ('2021-12-12', '20:00:00', 3, 10),
       ('2021-12-12', '20:00:00', 3, 13),
       ('2021-12-12', '20:00:00', 3, 16),
       ('2021-12-06', '20:20:00', 4, 4),
       ('2021-12-06', '19:30:00', 4, 14),
       ('2021-12-06', '09:30:00', 5, 2),
       ('2021-12-06', '09:30:00', 5, 5),
       ('2021-12-06', '09:30:00', 5, 19),
       ('2021-12-19', '21:30:00', 6, 20),
       ('2021-12-19', '21:30:00', 6, 24),
       ('2021-12-19', '21:30:00', 6, 4),
       ('2021-12-19', '21:30:00', 6, 2),
       ('2021-12-15', '22:30:00', 7, 15),
       ('2021-12-15', '20:30:00', 7, 12),
       ('2021-12-15', '20:30:00', 7, 23);

INSERT INTO film_show (date_film_show, startTime_film_show, movie_id, movie_room_id)
VALUES ('2021-12-21', '20:30:00', 3, 6),
       ('2021-12-21', '09:20:00', 2, 7),
       ('2021-12-21', '15:30:30', 7, 8);

INSERT INTO eval_bdd_cinema.costumer (firstName_costumer, lastName_costumer, birthDate_costumer, email_costumer, password_costumer)
VALUES ('Maryanne', 'Ference', '1967-02-27', 'mference0@deviantart.com', '$2y$10$Mk1dy3XNAC0W2kqH0fL4IutVkXUSnib8KoZpR5E8TmPeN1QgzibX6'),
       ('Paulette', 'McClurg', '2014-06-02', 'pmcclurg1@unesco.org', '$2y$10$3L8s./gckqKb.M7wNcjFlerVEppX.g4mMjjQSISEI8GPNMK4LTzXq'),
       ('Brewer', 'Blackadder', '2003-01-19', 'bblackadder2@eepurl.com', '$2y$10$evnOPpIOMMdnjlORed/tkeSDd7amg9XZnmktPe3JTzOX1qMkBiXzi'),
       ('Perry', 'Hancock', '1997-09-25', 'phancock5@webeden.co.uk', '$2y$10$hAt3dAMTwIppTA691gGB5uIyf93gtsqJObWXm7O75YceE6F6EyDs2'),
       ('Herve', 'Remmers', '1963-03-02', 'hremmersa@geocities.jp', '$2y$10$3oMUp5a4TDh2Wn7B8Nioq.XTbx1xmSirL2nO.1A99z607HlQwrul.'),
       ('Mack', 'Suddaby', '2006-06-08', 'msuddabyf@hexun.com', '$2y$10$hsodZSGz9sJ6kPWnfJbuWu4ZkpwpGdD./sBIXecy1HjqKCDWnW8kG'),
       ('Jone', 'Kroll', '1966-08-19', 'jkrollj@xinhuanet.com', '$2y$10$iGXGBsPw5MM/ECitVqZrPeh3U/dUEgdoGUkUGYiXyTRXn3tF.RtaK'),
       ('Killy', 'Gregg', '1984-04-28', 'kgregg12@sogou.com', '$2y$10$SUPeFZdez6wMYvKOU9AcUOYaMfCnN8UAfdMQc3euaqupgYA3EgfOW'),
       ('Orland', 'Extance', '1974-10-01', 'oextance16@elegantthemes.com', '$2y$10$IyzuLViLX18uSzFPs75CLeM78CPdkSr5XbQE54wcGFQyTGUvhHHcq'),
       ('Ora', 'Kernaghan', '2013-11-18', 'okernaghanr@miitbeian.gov.cn', '$2y$10$Kz5qIER9ljYQAF6kcFTE8OACVPsoeKdFVwXlw9HJ/jkqc5GAZzf56'),
       ('Micah', 'Grain', '2003-04-25', 'mgrainu@blogtalkradio.com', '$2y$10$zbLT65ndCxOjQmdqE15tm.2x0VB1kOQOanOSDi2oShLDHfU22KLvW');


INSERT INTO eval_bdd_cinema.payment (paymentMethod_payment, paymentType_payment)
VALUES ('CB', 'En ligne'),
       ('CB', 'Sur place'),
       ('Chèque', 'Sur place'),
       ('Espèces', 'Sur place');

INSERT INTO eval_bdd_cinema.price_list (priceType_price_list, price_price_list)
VALUES ('Plein Tarif', 9.20),
       ('Etudiant', 7.60),
       ('Enfant -14 ans', 5.90);

INSERT INTO eval_bdd_cinema.booking (film_show_id, costumer_id, price_list_id)
VALUES (22,'14db1a09-6369-11ec-8433-b831b59a1afd', 1),
       (9, '14db1d19-6369-11ec-8433-b831b59a1afd', 3),
       (1, '14db1db0-6369-11ec-8433-b831b59a1afd', 2),
       (18, '14db1dfa-6369-11ec-8433-b831b59a1afd', 1),
       (2, '14db1e47-6369-11ec-8433-b831b59a1afd', 1),
       (26, '14db1e94-6369-11ec-8433-b831b59a1afd', 1),
       (13, '14db1edf-6369-11ec-8433-b831b59a1afd', 1),
       (22, '14db1f25-6369-11ec-8433-b831b59a1afd', 1),
       (12, '14db1f72-6369-11ec-8433-b831b59a1afd', 1),
       (9, '14db1fb5-6369-11ec-8433-b831b59a1afd', 3),
       (8, '14db1ff6-6369-11ec-8433-b831b59a1afd', 2);

INSERT INTO eval_bdd_cinema.booking (film_show_id, costumer_id, price_list_id)
VALUES (3,'14db1e94-6369-11ec-8433-b831b59a1afd', 1),
       (8, '14db1f72-6369-11ec-8433-b831b59a1afd', 1),
       (25, '14db1ff6-6369-11ec-8433-b831b59a1afd', 2);

INSERT INTO eval_bdd_cinema.is_paid (booking_id, payment_id, date_is_paid, payment_is_Paid)
VALUES ('bb2f904b-636a-11ec-8433-b831b59a1afd', 1, NOW(), '1'),
       ('bb2f9532-636a-11ec-8433-b831b59a1afd', 2, NULL, '0'),
       ('bb2f95d2-636a-11ec-8433-b831b59a1afd', 3, NULL, '0'),
       ('bb2f9639-636a-11ec-8433-b831b59a1afd', 1, NOW(), '1'),
       ('bb2f969b-636a-11ec-8433-b831b59a1afd', 2, NULL, '0'),
       ('bb2f96f9-636a-11ec-8433-b831b59a1afd', 3, NULL, '0'),
       ('bb2f9758-636a-11ec-8433-b831b59a1afd', 1, NOW(), '1'),
       ('bb2f97b1-636a-11ec-8433-b831b59a1afd', 2, NULL, '0'),
       ('bb2f984d-636a-11ec-8433-b831b59a1afd', 3, NULL, '0'),
       ('bb2f98dd-636a-11ec-8433-b831b59a1afd', 1, NOW(), '1'),
       ('bb2f993f-636a-11ec-8433-b831b59a1afd', 2, NULL, '0');

INSERT INTO eval_bdd_cinema.is_paid (booking_id, payment_id, date_is_paid, payment_is_Paid)
VALUES ('bdd8fd19-637c-11ec-8433-b831b59a1afd', 1, NOW(), '1'),
       ('bdd9e4a3-637c-11ec-8433-b831b59a1afd', 1, NOW(), '1'),
       ('bdd9e615-637c-11ec-8433-b831b59a1afd', 3, NULL, '0');



