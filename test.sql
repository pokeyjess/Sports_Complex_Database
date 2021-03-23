USE sports_booking;

# Check tables, make sure everything is set up properly
SELECT * FROM members;
SELECT * FROM bookings;
SELECT * FROM rooms;

### Check 'insert_new_member' ###

# Add a new member
CALL insert_new_member ('angelolott', '1234abcd', 'AngeloNLott@gmail.com');

# New member will appear at top
SELECT * FROM members ORDER BY member_since DESC;

### Check 'delete_member' procedure ###

# Delete two members
CALL delete_member ('afeil');
CALL delete_member ('little31');

# Ensure both are deleted from table
SELECT * FROM members;

# Ensure 'little31' was added to pending_terminations, due to outstanding balance
SELECT * FROM pending_terminations;

### Check 'update_member_password' and 'update_member_email' ###

# Call the functions
CALL update_member_password ('noah51', '18oct1976');
CALL update_member_email ('noah51', 'noah51@hotmail.com');

# Double check that info was updated:
SELECT * FROM members;

### Test 'update_payment' procedure ###

# shows 'marvin1' has $10 balance
SELECT * FROM members WHERE id = 'marvin1';

# 'marvin1' also has an unpaid booking
SELECT * FROM bookings WHERE member_id = 'marvin1';

# Update payments
CALL update_payment (9);

# Double-check that update was made
SELECT * FROM members WHERE id = 'marvin1';
SELECT * FROM bookings WHERE member_id = 'marvin1';

### Test 'search_room' procedure ###

# Won't show any results, because already book
CALL search_room('Archery Range', '2017-12-26', '13:00:00');

# Shows openings, including on that had been cancelled previously
CALL search_room('Badminton Court', '2018-04-15', '14:00:00');

# Only shows one opening, since other court is booked
CALL search_room('Badminton Court', '2018-06-12', '15:00:00');

### Test 'make_booking' procedure ###

# Should throw error; room already booked
CALL make_booking ('AR', '2017-12-26', '13:00:00', 'noah51');

# Book rooms two weeks from now
CALL make_booking ('T1', CURDATE() + INTERVAL 2 WEEK, '11:00:00', 'noah51');
CALL make_booking ('AR', CURDATE() + INTERVAL 2 WEEK, '11:00:00', 'macejkovic73');

# Make sure rooms were booked
SELECT * FROM bookings;

### Cancel bookings ###

# Try to cancel on or after the booked date
CALL cancel_booking(1, @message);
SELECT @message;

# Cancel one of the bookings just made
CALL cancel_booking(12, @message);
SELECT @message;

# Cancel other booking just made
CALL cancel_booking(13, @message);
SELECT @message;

# Check that 'macejkovic73' was charged for the cancellation
SELECT * FROM members;





