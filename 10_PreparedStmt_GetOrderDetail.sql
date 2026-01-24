-- Little Lemon need you to help them to create a prepared statement called GetOrderDetail. 
-- This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
-- The prepared statement should accept one input argument, the CustomerID value, from a variable. 
-- The statement should return the order id, the quantity and the order cost from the Orders table. 

prepare GetOrderDetail from 'select order_id, quantity, total_cost from orders where customer_id=?';

set @id = 1;
execute GetOrderDetail using @id;