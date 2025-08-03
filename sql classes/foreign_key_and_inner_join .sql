-- Creates a table named 'authors' to store information about authors
create table authors(
    -- 'author_id' is a unique identifier for each author
    -- 'serial' is a PostgreSQL data type that auto-generates incrementing integers (1, 2, 3, ...)
    -- 'primary key' ensures each author_id is unique and cannot be null
    author_id serial primary key,
    
    -- 'author_name' stores the author's name as a string
    -- 'varchar(100)' limits the name to a maximum of 100 characters
    -- 'not null' means this field must have a value and cannot be empty
    author_name varchar(100) not null,
    
    -- 'nationality' stores the author's nationality as a string
    -- 'varchar(50)' limits the nationality to a maximum of 50 characters
    -- No 'not null', so this field is optional and can be null
    nationality varchar(50)
);

-- Creates a table named 'books' to store information about books
create table books(
    -- 'book_id' is a unique identifier for each book
    -- 'serial' auto-generates incrementing integers (1, 2, 3, ...)
    -- 'primary key' ensures each book_id is unique and cannot be null
    book_id serial primary key,
    
    -- 'title' stores the book's title as a string
    -- 'varchar(200)' limits the title to a maximum of 200 characters
    -- 'not null' means this field must have a value and cannot be empty
    title varchar(200) not null,
    
    -- 'publication_year' stores the year the book was published as an integer
    -- No 'not null', so this field is optional and can be null
    publication_year int,
    
    -- 'author_id' stores the ID of the author who wrote the book
    -- 'int' means it is an integer
    -- 'not null' means this field must have a value
    author_id int not null,
    
    -- 'foreign key (author_id) references authors(author_id)' defines a foreign key constraint
    -- This ensures that the 'author_id' in the 'books' table must match an existing 'author_id' in the 'authors' table
    -- It creates a relationship between the 'books' and 'authors' tables
    foreign key (author_id) references authors(author_id)
);

-- Inserts data into the 'authors' table
-- Adds three authors with their names and nationalities
INSERT INTO authors (author_name, nationality) VALUES
    ('J.K. Rowling', 'British'),        -- Adds author with name 'J.K. Rowling' and nationality 'British'
    ('George R.R. Martin', 'American'), -- Adds author with name 'George R.R. Martin' and nationality 'American'
    ('Haruki Murakami', 'Japanese');    -- Adds author with name 'Haruki Murakami' and nationality 'Japanese'

-- Inserts data into the 'books' table
-- Adds four books with their titles, publication years, and the author_id linking to the 'authors' table
INSERT INTO books (title, publication_year, author_id) VALUES
    ('Harry Potter and the Philosopher''s Stone', 1997, 1), -- Adds book with title, year 1997, and author_id 1 (J.K. Rowling)
    ('A Game of Thrones', 1996, 2),                        -- Adds book with title, year 1996, and author_id 2 (George R.R. Martin)
    ('Norwegian Wood', 1987, 3),                           -- Adds book with title, year 1987, and author_id 3 (Haruki Murakami)
    ('Harry Potter and the Chamber of Secrets', 1998, 1);  -- Adds another book with title, year 1998, and author_id 1 (J.K. Rowling)

-- Attempts to insert a book with an invalid author_id
-- This will fail because author_id 999 does not exist in the 'authors' table
-- The foreign key constraint ensures only valid author_ids are allowed
INSERT INTO books (title, publication_year, author_id) VALUES
    ('Invalid Book', 2020, 999);

-- Inserts more authors into the 'authors' table
-- Adds five additional authors with their names and nationalities
INSERT INTO authors (author_name, nationality) VALUES
    ('Toni Morrison', 'American'),         -- Adds author with name 'Toni Morrison' and nationality 'American'
    ('Gabriel García Márquez', 'Colombian'), -- Adds author with name 'Gabriel García Márquez' and nationality 'Colombian'
    ('Jane Austen', 'British'),            -- Adds author with name 'Jane Austen' and nationality 'British'
    ('Chimamanda Ngozi Adichie', 'Nigerian'), -- Adds author with name 'Chimamanda Ngozi Adichie' and nationality 'Nigerian'
    ('Fyodor Dostoevsky', 'Russian');     -- Adds author with name 'Fyodor Dostoevsky' and nationality 'Russian'

-- Selects specific columns from the 'books' and 'authors' tables using an INNER JOIN
-- An INNER JOIN combines rows from both tables where there is a match based on the specified condition
select b.book_id, b.title, a.author_name
from books as b                           -- 'books as b' assigns the alias 'b' to the 'books' table for brevity
join authors as a on b.author_id = a.author_id; -- 'join authors as a' assigns the alias 'a' to the 'authors' table
                                               -- 'on b.author_id = a.author_id' specifies the condition to match rows
                                               -- Only rows where the 'author_id' in 'books' matches the 'author_id' in 'authors' are included

-- Selects all columns from the 'authors' table
-- The '*' is a wildcard that retrieves every column in the table
select * from authors;














-- PRACTICE TASKS TO REINFORCE FOREIGN KEY AND INNER JOIN CONCEPTS
-- These tasks are designed to help you practice creating tables with foreign keys and querying them with inner joins

-- Task 1: Create a Library Database
-- Objective: Create tables for publishers and books with a foreign key relationship, and query them using an inner join
-- Steps:
-- 1. Create a 'publishers' table with columns:
--    - publisher_id (serial, primary key)
--    - publisher_name (varchar(100), not null)
--    - country (varchar(50))
-- 2. Create a 'books' table with columns:
--    - book_id (serial, primary key)
--    - title (varchar(200), not null)
--    - publication_year (int)
--    - publisher_id (int, foreign key referencing publishers.publisher_id)
-- 3. Insert 3 publishers into the 'publishers' table
-- 4. Insert 5 books into the 'books' table, ensuring each book has a valid publisher_id
-- 5. Try inserting a book with an invalid publisher_id to see the foreign key constraint in action
-- 6. Write a query using an INNER JOIN to display each book’s title and its publisher’s name

-- Task 2: Students and Courses
-- Objective: Model a relationship between students and courses they are enrolled in
-- Steps:
-- 1. Create a 'students' table with columns:
--    - student_id (serial, primary key)
--    - student_name (varchar(100), not null)
--    - email (varchar(100))
-- 2. Create a 'courses' table with columns:
--    - course_id (serial, primary key)
--    - course_name (varchar(100), not null)
--    - credits (int)
-- 3. Create an 'enrollments' table with columns:
--    - enrollment_id (serial, primary key)
--    - student_id (foreign key referencing students.student_id)
--    - course_id (foreign key referencing courses.course_id)
--    - enrollment_date (date)
-- 4. Insert 3 students and 3 courses
-- 5. Enroll students in courses by inserting records into the 'enrollments' table
-- 6. Write an INNER JOIN query to show each enrollment with the student’s name and course name

-- Task 3: Employees and Departments
-- Objective: Create a database for employees and their departments, using foreign keys and inner joins
-- Steps:
-- 1. Create a 'departments' table with columns:
--    - department_id (serial, primary key)
--    - department_name (varchar(100), not null)
-- 2. Create an 'employees' table with columns:
--    - employee_id (serial, primary key)
--    - employee_name (varchar(100), not null)
--    - department_id (foreign key referencing departments.department_id)
-- 3. Insert 2 departments and 4 employees, ensuring each employee is assigned to a valid department
-- 4. Write an INNER JOIN query to display each employee’s name and their department’s name
-- 5. Experiment: Try inserting an employee with an invalid department_id and observe the error

-- Task 4: Extend the Original Database
-- Objective: Add a new table and use inner joins to combine data
-- Steps:
-- 1. Using the existing 'authors' and 'books' tables, create a new table called 'genres' with columns:
--    - genre_id (serial, primary key)
--    - genre_name (varchar(50), not null)
-- 2. Add a 'genre_id' column to the 'books' table as a foreign key referencing genres.genre_id
-- 3. Insert 3 genres (e.g., Fantasy, Mystery, Romance)
-- 4. Update the 'books' table to assign a genre_id to each book
-- 5. Write a query using INNER JOIN to display each book’s title, author’s name, and genre name

-- Task 5: Analyze Inner Join vs. Other Joins
-- Objective: Understand the difference between INNER JOIN and other join types
-- Steps:
-- 1. Using the 'authors' and 'books' tables, modify the INNER JOIN query to use a LEFT JOIN:
--    select b.book_id, b.title, a.author_name from books as b left join authors as a on b.author_id = a.author_id
-- 2. Compare the results: Notice if any books appear with a NULL author (they won’t in this case due to the foreign key)
-- 3. Insert an author who has no books and use a RIGHT JOIN to see authors without books
-- 4. Write a brief explanation (as a comment) of the differences between INNER JOIN, LEFT JOIN, and RIGHT JOIN based on your results