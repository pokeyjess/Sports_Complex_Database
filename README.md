# Sports Complex Database

This is a practice MySQL database utilizing lessons in the book "Learn SQL in One Day" by Jamie Chan. It covers database design and creation, inserting data, queries, views, triggers and stored procedures and variables.

From the book:

"This project requires us to build a simple database to help us manage the booking process of a sports complex. The sports complex has the following facilities: 2 tennis courts, 2 badminton courts, 2 multi-purpose fields and 1 archery range. Each facility can be booked for a duration of one hour. Only registered users are allowed to make a booking. After booking, the complex allows users to cancel their bookings ... by the day prior to the booked date. Cancellation is free. However, if this is the third (or more) consecutive cancellation, the complex imposes a $10 fine."

As you can see from the ERD I created below, members can have multiple bookings, and each room can have multiple bookings, but each booking can only include one member, and one room.

<img width="1097" alt="Screen Shot 2021-03-21 at 6 50 05 PM" src="https://user-images.githubusercontent.com/65363804/111924390-ac856a80-8a7a-11eb-84c0-c81fc95f6cdc.png">
