-- to create procedure ManageBooking, plan to include already created procedures into this master procedure
-- CheckBooking --> booking date, table number
-- AddBooking --> booking id, customer id, table number, booking date
-- UpdateBooking param -> booking id, booking date
-- CancelBooking  param -> booking id
 
 -- Using here an an 'action' variable to direct the logical flow of calling the individual procedures
 -- using 'action' variable can be - tocheck, toadd, toupdate, tocancel
 
 -- first attempt i passed all the params individually
 -- after some struggle and research, JSON seemed to be cleaner way, using JSON and parsing JSON was a good learning
 
 
drop procedure if exists ManageBooking; 


delimiter //
create procedure ManageBooking(IN p_input JSON)
begin
	#declare variables
	declare var_action varchar(45);
	declare var_bookingID INT;
	declare var_table_no INT;
	declare var_custID INT;
	declare var_bookDate DATE;

	# extracting the json properties
    # challenges - passing null values for INT fields, have to use nullif to extrac the value as null if null in JSON 
	set var_action = p_input->>'$.action';
	set var_table_no = nullif(p_input->>'$.table_no', 'null');
	set var_custID = nullif(p_input->>'$.custID', 'null');
	set var_bookDate = p_input->>'$.bookDate';
    set var_bookingID = nullif(p_input->>'$.bookingID', 'null');


	start transaction;
	if (var_bookingID=var_table_no=var_custID=var_bookDate=NULL) then
		select 'Provide input parameters' as Message;
		rollback;
	else
		case 
			when var_action='tocheck' then
			 call CheckBooking(var_bookDate, var_table_no);
			when var_action='toadd' then
			 call AddBooking(var_bookingID, var_custID, var_table_no, var_bookDate);
			when var_action='toupdate' then
			 call UpdateBooking(var_bookingID, var_bookDate);
			when var_action='tocancel' then
			 call CancelBooking(var_bookingID);
			else select 'Invalid action, please provide action as tocheck or toadd or toupdate or tocancel' as Message;
			rollback;
		end case;
		commit;
	end if;
end//

delimiter ;

-- to check booking
call ManageBooking('{"action":"tocheck", "bookingID":null, "table_no":3, "bookDate":"2022-11-12", "custID":null}');

-- To add booking
call ManageBooking('{"action":"toadd", "bookingID":9, "table_no":5, "bookDate":"2022-10-10", "custID":3}');