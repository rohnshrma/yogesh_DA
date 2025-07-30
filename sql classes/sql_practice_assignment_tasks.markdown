# SQL Practice Assignment: Primary Keys, Foreign Keys, and Inner Joins

This assignment provides tasks to practice SQL concepts including table creation with primary and foreign keys, data insertion, updates, deletes, and querying with INNER JOINs. You must create and populate tables with at least 50 dummy data rows across them. Use a PostgreSQL database to complete the tasks.

---

## Part 1: Create Tables

1. Create a `customers` table to store customer information:
   - `customer_id`: Auto-incrementing integer, primary key.
   - `first_name`: Variable-length string (max 50 characters), not null.
   - `last_name`: Variable-length string (max 50 characters), not null.
   - `email`: Variable-length string (max 100 characters), unique, can be null.

2. Create a `purchases` table to store purchase information:
   - `purchase_id`: Auto-incrementing integer, primary key.
   - `customer_id`: Integer, foreign key referencing `customer_id` in the `customers` table with `ON DELETE CASCADE`.
   - `purchase_date`: Date, can be null.

---

## Part 2: Insert Sample Data

1. Insert at least 30 rows into the `customers` table:
   - Ensure at least 5 rows have a NULL email.
   - Use diverse first names, last names, and email addresses (where applicable).

2. Insert at least 50 rows into the `purchases` table:
   - Ensure `customer_id` values reference existing `customer_id` values from the `customers` table.
   - Distribute purchases across multiple customers, with some customers having multiple purchases and others having none.
   - Use a variety of purchase dates, including some NULL values.

---

## Part 3: Modify Table Structure

1. Add a `category` column to the `purchases` table:
   - Type: Variable-length string (max 30 characters), can be null.

2. Update the `category` column for all purchases where `customer_id` corresponds to customers with a specific `first_name` (e.g., 'John'):
   - Set `category` to a value like 'Electronics'.

3. Add a `birth_year` column to the `customers` table:
   - Type: Integer.

4. Change the `birth_year` column type to VARCHAR(4).

5. Update the `birth_year` column for customers with a specific `first_name` (e.g., 'John'):
   - Set `birth_year` to a value like '1990'.

6. Drop the `birth_year` column from the `customers` table.

---

## Part 4: Query the Data

1. Verify all data in both tables:
   - Select all columns from the `customers` table.
   - Select all columns from the `purchases` table.

2. Perform an INNER JOIN to combine the `customers` and `purchases` tables:
   - Select `purchase_id`, `first_name`, `last_name`, and `purchase_date`.
   - Use table aliases (e.g., `c` for `customers`, `p` for `purchases`) for brevity.
   - Only include rows where there is a match between the tables.

3. Query rows from `customers` where `first_name` is a specific value (e.g., 'John'):
   - Select all columns.

4. Query rows from `customers` where `customer_id` is less than 5:
   - Select all columns.

5. Query rows from `customers` where `customer_id` is less than or equal to 10:
   - Select all columns.

6. Query rows from `customers` where `customer_id` is greater than 5:
   - Select all columns.

7. Query rows from `customers` where `customer_id` is greater than or equal to 3:
   - Select all columns.

8. Query rows from `customers` where `customer_id` is not equal to 2:
   - Select all columns.

9. Query rows from `customers` where `customer_id` is between 3 and 7 (inclusive):
   - Select all columns.

10. Query rows from `customers` where `email` is NULL:
    - Select all columns.

11. Query rows from `customers` where `first_name` is in a list of three specific names (e.g., 'John', 'Jane', 'Alice'):
    - Select all columns.

12. Query rows from `customers` where both `first_name` is a specific value (e.g., 'John') AND `email` matches a specific pattern (e.g., 'john.doe@email.com'):
    - Select all columns.

13. Query rows from `customers` where either `first_name` is a specific value (e.g., 'John') OR `email` matches a specific pattern (e.g., 'jane.smith@email.com'):
    - Select all columns.

---

## Part 5: Modify and Delete Data

1. Delete all rows from `customers` where `first_name` is a specific value (e.g., 'John'):
   - Ensure the `ON DELETE CASCADE` constraint removes related rows from the `purchases` table.

2. Insert a new row into the `customers` table:
   - Provide values for `first_name`, `last_name`, `email`, and ensure `customer_id` is auto-generated.

3. Insert a new row into the `purchases` table:
   - Reference an existing `customer_id` and provide a `purchase_date`.

---

## Part 6: Drop Tables

1. Drop the `purchases` table.
2. Drop the `customers` table.

---

**Notes:**
- Ensure all `customer_id` values in the `purchases` table reference valid `customer_id` values in the `customers` table to maintain referential integrity.
- Use realistic dummy data for names, emails, and dates to simulate a real-world scenario.
- Test your queries to ensure they return the expected results based on the inserted data.
- Save your SQL commands in a `.sql` file for submission or testing.