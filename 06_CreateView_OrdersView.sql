-- In this task, Little Lemon need you to create a virtual table called OrdersView
-- that focuses on OrderID, Quantity and Cost columns
-- within the Orders table for all orders with a quantity greater than 2.

create view OrdersView as
	select order_id, quantity, total_cost from orders where quantity>2;
    
select * from OrdersView;    
