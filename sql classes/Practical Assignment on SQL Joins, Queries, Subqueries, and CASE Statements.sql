CREATE TABLE Departments (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50),
Location VARCHAR(50)
);

CREATE TABLE Employees (
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
DepartmentID INT,
HireDate DATE,
Status VARCHAR(20)
);


CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
EmployeeID INT,
OrderDate DATE,
Product VARCHAR(100),
Quantity INT,
Price DECIMAL(10, 2),
OrderStatus VARCHAR(20)
);




INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(1, 'Sales', 'New York'),
(2, 'Reception', 'Chicago'),
(3, 'Accounting', 'Boston'),
(4, 'Customer Service', 'Los Angeles'),
(5, 'Temp', 'Miami'),
(6, 'IT', NULL);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Status) VALUES
(1, 'Michael', 'Scott', 'michael.scott@email.com', 1, '2022-01-10', 'Active'),
(2, 'Pam', 'Beesly', 'pam.beesly@email.com', 2, '2022-02-15', 'Active'),
(3, 'Dwight', 'Schrute', NULL, 1, '2022-03-20', 'Inactive'),
(4, 'Jim', 'Halpert', 'jim.halpert@email.com', 1, '2022-04-25', 'Active'),
(5, 'Angela', 'Martin', 'angela.martin@email.com', 3, '2022-05-30', 'Active'),
(6, 'Kevin', 'Malone', NULL, 3, '2022-06-15', 'Inactive'),
(7, 'Kelly', 'Kapoor', 'kelly.kapoor@email.com', 4, '2022-07-10', 'Active'),
(8, 'Ryan', 'Howard', 'ryan.howard@email.com', 5, NULL, 'Active'),
(9, 'Erin', 'Hannon', 'erin.hannon@email.com', 2, '2022-09-05', 'Inactive'),
(10, 'Andy', 'Bernard', NULL, 1, '2022-10-20', 'Active'),
(11, 'Toby', 'Flenderson', 'toby.flenderson@email.com', NULL, '2022-11-01', 'Active'),
(12, 'Stanley', 'Hudson', 'stanley.hudson@email.com', 1, '2022-12-10', 'Active');



INSERT INTO Orders (OrderID, EmployeeID, OrderDate, Product, Quantity, Price, OrderStatus) VALUES
(1, 1, '2022-02-01', 'Paper Bundle', 100, 49.99, 'Delivered'),
(2, 2, '2022-03-10', 'Printer', 2, 299.99, 'Delivered'),
(3, 1, '2022-04-15', 'Stapler', 50, 9.99, 'Pending'),
(4, 3, '2022-05-20', 'Toner Cartridge', 10, 79.99, 'Cancelled'),
(5, 4, '2022-06-05', 'Desk Chair', 5, 199.99, 'Delivered'),
(6, 2, '2022-07-12', 'Paper Bundle', 200, 49.99, 'Pending'),
(7, 5, '2022-08-01', 'Calculator', 20, 29.99, 'Delivered'),
(8, 7, '2022-09-15', 'Monitor', 3, 249.99, 'Delivered'),
(9, 8, '2022-10-10', 'Mouse', 30, 19.99, 'Pending'),
(10, 1, '2022-11-01', 'File Cabinet', 2, 149.99, 'Delivered'),
(11, 11, '2022-12-01', 'Laptop', 1, 999.99, 'Delivered'),
(12, 4, '2023-01-15', 'Keyboard', 10, 39.99, 'Delivered'),
(13, 12, '2023-02-20', 'Paper Bundle', 150, 49.99, 'Pending'),
(14, 7, '2023-03-05', 'Desk Lamp', 5, 24.99, 'Delivered');



--Assignment Tasks
--1. Basic Joins: Retrieve a list of all employees, their orders, 
--and department names, including employees without orders. Display EmployeeID,
--FirstName, LastName, DepartmentName, OrderID, and Product.


-- SELECT: Specifies columns to retrieve from the result set
SELECT
    e.EmployeeID,                  -- Selects EmployeeID from Employees table (aliased as 'e')
    e.FirstName,                   -- Selects FirstName from Employees table
    e.LastName,                    -- Selects LastName from Employees table
    d.DepartmentName,              -- Selects DepartmentName from Departments table (aliased as 'd')
    o.OrderID,                     -- Selects OrderID from Orders table (aliased as 'o')
    o.Product                      -- Selects Product from Orders table
-- FROM: Specifies the primary table and assigns alias 'e' to Employees
FROM Employees e
-- LEFT JOIN: Includes all employees, even those without orders (OrderID, Product will be NULL)
LEFT JOIN Orders o ON o.EmployeeID = e.EmployeeID
-- LEFT JOIN: Includes all employees, even those without a department (DepartmentName will be NULL)
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;



--2. Inner Join with Filtering: Find all employees who have placed orders with a total price
-- (Quantity * Price) greater than 500, including their
-- department details. Display EmployeeID, FirstName, LastName, DepartmentName, and the total price.

-- SELECT: Specifies columns to retrieve
SELECT
    e.EmployeeID,                  -- Selects EmployeeID from Employees table
    e.FirstName,                   -- Selects FirstName from Employees table
    e.LastName,                    -- Selects LastName from Employees table
    d.DepartmentName,              -- Selects DepartmentName from Departments table
    (o.Quantity * o.Price) AS TotalPrice  -- Calculates total price (Quantity * Price) and names it TotalPrice
-- FROM: Specifies the primary table with alias 'e'
FROM Employees e
-- INNER JOIN: Only includes employees with matching orders
INNER JOIN Orders o ON o.EmployeeID = e.EmployeeID
-- INNER JOIN: Only includes employees with matching departments
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
-- WHERE: Filters rows where total price exceeds 500
WHERE (o.Quantity * o.Price) > 500;

-- 3. Subquery: Identify employees who have placed more than one order. 
-- Display EmployeeID, FirstName, LastName, DepartmentName, and
-- the number of orders.

-- SELECT: Specifies columns to retrieve
SELECT
    e.EmployeeID,                  -- Selects EmployeeID from Employees table
    e.FirstName,                   -- Selects FirstName from Employees table
    e.LastName,                    -- Selects LastName from Employees table
    d.DepartmentName,              -- Selects DepartmentName from Departments table
    (SELECT COUNT(*)              -- Subquery: Counts total orders for each employee
     FROM Orders o
     WHERE o.EmployeeID = e.EmployeeID) AS OrderCount  -- Correlates subquery with outer query
-- FROM: Specifies the primary table with alias 'e'
FROM Employees e
-- LEFT JOIN: Includes all employees, even those without a department
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
-- WHERE: Filters employees with more than one order using the same subquery
WHERE (SELECT COUNT(*) 
       FROM Orders o
       WHERE o.EmployeeID = e.EmployeeID) > 1;

-- 4. CASE Statement: Categorize orders based on their total price (Quantity * Price) as 
-- ’Low’ (< 100), ’Medium’ (100500), or ’High’ (> 500).
-- Display OrderID, Product, DepartmentName, and the price category.


-- SELECT: Specifies columns to retrieve
SELECT 
    o.OrderID,                     -- Selects OrderID from Orders table
    o.Product,                     -- Selects Product from Orders table
    d.DepartmentName,              -- Selects DepartmentName from Departments table
    (o.Quantity * o.Price) AS TotalPrice,  -- Calculates total price and names it TotalPrice
    CASE                           -- CASE: Assigns price category based on total price
        WHEN (o.Quantity * o.Price) < 100 THEN 'Low'  -- Total price < 100 is 'Low'
        WHEN (o.Quantity * o.Price) BETWEEN 100 AND 500 THEN 'Medium'  -- Total price 100-500 is 'Medium'
        ELSE 'High'                -- Total price > 500 is 'High'
    END AS PriceCategory           -- Names the derived column PriceCategory
-- FROM: Specifies the primary table with alias 'o'
FROM Orders o
-- INNER JOIN: Only includes orders with matching employees
INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
-- LEFT JOIN: Includes orders even if employee has no department
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;


--5. Data Cleaning - Handling NULLs: Replace NULL values in the Email column of the Employees table with 
--	’No Email Provided’ and
-- 	NULL DepartmentID with 6 (IT). Display EmployeeID, FirstName, LastName, Email, and DepartmentName.


-- SELECT: Specifies columns to retrieve
SELECT 
    e.EmployeeID,                  -- Selects EmployeeID from Employees table
    e.FirstName,                   -- Selects FirstName from Employees table
    e.LastName,                    -- Selects LastName from Employees table
    COALESCE(e.Email, 'No Email Provided') AS Email,  -- Replaces NULL Email with 'No Email Provided'
    d.DepartmentName               -- Selects DepartmentName from Departments table
-- FROM: Specifies the primary table with alias 'e'
FROM Employees e
-- LEFT JOIN: Joins Departments, using DepartmentID 6 for NULL DepartmentID
LEFT JOIN Departments d ON COALESCE(e.DepartmentID, 6) = d.DepartmentID;



--6. Aggregate with Join: Calculate the total revenue (sum of Quantity * Price) per department for delivered orders.
-- Display DepartmentName,
--3
--Location, and Total Revenue.


--7. Subquery with CASE: Identify employees hired before 2022-06-01 with at least one delivered order.
-- Use a CASE statement to label them
-- as ’Loyal’ if they have more than one delivered order, else ’Regular’.
-- Display EmployeeID, FirstName, LastName, DepartmentName, and Loyalty Status.

-- SELECT statement: Specifies the columns to retrieve from the database
SELECT 
    e.EmployeeID,                  -- Selects the EmployeeID column from the Employees table (aliased as 'e')
    e.FirstName,                   -- Selects the FirstName column from the Employees table
    e.LastName,                    -- Selects the LastName column from the Employees table
    d.DepartmentName,              -- Selects the DepartmentName column from the Departments table (aliased as 'd')
    -- CASE statement: Evaluates a condition to assign a value to a derived column (LoyaltyStatus)
    CASE 
        -- Subquery: Counts the number of 'Delivered' orders for the current employee
        WHEN (SELECT COUNT(*) 
              FROM Orders o 
              WHERE o.EmployeeID = e.EmployeeID 
              AND o.OrderStatus = 'Delivered') > 1 THEN 'Loyal'
        -- If the count of delivered orders is greater than 1, assign 'Loyal'
        ELSE 'Regular'             -- If the count is 0 or 1, assign 'Regular'
    END AS LoyaltyStatus           -- Names the derived column as LoyaltyStatus
-- FROM clause: Specifies the primary table (Employees) and assigns it an alias 'e'
FROM Employees e
-- LEFT JOIN: Joins the Departments table to Employees, including all employees even if they have no department
LEFT JOIN Departments d 
    ON e.DepartmentID = d.DepartmentID  -- Matches rows based on DepartmentID
-- WHERE clause: Filters the result set based on specified conditions
WHERE e.HireDate < '2022-06-01'  -- Only includes employees hired before June 1, 2022
    AND EXISTS (                  -- EXISTS: Checks if at least one row matches the subquery condition
        SELECT 1                 -- Returns a single value (1) to confirm existence; the value itself doesn't matter
        FROM Orders o            -- Subquery references the Orders table (aliased as 'o')
        WHERE o.EmployeeID = e.EmployeeID  -- Matches orders to the current employee
        AND o.OrderStatus = 'Delivered'   -- Only considers orders with 'Delivered' status
    );






--8. Complex Join with Data Cleaning: Retrieve all orders with employee and department details,
-- replacing NULL HireDate with ’2022-01-01’
-- and NULL Location with ’Unknown’. Include only orders with OrderStatus ’Delivered’ or ’Pending’. 
-- Display EmployeeID, FirstName,
-- LastName, HireDate, DepartmentName, Location, OrderID, and Product.

-- SELECT: Specifies columns to retrieve
SELECT
    e.EmployeeID,                  -- Selects EmployeeID from Employees table
    e.FirstName,                   -- Selects FirstName from Employees table
    e.LastName,                    -- Selects LastName from Employees table
    COALESCE(e.HireDate, '2022-01-01') AS HireDate,  -- Replaces NULL HireDate with '2022-01-01'
    d.DepartmentName,              -- Selects DepartmentName from Departments table
    COALESCE(d.Location, 'Unknown') AS Location,  -- Replaces NULL Location with 'Unknown'
    o.OrderID,                     -- Selects OrderID from Orders table
    o.Product                      -- Selects Product from Orders table
-- FROM: Specifies the primary table with alias 'o'
FROM Orders o
-- INNER JOIN: Only includes orders with matching employees
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID
-- LEFT JOIN: Includes orders even if employee has no department
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
-- WHERE: Filters for orders with 'Delivered' or 'Pending' status
WHERE o.OrderStatus IN ('Delivered', 'Pending');




--9. Nested Subquery: Find the employee who placed the most recent order, including their department details. Display EmployeeID, FirstName,
--LastName, DepartmentName, and OrderDate.


--10. Combining Joins and CASE: Display all orders with employee and department details. Use a CASE statement to flag orders as ’Expensive’
--if the total price (Quantity * Price) exceeds 300, else ’Affordable’. Display EmployeeID, FirstName, DepartmentName, OrderID, Product,
--and Price Flag.

--11. Group By with Subquery: Find departments with a total order value (Quantity * Price) 
--exceeding 1000 for delivered orders. Display
--DepartmentName and the total order value.

-- SELECT: Specifies columns to retrieve
SELECT 
    d.DepartmentName,              -- Selects DepartmentName from Departments table
    SUM(o.Quantity * o.Price) AS TotalOrderValue  -- Calculates sum of total price for delivered orders
-- FROM: Specifies the primary table with alias 'd'
FROM Departments d
-- INNER JOIN: Only includes departments with matching employees
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
-- INNER JOIN: Only includes employees with matching delivered orders
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
-- WHERE: Filters for 'Delivered' orders
WHERE o.OrderStatus = 'Delivered'
-- GROUP BY: Groups results by DepartmentName
GROUP BY d.DepartmentName
-- HAVING: Filters groups with total order value > 1000
HAVING SUM(o.Quantity * o.Price) > 1000;


--12. Multiple Joins with Filtering: Retrieve orders placed in 2023, 
--including employee and department details. Display OrderID, Product,
--OrderDate, EmployeeID, FirstName, LastName, and DepartmentName.





--13. Data Cleaning with CASE: Create a query to clean the OrderStatus column by standardizing values:
-- change ’Delivered’ to ’Completed’,
--’Pending’ to ’In Progress’, and others to ’Other’. Display OrderID, EmployeeID, Product, 
-- and the cleaned OrderStatus.



-- 14. Subquery with Aggregation: Identify employees whose total order value (sum of Quantity * Price) 
-- exceeds the average total order value
-- across all employees. Display EmployeeID, FirstName, LastName, and their total order value.



-- SELECT: Specifies columns to retrieve
SELECT 
    e.EmployeeID,                  -- Selects EmployeeID from Employees table
    e.FirstName,                   -- Selects FirstName from Employees table
    e.LastName,                    -- Selects LastName from Employees table
    SUM(o.Quantity * o.Price) AS TotalOrderValue  -- Calculates sum of total price per employee
-- FROM: Specifies the primary table with alias 'e'
FROM Employees e
-- INNER JOIN: Only includes employees with orders
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
-- GROUP BY: Groups results by employee details for aggregation
GROUP BY e.EmployeeID, e.FirstName, e.LastName
-- HAVING: Filters employees whose total order value exceeds the average
HAVING SUM(o.Quantity * o.Price) > (
    SELECT AVG(TotalValue)        -- Subquery: Calculates average total order value across employees
    FROM (
        SELECT SUM(Quantity * Price) AS TotalValue  -- Calculates total order value per employee
        FROM Orders
        GROUP BY EmployeeID
    ) AS AvgValues
);


--15. Complex CASE with Joins: Assign a performance tier to employees based on the number of orders: ’Top’ (> 3 orders), ’Mid’ (23 orders),
--’Low’ (1 order), or ’None’ (0 orders). Display EmployeeID, FirstName, LastName, DepartmentName, and Performance Tier.
--Instructions
--• Use the provided table creation and data insertion scripts to set up your database.
--4
--• Write SQL queries to solve each task.
--• Ensure your queries handle edge cases like NULL values and missing data appropriately.
--• Test your queries to confirm they produce the expected resul
--
--
--
--
