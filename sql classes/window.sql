-- 1. Creating the employeez table
-- Purpose: Define a table structure to store employee data with unique IDs, names, departments, and salaries.
-- Concept: Tables organize data in rows and columns. Data types (SERIAL, VARCHAR, DECIMAL) define what kind of data each column holds. Constraints like PRIMARY KEY and NOT NULL enforce data integrity.
CREATE TABLE employeez (
    -- 'id' column: Auto-incrementing integer (1, 2, 3...) for unique row identification
    -- SERIAL: Automatically generates unique IDs, great for beginners
    -- PRIMARY KEY: Ensures 'id' is unique and not null, speeds up lookups
    id SERIAL PRIMARY KEY,
    -- 'name' column: Stores text up to 100 characters (e.g., "John Smith")
    -- VARCHAR(100): Variable-length string with max 100 chars
    -- NOT NULL: Requires a value, can't be empty
    name VARCHAR(100) NOT NULL,
    -- 'department' column: Stores department names up to 50 characters
    -- NOT NULL ensures every employee has a department
    department VARCHAR(50) NOT NULL,
    -- 'salary' column: Stores numbers with decimals (e.g., 75000.00)
    -- DECIMAL(10, 2): Up to 10 digits total, 2 after decimal (e.g., 1234567.89)
    -- NOT NULL ensures salary is always provided
    salary DECIMAL(10, 2) NOT NULL
);

-- 2. Inserting sample data into employeez
-- Purpose: Populate the table with 50 employee records to simulate a real dataset for querying.
-- Concept: INSERT adds new rows. Batch inserts (multiple rows in one statement) are efficient.
-- Parameters: Column names (name, department, salary) and VALUES with data tuples.
INSERT INTO employeez (name, department, salary) VALUES
    -- Each row is a tuple: text in quotes, numbers without
    -- Adds employee: John Smith, Engineering, $75,000
    ('John Smith', 'Engineering', 75000.00),
    ('Emma Johnson', 'Marketing', 62000.00),
    ('Michael Brown', 'Finance', 68000.00),
    ('Sarah Davis', 'HR', 55000.00),
    ('David Wilson', 'Engineering', 82000.00),
    ('Lisa Anderson', 'Sales', 59000.00),
    ('James Taylor', 'IT', 71000.00),
    ('Emily Martinez', 'Marketing', 63000.00),
    ('Robert Thomas', 'Engineering', 78000.00),
    ('Jennifer Lee', 'Finance', 69000.00),
    ('William Clark', 'HR', 56000.00),
    ('Ashley Rodriguez', 'Sales', 61000.00),
    ('Christopher Lewis', 'IT', 72000.00),
    ('Amanda Walker', 'Engineering', 80000.00),
    ('Daniel Hall', 'Marketing', 64000.00),
    ('Elizabeth Allen', 'Finance', 67000.00),
    ('Matthew Young', 'HR', 57000.00),
    ('Megan King', 'Sales', 60000.00),
    ('Andrew Scott', 'IT', 73000.00),
    ('Stephanie Green', 'Engineering', 79000.00),
    ('Joseph Adams', 'Marketing', 65000.00),
    ('Laura Baker', 'Finance', 66000.00),
    ('Thomas Gonzalez', 'HR', 58000.00),
    ('Rebecca Nelson', 'Sales', 62000.00),
    ('Mark Carter', 'IT', 74000.00),
    ('Nicole Mitchell', 'Engineering', 81000.00),
    ('Steven Perez', 'Marketing', 61000.00),
    ('Kimberly Roberts', 'Finance', 70000.00),
    ('Paul Turner', 'HR', 59000.00),
    ('Michelle Phillips', 'Sales', 63000.00),
    ('Edward Campbell', 'IT', 75000.00),
    ('Angela Parker', 'Engineering', 77000.00),
    ('Brian Evans', 'Marketing', 66000.00),
    ('Samantha Collins', 'Finance', 68000.00),
    ('Kevin Edwards', 'HR', 57000.00),
    ('Rachel Stewart', 'Sales', 64000.00),
    ('Patrick Sanchez', 'IT', 72000.00),
    ('Heather Morris', 'Engineering', 79000.00),
    ('Ryan Rogers', 'Marketing', 65000.00),
    ('Christine Reed', 'Finance', 67000.00),
    ('Timothy Cook', 'HR', 56000.00),
    ('Melissa Morgan', 'Sales', 61000.00),
    ('Brandon Bell', 'IT', 74000.00),
    ('Tiffany Bailey', 'Engineering', 80000.00),
    ('Justin Rivera', 'Marketing', 63000.00),
    ('Katherine Cox', 'Finance', 69000.00),
    ('Jonathan Howard', 'HR', 58000.00),
    ('Victoria Ward', 'Sales', 62000.00),
    ('Benjamin Brooks', 'IT', 73000.00),
    ('Danielle Price', 'Engineering', 78000.00);

-- 3. Select all data
-- Purpose: Display all rows and columns to verify the data was inserted correctly.
-- Concept: SELECT retrieves data; '*' is a wildcard for all columns (handy but less performant than naming columns).
-- Parameters: None beyond table name.
select * from employeez;

-- 4. Aggregate query to find max salary per department
-- Purpose: Summarize the highest salary in each department, showing one row per department.
-- Concept: GROUP BY collapses rows into groups; MAX is an aggregate function that finds the highest value.
-- Parameters: MAX(salary) takes the salary column; GROUP BY uses department.
select department, max(salary) from employeez group by department;

-- 5. Window function to show max salary per department for each row
-- Purpose: Add a column showing the highest salary in each employee's department, keeping all rows.
-- Concept: Window functions compute over a "window" of rows (here, grouped by department) without collapsing rows.
-- Parameters: OVER(PARTITION BY department) defines the window; 'e' is a table alias for clarity.
select e.*,
       -- MAX(salary) calculates highest salary within each department
       -- OVER(PARTITION BY department): Groups rows by department for the calculation
       -- as maxSalary: Names the new column
       max(salary) over (partition by department) as maxSalary
from employeez e;

-- 6. Window function to number rows within each department
-- Purpose: Assign a unique number (1, 2, 3...) to each employee within their department.
-- Concept: ROW_NUMBER() is a window function that assigns sequential numbers per partition.
-- Parameters: PARTITION BY department groups rows; no ORDER BY means default row order (often insertion).
select row_number() over(partition by department) as row_number, e.*
from employeez e;

-- 7. Subquery to get first 2 employees per department (by ID)
-- Purpose: Fetch the first two employees who joined each department, assuming lower ID means earlier join.
-- Concept: Subquery (inner query) adds row numbers; outer query filters for rows 1 and 2. ROW_NUMBER with ORDER BY sorts within the window.
-- Parameters: PARTITION BY department, ORDER BY id for earliest joiners.
select * from (
    -- Inner subquery: Assign row numbers within each department, ordered by id
    select e.*,
           row_number() over (partition by department order by id) as row_number
    from employeez e
) as main -- Alias the subquery as 'main'
where main.row_number < 3; -- Keep only rows numbered 1 or 2

-- 8. Subquery to get top 3 highest-paid employees per department
-- Purpose: Identify the top 3 employees by salary in each department, handling ties with rank.
-- Concept: RANK() assigns positions with ties sharing the same rank (e.g., 1,1,3); subquery filters top ranks.
-- Parameters: PARTITION BY department, ORDER BY salary DESC for highest first.
select * from (
    select e.*,
           -- RANK(): Assigns rank within department, ties get same rank, next rank skips
           rank() over (partition by department order by salary desc) as rnk
    from employeez e
) employeez -- Alias subquery (same name as table, but distinct)
where rnk < 4; -- Keep ranks 1, 2, 3

-- 9. Comparing RANK and DENSE_RANK
-- Purpose: Show how different ranking methods handle ties within departments by salary.
-- Concept: RANK() skips numbers after ties (e.g., 1,1,3); DENSE_RANK() doesn't (e.g., 1,1,2).
-- Parameters: Both use PARTITION BY department, ORDER BY salary DESC.
select e.*,
       rank() over (partition by department order by salary desc) as rnk,
       -- DENSE_RANK(): Like RANK but consecutive numbers after ties
       dense_rank() over (partition by department order by salary desc) as dns_rnk
from employeez e;

-- 10. LAG to access previous employee's salary
-- Purpose: Show the salary of the previous employee in the same department (by ID order).
-- Concept: LAG() accesses prior rows in a window; useful for comparisons like trends.
-- Parameters: LAG(salary) defaults to offset=1, no default value (NULL for first row).
select e.*,
       lag(salary) over (partition by department order by id) as prev_emp_salary
from employeez e;

-- 11. LAG with custom offset and default value
-- Purpose: Get the salary from two employees prior in the department, defaulting to 0 if none exist.
-- Concept: LAG can take offset and default value for flexibility.
-- Parameters: LAG(salary, 2, 0) means 2 rows back, return 0 if no such row.
select e.*,
       lag(salary, 2, 0) over (partition by department order by id) as prev_emp_salary
from employeez e;

-- 12. LAG and LEAD for previous and next salaries
-- Purpose: Compare each employee's salary to both the previous and next employee in their department.
-- Concept: LEAD() is like LAG but accesses the next row in the window.
-- Parameters: Both use default offset=1, PARTITION BY department, ORDER BY id.
select e.*,
       lag(salary) over (partition by department order by id) as prev_emp_salary,
       lead(salary) over (partition by department order by id) as next_emp_salary
from employeez e;

-- 13. Compare salary to previous employee with CASE
-- Purpose: Classify each employee's salary as higher, lower, or equal to the previous employee's in their department.
-- Concept: CASE statement for conditional logic; LAG for accessing prior salary.
-- Parameters: LAG(salary, 1, 0) for 1 row back, default 0; CASE evaluates conditions.
select e.*,
       -- Get previous salary, default to 0 for first employee
       lag(salary, 1, 0) over (partition by department order by id) as prev_emp_salary,
       -- CASE: Compare current salary to previous, output text result
       case 
           when salary > lag(salary, 1, 0) over (partition by department order by id) then 'Higher'
           when salary < lag(salary, 1, 0) over (partition by department order by id) then 'Lower'
           when salary = lag(salary, 1, 0) over (partition by department order by id) then 'Same'
       end as salary_compare_to_prev_emp
from employeez e;