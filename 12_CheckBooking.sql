-- Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. 
-- Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.


delimiter //

create procedure CheckBooking(IN bookDate DATE, IN table_number INT)
begin
if exists (select 1 from bookings where booking_date=bookDate and table_no=table_number)
then
	select concat('Table ', table_number, ' is already booked') as BookingStatus;
else
	select concat('Table ', table_number, ' is available') as BookingStatus;
end if;	
end //

delimiter ;

call CheckBooking('2022-11-12', 3);