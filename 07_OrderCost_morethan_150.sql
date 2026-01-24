-- Little Lemon need information from four tables on all customers with orders that cost more than $150. 
-- Extract the required information from each of the following tables by using the relevant JOIN clause: 
-- Customers table: The customer id and full name.
-- Orders table: The order id and cost.
-- Menus table: The menus name.
-- MenusItems table: the item’s name and category (e.g., starter, main, dessert, drink).
-- The result set should be sorted by the lowest cost amount.

select o.customer_id as CustomerID, c.name as FullName, o.order_id as OrderID, 
		o.total_cost as Cost, m.menu_name as MenuName,
        group_concat(case when it.type_name='Starters' then mi.name end) as Starters,
		group_concat(case when it.type_name='Main Courses' then mi.name end) as Courses,
        group_concat(case when it.type_name='Desserts' then mi.name end) as Desserts,
        group_concat(case when it.type_name='Drinks' then mi.name end) as Drinks
from customers c inner join orders o on c.customer_id=o.customer_id
    inner join menu m on o.menu_id = m.menu_id
    inner join menu_items mi on m.item_id = mi.item_id
    inner join item_types it on mi.type = it.type_id
where o.total_cost>150
group by o.order_id
order by o.total_cost;