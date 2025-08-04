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
    -- It enforces data integrity by preventing invalid author_id values
    foreign key (author_id) references authors(author_id)
);

-- Inserts data into the 'authors' table
-- Adds three authors with their names and nationalities
INSERT INTO authors (author_name, nationality) VALUES
    ('J.K. Rowling', 'British'),        -- Adds author with author_id 1
    ('George R.R. Martin', 'American'), -- Adds author with author_id 2
    ('Haruki Murakami', 'Japanese');    -- Adds author with author_id 3

-- Inserts data into the 'books' table
-- Adds four books with their titles, publication years, and the author_id linking to the 'authors' table
INSERT INTO books (title, publication_year, author_id) VALUES
    ('Harry Potter and the Philosopher''s Stone', 1997, 1), -- Book with author_id 1 (J.K. Rowling)
    ('A Game of Thrones', 1996, 2),                        -- Book with author_id 2 (George R.R. Martin)
    ('Norwegian Wood', 1987, 3),                           -- Book with author_id 3 (Haruki Murakami)
    ('Harry Potter and the Chamber of Secrets', 1998, 1);  -- Book with author_id 1 (J.K. Rowling)

-- Attempts to insert a book with an invalid author_id
-- This will fail because author_id 999 does not exist in the 'authors' table
-- The foreign key constraint ensures only valid author_ids are allowed
INSERT INTO books (title, publication_year, author_id) VALUES
    ('Invalid Book', 2020, 999);

-- Inserts more authors into the 'authors' table
-- Adds five additional authors with their names and nationalities
INSERT INTO authors (author_name, nationality) VALUES
    ('Toni Morrison', 'American'),         -- Adds author with author_id 4
    ('Gabriel García Márquez', 'Colombian'), -- Adds author with author_id 5
    ('Jane Austen', 'British'),            -- Adds author with author_id 6
    ('Chimamanda Ngozi Adichie', 'Nigerian'), -- Adds author with author_id 7
    ('Fyodor Dostoevsky', 'Russian');     -- Adds author with author_id 8

-- Selects specific columns from the 'books' and 'authors' tables using an INNER JOIN
-- An INNER JOIN combines rows from both tables where there is a match based on the specified condition
select b.book_id, b.title, a.author_name
from books as b                           -- 'books as b' assigns the alias 'b' to the 'books' table for brevity
join authors as a on b.author_id = a.author_id; -- 'join authors as a' assigns the alias 'a' to the 'authors' table
                                               -- 'on b.author_id = a.author_id' specifies the condition to match rows
                                               -- Only rows where the 'author_id' in 'books' matches the 'author_id' in 'authors' are included
-- Expected output:
-- book_id | title                                      | author_name
-- 1       | Harry Potter and the Philosopher's Stone | J.K. Rowling
-- 2       | A Game of Thrones                        | George R.R. Martin
-- 3       | Norwegian Wood                           | Haruki Murakami
-- 4       | Harry Potter and the Chamber of Secrets  | J.K. Rowling

-- Selects all columns from the 'authors' table
-- The '*' is a wildcard that retrieves every column in the table
select * from authors;
-- Expected output:
-- author_id | author_name                 | nationality
-- 1         | J.K. Rowling                | British
-- 2         | George R.R. Martin          | American
-- 3         | Haruki Murakami             | Japanese
-- 4         | Toni Morrison               | American
-- 5         | Gabriel García Márquez      | Colombian
-- 6         | Jane Austen                 | British
-- 7         | Chimamanda Ngozi Adichie    | Nigerian
-- 8         | Fyodor Dostoevsky           | Russian

-- Selects specific columns using a LEFT JOIN with 'books' as the left table
-- A LEFT JOIN includes ALL rows from the left table ('books') and matching rows from the right table ('authors')
-- If there is no match in 'authors', columns from 'authors' (e.g., author_name) will be NULL
select b.book_id, b.title, a.author_name
from books as b                           -- 'books as b' assigns the alias 'b' to the 'books' table
left join authors as a on b.author_id = a.author_id; -- 'left join authors as a' assigns the alias 'a' to the 'authors' table
                                                    -- 'on b.author_id = a.author_id' specifies the condition to match rows
-- Explanation: In this case, the results are identical to the INNER JOIN
-- Reason: The foreign key constraint and 'not null' on books.author_id ensure every book has a valid author_id
-- Expected output (same as INNER JOIN due to constraints):
-- book_id | title                                      | author_name
-- 1       | Harry Potter and the Philosopher's Stone | J.K. Rowling
-- 2       | A Game of Thrones                        | George R.R. Martin
-- 3       | Norwegian Wood                           | Haruki Murakami
-- 4       | Harry Potter and the Chamber of Secrets  | J.K. Rowling

-- Selects specific columns using a LEFT JOIN with 'authors' as the left table
-- This LEFT JOIN includes ALL rows from the 'authors' table and matching rows from the 'books' table
-- If an author has no books, columns from 'books' (e.g., book_id, title) will be NULL
select b.book_id, b.title, a.author_name
from authors as a                         -- 'authors as a' assigns the alias 'a' to the 'authors' table
left join books as b on b.author_id = a.author_id; -- 'left join books as b' assigns the alias 'b' to the 'books' table
                                                  -- 'on b.author_id = a.author_id' specifies the condition to match rows
-- Expected output:
-- book_id | title                                      | author_name
-- 1       | Harry Potter and the Philosopher's Stone | J.K. Rowling
-- 4       | Harry Potter and the Chamber of Secrets  | J.K. Rowling
-- 2       | A Game of Thrones                        | George R.R. Martin
-- 3       | Norwegian Wood                           | Haruki Murakami
-- NULL    | NULL                                     | Toni Morrison
-- NULL    | NULL                                     | Gabriel García Márquez
-- NULL    | NULL                                     | Jane Austen
-- NULL    | NULL                                     | Chimamanda Ngozi Adichie
-- NULL    | NULL                                     | Fyodor Dostoevsky
-- Explanation: This query shows all authors, including those without books
-- Authors with author_id 4, 5, 6, 7, and 8 have no books, so book_id and title are NULL

-- Explanation of INNER JOIN vs. LEFT JOIN:
-- INNER JOIN: Only includes rows where there is a match in both tables (e.g., books with valid authors)
-- LEFT JOIN (books as left): Includes all books, with NULL for author_name if no matching author (not possible here due to foreign key)
-- LEFT JOIN (authors as left): Includes all authors, with NULL for book_id and title if an author has no books
-- The second LEFT JOIN demonstrates the key difference, as authors like Toni Morrison have no books, resulting in NULL values



-- REVISED PRACTICE TASKS TO REINFORCE FOREIGN KEY, INNER JOIN, AND LEFT JOIN CONCEPTS
-- These tasks focus on creating tables with foreign keys and querying with INNER JOIN and LEFT JOIN
-- RIGHT JOIN references have been removed as requested

-- Task 1: Library Database with Publishers and Books
-- Objective: Create tables with a foreign key and query using INNER JOIN and LEFT JOIN
-- Steps:
-- 1. Create a 'publishers' table with columns:
--    - publisher_id (serial, primary key)
--    - publisher_name (varchar(100), not null)
--    - country (varchar(50))
-- 2. Create a 'books' table with columns:
--    - book_id (serial, primary key)
--    - title (varchar(200), not null)
--    - publication_year (int)
--    - publisher_id (int, foreign key referencing publishers.publisher_id, nullable to allow experimentation)
-- 3. Insert 3 publishers into the 'publishers' table
-- 4. Insert 5 books, with 3 having valid publisher_id values and 2 with NULL publisher_id
-- 5. Write an INNER JOIN query to display each book’s title and its publisher’s name (only books with publishers)
-- 6. Write a LEFT JOIN query with 'books' as the left table to include all books, even those without publishers
-- 7. Write a LEFT JOIN query with 'publishers' as the left table to include all publishers, even those without books
-- 8. Compare the results of INNER JOIN and both LEFT JOIN queries to see how unmatched rows are handled

-- Task 2: Students and Courses
-- Objective: Model students and course enrollments, using INNER JOIN and LEFT JOIN
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
-- 4. Insert 4 students and 3 courses
-- 5. Insert enrollment records for 2 students in 2 courses each
-- 6. Write an INNER JOIN query to show enrollments with student names and course names
-- 7. Write a LEFT JOIN query with 'students' as the left table to show all students, including those not enrolled
-- 8. Write a LEFT JOIN query with 'courses' as the left table to show all courses, including those with no enrollments
-- 9. Compare the results to understand how LEFT JOIN includes unmatched rows with NULL values

-- Task 3: Employees and Departments
-- Objective: Create employee and department tables, query with INNER JOIN and LEFT JOIN
-- Steps:
-- 1. Create a 'departments' table with columns:
--    - department_id (serial, primary key)
--    - department_name (varchar(100), not null)
-- 2. Create an 'employees' table with columns:
--    - employee_id (serial, primary key)
--    - employee_name (varchar(100), not null)
--    - department_id (int, foreign key referencing departments.department_id, nullable)
-- 3. Insert 3 departments and 5 employees, with 2 employees having NULL department_id
-- 4. Write an INNER JOIN query to display employees with their department names (only those with departments)
-- 5. Write a LEFT JOIN query with 'employees' as the left table to include all employees, even those without departments
-- 6. Write a LEFT JOIN query with 'departments' as the left table to include all departments, even those without employees
-- 7. Try inserting an employee with an invalid department_id to test the foreign key constraint
-- 8. Compare the results of INNER JOIN and both LEFT JOIN queries to observe NULL values for unmatched rows

-- Task 4: Extend the Original Database with Genres
-- Objective: Add a genres table and use INNER JOIN and LEFT JOIN
-- Steps:
-- 1. Create a 'genres' table with columns:
--    - genre_id (serial, primary key)
--    - genre_name (varchar(50), not null)
-- 2. Alter the 'books' table to add a 'genre_id' column (int, foreign key referencing genres.genre_id, nullable)
-- 3. Insert 3 genres (e.g., Fantasy, Mystery, Romance)
-- 4. Update the 'books' table to assign genre_id to some books, leaving at least one book with NULL genre_id
-- 5. Write an INNER JOIN query to display books with their titles, author names, and genre names (only books with genres)
-- 6. Write a LEFT JOIN query with 'books' as the left table to include all books, even those without genres
-- 7. Write a LEFT JOIN query with 'genres' as the left table to include all genres, even those not assigned to books
-- 8. Compare the results to see how LEFT JOIN includes unmatched rows with NULL values

-- Task 5: Compare INNER JOIN and LEFT JOIN
-- Objective: Understand differences between INNER JOIN and LEFT JOIN using the 'authors' and 'books' tables
-- Steps:
-- 1. Run the original INNER JOIN query (books and authors)
-- 2. Run the LEFT JOIN query with 'books' as the left table
-- 3. Run the LEFT JOIN query with 'authors' as the left table
-- 4. (Optional) Remove the foreign key and not null constraints on books.author_id to allow NULL or invalid author_id values
-- 5. Insert a book with a NULL author_id and re-run all queries
-- 6. Write a comment explaining:
--    - INNER JOIN: Only matched rows from both tables
--    - LEFT JOIN: All rows from the left table, NULL for unmatched right table columns
-- 7. Compare the results to see how LEFT JOIN handles unmatched rows with NULL values







create table publishers(
publisher_id serial primary key,
publisher_name varchar(100) not null,
country varchar(50)
);


create table books(
book_id serial primary key,
title varchar(200) not null,
publication_year int,
publisher_id int,
foreign key (publisher_id) references publishers(publisher_id)
);



INSERT INTO publishers (publisher_name, country) VALUES
('Penguin Books', 'UK'),
('Random House', 'USA'),
('HarperCollins', 'USA');


INSERT INTO books (title, publication_year, publisher_id) VALUES
('The Great Gatsby', 1925, 1),
('1984', 1949, 2),
('Pride and Prejudice', 1813, 1),
('No Publisher Book 1', 2020, NULL),
('No Publisher Book 2', 2021, NULL);





select * from books;
select * from publishers;



select  b.title  , p.publisher_name
from books b
inner join publishers p on b.publisher_id = p.publisher_id;


select  b.title ,b.publication_year , p.publisher_name
from books b
left join publishers p on p.publisher_id = b.publisher_id;


select   p.publisher_name , b.title
from publishers p
left join books b on p.publisher_id = b.publisher_id;






create table students(
student_id serial primary key,
student_name varchar (100) not null,
email varchar (100)
);


create table courses(
course_id serial primary key,
course_name varchar (100) not null,
credits int
);



create table enrollments(
enrollment_id serial primary key,
student_id int,
course_id int ,
enrollment_date date,
foreign key (student_id)  references students(student_id), 
foreign key (course_id)  references courses(course_id)
)





INSERT INTO students (student_name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Jones', 'bob@example.com'),
('Cathy Lee', 'cathy@example.com'),
('David Brown', 'david@example.com');


INSERT INTO courses (course_name, credits) VALUES
('Mathematics', 3),
('Physics', 4),
('History', 3);


INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2025-01-15'),
(1, 2, '2025-01-15'),
(2, 1, '2025-01-16'),
(2, 3, '2025-01-16');


select * from enrollments;




select s.student_name, c.course_name ,  e.enrollment_date
from enrollments e
inner join students s on e.student_id = s.student_id
inner join courses c on e.course_id = c.course_id;



select s.student_name, c.course_name , e.enrollment_date
from students s
left join enrollments e on s.student_id = e.student_id
left join courses c on e.course_id = c.course_id;


select c.course_name, s.student_name, e.enrollment_date
from courses c
left join enrollments e on c.course_id= e.student_id
left join stxudents s on e.student_id = s.student_id;


