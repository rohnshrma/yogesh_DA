# SQL Practical Assignment: Database Management with Employees Table

This assignment tests your ability to apply SQL concepts related to table creation, data manipulation, and querying. You will work with an `employees` table, performing tasks that involve creating, modifying, and querying data. Each task must be completed using valid SQL commands based on the concepts from the provided code. Use a PostgreSQL database for this assignment.

---

## Assignment Instructions
- Create and execute SQL commands for each task.
- Assume the `employees` table does not exist initially unless specified.
- Use the same column structure as in the provided code: `employee_id` (SERIAL PRIMARY KEY), `first_name` (TEXT, NOT NULL, max 50 chars), `last_name` (TEXT, NOT NULL, max 50 chars), `email` (TEXT, UNIQUE, max 100 chars), `hire_date` (DATE), and any additional columns as needed.
- Write each command in a clear, organized manner.
- Test your commands in a PostgreSQL environment to ensure they work as expected.
- Save your commands in a `.sql` file for submission.

---

## Tasks

1. **Create the Employees Table**  
   Create a table named `employees` with the following columns:  
   - `employee_id`: Auto-incrementing integer, primary key.  
   - `first_name`: Text, cannot be null, max length 50 characters (after trimming).  
   - `last_name`: Text, cannot be null, max length 50 characters (after trimming).  
   - `email`: Text, must be unique, max length 100 characters (after trimming).  
   - `hire_date`: Date, optional.

2. **Insert Sample Data**  
   Insert 4 rows into the `employees` table with the following data:  
   - Employee 1: first_name = 'Alice', last_name = 'Brown', email = 'alice.brown@email.com', hire_date = '2023-03-10'.  
   - Employee 2: first_name = 'Bob', last_name = 'Wilson', email = NULL, hire_date = '2022-09-15'.  
   - Employee 3: first_name = 'Carol', last_name = 'Taylor', email = 'carol.taylor@email.com', hire_date = '2024-01-20'.  
   - Employee 4: first_name = 'David', last_name = 'Lee', email = 'david.lee@email.com', hire_date = '2025-06-01'.

3. **Add a New Column**  
   Add a column named `role` to the `employees` table. The column should be text with a maximum length of 30 characters (after trimming).

4. **Update Role for Specific Employees**  
   Update the `role` column to 'Developer' for employees whose `first_name` is 'Alice'.

5. **Add a Salary Column**  
   Add a column named `salary` to the `employees` table. The column should store integer values.

6. **Change Salary Column Type**  
   Change the `salary` column type to a decimal with 10 digits and 2 decimal places (e.g., 123456.78).

7. **Update Salary for Specific Employees**  
   Update the `salary` column to 50000.00 for employees whose `first_name` is 'Carol'.

8. **Remove Salary Column**  
   Remove the `salary` column from the `employees` table.

9. **Query All Data**  
   Write a query to retrieve all columns and rows from the `employees` table.

10. **Delete Specific Rows**  
    Delete all rows from the `employees` table where `first_name` is 'Bob'.

11. **Insert a New Employee**  
    Insert a new row into the `employees` table with:  
    - first_name = 'Eve', last_name = 'Davis', email = 'eve.davis@email.com', hire_date = '2025-07-22'.

12. **Query by First Name**  
    Write a query to select all columns for employees where `first_name` is 'Eve'.

13. **Query by Employee ID Range**  
    Write a query to select all columns for employees where `employee_id` is between 2 and 4 (inclusive).

14. **Query by Null Email**  
    Write a query to select all columns for employees where `email` is NULL.

15. **Query with IN Clause**  
    Write a query to select all columns for employees where `first_name` is either 'Alice', 'Carol', or 'Eve'.

16. **Query with NOT IN Clause**  
    Write a query to select all columns for employees where `first_name` is not 'Alice' or 'David'.

17. **Query with LIKE (Starts With)**  
    Write a query to select all columns for employees where `first_name` starts with the letter 'C'.

18. **Query with NOT LIKE (Contains)**  
    Write a query to select all columns for employees where `first_name` does not contain the letter 'a'.

19. **Query with AND Condition**  
    Write a query to select all columns for employees where `first_name` is 'Eve' and `email` is 'eve.davis@email.com'.

20. **Query with OR Condition**  
    Write a query to select all columns for employees where `first_name` is 'Carol' or `role` is 'Developer'.

21. **Query Unique Roles**  
    Write a query to select unique values from the `role` column.

22. **Query Sorted by Last Name**  
    Write a query to select all columns from the `employees` table, sorted by `last_name` in descending order (Z to A).

23. **Update Role for All Employees**  
    Update the `role` column to 'Manager' for all employees in the table.

24. **Query Email Ending with Pattern**  
    Write a query to select all columns for employees where `email` ends with 'email.com'.

25. **Drop the Employees Table**  
    Write a command to delete the entire `employees` table from the database.

---

## Submission Guidelines
- Write all SQL commands in a single `.sql` file, with each task clearly labeled (e.g., `-- Task 1`, `-- Task 2`).
- Ensure commands are syntactically correct and follow the structure of the provided code.
- Test your commands in a PostgreSQL database to verify they work as expected.
- Submit the `.sql` file with your commands.

---

## Notes
- Tasks are designed to reflect the SQL operations in the provided code, including table creation, data manipulation, and querying.
- Pay attention to constraints (e.g., `NOT NULL`, `UNIQUE`, `CHECK`) when creating or modifying the table.
- For queries, assume the table contains the data from the `INSERT` tasks unless modified by `UPDATE` or `DELETE`.
- Be cautious with `UPDATE` and `DELETE` commands without `WHERE` clauses, as they affect all rows.