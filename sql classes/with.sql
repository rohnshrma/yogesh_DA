-- common table expression
-- sub query factoring

-- use of with clause


-- fetch employees who earn more than average salary of all employees


CREATE TABLE store_inventory (
    store_id INTEGER,
    store_name CHARACTER VARYING(50),
    product CHARACTER VARYING(50),
    quantity INTEGER,
    cost INTEGER
);

INSERT INTO store_inventory (store_id, store_name, product, quantity, cost) VALUES
(1, 'Apple Originals 1', 'iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1', 'MacBook pro 13', 3, 2000),
(1, 'Apple Originals 1', 'AirPods Pro', 2, 280),
(2, 'Apple Originals 2', 'iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3', 'iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3', 'MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3', 'MacBook Air', 4, 1100),
(3, 'Apple Originals 3', 'iPhone 12', 2, 1000),
(3, 'Apple Originals 3', 'AirPods Pro', 3, 280),
(4, 'Apple Originals 4', 'iPhone 12 Pro', 2, 1000),
(4, 'Apple Originals 4', 'MacBook pro 13', 1, 2500),
(1, 'Apple Originals 1', 'iPhone 12', 3, 900),
(2, 'Apple Originals 2', 'MacBook Air', 2, 1100),
(2, 'Apple Originals 2', 'AirPods Pro', 1, 280),
(3, 'Apple Originals 3', 'MacBook pro 13', 2, 2000),
(4, 'Apple Originals 4', 'iPhone 12', 1, 900),
(1, 'Apple Originals 1', 'MacBook Air', 1, 1100),
(2, 'Apple Originals 2', 'iPhone 12 Pro', 1, 1000),
(3, 'Apple Originals 3', 'AirPods Pro', 2, 280),
(4, 'Apple Originals 4', 'MacBook pro 13', 3, 2500),
(1, 'Apple Originals 1', 'iPhone 12 Pro', 2, 1000),
(2, 'Apple Originals 2', 'MacBook pro 13', 1, 2000),
(3, 'Apple Originals 3', 'iPhone 12', 3, 900),
(4, 'Apple Originals 4', 'AirPods Pro', 1, 280),
(1, 'Apple Originals 1', 'MacBook Air', 2, 1100),
(2, 'Apple Originals 2', 'iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3', 'MacBook pro 13', 1, 2000),
(4, 'Apple Originals 4', 'iPhone 12', 2, 900),
(1, 'Apple Originals 1', 'AirPods Pro', 3, 280),
(2, 'Apple Originals 2', 'MacBook Air', 1, 1100),
(3, 'Apple Originals 3', 'iPhone 12 Pro', 1, 1000),
(4, 'Apple Originals 4', 'MacBook pro 13', 2, 2500),
(1, 'Apple Originals 1', 'iPhone 12', 1, 900),
(2, 'Apple Originals 2', 'AirPods Pro', 2, 280),
(3, 'Apple Originals 3', 'MacBook Air', 3, 1100),
(4, 'Apple Originals 4', 'iPhone 12 Pro', 1, 1000),
(1, 'Apple Originals 1', 'MacBook pro 13', 2, 2000),
(2, 'Apple Originals 2', 'iPhone 12', 1, 900),
(3, 'Apple Originals 3', 'AirPods Pro', 1, 280),
(4, 'Apple Originals 4', 'MacBook Air', 2, 1100),
(1, 'Apple Originals 1', 'iPhone 12 Pro', 1, 1000),
(2, 'Apple Originals 2', 'MacBook pro 13', 3, 2000),
(3, 'Apple Originals 3', 'iPhone 12', 2, 900),
(4, 'Apple Originals 4', 'AirPods Pro', 3, 280),
(1, 'Apple Originals 1', 'MacBook Air', 1, 1100),
(2, 'Apple Originals 2', 'iPhone 12 Pro', 2, 1000),
(3, 'Apple Originals 3', 'MacBook pro 13', 1, 2000),
(4, 'Apple Originals 4', 'iPhone 12', 1, 900),
(1, 'Apple Originals 1', 'AirPods Pro', 2, 280);




--select * from employeez e
--where e.salary > (select avg(salary) from employeez)
--
--
--with average_salary  (avg_salary) as (select avg (salary) from employeez)
--select * from employeez e ,  average_salary av
--where e.salary > av.avg_salary;
--
--
--
--select avg (salary) from employeez



--  find the product in the store_inventory table
-- where the total cost (quntity * cost) is greater then the 
-- average total cost across all products


with avg_total_cost as ( select avg(quantity * cost) as avg_cost from store_inventory )
select store_id, store_name, product, 	quantity , cost , (quantity * cost) as totalcost
from store_inventory si , avg_total_cost atc
where (quantity * cost) > atc.avg_cost; 




-- Filter Products with Above-Average Cost
-- Count Products per Store



