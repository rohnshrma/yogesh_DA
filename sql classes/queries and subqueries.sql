
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50),
    SignUpDate DATE
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10, 2),
    ProductCategory VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO Customers (CustomerID, CustomerName, Country, SignUpDate) VALUES
(1, 'Alice Smith', 'USA', '2024-01-10'),
(2, 'Bob Jones', 'Canada', '2024-02-15'),
(3, 'Charlie Brown', 'USA', '2024-03-20'),
(4, 'Diana Prince', 'UK', '2024-04-25'),
(5, 'Emma Watson', 'UK', '2024-05-30'),
(6, 'Frank Miller', 'Canada', '2024-06-15');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Amount, ProductCategory) VALUES
(101, 1, '2025-01-15', 500.00, 'Electronics'),
(102, 1, '2025-02-10', 300.00, 'Books'),
(103, 1, '2025-03-05', 750.00, 'Electronics'),
(104, 2, '2025-01-20', 700.00, 'Clothing'),
(105, 2, '2025-02-25', 400.00, 'Books'),
(106, 2, '2025-03-10', 600.00, 'Electronics'),
(107, 3, '2025-01-25', 400.00, 'Books'),
(108, 3, '2025-02-15', 450.00, 'Clothing'),
(109, 3, '2025-03-20', 800.00, 'Electronics'),
(110, 4, '2025-01-30', 200.00, 'Books'),
(111, 4, '2025-02-20', 350.00, 'Clothing'),
(112, 4, '2025-03-15', 500.00, 'Electronics'),
(113, 5, '2025-01-10', 600.00, 'Electronics'),
(114, 5, '2025-02-05', 250.00, 'Books'),
(115, 5, '2025-03-25', 700.00, 'Clothing'),
(116, 1, '2025-04-01', 450.00, 'Clothing'),
(117, 2, '2025-04-05', 550.00, 'Electronics'),
(118, 3, '2025-04-10', 300.00, 'Books'),
(119, 4, '2025-04-15', 400.00, 'Clothing'),
(120, 5, '2025-04-20', 650.00, 'Electronics');




-- This picks the CustomerName column from the Customers table.
-- Think of Customers as a spreadsheet with customer info. We just want their names.
-- The 'c' is a nickname for the Customers table to make it easier to write later.
select CustomerName from Customers c

-- The WHERE clause is like a gatekeeper. It only lets through customers who pass a test.
where (
    -- This is a mini-query (a subquery) that adds up all the money a specific customer spent.
    -- The 'orders' table is like a list of all purchases, and we call it 'o' for short.
    select sum(amount)
    from orders o
    -- This matches orders to the customer we’re checking. It says: "Only add up orders where the CustomerID in orders matches the CustomerID of the customer we’re looking at from the Customers table."
    where o.CustomerID = c.CustomerID
) > (
    -- This is another mini-query to find the average total spending of all customers.
    select avg(TotalAmount)
    from (
        -- This inner mini-query adds up the total spent by each customer.
        -- For each CustomerID, it sums up their order amounts and calls it TotalAmount.
        select CustomerID, sum(amount) as TotalAmount
        from orders
        -- GROUP BY clumps all orders by CustomerID, so we get one total per customer.
        group by CustomerID
    ) as Customer_Total
    -- The result of the inner query is like a temporary table called Customer_Total.
    -- We take the average of all the TotalAmount values from that table.
);


select CustomerName , (
	select Max(Amount)
	from Orders o
	where o.CustomerID = c.CustomerID) as MaxOrderAmount 
from Customers c;




-- Retrieve all customer names and their countries.

-- Find orders with an amount greater than 500.

-- List customer names and their order amounts for all orders

-- Calculate the total order amount per customer.

-- List all orders sorted by amount in descending order.







--Find customers who have at least one order



-- Find orders from customers in the USA



select OrderID, Amount, ProductCategory , CustomerID
from Orders o
where CustomerID in (
	select CustomerID
	from Customers c
	where c.Country = 'USA'
	);


-- Find orders from customers who signed up after March 1, 2024
select OrderID, Amount, ProductCategory , CustomerID
from Orders o
where CustomerID in (
	select CustomerID
	from Customers c
	where c.SignUpDate  > '2024-03-1');

-- Find orders in the 'Electronics' category from customers in Canada




select OrderID, Amount, ProductCategory , CustomerID
from Orders o
where ProductCategory = 'Electronics' 
and CustomerID in (
	select CustomerID
	from Customers c
	where c.Country = 'Canada');




-- Find orders from customers whose names start with 'A'
-- Find orders with amounts greater than the customer’s first order amount

-- Find orders placed in February 2025

-- Find orders from customers in the UK with amounts over 300

-- Find orders in the 'Books' category from customers who signed 
-- up before May 2024

-- Find orders with amounts less than the highest order amount

-- Find orders from customers in the USA or Canada


-- Find orders in Electronics or Clothing from customers not in the UK

-- Find orders with amounts greater than 400 and not from customers who signed up in January

-- Find orders from customers who signed up in March or April and ordered Books

-- Find orders where the amount is less than 600 or the customer is from Canada








