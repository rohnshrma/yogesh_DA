-- SQL Analysis Assignment: Product Sales Database
-- This script creates a product sales database with over 100 products and lists analysis tasks as comments.
-- Use only the following SQL concepts: INSERT, OFFSET, WHERE, AVG, SUM, MIN, MAX, LIMIT, SELECT, 
-- SELECT DISTINCT, operators (e.g., =, !=, <, >, <=, >=, LIKE, IN, NOT IN, AND, OR, IS NULL, NOT LIKE, BETWEEN),
-- ALTER TABLE (ADD and DROP COLUMN), and UPDATE.

-- Setup Instructions:
-- 1. Create a new database or use an existing one.
-- 2. Execute the SQL commands below to set up the product_sales table and populate it with data.
-- 3. Write SQL queries for the analysis tasks (listed as comments) using only the specified SQL concepts.
-- 4. Submit your queries in a clear, organized format.

-- Create the product_sales table
CREATE TABLE product_sales (
    sale_id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL CHECK (LENGTH(TRIM(product_name)) <= 50),
    category TEXT CHECK (LENGTH(TRIM(category)) <= 30),
    sale_date DATE NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0),
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0)
);

-- Insert 103 product sales records
INSERT INTO product_sales (product_name, category, sale_date, quantity, unit_price) VALUES
    ('Laptop Pro', 'Electronics', '2023-01-15', 5, 999.99),
    ('Desk Chair', 'Furniture', '2022-06-20', 10, 149.99),
    ('Smartphone X', 'Electronics', '2025-04-11', 8, 799.99),
    ('Table Lamp', 'Furniture', '2022-01-13', 15, 29.99),
    ('Monitor 24"', 'Electronics', '2021-03-22', 12, 199.99),
    ('Bookshelf', 'Furniture', '2020-11-10', 7, 249.99),
    ('Headphones', 'Electronics', '2023-07-08', 20, 59.99),
    ('Coffee Table', 'Furniture', '2024-02-14', 3, 199.99),
    ('Keyboard', 'Electronics', '2022-09-05', 25, 49.99),
    ('Sofa', 'Furniture', '2021-05-17', 2, 499.99),
    ('Mouse', 'Electronics', '2023-12-01', 30, 29.99),
    ('Desk', 'Furniture', '2020-08-23', 4, 299.99),
    ('Speaker', 'Electronics', '2024-06-30', 10, 89.99),
    ('Bookshelf Small', 'Furniture', '2022-04-12', 6, 129.99),
    ('Webcam', 'Electronics', '2021-10-19', 15, 69.99),
    ('TV 55"', 'Electronics', '2023-03-03', 3, 599.99),
    ('Dining Table', 'Furniture', '2020-12-15', 2, 399.99),
    ('Printer', 'Electronics', '2022-07-27', 8, 149.99),
    ('Bed Frame', 'Furniture', '2024-01-09', 1, 349.99),
    ('Smartwatch', 'Electronics', '2021-02-28', 12, 199.99),
    ('Wardrobe', 'Furniture', '2023-08-14', 3, 499.99),
    ('Router', 'Electronics', '2020-10-05', 10, 79.99),
    ('Nightstand', 'Furniture', '2022-11-22', 5, 99.99),
    ('Tablet', 'Electronics', '2021-06-18', 7, 299.99),
    ('Bookshelf Large', 'Furniture', '2024-04-07', 2, 349.99),
    ('External Drive', 'Electronics', '2023-05-25', 15, 89.99),
    ('Recliner', 'Furniture', '2020-09-13', 4, 399.99),
    ('Camera', 'Electronics', '2022-02-10', 6, 499.99),
    ('Dresser', 'Furniture', '2021-07-29', 3, 249.99),
    ('USB Hub', 'Electronics', '2023-10-04', 20, 19.99),
    ('Mattress', 'Furniture', '2020-12-30', 2, 599.99),
    ('Smart Speaker', 'Electronics', '2024-03-16', 10, 99.99),
    ('TV Stand', 'Furniture', '2022-08-08', 5, 149.99),
    ('Laptop Charger', 'Electronics', '2021-04-21', 25, 39.99),
    ('Office Chair', 'Furniture', '2023-01-27', 8, 199.99),
    ('Wireless Mouse', 'Electronics', '2020-11-11', 15, 34.99),
    ('Bookshelf Medium', 'Furniture', '2022-05-06', 6, 179.99),
    ('Bluetooth Speaker', 'Electronics', '2024-07-19', 12, 79.99),
    ('Dining Chair', 'Furniture', '2021-09-02', 10, 89.99),
    ('Smart Bulb', 'Electronics', '2023-06-12', 20, 24.99),
    ('Side Table', 'Furniture', '2020-10-25', 7, 99.99),
    ('Gaming Console', 'Electronics', '2022-03-14', 5, 499.99),
    ('Bedside Lamp', 'Furniture', '2021-08-07', 10, 39.99),
    ('USB Cable', 'Electronics', '2024-02-23', 30, 9.99),
    ('Sofa Bed', 'Furniture', '2023-11-18', 2, 699.99),
    ('Smart TV 65"', 'Electronics', '2020-07-09', 3, 799.99),
    ('Bookshelf Tall', 'Furniture', '2022-12-04', 4, 299.99),
    ('Wireless Charger', 'Electronics', '2021-01-16', 15, 29.99),
    ('Coffee Maker', 'Appliances', '2023-04-29', 8, 99.99),
    ('Armchair', 'Furniture', '2024-05-13', 5, 249.99),
    ('Smart Thermostat', 'Electronics', '2022-10-20', 10, 149.99),
    ('Mirror', 'Furniture', '2021-03-05', 6, 79.99),
    ('Fitness Tracker', 'Electronics', '2020-06-17', 12, 59.99),
    ('Kitchen Table', 'Furniture', '2023-09-01', 3, 349.99),
    ('Earphones', 'Electronics', '2022-01-10', 25, 19.99),
    ('Storage Cabinet', 'Furniture', '2024-08-15', 4, 199.99),
    ('Smart Doorbell', 'Electronics', '2021-11-22', 8, 129.99),
    ('Bar Stool', 'Furniture', '2023-02-17', 6, 99.99),
    ('Power Bank', 'Electronics', '2020-12-05', 20, 39.99),
    ('Dining Bench', 'Furniture', '2022-07-14', 5, 149.99),
    ('Smart Plug', 'Electronics', '2024-01-30', 15, 24.99),
    ('Bookshelf Narrow', 'Furniture', '2021-05-09', 7, 129.99),
    ('Wireless Keyboard', 'Electronics', '2023-06-25', 10, 59.99),
    ('Patio Table', 'Furniture', '2020-09-20', 3, 299.99),
    ('Smart Light Strip', 'Electronics', '2022-11-01', 12, 49.99),
    ('Console Table', 'Furniture', '2024-03-08', 4, 179.99),
    ('Action Camera', 'Electronics', '2021-07-15', 8, 199.99),
    ('Rocking Chair', 'Furniture', '2023-12-12', 2, 249.99),
    ('USB Adapter', 'Electronics', '2020-08-30', 25, 14.99),
    ('Wardrobe Large', 'Furniture', '2022-04-05', 1, 599.99),
    ('Smart Scale', 'Electronics', '2024-06-10', 10, 39.99),
    ('Folding Table', 'Furniture', '2021-02-20', 6, 99.99),
    ('Wireless Earbuds', 'Electronics', '2023-05-15', 15, 79.99),
    ('Nightstand Set', 'Furniture', '2020-10-12', 5, 149.99),
    ('Gaming Mouse', 'Electronics', '2022-09-25', 12, 69.99),
    ('Bookshelf Wide', 'Furniture', '2024-02-28', 3, 349.99),
    ('Smart Camera', 'Electronics', '2021-06-05', 8, 129.99),
    ('Dining Set', 'Furniture', '2023-01-15', 2, 499.99),
    ('HDMI Cable', 'Electronics', '2020-11-30', 20, 19.99),
    ('Sofa Set', 'Furniture', '2022-08-10', 1, 799.99),
    ('Smart Lock', 'Electronics', '2024-04-20', 10, 149.99),
    ('Wall Shelf', 'Furniture', '2021-03-25', 7, 59.99),
    ('VR Headset', 'Electronics', '2023-07-05', 5, 399.99),
    ('Patio Chair', 'Furniture', '2020-12-15', 8, 99.99),
    ('Smart Fan', 'Electronics', '2022-06-20', 10, 89.99),
    ('Coffee Table Set', 'Furniture', '2024-01-10', 3, 249.99),
    ('Wireless Router', 'Electronics', '2021-09-01', 12, 99.99),
    ('Bookshelf Short', 'Furniture', '2023-02-25', 5, 119.99),
    ('Smart Glasses', 'Electronics', '2020-07-15', 6, 299.99),
    ('Desk Organizer', 'Furniture', '2022-10-30', 10, 29.99),
    ('Portable Speaker', 'Electronics', '2024-05-05', 15, 69.99),
    ('Folding Chair', 'Furniture', '2021-04-10', 8, 49.99),
    ('Smart Hub', 'Electronics', '2023-08-20', 10, 129.99),
    ('TV Mount', 'Furniture', '2020-11-05', 6, 79.99),
    ('Gaming Headset', 'Electronics', '2022-12-20', 12, 99.99),
    ('Bar Table', 'Furniture', '2024-03-15', 4, 199.99),
    ('Smart Projector', 'Electronics', '2021-02-10', 5, 499.99),
    ('Storage Bench', 'Furniture', '2023-06-30', 3, 149.99),
    ('USB-C Cable', 'Electronics', '2020-09-15', 25, 14.99),
    ('Bookshelf Corner', 'Furniture', '2022-05-25', 5, 179.99),
    ('Smart Monitor', 'Electronics', '2024-07-10', 8, 299.99),
    ('Microwave', 'Appliances', '2021-01-20', 6, 129.99),
    ('Lamp Set', 'Furniture', '2023-04-10', 10, 49.99);

-- Add discount column
ALTER TABLE product_sales
ADD discount DECIMAL(5, 2) CHECK (discount >= 0 AND discount <= 100);

-- Update discount for Electronics and Appliances categories
UPDATE product_sales
SET discount = 10.00
WHERE category = 'Electronics';

UPDATE product_sales
SET discount = 5.00
WHERE category = 'Appliances';

-- Add region column
ALTER TABLE product_sales
ADD COLUMN region VARCHAR(50);

-- Update region for all products
UPDATE product_sales
SET region = 'North'
WHERE product_name IN (
    'Laptop Pro', 'Monitor 24"', 'Keyboard', 'Mouse', 'Webcam', 'TV 55"', 'Printer', 'Smartwatch',
    'Router', 'Tablet', 'External Drive', 'Camera', 'USB Hub', 'Smart Speaker', 'Laptop Charger',
    'Wireless Mouse', 'Bluetooth Speaker', 'Smart Bulb', 'Gaming Console', 'USB Cable', 'Smart TV 65"',
    'Wireless Charger', 'Smart Thermostat', 'Fitness Tracker', 'Earphones', 'Smart Doorbell', 'Power Bank',
    'Smart Plug', 'Wireless Keyboard', 'Smart Light Strip', 'Action Camera', 'USB Adapter', 'Smart Scale',
    'Wireless Earbuds', 'Gaming Mouse', 'Smart Camera', 'HDMI Cable', 'Smart Lock', 'VR Headset', 'Smart Fan',
    'Wireless Router', 'Smart Glasses', 'Portable Speaker', 'Smart Hub', 'Gaming Headset', 'Smart Projector',
    'USB-C Cable', 'Smart Monitor'
);

UPDATE product_sales
SET region = 'South'
WHERE product_name IN (
    'Desk Chair', 'Bookshelf', 'Sofa', 'Desk', 'Bookshelf Small', 'Dining Table', 'Bed Frame', 'Wardrobe',
    'Nightstand', 'Bookshelf Large', 'Recliner', 'Dresser', 'Mattress', 'TV Stand', 'Office Chair',
    'Bookshelf Medium', 'Dining Chair', 'Side Table', 'Bedside Lamp', 'Sofa Bed', 'Bookshelf Tall',
    'Armchair', 'Mirror', 'Kitchen Table', 'Storage Cabinet', 'Bar Stool', 'Dining Bench', 'Bookshelf Narrow',
    'Patio Table', 'Console Table', 'Rocking Chair', 'Folding Table', 'Nightstand Set', 'Bookshelf Wide',
    'Dining Set', 'Sofa Set', 'Wall Shelf', 'Patio Chair', 'Coffee Table Set', 'Bookshelf Short',
    'Desk Organizer', 'Folding Chair', 'TV Mount', 'Bar Table', 'Storage Bench', 'Bookshelf Corner', 'Lamp Set'
);

UPDATE product_sales
SET region = 'East'
WHERE product_name IN ('Smartphone X', 'Headphones', 'Speaker');

UPDATE product_sales
SET region = 'West'
WHERE product_name IN ('Table Lamp', 'Coffee Table', 'Microwave');

-- Analysis Tasks (Write SQL queries for each task using only the specified SQL concepts)
-- Task 1: Select all columns for sales where the product_name is 'Laptop Pro'.
select  *  from product_sales where product_name = 'Laptop Pro'; 
-- Task 2: Select all columns for sales where sale_id is less than 5
select * from product_sales where sale_id < 5;
-- Task 3: Select all columns for sales where sale_id is greater than or equal to 10.
select * from product_sales where sale_id >= 10;
-- Task 4: Select all columns for sales where sale_id is not equal to 7.
select * from product_sales where sale_id != 7;
-- Task 5: Select all columns for sales where sale_id is between 3 and 8 (inclusive).
select * from product_sales where sale_id between 3 and 8;
-- Task 6: Select all columns for sales where discount is NULL.
select * from product_sales where discount is null;
-- Task 7: Select all columns for sales where product_name is in ('Laptop Pro', 'Sofa', 'Monitor 24"').
select * from product_sales where product_name  in ('Laptop Pro', 'Sofa', 'Monitor 24"');
-- Task 8: Select all columns for sales where product_name is not in ('Laptop Pro', 'Sofa', 'Monitor 24"').
select * from product_sales where product_name  not in ('Laptop Pro', 'Sofa', 'Monitor 24"');
-- Task 9: Select all columns for sales where product_name starts with 'S'.
select * from product_sales where product_name like 'S%';
-- Task 10: Select all columns for sales where product_name ends with 'e'.
select * from product_sales where product_name like '%e';
-- Task 11: Select all columns for sales where product_name does not start with 'S'.
select * from product_sales where product_name not like 'S%';
-- Task 12: Select all columns for sales where category is 'Electronics' and discount is greater than 0.
select * from product_sales where category = 'Electronics' and  discount > 0;
-- Task 13: Select all columns for sales where region is 'North' or unit_price is less than 50.
select * from product_sales where region = 'North' and  unit_price < 50;
-- Task 14: Select only product_name and unit_price for all sales.
select product_name , unit_price from product_sales;
-- Task 15: Add a new column tax_rate (DECIMAL(5, 2)) to the product_sales table.
alter table product_sales add tax_rate decimal(5,2);
-- Task 16: Update the tax_rate to 8.00 for sales where region is 'North'.
UPDATE product_sales set tax_rate = 8.00 where region = 'North';
-- Task 17: Update the tax_rate to 7.50 for sales where product_name is 'Desk Chair'.
UPDATE product_sales set tax_rate = 7.50 where product_name = 'Desk Chair';
-- Task 18: Update the tax_rate to 6.25 for all sales.
update product_sales set tax_rate = 6.25;
-- Task 19: Select unique region values from the product_sales table.
select distinct region from product_sales;
-- Task 20: Select all columns, sorted by unit_price in descending order.
select * from product_sales order by unit_price desc;
-- Task 21: Select product_name, category, and sale_date for the first 5 sales.
select product_name, category, sale_date from product_sales limit 5;
-- Task 22: Select product_name, category, and sale_date for 5 sales, sorted by sale_date in descending order, skipping the first 10.
select product_name , category, sale_date from product_sales order by sale_date desc limit 5 offset 10;
-- Task 23: Find the earliest sale_date.
select min(sale_date) from product_sales;
-- Task 24: Find the latest sale_date.
select max(sale_date) from product_sales;
-- Task 25: Count the total number of sales.
select count(*) from product_sales;
-- Task 26: Count the number of sales with a non-NULL discount.
select count(*) from product_sales where discount is not null;

-- Task 27: Select all columns for sales with a NULL region.
select * from product_sales where region is null;
-- Task 28: Calculate the sum of quantities sold.
select sum(quantity) from product_sales;
-- Task 29: Calculate the average unit_price of all sales.
select avg(unit_price) from product_sales;
-- Task 30: Drop the tax_rate column from the product_sales table.
alter table product_sales drop column tax_rate;

-- Create a table named 'users' to store user information
create table users (
    user_id serial primary key, -- 'serial' is a PostgreSQL-specific data type that auto-increments integers (1, 2, 3, ...). 'primary key' ensures user_id is unique and not null, serving as the table's unique identifier.
    username varchar(50) not null -- 'varchar(50)' defines a variable-length string with a maximum length of 50 characters. 'not null' ensures this column cannot be empty.
);

-- Create a table named 'orders' to store order information
create table orders (
    order_id serial primary key, -- 'serial' auto-increments the order_id, and 'primary key' ensures it’s unique and not null, uniquely identifying each order.
    user_id int, -- 'int' defines an integer column to store the ID of the user who placed the order. This will link to the 'users' table.
    order_date date, -- 'date' stores the date of the order (e.g., '2025-07-11'). This column can be null unless specified otherwise.
    foreign key (user_id) references users (user_id) on delete cascade -- 'foreign key' establishes a relationship between 'user_id' in the 'orders' table and 'user_id' in the 'users' table. 'references users (user_id)' ensures that any user_id in 'orders' must exist in 'users'. 'on delete cascade' means if a user is deleted from the 'users' table, all their orders in the 'orders' table are automatically deleted to maintain referential integrity.
);

-- Insert data into the 'users' table
insert into users (username)
values ('himanshu@123'), -- Inserts a row with username 'himanshu@123'. The 'user_id' is auto-generated (e.g., 1).
('deepesh@345'), -- Inserts a row with username 'deepesh@345' (e.g., user_id = 2).
('rohan@546'), -- Inserts a row with username 'rohan@546' (e.g., user_id = 3).
('yogesh@123'); -- Inserts a row with username 'yogesh@123' (e.g., user_id = 4).

-- Insert data into the 'orders' table
insert into orders (user_id, order_date)
values (3, '2025-07-11'), -- Inserts an order for user_id 3 (rohan@546) with order date '2025-07-11'. 'order_id' is auto-generated (e.g., 1).
(1, '2024-04-11'), -- Inserts an order for user_id 1 (himanshu@123) with order date '2024-04-11' (e.g., order_id = 2).
(2, '2025-04-01'), -- Inserts an order for user_id 2 (deepesh@345) with order date '2025-04-01' (e.g., order_id = 3).
(3, '2023-01-01'); -- Inserts another order for user_id 3 (rohan@546) with order date '2023-01-01' (e.g., order_id = 4).

-- Select all columns from the 'users' table
select * from users; -- Retrieves all rows and columns from the 'users' table. Output will show user_id and username for all users (e.g., 1, 'himanshu@123'; 2, 'deepesh@345'; etc.).

-- Select all columns from the 'orders' table
select * from orders; -- Retrieves all rows and columns from the 'orders' table. Output will show order_id, user_id, and order_date for all orders (e.g., 1, 3, '2025-07-11'; etc.).

-- Perform an INNER JOIN to combine data from 'users' and 'orders' tables
select orders.order_id as oid, users.username, orders.order_date -- Selects specific columns: 'order_id' (aliased as 'oid'), 'username', and 'order_date'.
from users -- Specifies the 'users' table as the left table in the join.
inner join orders on orders.user_id = users.user_id; -- 'inner join' combines rows from 'users' and 'orders' where the condition 'orders.user_id = users.user_id' is true. Only matching rows are returned (e.g., users with orders). The result shows order_id, username, and order_date for matched records.

-- Perform the same INNER JOIN with table aliases for brevity
select o.order_id as oid, u.username, o.order_date -- Selects the same columns as above, but uses aliases 'o' for 'orders' and 'u' for 'users' to shorten the syntax.
from users as u -- Aliases the 'users' table as 'u' for easier reference.
inner join orders as o on o.user_id = u.user_id; -- 'inner join' performs the same operation as above, matching rows where 'orders.user_id' equals 'users.user_id'. The aliases 'o' and 'u' make the query more concise but produce the same result.


select * from product_sales;