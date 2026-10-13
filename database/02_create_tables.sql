DROP DATABASE IF EXISTS cineflow_db;

CREATE DATABASE cineflow_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE cineflow_db;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,

    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,

    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,

    phone VARCHAR(20),

    role ENUM('CUSTOMER', 'ADMIN')
        NOT NULL DEFAULT 'CUSTOMER',

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE cinemas (
    cinema_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    address VARCHAR(255) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE halls (
    hall_id INT AUTO_INCREMENT PRIMARY KEY,

    cinema_id INT NOT NULL,

    hall_name VARCHAR(50) NOT NULL,

    total_rows INT NOT NULL,

    seats_per_row INT NOT NULL,

    FOREIGN KEY (cinema_id)
        REFERENCES cinemas(cinema_id)
        ON DELETE CASCADE
);

CREATE TABLE seats (
    seat_id INT AUTO_INCREMENT PRIMARY KEY,

    hall_id INT NOT NULL,

    row_label CHAR(1) NOT NULL,

    seat_number INT NOT NULL,

    FOREIGN KEY (hall_id)
        REFERENCES halls(hall_id)
        ON DELETE CASCADE,

    UNIQUE (hall_id, row_label, seat_number)
);

CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(150) NOT NULL,

    genre VARCHAR(50),

    duration_minutes INT NOT NULL,

    language VARCHAR(30),

    rating VARCHAR(10),

    release_date DATE,

    description TEXT,

    poster_url VARCHAR(255),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);