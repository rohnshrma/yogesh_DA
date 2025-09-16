-- Practical Assignment: SQL Window Functions and Aggregates (Tasks Only)
-- Purpose: Practice RANK(), ROW_NUMBER(), OVER, LAG, LEAD, MIN, MAX, and AVG with a sales_records table.
-- Instructions: Complete the tasks below by writing appropriate SQL queries.

-- Task 1: Create the sales_records Table
-- Create a table named sales_records to store sales data with the following columns:
-- - transaction_id: Auto-incrementing unique ID (use SERIAL, PRIMARY KEY)
-- - salesperson: Name of the salesperson, up to 100 characters (VARCHAR, NOT NULL)
-- - store_location: Store location, up to 50 characters (VARCHAR, NOT NULL)
-- - sale_amount: Sale amount, up to 10 digits with 2 decimal places (DECIMAL, NOT NULL)
-- - sale_date: Date of the sale (DATE, NOT NULL)

-- Task 2: Insert Dummy Data (50 Rows)
-- Insert 50 rows of dummy data into the sales_records table.
-- - Use varied salesperson names (e.g., Alice Thompson, Bob Carter).
-- - Use store locations like New York, Los Angeles, Chicago, Houston.
-- - Include sale amounts between $50.00 and $500.00.
-- - Use sale dates in January and February 2025.
-- - Ensure data is diverse for meaningful query results.

-- Task 3: Select All Data
-- Write a query to retrieve all rows and columns from the sales_records table to verify the inserted data.

-- Task 4: Aggregate Query: Max, Min, and Average Sale Amount per Store Location
-- Write a query to find the highest, lowest, and average sale amounts for each store location.
-- - Group by store_location.
-- - Round the average to 2 decimal places.
-- - Name the output columns max_sale, min_sale, and avg_sale.

-- Task 5: Window Function: Max Sale Amount per Store for Each Row
-- Write a query to add a column showing the highest sale amount in each store location, keeping all rows.
-- - Use a window function with PARTITION BY store_location.
-- - Name the output column max_sale_in_store.

-- Task 6: Window Function: Number Rows within Each Store
-- Write a query to assign a unique row number to each sale within its store location.
-- - Use ROW_NUMBER() with PARTITION BY store_location.
-- - Include all columns from the table.

-- Task 7: Subquery: First 2 Sales per Store (by Transaction ID)
-- Write a query to fetch the first two sales in each store, assuming lower transaction_id means earlier sale.
-- - Use a subquery to assign row numbers within each store, ordered by transaction_id.
-- - Filter for rows numbered 1 or 2.

-- Task 8: Subquery: Top 3 Highest Sales per Store
-- Write a query to identify the top 3 sales by amount in each store, handling ties appropriately.
-- - Use RANK() with PARTITION BY store_location and ORDER BY sale_amount DESC.
-- - Filter for ranks 1, 2, or 3.

-- Task 9: Compare RANK and DENSE_RANK
-- Write a query to show both RANK() and DENSE_RANK() for sales amounts within each store.
-- - Use PARTITION BY store_location and ORDER BY sale_amount DESC.
-- - Name the output columns rnk and dense_rnk.

-- Task 10: LAG: Previous Sale Amount
-- Write a query to show the sale amount of the previous sale in the same store, ordered by transaction_id.
-- - Use LAG() with PARTITION BY store_location.

-- Task 11: LAG with Custom Offset and Default Value
-- Write a query to get the sale amount from two sales prior in the same store, defaulting to 0 if none exist.
-- - Use LAG() with an offset of 2 and a default value of 0.
-- - Partition by store_location and order by transaction_id.

-- Task 12: LAG and LEAD: Previous and Next Sale Amounts
-- Write a query to show both the previous and next sale amounts for each sale in the same store.
-- - Use LAG() and LEAD() with PARTITION BY store_location and ORDER BY transaction_id.
-- - Name the output columns prev_sale_amount and next_sale_amount.

-- Task 13: Compare Sale Amount to Previous with CASE
-- Write a query to classify each sale amount as 'Higher', 'Lower', or 'Same' compared to the previous sale in the same store.
-- - Use LAG() to access the previous sale amount (default to 0 for the first sale).
-- - Use CASE to compare the current sale_amount to the previous one.
-- - Partition by store_location and order by transaction_id.
-- - Name the output column sale_compare_to_prev.