-- drop database littlelemondb;

show databases;

use littlelemondb;

show tables;

insert into item_types (type_id, type_name)
values (1, 'Starters'),
(2, 'Main Courses'),
(3, 'Sides'),
(4, 'Desserts'),
(5, 'Drinks');


insert into menu_items (item_id, name, type, price)
values
(1, 'Olives',1,5),
(2, 'Flatbread',1, 5),
(3, 'Minestrone', 1, 8),
(4, 'Tomato bread',1, 8),
(5, 'Falafel', 1, 7),
(6, 'Hummus', 1, 5),
(7, 'Greek salad', 2, 15),
(8, 'Bean soup', 2, 12),
(9, 'Pizza', 2, 15),
(10, 'Greek yoghurt',4, 7),
(11, 'Ice cream', 4, 6),
(12, 'Cheesecake', 4, 4),
(13, 'Athens White wine', 5, 25),
(14, 'Corfu Red Wine', 5, 30),
(15, 'Turkish Coffee', 5, 10),
(16, 'Kabasa', 2, 17);


insert into  menu (menu_id, item_id,  menu_name, cuisine)
values
(1,  1, 'Greekos','Greek'),
(1, 7, 'Greekos','Greek'),
(1, 10, 'Greekos','Greek'),
(1, 13, 'Greekos','Greek'),
(2, 3, 'PizzaTwist','Italian'),
(2, 9, 'PizzaTwist','Italian'),
(2, 12, 'PizzaTwist','Italian'),
(2, 15, 'PizzaTwist','Italian'),
(3, 5, 'Mousakka', 'Turkish'),
(3, 16, 'Mousakka', 'Turkish'),
(3, 11, 'Mousakka', 'Turkish'),
(3, 15, 'Mousakka', 'Turkish');

insert into customers(customer_id, name, contact, email)
values (1, 'John Doe', '366-98200-12345', 'john.doe@email.in'),
(2, 'Sophie Dubois', '+33 6 12 34 56 78', 's.dubois@service.fr'),
(3, 'James Wilson', '+1 212-555-0198', 'j.wilson88@provider.com'),
(4, 'Yuki Tanaka', '+81 90-1234-5678', 'tanaka.y@net.jp'),
(5, 'Elena Rodriguez', '+34 912 34 56 78', 'elena.rod@estudio.es'),
(6, 'Kwame Osei', '+233 24 123 4567', 'k.osei@africaonline.com'),
(7, 'Li Wei', '+86 139 1234 5678', 'li.wei@workmail.com'),
(8, 'Fatima Sahar', '+971 50 123 4567', 'f.s@mail.com'),
(9, 'Hans Müller', '+49 151 12345678', 'h.mueller@technik.de'),
(10, 'Isabella Rossi', '+39 333 123 4567', 'i.rossi@italia.it');

-- delete from staff_details;
insert into staff_details (staff_id, name, role)
values
(1,'Mario Gollini','Manager'),
(2,'Adrian Gollini','Assistant Manager'),
(3,'Giorgos Dioudis','Head Chef'),
(4,'Fatma Kaya','Assistant Chef'),
(5,'Elena Salvai','Head Waiter'),
(6,'John Millar','Receptionist');

insert into  bookings (booking_id, booking_date, table_no, customer_id, staff_id)
values
(1, '2022-10-10', 5, 1, 1),
(2, '2022-11-12', 3, 3, 1),
(3, '2022-10-11', 2, 2, 3),
(4, '2022-10-13', 2, 1, 4),
(5, '2022-10-23', 1, 7, 2),
(6, '2022-11-13', 4, 4, 5),
(7, '2022-12-17', 6, 4, 5);


insert into countries(country_id, country_name, country_code)
values (1, 'USA', 'US'),
(2, 'Italy', 'IT'),
(3, 'Germany', 'DE'),
(4,  'UAE', 'AE'),
(5, 'China', 'CN'),
(6, 'Ghana', 'GH'),
(7, 'Spain', 'ES'),
(8,'Japan', 'JP'),
(9, 'France', 'FR');


insert into  address (address_id, street, city, postal_code, country_id, customer_id) 
values (1, '12 High Street', 'New York', '10001', 1, 1),
(2, '45 Rue de la Paix', 'Paris', '75002', 9, 2),
(3, '742 Evergreen Terrace', 'New York', '10001', 1, 3),
(4, '2-1-1 Nihonbashi', 'Tokyo', '103-0027', 8, 4),
(5, 'Calle de Alcalá, 15', 'Madrid', '28014', 7, 5),
(6, 'Oxford Street 10', 'Accra', 'GA-123', 6, 6),
(7, '88 Nanjing Road', 'Shanghai', '200001', 5, 7),
(8, 'Sheikh Zayed Road, Tower 1', 'Dubai', '00000',4, 8),
(9, 'Alexanderplatz 1', 'Berlin', '10178', 3, 9),
(0, 'Via del Corso, 4', 'Rome', '00186', 2, 10);



insert into  Orders (order_id, order_date, booking_id, order_mode, menu_id, quantity,total_cost, customer_id)
values
(1, '2022-10-15',1, 0, 1, 2, 86, 1),
(2, '2022-10-12', 3, 0, 1, 3, 237, 2),
(3, '2022-10-24', 5, 0, 2, 4, 458, 7),
(4, '2022-10-16', 4, 0, 3, 1, 40, 1),
(5, '2022-10-14', NULL, 1, 2, 2, 143, 8),
(6, '2022-10-12', NULL, 1, 3, 2, 100, 9),
(7, '2022-10-12', NULL, 1, 1, 2, 200, 3),
(8, '2022-10-12', NULL, 1, 1, 3, 250, 4),
(9, '2022-10-13', NULL, 1, 1, 2, 200, 8),
(10, '2022-10-16', NULL, 1, 1, 3, 250, 2),
(11, '2022-10-16', NULL, 1, 1, 2, 200, 10),
(12, '2022-10-17', NULL, 1, 1, 3, 250, 6),
(13, '2022-10-17', NULL, 1, 3, 2, 100, 9);


insert into order_deliveries(delivery_id, delivery_date, delivery_status, order_id, address_id)
values (1, '2022-10-14', 'Delivered', 5, 8),
(2, '2022-10-12', 'Delivered', 6, 9),
(3, '2022-10-12','Delivered', 7, 3),
(4, '2022-10-12', 'Delivered',  8, 4),
(5, '2022-10-13', 'Delivered',  9, 8),
(6, '2022-10-16', 'Delivered',  10, 2),
(7, '2022-10-16', 'Pending', 11, 10),
(8, '2022-10-17', 'In progress', 12, 6),
(9, '2022-10-17', 'In progress', 13, 9);