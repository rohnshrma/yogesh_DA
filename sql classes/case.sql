create table products(
product_id serial primary key,
name varchar(100) not null,
amount int not null
)


insert into products (name, amount)
values ('milk' , 38),
('bread' , 65),
('apple' , 120),
('avacardo' , 180),
('charger' , 1500),
('earphones', 3999),
('toothpaste' , 250),
('sale' , 300);




--case
--	when condition then result
--	when condition then result
--	else result
--end 



select name, amount , 
case 
	when amount >= 1000 then 'Very Expensive'
	when amount >= 100 and amount < 1000 then 'Expensive'
	else 'budget Friendly'
end as category
from products;

--
--
--Question 1: Tax Application
--Write a query to calculate the tax amount for each product based on its amount:
--
--If amount is greater than 1000, apply a 15% tax.
--If amount is between 100 and 1000 (inclusive), apply a 10% tax.
--If amount is less than 100, apply a 5% tax.
--Display the name, amount, and the calculated tax amount (as tax).
--

select name , amount,
case 
	when amount > 1000 then amount * 0.15
	when amount >= 100 and amount <= 1000 then amount * 0.10
	else amount * 0.5
end as tax_amount
from products;


--Hint: Use a CASE statement to determine the tax rate and multiply it by amount.
--Question 2: Product Availability
--Write a query to assign an availability status based on the amount:
--
--If amount is greater than 500, status is 'Premium'.
--If amount is between 100 and 500 (inclusive), status is 'Standard'.
--If amount is less than 100, status is 'Budget'.
--Display the name, amount, availability status, and sort the results by amount in ascending order.
--
--Hint: Use CASE for the status and add an ORDER BY clause.


select name , amount,
case 
	when amount > 500 then 'Premium'
	when amount >= 100 and amount <= 500 then 'Standard'
	else 'Budget'
end as availability_status
from products
order by amount asc;




--Question 3: Name-Based Discount Eligibility
--Write a query to determine discount eligibility based on the product name:
--
--If the name starts with 'm' or 'b', the product is 'Eligible for 10% Discount'.
--If the name contains 'cleaner', the product is 'Eligible for 15% Discount'.
--Otherwise, the product is 'Not Eligible'.
--Display the name, amount, and the discount eligibility.
--
--Hint: Use CASE with LIKE or LOWER(name) for case-insensitive matching.
--Question 4: Price Tier with Adjusted Amount
--Write a query to assign a price tier and adjust the amount based on the tier:
--
--If amount is greater than 200, label as 'Luxury' and increase the price by 10%.
--If amount is between 50 and 200 (inclusive), label as 'Mid-Range' and keep the price unchanged.
--If amount is less than 50, label as 'Economy' and decrease the price by 5%.
--Display the name, original amount, price tier, and the adjusted amount (as adjusted_amount).
--
--Hint: Use CASE for both the tier label and the price adjustment calculation.
--Question 5: Category and Count Summary
--Write a query to categorize products by price range and count the number of products in each category, as well as calculate the total amount for each category:
--
--'Expensive': amount > 200
--'Moderate': amount between 50 and 200
--'Cheap': amount < 50
--Display the category, the count of products, and the total amount for each category.
--
--Hint: Use CASE within a GROUP BY query with COUNT and SUM aggregates.
--
--
--
