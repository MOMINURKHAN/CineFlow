USE cineflow_db;

SELECT * FROM movies;

SELECT
    s.showtime_id,
    m.title,
    h.hall_name,
    s.show_date,
    s.start_time,
    s.ticket_price
FROM showtimes s
JOIN movies m ON s.movie_id = m.movie_id
JOIN halls h ON s.hall_id = h.hall_id;

SELECT
    b.booking_id,
    se.row_label,
    se.seat_number
FROM booking_seats bs
JOIN bookings b ON bs.booking_id = b.booking_id
JOIN seats se ON bs.seat_id = se.seat_id;


SELECT
    u.first_name,
    u.last_name,
    m.title,
    s.show_date,
    s.start_time
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN showtimes s ON b.showtime_id = s.showtime_id
JOIN movies m ON s.movie_id = m.movie_id;


SELECT *
FROM bookings
WHERE qr_token = 'QR_TOKEN_001';


SELECT
    seat_id,
    row_label,
    seat_number
FROM seats
WHERE seat_id NOT IN (
    SELECT bs.seat_id
    FROM booking_seats bs
    JOIN bookings b ON bs.booking_id = b.booking_id
    WHERE b.showtime_id = 1
);


SELECT
    show_date,
    SUM(total_amount) AS total_revenue
FROM bookings b
JOIN showtimes s ON b.showtime_id = s.showtime_id
WHERE booking_status = 'CONFIRMED'
GROUP BY show_date;


SELECT
    m.title,
    COUNT(b.booking_id) AS total_bookings
FROM movies m
JOIN showtimes s ON m.movie_id = s.movie_id
LEFT JOIN bookings b ON s.showtime_id = b.showtime_id
GROUP BY m.title;