# SQL Practical Assignment: Database Management with Books Table

This assignment tests your ability to apply SQL concepts related to table creation, data manipulation, and querying using a `books` table. You will perform tasks to create, modify, and query data in a PostgreSQL database. Each task must be completed using valid SQL commands based on the concepts from the provided code.

---

## Assignment Instructions
- Create and execute SQL commands for each task.
- Assume the `books` table does not exist initially unless specified.
- Use a column structure tailored to a books context: `book_id` (SERIAL PRIMARY KEY), `title` (TEXT, NOT NULL, max 50 chars), `genre` (TEXT, max 30 chars), `author` (TEXT, max 50 chars), `publication_year` (optional, integer).
- Write each command in a clear, organized manner.
- Test your commands in a PostgreSQL environment to ensure they work as expected.
- Save your commands in a `.sql` file for submission.

---

## Tasks

1. **Create the Books Table**  
   Create a table named `books` with the following columns:  
   - `book_id`: Auto-incrementing integer, primary key.  
   - `title`: Text, cannot be null, max length 50 characters (after trimming).  
   - `genre`: Text, max length 30 characters (after trimming).  
   - `author`: Text, max length 50 characters (after trimming).  
   - `publication_year`: Integer, optional.

2. **Insert Sample Data**  
   Insert 4 rows into the `books` table with the following data:  
   - Book 1: title = 'The Mystery', genre = 'Mystery', author = 'Jane Doe', publication_year = 2020.  
   - Book 2: title = 'Space Odyssey', genre = 'Sci-Fi', author = NULL, publication_year = 2018.  
   - Book 3: title = 'Love Story', genre = 'Romance', author = 'John Smith', publication_year = 2023.  
   - Book 4: title = 'Adventure Tales', genre = 'Adventure', author = 'Alice Brown', publication_year = 2021.

3. **Add a New Column**  
   Add a column named `publisher` to the `books` table. The column should be text with a maximum length of 30 characters (after trimming).

4. **Update Publisher for Specific Books**  
   Update the `publisher` column to 'LitPress' for books whose `title` is 'The Mystery'.

5. **Add a Pages Column**  
   Add a column named `pages` to the `books` table. The column should store integer values.

6. **Change Pages Column Type**  
   Change the `pages` column type to a varchar with a maximum length of 5 characters.

7. **Update Pages for Specific Books**  
   Update the `pages` column to '300' for books whose `title` is 'Love Story'.

8. **Remove Pages Column**  
   Remove the `pages` column from the `books` table.

9. **Query All Data**  
   Write a query to retrieve all columns and rows from the `books` table.

10. **Delete Specific Rows**  
    Delete all rows from the `books` table where `title` is 'Space Odyssey'.

11. **Insert a New Book**  
    Insert a new row into the `books` table with:  
    - title = 'Fantasy World', genre = 'Fantasy', author = 'Eve Taylor', publication_year = 2024.

12. **Query by Title**  
    Write a query to select all columns for books where `title` is 'Fantasy World'.

13. **Query by Book ID Range**  
    Write a query to select all columns for books where `book_id` is between 2 and 4 (inclusive).

14. **Query by Null Author**  
    Write a query to select all columns for books where `author` is NULL.

15. **Query with IN Clause**  
    Write a query to select all columns for books where `title` is either 'The Mystery', 'Love Story', or 'Fantasy World'.

16. **Query with NOT IN Clause**  
    Write a query to select all columns for books where `title` is not 'The Mystery' or 'Adventure Tales'.

17. **Query with LIKE (Starts With)**  
    Write a query to select all columns for books where `title` starts with the letter 'F'.

18. **Query with NOT LIKE (Contains)**  
    Write a query to select all columns for books where `title` does not contain the letter 'e'.

19. **Query with AND Condition**  
    Write a query to select all columns for books where `title` is 'Fantasy World' and `genre` is 'Fantasy'.

20. **Query with OR Condition**  
    Write a query to select all columns for books where `title` is 'Love Story' or `publisher` is 'LitPress'.

21. **Query Unique Genres**  
    Write a query to select unique values from the `genre` column.

22. **Query Sorted by Title**  
    Write a query to select all columns from the `books` table, sorted by `title` in descending order (Z to A).

23. **Update Publisher for All Books**  
    Update the `publisher` column to 'BookHaven' for all books in the table.

24. **Query Author Ending with Pattern**  
    Write a query to select all columns for books where `author` ends with 'Smith'.

25. **Drop the Books Table**  
    Write a command to delete the entire `books` table from the database.

---

## Submission Guidelines
- Write all SQL commands in a single `.sql` file, with each task clearly labeled (e.g., `-- Task 1`, `-- Task 2`).
- Ensure commands are syntactically correct and follow the structure of the provided code.
- Test your commands in a PostgreSQL database to verify they work as expected.
- Submit the `.sql` file with your commands.

---

## Notes
- Tasks are designed to mirror the SQL operations in the provided code but applied to a `books` table instead of `employees` or `products`.
- Pay attention to constraints (e.g., `NOT NULL`, `CHECK`) when creating or modifying the table.
- For queries, assume the table contains the data from the `INSERT` tasks unless modified by `UPDATE` or `DELETE`.
- Be cautious with `UPDATE` and `DELETE` commands without `WHERE` clauses, as they affect all rows.
- The assignment assumes a PostgreSQL database due to the use of `SERIAL` in the original code.