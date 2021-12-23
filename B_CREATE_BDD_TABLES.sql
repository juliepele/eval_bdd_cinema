-- Connexion au serveur MySQL/MariaDB en terminal de commande (cf. capture)
-- mysql -h localhost -u root -p

-- Afficher la liste des bases de données
SHOW databases;

-- Effacement de la base de données si existante et Création de la base de données
DROP DATABASE IF EXISTS eval_bdd_cinema;
CREATE DATABASE IF NOT EXISTS eval_bdd_cinema;
SHOW DATABASES;

-- Selection de la base de données pour création des tables
USE eval_bdd_cinema;

-- Création des tables
DROP TABLE IF EXISTS cinema_complex;
CREATE TABLE IF NOT EXISTS cinema_complex
(
    id_cinema_complex INT(11) auto_increment NOT NULL,
    name_cinema_complex VARCHAR(100) NOT NULL,
    phone_cinema_complex VARCHAR(15) NOT NULL,
    address_cinema_complex VARCHAR(200) NOT NULL,
    zipCode_cinema_complex VARCHAR(5) NOT NULL,
    city_cinema_complex VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_cinema_complex)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS role;
CREATE TABLE IF NOT EXISTS role
(
    id_role INT(11) auto_increment NOT NULL,
    roleType_role VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS user
(
    id_user INT(11) auto_increment NOT NULL,
    firstName_user VARCHAR(100) NOT NULL,
    lastName_user VARCHAR(100) NOT NULL,
    pseudo_user VARCHAR(50) UNIQUE NOT NULL,
    password_user VARCHAR(60) NOT NULL,
    role_id INT(11) NOT NULL,
    PRIMARY KEY (id_user),
    CONSTRAINT role_FK FOREIGN KEY (role_id) REFERENCES eval_bdd_cinema.role (id_role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS manage;
CREATE TABLE IF NOT EXISTS manage
(
    cinema_complex_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    PRIMARY KEY (cinema_complex_id,user_id),
    CONSTRAINT cinema_complex_FK FOREIGN KEY (cinema_complex_id) REFERENCES eval_bdd_cinema.cinema_complex (id_cinema_complex),
    CONSTRAINT user_FK FOREIGN KEY (user_id) REFERENCES eval_bdd_cinema.user (id_user)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS hall;
CREATE TABLE IF NOT EXISTS hall
(
    id_hall INT(11) auto_increment NOT NULL,
    hallType_hall VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_hall)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS movie_room;
CREATE TABLE IF NOT EXISTS movie_room
(
    id_movie_room INT(11) auto_increment NOT NULL,
    seats_movie_room INT(11) NOT NULL,
    cinema_complex_id INT(11) NOT NULL,
    hall_id INT(11) NOT NULL,
    PRIMARY KEY (id_movie_room),
    CONSTRAINT cinema_complex_1_FK FOREIGN KEY (cinema_complex_id) REFERENCES eval_bdd_cinema.cinema_complex (id_cinema_complex),
    CONSTRAINT hall_FK FOREIGN KEY (hall_id) REFERENCES eval_bdd_cinema.hall (id_hall)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS genre;
CREATE TABLE IF NOT EXISTS genre
(
    id_genre INT(11) auto_increment NOT NULL,
    name_genre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_genre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS movie;
CREATE TABLE IF NOT EXISTS movie
(
    id_movie INT(11) auto_increment NOT NULL,
    name_movie VARCHAR(250) NOT NULL,
    director_movie VARCHAR(250) NOT NULL,
    description_movie TEXT NOT NULL,
    duration_movie TIME NOT NULL,
    genre_id INT(11) NOT NULL,
    PRIMARY KEY (id_movie),
    CONSTRAINT genre_FK FOREIGN KEY (genre_id) REFERENCES eval_bdd_cinema.genre (id_genre)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS film_show;
CREATE TABLE IF NOT EXISTS film_show
(
    id_film_show INT(11) auto_increment NOT NULL,
    date_film_show DATE NOT NULL,
    startTime_film_show TIME NOT NULL,
    movie_id INT(11) NOT NULL,
    movie_room_id INT(11) NOT NULL,
    PRIMARY KEY (id_film_show),
    CONSTRAINT movie_FK FOREIGN KEY (movie_id) REFERENCES eval_bdd_cinema.movie (id_movie),
    CONSTRAINT movie_room_FK FOREIGN KEY (movie_room_id) REFERENCES eval_bdd_cinema.movie_room (id_movie_room)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS costumer;
CREATE TABLE IF NOT EXISTS costumer
(
    id_costumer CHAR(36) DEFAULT (UUID()) NOT NULL,
    firstName_costumer VARCHAR(100) NOT NULL,
    lastName_costumer VARCHAR(100) NOT NULL,
    birthDate_costumer DATE NOT NULL,
    email_costumer VARCHAR(254) UNIQUE NOT NULL,
    password_costumer VARCHAR(60) NOT NULL,
    PRIMARY KEY (id_costumer)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS payment;
CREATE TABLE IF NOT EXISTS payment
(
    id_payment INT(11) auto_increment NOT NULL,
    paymentMethod_payment VARCHAR(50) NOT NULL,
    paymentType_payment VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_payment)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS price_list;
CREATE TABLE IF NOT EXISTS price_list
(
    id_price_list INT(11) auto_increment NOT NULL,
    priceType_price_list VARCHAR(100) NOT NULL,
    price_price_list DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (id_price_list)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS booking;
CREATE TABLE IF NOT EXISTS booking
(
    id_booking CHAR(36) DEFAULT (UUID()) NOT NULL,
    createdAt_booking DATETIME DEFAULT NOW() NOT NULL,
    film_show_id INT(11) NOT NULL,
    costumer_id CHAR(36) NOT NULL,
    price_list_id INT(11) NOT NULL,
    PRIMARY KEY (id_booking),
    CONSTRAINT film_show_FK FOREIGN KEY (film_show_id) REFERENCES eval_bdd_cinema.film_show (id_film_show),
    CONSTRAINT costumer_FK FOREIGN KEY (costumer_id) REFERENCES eval_bdd_cinema.costumer (id_costumer),
    CONSTRAINT price_list_FK FOREIGN KEY (price_list_id) REFERENCES eval_bdd_cinema.price_list (id_price_list)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS is_paid;
CREATE TABLE IF NOT EXISTS is_paid
(
    booking_id CHAR(36) NOT NULL,
    payment_id INT(11) NOT NULL,
    date_is_paid DATE DEFAULT NOW(),
    payment_is_Paid BOOLEAN DEFAULT 0 NOT NULL,
    PRIMARY KEY (booking_id,payment_id),
    CONSTRAINT booking_1_FK FOREIGN KEY (booking_id) REFERENCES booking (id_booking),
    CONSTRAINT payment_FK FOREIGN KEY (payment_id) REFERENCES payment (id_payment)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SHOW TABLES;




