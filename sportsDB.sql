CREATE DATABASE sports_booking;

USE sports_booking;

### Create tables ###

CREATE TABLE members (
	id VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    member_since TIMESTAMP NOT NULL DEFAULT NOW(),
    payment_due DECIMAL(6, 2) NOT NULL DEFAULT 0
);

CREATE TABLE pending_terminations (
	id VARCHAR(255) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    request_date TIMESTAMP NOT NULL DEFAULT NOW(),
    payment_due DECIMAL(6, 2) NOT NULL DEFAULT 0
);

CREATE TABLE rooms (
	id VARCHAR(255) PRIMARY KEY,
    room_type VARCHAR(255) NOT NULL,
    price DECIMAL(6, 2) NOT NULL
);

CREATE TABLE bookings (
	id INT PRIMARY KEY AUTO_INCREMENT,
    room_id VARCHAR(255) NOT NULL,
    booked_date DATE NOT NULL,
    booked_time TIME NOT NULL,
    member_id VARCHAR(255) NOT NULL,
    datetime_of_booking TIMESTAMP NOT NULL DEFAULT NOW(),
    payment_status VARCHAR(255) NOT NULL DEFAULT 'Unpaid',
    CONSTRAINT uc1 UNIQUE(room_id, booked_date, booked_time)
);

### Add foreign keys ###

ALTER TABLE bookings
	ADD CONSTRAINT fk1 FOREIGN KEY (member_id) REFERENCES members (id)
    ON UPDATE CASCADE ON DELETE CASCADE,
    ADD CONSTRAINT fk2 FOREIGN KEY (room_id) REFERENCES rooms (id)
    ON UPDATE CASCADE ON DELETE CASCADE;
    
