create table customers(
customer_id serial primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar (100) unique
);


create table purchases(
purchase_id serial primary key,
customer_id int not null,
purchase_date date,
foreign key (customer_id) references customers(customer_id) on delete cascade
);



-- Insert 50 rows into the customers table
INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Brown', 'alice.brown@email.com'),
('Bob', 'Smith', NULL),
('Clara', 'Jones', 'clara.jones@email.com'),
('David', 'Wilson', 'david.wilson@email.com'),
('Emma', 'Taylor', 'emma.taylor@email.com'),
('Frank', 'Davis', NULL),
('Grace', 'Clark', 'grace.clark@email.com'),
('Henry', 'Lewis', 'henry.lewis@email.com'),
('Isabella', 'Walker', 'isabella.walker@email.com'),
('James', 'Hall', NULL),
('Kelly', 'Young', 'kelly.young@email.com'),
('Liam', 'Allen', 'liam.allen@email.com'),
('Mia', 'King', 'mia.king@email.com'),
('Noah', 'Wright', NULL),
('Olivia', 'Scott', 'olivia.scott@email.com'),
('Peter', 'Green', 'peter.green@email.com'),
('Quinn', 'Adams', 'quinn.adams@email.com'),
('Rachel', 'Baker', 'rachel.baker@email.com'),
('Samuel', 'Gonzalez', NULL),
('Tara', 'Nelson', 'tara.nelson@email.com'),
('Ursula', 'Carter', 'ursula.carter@email.com'),
('Victor', 'Mitchell', 'victor.mitchell@email.com'),
('Wendy', 'Perez', 'wendy.perez@email.com'),
('Xander', 'Roberts', 'xander.roberts@email.com'),
('Yara', 'Turner', NULL),
('Zachary', 'Phillips', 'zachary.phillips@email.com'),
('Amelia', 'Campbell', 'amelia.campbell@email.com'),
('Benjamin', 'Parker', 'benjamin.parker@email.com'),
('Chloe', 'Evans', 'chloe.evans@email.com'),
('Daniel', 'Edwards', 'daniel.edwards@email.com'),
('Evelyn', 'Collins', 'evelyn.collins@email.com'),
('Finn', 'Stewart', 'finn.stewart@email.com'),
('Gabriella', 'Sanchez', 'gabriella.sanchez@email.com'),
('Harper', 'Morris', 'harper.morris@email.com'),
('Isaac', 'Rogers', 'isaac.rogers@email.com'),
('Jasmine', 'Reed', 'jasmine.reed@email.com'),
('Kevin', 'Cook', 'kevin.cook@email.com'),
('Lily', 'Morgan', 'lily.morgan@email.com'),
('Mason', 'Bell', 'mason.bell@email.com'),
('Nora', 'Murphy', 'nora.murphy@email.com'),
('Oliver', 'Bailey', 'oliver.bailey@email.com'),
('Penelope', 'Rivera', 'penelope.rivera@email.com'),
('Quentin', 'Cooper', 'quentin.cooper@email.com'),
('Riley', 'Richardson', 'riley.richardson@email.com'),
('Sophia', 'Cox', 'sophia.cox@email.com'),
('Thomas', 'Howard', 'thomas.howard@email.com'),
('Uma', 'Ward', 'uma.ward@email.com'),
('Vincent', 'Torres', 'vincent.torres@email.com'),
('Willow', 'Peterson', 'willow.peterson@email.com'),
('Xavier', 'Gray', 'xavier.gray@email.com');

-- Insert 50 rows into the purchases table
INSERT INTO purchases (customer_id, purchase_date) VALUES
(1, '2025-01-10'), (2, '2024-12-15'), (3, '2025-03-22'), (1, '2025-06-01'),
(4, '2024-11-05'), (5, NULL), (6, '2025-02-14'), (7, '2024-10-20'),
(8, '2025-04-10'), (9, '2024-09-15'), (10, '2025-05-30'), (11, '2024-08-01'),
(12, '2025-07-12'), (13, '2024-07-25'), (14, NULL), (15, '2025-01-01'),
(16, '2024-06-10'), (17, '2025-03-15'), (18, '2024-12-01'), (19, NULL),
(20, '2025-02-20'), (21, '2024-11-11'), (22, '2025-06-15'), (23, '2024-10-10'),
(24, '2025-04-05'), (25, NULL), (26, '2024-09-20'), (27, '2025-05-01'),
(28, '2024-08-15'), (29, '2025-03-10'), (30, '2024-07-01'), (31, '2025-02-01'),
(32, '2024-12-20'), (33, '2025-06-25'), (34, '2024-11-30'), (35, '2025-01-15'),
(36, '2024-10-05'), (37, '2025-04-20'), (38, '2024-09-10'), (39, NULL),
(40, '2025-03-05'), (41, '2024-08-20'), (42, '2025-07-01'), (43, '2024-12-10'),
(44, '2025-02-15'), (45, '2024-11-25'), (46, '2025-06-10'), (47, '2024-10-15'),
(48, '2025-05-20'), (49, '2024-09-05'), (50, '2025-01-20');


alter table purchases
add column category varchar(30);

update purchases
set category = 'Electronics'
where customer_id in (
	select customer_id 
	from customers
	where first_name = 'Alice'
	);


alter table customers
add column birth_year int;


alter table customers
alter column birth_year type varchar(4);


update customers
set birth_year = '1995'
where first_name = 'Alice';



alter table customers
drop column birth_year;



select 
p.purchase_id, 
c.first_name , 
c.last_name, 
p.purchase_date
from customers c 
inner join purchases p
on c.customer_id = p.customer_id


select *  from customers where first_name = 'Alice';



select *  from customers where customer_id < 5;


select *  from customers where customer_id <= 10;


select *  from customers where customer_id > 5;

select *  from customers where customer_id >= 3;

select *  from customers where customer_id != 2;

select *  from customers where customer_id between 3 and 7;


select *  from customers where email is null;

select *  from customers where first_name in ('Alice','Bob','Clara');

select *  from customers where first_name = 'Alice' and email = 'alice.brown@email.com';

select *  from customers where first_name = 'Alice' or email = 'bob.smith@email.com';


delete from customers where first_name= 'Alice';



 insert into customers (first_name  ,last_name, email)
 values ('john','doe','john.doe@gmail.com');
 
 insert into purchases (customer_id,purchase_date)
 values ((select customer_id from customers where first_name = 'john' and last_name = 'doe') , '2024-07-01'
 );
 


drop table PURCHASES;
drop table CUSTOMERS;




select * from customers;

select * from purchases;
