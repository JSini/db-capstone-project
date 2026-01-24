-- Little Lemon need to create procedure UpdateBooking to update existing bookings in the booking table.
-- The procedure should have two input parameters in the form of booking id and booking date. 
-- You must also include an UPDATE statement inside the procedure. 

-- drop procedure if exists UpdateBooking;

delimiter //
create procedure UpdateBooking(IN bookID INT, IN book_date DATE)
begin
	start transaction;
    if not exists (select 1 from bookings where booking_id=bookID) then
		select concat('Booking ID ', bookID, ' does not exist') as BookingStatus;
		rollback;
	else
		update bookings set booking_date=book_date where booking_id=bookID;
        select concat ('Booking ', bookID, ' Updated') as Confirmation;
		commit;
	end if;
end//
delimiter ;

call UpdateBooking(9, '2022-12-17'); 


