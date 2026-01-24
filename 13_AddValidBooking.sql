-- Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 
-- create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table 
-- that’s already booked under another name.

drop procedure if exists AddValidBooking;

delimiter //
create procedure AddValidBooking(IN book_date DATE, IN table_number INT)
begin
	declare isAvailable INT default 0;
	start transaction;
    set isAvailable =(select 1 from bookings where booking_date=book_date and table_no=table_number);
    if isAvailable then
		select concat('Table ', table_number, ' is already booked - booking cancelled') as BookingStatus;
		rollback;
	else
		insert into bookings (booking_date,table_no) values(book_date, table_number);
		commit;
	end if;
end//

delimiter ;

call AddValidBooking('2022-12-17', 6)
