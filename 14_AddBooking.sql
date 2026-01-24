-- create a new procedure called AddBooking to add a new table booking record.
-- The procedure should include four input parameters in the form of the following bookings parameters:
-- booking id, customer id, booking date,and table number.

drop procedure if exists AddBooking;

delimiter //
create procedure AddBooking(IN bookID INT, IN custID INT, IN table_number INT, IN book_date DATE)
begin
	declare isAvailable INT default 0;
    set isAvailable =(select 1 from bookings where booking_date=book_date and table_no=table_number);
	start transaction;
    if isAvailable then
		select concat('Table ', table_number, ' is already booked - booking cancelled') as BookingStatus;
		rollback;
	else
		insert into bookings (booking_id, booking_date,table_no, customer_id) values(bookID, book_date, table_number, custID);
        select 'New Booking Added' as Confirmation;
		commit;
	end if;
end//
delimiter ;

call AddBooking(9, 3, 4, '2022-12-30')
