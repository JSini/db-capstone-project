-- create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure 
-- to delete an order record based on the user input of the order id.
delimiter //

create procedure CancelOrder(IN orderID INT)
begin
	if exists(select 1 from orders where order_id=orderID)
	then
		delete from orders where order_id=orderID;
		select concat('Order', orderID, ' is cancelled') as Confirmation;
	else
		select ('Order', orderID, 'does not exist') as Confirmation;
	end if;
end//alter

delimiter ;

call CancelOrder(5);