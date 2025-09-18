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

with average_cost as ( select avg(cost) as avg_cost from store_inventory )
select store_id, store_name, product, 	quantity , cost
from store_inventory si , average_cost ac
where cost > ac.avg_cost; 

-- Count Products per Store


with product_counts as (
	select store_id, store_name, count(*) as product_count
	from store_inventory
	group by store_id, store_name)
select store_id, store_name ,product_count
from  product_counts
order by product_count desc



with store_totals as (
	select store_id, 
		store_name, 
		sum (quantity) as total_quantity,
		sum (quantity *cost) as total_cost
	from store_inventory
	group by store_id  , store_name 
) ,
	avg_store_cost as (
	select avg (total_cost) as avg_cost
	from store_totals
	)
select store_id, store_name, total_quantity, total_cost
from store_totals  , avg_store_cost 
where total_cost > avg_cost
order by total_cost desc	









with product_values as (
	select	store_id, store_name, product , quantity , cost , (quantity * cost) as total_value,
	rank() over (partition by store_id order by (quantity * cost) desc) as value_rank
	from store_inventory 
)
select store_id, store_name, product , quantity , cost , total_value , value_rank
from product_values
where value_rank = 1
order by total_value desc;


with high_value_products as (
	select store_id, store_name, product, (quantity * cost) as total_value
	from store_inventory si 
	where (quantity * cost) > 3000
)
select distinct store_id , store_name ,total_value  from 
high_value_products 
order by store_id;
































