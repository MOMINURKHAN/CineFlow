USE cineflow_db;

-- Performance Indexes

CREATE INDEX idx_users_email
ON users(email);

CREATE INDEX idx_showtimes_movie
ON showtimes(movie_id);

CREATE INDEX idx_showtimes_hall
ON showtimes(hall_id);

CREATE INDEX idx_bookings_user
ON bookings(user_id);

CREATE INDEX idx_bookings_showtime
ON bookings(showtime_id);

/*
This part is deleted cz it's redundent it's already in in idx_bookings_user

CREATE INDEX idx_bookings_qr
ON bookings(qr_token);
*/
CREATE INDEX idx_booking_seats_booking
ON booking_seats(booking_id);

CREATE INDEX idx_booking_seats_seat
ON booking_seats(seat_id);