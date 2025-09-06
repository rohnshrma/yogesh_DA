-- Create a table named 'products' to store product information
create table products (
    -- Define 'product_id' as an auto-incrementing integer that uniquely identifies each product
    -- 'serial' automatically generates sequential integers (1, 2, 3, ...)
    -- 'primary key' ensures 'product_id' is unique and not null
    product_id serial primary key,
    -- Define 'name' as a variable-length string with a maximum of 100 characters
    -- 'not null' ensures that every product must have a name
    name varchar(100) not null,
    -- Define 'amount' as an integer to store the price of the product
    -- 'not null' ensures that every product must have an amount
    amount int not null
);

-- Insert data into the 'products' table
insert into products (name, amount)
values 
    -- Insert a product with name 'milk' and amount 38
    ('milk', 38),
    -- Insert a product with name 'bread' and amount 65
    ('bread', 65),
    -- Insert a product with name 'apple' and amount 120
    ('apple', 120),
    -- Insert a product with name 'avacardo' (likely a typo for 'avocado') with amount 180
    ('avacardo', 180),
    -- Insert a product with name 'charger' and amount 1500
    ('charger', 1500),
    -- Insert a product with name 'earphones' and amount 3999
    ('earphones', 3999),
    -- Insert a product with name 'toothpaste' and amount 250
    ('toothpaste', 250),
    -- Insert a product with name 'sale' and amount 300
    ('sale', 300);

-- CASE statement structure (commented for reference, not executed)
-- CASE is used for conditional logic in SQL, similar to if-else in programming
-- Syntax: CASE WHEN condition THEN result WHEN condition THEN result ELSE result END
-- This is a template for the CASE statements used in the following queries
-- select name, amount,
-- case 
--     when amount >= 1000 then 'Some Result'
-- end

-- Query to categorize products based on their amount
select 
    -- Select the 'name' column from the products table
    name,
    -- Select the 'amount' column from the products table
    amount,
    -- Use CASE to assign a category based on the amount
    case 
        -- If amount is 1000 or more, categorize as 'Very Expensive'
        when amount >= 1000 then 'Very Expensive'
        -- If amount is between 100 and 999 (inclusive), categorize as 'Expensive'
        when amount >= 100 and amount < 1000 then 'Expensive'
        -- For all other cases (amount < 100), categorize as 'Budget Friendly'
        else 'Budget Friendly'
    -- End the CASE statement and name the resulting column 'category'
    end as category
-- Specify the table to query
from products;

-- Question 1: Tax Application
-- Calculate tax for each product based on its amount
select 
    -- Select the 'name' column
    name,
    -- Select the 'amount' column
    amount,
    -- Use CASE to calculate tax based on amount
    case 
        -- If amount > 1000, apply 15% tax (multiply amount by 0.15)
        when amount > 1000 then amount * 0.15
        -- If amount is between 100 and 1000 (inclusive), apply 10% tax
        when amount >= 100 and amount <= 1000 then amount * 0.10
        -- If amount < 100, apply 5% tax (Note: Original code has a typo, should be 0.05, not 0.5)
        else amount * 0.05 -- Corrected from 0.5 to 0.05 for 5% tax
    -- End CASE and name the resulting column 'tax_amount'
    end as tax_amount
-- Query the 'products' table
from products;

-- Question 2: Product Availability
-- Assign availability status based on amount and sort by amount
select 
    -- Select the 'name' column
    name,
    -- Select the 'amount' column
    amount,
    -- Use CASE to assign availability status based on amount
    case 
        -- If amount > 500, status is 'Premium'
        when amount > 500 then 'Premium'
        -- If amount is between 100 and 500 (inclusive), status is 'Standard'
        when amount >= 100 and amount <= 500 then 'Standard'
        -- If amount < 100, status is 'Budget'
        else 'Budget'
    -- End CASE and name the resulting column 'availability_status'
    end as availability_status
-- Query the 'products' table
from products
-- Sort results by 'amount' in ascending order
order by amount asc;

-- Question 3: Name-Based Discount Eligibility
-- Determine discount eligibility based on product name
select 
    -- Select the 'name' column
    name,
    -- Select the 'amount' column
    amount,
    -- Use CASE with LIKE to check product name patterns
    case 
        -- If name starts with 'm' or 'b', product is eligible for 10% discount
        -- LIKE 'm%' checks if name starts with 'm', case-sensitive
        -- LIKE 'b%' checks if name starts with 'b'
        when name like 'm%' or name like 'b%' then 'Eligible for 10% Discount'
        -- If name contains 'paste' (e.g., in 'toothpaste'), eligible for 15% discount
        -- Note: Original code uses 'paste' instead of 'cleaner' as per the question hint
        when name like '%paste%' then 'Eligible for 15% Discount'
        -- For all other cases, product is not eligible for a discount
        else 'Not Eligible'
    -- End CASE and name the resulting column 'discount_Eligibility'
    end as discount_Eligibility
-- Query the 'products' table
from products;

-- Question 4: Price Tier with Adjusted Amount
-- Assign price tier and adjust amount based on tier
select 
    -- Select the 'name' column
    name,
    -- Select the original 'amount' column
    amount,
    -- Use CASE to assign a price tier based on amount
    case 
        -- If amount > 200, label as 'Luxury'
        when amount > 200 then 'Luxury'
        -- If amount is between 50 and 200 (inclusive), label as 'Mid-Range'
        when amount >= 50 and amount <= 200 then 'Mid-Range'
        -- If amount < 50, label as 'Economy'
        else 'Economy'
    -- End CASE and name the resulting column 'price_tier'
    end as price_tier,
    -- Use CASE to calculate adjusted amount based on tier
    case 
        -- If amount > 200, increase price by 10% (multiply by 1.10)
        when amount > 200 then amount * 1.10
        -- If amount is between 50 and 200, keep price unchanged
        when amount >= 50 and amount <= 200 then amount
        -- If amount < 50, decrease price by 5% (multiply by 0.95)
        else amount * 0.95
    -- End CASE and name the resulting column 'adjusted_amount'
    end as adjusted_amount
-- Query the 'products' table
from products;

-- Question 5: Category and Count Summary
-- Categorize products by price range and summarize count and total amount
select 
    -- Use CASE to categorize products based on amount
    case 
        -- If amount > 200, category is 'Expensive'
        when amount > 200 then 'Expensive'
        -- If amount is between 50 and 200 (inclusive), category is 'Moderate'
        when amount >= 50 and amount <= 200 then 'Moderate'
        -- If amount < 50, category is 'Cheap'
        else 'Cheap'
    -- End CASE and name the resulting column 'category'
    end as category,
    -- Use COUNT(*) to count the number of products in each category
    count(*) as product_count,
    -- Use SUM(amount) to calculate the total amount for each category
    sum(amount) as total_amount
-- Query the 'products' table
from products
-- Group results by the same CASE expression used for categorization
group by 
    case 
        when amount > 200 then 'Expensive'
        when amount >= 50 and amount <= 200 then 'Moderate'
        else 'Cheap'
    end;