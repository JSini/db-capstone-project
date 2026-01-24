-- Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking.
-- The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 

-- drop procedure if exists CancelBooking;

delimiter //
create procedure CancelBooking(IN bookID INT)
begin
	start transaction;
    if not exists (select 1 from bookings where booking_id=bookID) then
		select concat('Booking ID ', bookID, ' does not exist') as BookingStatus;
		rollback;
	else
		delete from bookings where booking_id=bookID;
        select concat ('Booking ', bookID, ' cancelled') as Confirmation;
		commit;
	end if;
end//
delimiter ;

call CancelBooking(9); 


