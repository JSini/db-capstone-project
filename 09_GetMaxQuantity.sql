-- In this first task, Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table. 
--  call the procedure GetMaxQuantity

drop procedure if exists GetMaxQuantity;

create procedure GetMaxQuantity()
select max(quantity) as 'Max Quantity in Order' from orders;

-- calling the procedure
call GetMaxQuantity();