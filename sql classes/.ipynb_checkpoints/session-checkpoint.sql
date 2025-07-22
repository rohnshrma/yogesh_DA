-- 1. Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL CHECK (LENGTH(TRIM(first_name)) <= 50),
    last_name TEXT NOT NULL CHECK (LENGTH(TRIM(last_name)) <= 50),
    email TEXT UNIQUE CHECK (LENGTH(TRIM(email)) <= 100),
    hire_date DATE
);

-- 2. Insert sample data (4 rows, one with NULL email)
INSERT INTO employees (first_name, last_name, email, hire_date) VALUES
    ('John', 'Doe', 'john.doe@email.com', '2023-01-15'),
    ('Jane', 'Smith', NULL, '2022-06-20'),
    ('Sony', 'Shane', 'sony.shane@email.com', '2025-04-11'),
    ('Jasie', 'Joe', 'jasie.joe@email.com', '2022-01-13');

-- 3. Add department column
ALTER TABLE employees
ADD department TEXT CHECK (LENGTH(TRIM(department)) <= 30);

-- 4. Update department for employees named John
UPDATE employees
SET department = 'Engineering'
WHERE first_name = 'John';

-- 5. Add year_of_birth column as integer
ALTER TABLE employees
ADD COLUMN year_of_birth INT;

-- 6. Change year_of_birth type to varchar(4)
ALTER TABLE employees
ALTER COLUMN year_of_birth TYPE VARCHAR(4);

-- 7. Update year_of_birth for employees named John
UPDATE employees
SET year_of_birth = '1999'
WHERE first_name = 'John';

-- 8. Drop year_of_birth column
ALTER TABLE employees
DROP COLUMN year_of_birth;

-- 9. Verify all data
SELECT * FROM employees;

-- 10. Delete rows where first_name is John
DELETE FROM employees
WHERE first_name = 'John';

-- 11. Insert a new row
INSERT INTO employees (first_name, last_name, email, hire_date) VALUES
    ('Tushar', 'Singh', 'tushar.singh@email.com', '2025-05-11');

-- 12. Drop the employees table
DROP TABLE employees;




-- Query 1: Select rows where first_name is 'Tushar'
-- Retrieves all columns for rows where the first_name is exactly 'Tushar'
SELECT * FROM employees
WHERE first_name = 'Tushar';
-- Result: Shows Tushar Singh’s row (employee_id likely 5, based on SERIAL).

-- Query 2: Select rows where employee_id is less than 3
-- Retrieves all columns for rows where employee_id is less than 3
SELECT * FROM employees
WHERE employee_id < 3;
-- Result: Shows rows for Jane (employee_id 2) and Jasie (employee_id 4), assuming John (employee_id 1) was deleted.

-- Query 3: Select rows where employee_id is less than or equal to 3
-- Retrieves all columns for rows where employee_id is 3 or less
SELECT * FROM employees
WHERE employee_id <= 3;
-- Result: Similar to above, includes Jane (employee_id 2) and possibly others if employee_id 3 exists.

-- Query 4: Select rows where employee_id is greater than 3
-- Retrieves all columns for rows where employee_id is more than 3
SELECT * FROM employees
WHERE employee_id > 3;
-- Result: Shows rows for Sony (employee_id 3) and Tushar (employee_id 5), depending on exact IDs.

-- Query 5: Select rows where employee_id is greater than or equal to 3
-- Retrieves all columns for rows where employee_id is 3 or more
SELECT * FROM employees
WHERE employee_id >= 3;
-- Result: Includes Sony (employee_id 3), Jasie (employee_id 4), and Tushar (employee_id 5).

-- Query 6: Select rows where employee_id is not equal to 3
-- Retrieves all columns for rows where employee_id is not 3
SELECT * FROM employees
WHERE employee_id != 3;
-- Result: Shows Jane (employee_id 2), Jasie (employee_id 4), and Tushar (employee_id 5).

-- Query 7: Alternative syntax for not equal (same as !=)
-- Retrieves all columns for rows where employee_id is not 3
-- WHERE employee_id <> 3;
-- Result: Same as above (this line is commented out but would work the same way).

-- Query 8: Select rows where employee_id is between 2 and 5 (inclusive)
-- Retrieves all columns for rows where employee_id is from 2 to 5
SELECT * FROM employees
WHERE employee_id BETWEEN 2 AND 5;
-- Result: Shows Jane (employee_id 2), Sony (employee_id 3), Jasie (employee_id 4), and Tushar (employee_id 5).

-- Query 9: Select rows where email is NULL
-- Retrieves all columns for rows where the email column is empty (NULL)
SELECT * FROM employees
WHERE email IS NULL;
-- Result: Shows Jane’s row (since her email is NULL).

-- Query 10: Select rows where first_name is in a list
-- Retrieves all columns for rows where first_name is 'Tushar', 'Jane', or 'Rohan'
SELECT * FROM employees
WHERE first_name IN ('Tushar', 'Jane', 'Rohan');
-- Result: Shows Tushar and Jane’s rows (Rohan does not exist in the table).

-- Query 11: Select rows where both conditions are true
-- Retrieves all columns where first_name is 'Tushar' AND email is 'tushar.singh@email.com'
SELECT * FROM employees
WHERE first_name = 'Tushar' AND email = 'tushar.singh@email.com';
-- Result: Shows Tushar’s row (since both conditions match).

-- Query 12: Select rows where at least one condition is true
-- Retrieves all columns where first_name is 'Tushar' OR email is 'tusharsingh@email.com'
SELECT * FROM employees
WHERE first_name = 'Tushar' OR email = 'tusharsingh@email.com';
-- Result: Shows Tushar’s row (matches first_name; no rows have 'tusharsingh@email.com').




-- Query 1: Select all columns from employees table, excluding specific names
SELECT * FROM employees
WHERE first_name NOT IN ('Tushar', 'Jane', 'Rohan');
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- FROM employees: Specifies the table to query (employees).
-- WHERE first_name NOT IN ('Tushar', 'Jane', 'Rohan'): Filters rows to exclude records where first_name is Tushar, Jane, or Rohan.
-- Concept: The NOT IN clause checks if a value is not in a specified list.

-- Query 2: Select all columns where first_name starts with 'J'
SELECT * FROM employees
WHERE first_name LIKE 'J%';
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- WHERE first_name LIKE 'J%': Filters rows where first_name starts with 'J'. The '%' is a wildcard meaning "any characters after J".
-- Concept: The LIKE operator is used for pattern matching, with '%' representing zero or more characters.

-- Query 3: Select all columns where first_name ends with 'e'
SELECT * FROM employees
WHERE first_name LIKE '%e';
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- WHERE first_name LIKE '%e': Filters rows where first_name ends with 'e'. The '%' before 'e' means any characters before 'e'.
-- Concept: LIKE with '%e' matches strings ending with a specific character.

-- Query 4: Select all columns where first_name does not start with 'J'
SELECT * FROM employees
WHERE first_name NOT LIKE 'J%';
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- WHERE first_name NOT LIKE 'J%': Filters rows where first_name does not start with 'J'.
-- Concept: NOT LIKE negates the pattern matching of LIKE.

-- Query 5: Select all columns where email ends with 'email.com'
SELECT * FROM employees
WHERE email LIKE '%email.com';
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- WHERE email LIKE '%email.com': Filters rows where the email column ends with 'email.com'.
-- Concept: LIKE is used to match patterns in text fields, useful for filtering email domains.

-- Query 6: Select all columns where email does not end with 'email.com'
SELECT * FROM employees
WHERE email NOT LIKE '%email.com';
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- WHERE email NOT LIKE '%email.com': Filters rows where the email does not end with 'email.com'.
-- Concept: NOT LIKE excludes rows matching the specified pattern.

-- Query 7: Select all columns from employees table
SELECT * FROM employees;
-- Explanation:
-- SELECT *: Retrieves all columns and all rows from the employees table.
-- FROM employees: Specifies the table to query.
-- Concept: A basic SELECT query without conditions retrieves all data from the specified table.

-- Query 8: Select all columns where first_name contains 'a'
SELECT * FROM employees
WHERE first_name LIKE '%a%';
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- WHERE first_name LIKE '%a%': Filters rows where first_name contains the letter 'a' anywhere in the name. '%' on both sides means any characters before and after 'a'.
-- Concept: LIKE with '%a%' matches any string containing the specified character(s).

-- Query 9: Select all columns where first_name does not contain 'a'
SELECT * FROM employees
WHERE first_name NOT LIKE '%a%';
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- WHERE first_name NOT LIKE '%a%': Filters rows where first_name does not contain the letter 'a'.
-- Concept: NOT LIKE with '%a%' excludes strings containing the specified character(s).

-- Query 10: Select only first_name and email columns
SELECT first_name, email FROM employees;
-- Explanation:
-- SELECT first_name, email: Retrieves only the first_name and email columns (not all columns).
-- FROM employees: Specifies the table to query.
-- Concept: You can specify columns to retrieve instead of using '*' to get all columns.

-- Query 11: Add a new column 'city' to the employees table
ALTER TABLE employees
ADD COLUMN city VARCHAR(50);
-- Explanation:
-- ALTER TABLE employees: Modifies the structure of the employees table.
-- ADD COLUMN city VARCHAR(50): Adds a new column named 'city' that can store text up to 50 characters.
-- Concept: ALTER TABLE is used to modify table structure, and VARCHAR is a data type for variable-length strings.

-- Query 12: Update the city for an employee named 'sony'
UPDATE employees
SET city = 'Gurgaon'
WHERE first_name = 'sony';
-- Explanation:
-- UPDATE employees: Specifies the table to modify.
-- SET city = 'Gurgaon': Changes the value of the city column to 'Gurgaon'.
-- WHERE first_name = 'sony': Applies the change only to rows where first_name is 'sony'.
-- Concept: UPDATE modifies existing rows, and WHERE ensures only specific rows are updated.

-- Query 13: Update the city for an employee named 'Jane'
UPDATE employees
SET city = 'Nagpur'
WHERE first_name = 'Jane';
-- Explanation:
-- UPDATE employees: Specifies the table to modify.
-- SET city = 'Nagpur': Sets the city column to 'Nagpur'.
-- WHERE first_name = 'Jane': Updates only the row where first_name is 'Jane'.
-- Concept: Similar to the previous UPDATE, but targets a different employee.

-- Query 14: Update the city for an employee named 'Jasie'
UPDATE employees
SET city = 'Sirsa'
WHERE first_name = 'Jasie';
-- Explanation:
-- UPDATE employees: Specifies the table to modify.
-- SET city = 'Sirsa': Sets the city column to 'Sirsa'.
-- WHERE first_name = 'Jasie': Updates only the row where first_name is 'Jasie'.
-- Concept: Another targeted UPDATE for a specific employee.

-- Query 15: Update the city for all employees
UPDATE employees
SET city = 'Pune';
-- Explanation:
-- UPDATE employees: Specifies the table to modify.
-- SET city = 'Pune': Sets the city column to 'Pune' for all rows.
-- No WHERE clause: Without WHERE, the update applies to every row in the table.
-- Concept: An UPDATE without WHERE affects all rows, so use with caution.

-- Query 16: Select unique city values
SELECT DISTINCT city FROM employees;
-- Explanation:
-- SELECT DISTINCT city: Retrieves unique (non-duplicate) values from the city column.
-- FROM employees: Specifies the table to query.
-- Concept: DISTINCT removes duplicate values from the result set.

-- Query 17: Select all columns, sorted by first_name in descending order
SELECT * FROM employees
ORDER BY first_name DESC;
-- Explanation:
-- SELECT *: Retrieves all columns from the employees table.
-- ORDER BY first_name DESC: Sorts the results by first_name in descending order (Z to A).
-- Concept: ORDER BY sorts query results, and DESC specifies descending order (ASC for ascending is default).