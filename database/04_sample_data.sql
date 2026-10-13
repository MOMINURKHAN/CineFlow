USE cineflow_db;

INSERT INTO cinemas (name, address)
VALUES
('CineFlow Cinema', 'Dhaka, Bangladesh');

INSERT INTO halls
(cinema_id, hall_name, total_rows, seats_per_row)
VALUES
(1,'Hall 1',10,10),
(1,'Hall 2',8,12),
(1,'Hall 3',12,15);

INSERT INTO movies
(title, genre, duration_minutes, language, rating, release_date, description, poster_url)
VALUES

('Avengers: Endgame',
'Action',
181,
'English',
'PG-13',
'2019-04-26',
'Superhero action movie.',
'/images/endgame.jpg'),

('Interstellar',
'Sci-Fi',
169,
'English',
'PG-13',
'2014-11-07',
'Space exploration adventure.',
'/images/interstellar.jpg'),

('The Dark Knight',
'Action',
152,
'English',
'PG-13',
'2008-07-18',
'Batman faces Joker.',
'/images/darkknight.jpg');

DELIMITER $$

CREATE PROCEDURE generate_seats()
BEGIN
    DECLARE h INT DEFAULT 1;
    DECLARE r CHAR(1);
    DECLARE s INT;

    WHILE h <= 3 DO
        SET r = 'A';

        WHILE r <= 'J' DO
            SET s = 1;

            WHILE s <= 10 DO

                INSERT INTO seats(hall_id,row_label,seat_number)
                VALUES(h,r,s);

                SET s = s + 1;

            END WHILE;

            SET r = CHAR(ASCII(r)+1);

        END WHILE;

        SET h = h + 1;

    END WHILE;
END$$

DELIMITER ;

CALL generate_seats();

DROP PROCEDURE generate_seats;

INSERT INTO users
(first_name,last_name,email,password_hash,phone,role)
VALUES

('Admin','User',
'admin@cineflow.com',
'admin123',
'01700000000',
'ADMIN'),

('Mominur','Khan',
'momin@example.com',
'password123',
'01811111111',
'CUSTOMER'),

('John','Doe',
'john@example.com',
'password123',
'01922222222',
'CUSTOMER');


INSERT INTO showtimes
(movie_id,hall_id,show_date,start_time,end_time,ticket_price)
VALUES

(1,1,'2025-08-10','18:00:00','21:01:00',350),

(2,2,'2025-08-10','19:00:00','21:49:00',300),

(3,3,'2025-08-10','20:00:00','22:32:00',320);


INSERT INTO bookings
(user_id,showtime_id,total_amount,booking_status,qr_token)
VALUES

(2,1,700,'CONFIRMED','QR_TOKEN_001'),

(3,2,300,'CONFIRMED','QR_TOKEN_002');



INSERT INTO booking_seats
(booking_id,seat_id)
VALUES

(1,1),
(1,2),

(2,101);