-- **Concept: Table Creation**
-- The 'CREATE TABLE' statement defines a new table in the database.
-- Tables are used to store data in a structured format with rows and columns.
-- Each column has a defined data type and optional constraints to enforce data integrity.
create table authors(
    -- **Concept: Primary Key and Serial Data Type**
    -- 'author_id' is a column that uniquely identifies each author.
    -- 'serial' is a special data type that auto-generates sequential integers (1, 2, 3, ...).
    -- 'primary key' is a constraint ensuring 'author_id' is unique and not null for each row.
    author_id serial primary key,
    -- **Concept: Varchar and Not Null**
    -- 'author_name' stores the author's name as a variable-length string (up to 100 characters).
    -- 'varchar(100)' limits the string length to 100 characters.
    -- 'not null' is a constraint requiring this column to always have a value.
    author_name varchar(100) not null,
    -- **Concept: Optional Columns**
    -- 'nationality' stores the author's nationality as a string (up to 50 characters).
    -- No 'not null' constraint, so this field can be null (optional).
    nationality varchar(50)
);

-- **Concept: Table Creation with Foreign Key**
-- Creates a 'books' table to store book information.
-- A foreign key establishes a relationship between tables to maintain data consistency.
create table books(
    -- **Concept: Primary Key**
    -- 'book_id' uniquely identifies each book, using 'serial' for auto-incrementing IDs.
    -- 'primary key' ensures uniqueness and non-null values.
    book_id serial primary key,
    -- **Concept: Mandatory Data**
    -- 'title' stores the book's title as a string (up to 200 characters).
    -- 'not null' ensures every book must have a title.
    title varchar(200) not null,
    -- **Concept: Integer Data Type**
    -- 'publication_year' stores the year of publication as an integer.
    -- No 'not null', so this field is optional (can be null).
    publication_year int,
    -- **Concept: Foreign Key Relationship**
    -- 'author_id' stores the ID of the author who wrote the book, linking to the 'authors' table.
    -- Defined as an integer to match the 'author_id' type in 'authors'.
    author_id int,
    -- **Concept: Foreign Key Constraint**
    -- 'foreign key (author_id) references authors(author_id)' ensures that 'author_id' in 'books'
    -- must match an existing 'author_id' in the 'authors' table or be null.
    -- This enforces referential integrity, preventing invalid author IDs.
    foreign key (author_id) references authors(author_id)
);

-- **Concept: Inserting Data**
-- The 'INSERT INTO' statement adds rows to a table.
-- Columns are listed, and corresponding values are provided in the same order.
-- For 'serial' columns (e.g., author_id), values are auto-generated and omitted in the insert.
INSERT INTO authors (author_name, nationality) VALUES
    -- Each row provides 'author_name' and 'nationality' for one author.
    -- 'author_id' is automatically assigned (1, 2, 3, ...).
    ('J.K. Rowling', 'British'),       
    ('George R.R. Martin', 'American'),
    ('Haruki Murakami', 'Japanese'),
    ('Toni Morrison', 'American'),         
    ('Gabriel García Márquez', 'Colombian'), 
    ('Jane Austen', 'British'),           
    ('Chimamanda Ngozi Adichie', 'Nigerian'),
    ('Fyodor Dostoevsky', 'Russian');

-- **Concept: Inserting Data with Foreign Key**
-- Inserts rows into the 'books' table, linking books to authors via 'author_id'.
-- Note: Single quotes in titles (e.g., Philosopher's Stone) are escaped with double single quotes ('').
INSERT INTO books (title, publication_year, author_id) VALUES
    -- Each row provides 'title', 'publication_year', and 'author_id' (book_id is auto-generated).
    -- 'author_id' values (1, 2, 3) refer to authors in the 'authors' table.
    ('Harry Potter and the Philosopher''s Stone', 1997, 1), -- Links to J.K. Rowling (author_id = 1)
    ('A Game of Thrones', 1996, 2),                        -- Links to George R.R. Martin (author_id = 2)
    ('Norwegian Wood', 1987, 3),                           -- Links to Haruki Murakami (author_id = 3)
    ('Harry Potter and the Chamber of Secrets', 1998, 1);  -- Links to J.K. Rowling (author_id = 1)

-- **Concept: Basic Querying with SELECT**
-- The 'SELECT' statement retrieves data from a table.
-- '*' is a wildcard that selects all columns in the table.
-- This query returns all columns (book_id, title, publication_year, author_id) from 'books'.
select * from books;

-- **Concept: Adding More Data**
-- Inserts additional authors into the 'authors' table.
-- Follows the same structure as the previous 'INSERT INTO authors'.
INSERT INTO authors (author_name, nationality) VALUES
    -- Adds 5 more authors with their nationalities.
    -- 'author_id' values will continue from the last assigned ID (e.g., 9, 10, 11, ...).
    ('Isabel Allende', 'Chilean'),
    ('Salman Rushdie', 'British-Indian'),
    ('Agatha Christie', 'British'),
    ('Ngũgĩ wa Thiong''o', 'Kenyan'),
    ('Virginia Woolf', 'British');

-- **Concept: Inserting Data with NULL Values**
-- Inserts more books, some with 'null' for 'author_id', indicating no author is assigned.
-- 'author_id' is optional (no 'not null' constraint), so null values are allowed.
INSERT INTO books (title, publication_year, author_id) VALUES
    ('Harry Potter and the Goblet of Fire', 2000, null),    -- No author assigned
    ('1Q84', 2009, null),                                   -- No author assigned
    ('Harry Potter and the Order of the Phoenix', 2003, 1), -- Links to J.K. Rowling
    ('The Wind-Up Bird Chronicle', 1994, null),             -- No author assigned
    ('Harry Potter and the Deathly Hallows', 2007, 1);     -- Links to J.K. Rowling

-- **Concept: Selecting Specific Columns**
-- Selects only the 'author_name' column from the 'authors' table.
-- Returns a single-column result with the names of all authors.
select author_name from authors;

-- **Concept: Inner Join**
-- An inner join combines rows from two tables where there is a match based on a condition.
-- Only rows with matching values in both tables are included in the result.
select b.book_id, b.title, a.author_name
from books as b
    -- **Concept: Table Aliases**
    -- 'as b' assigns 'books' a shorter alias 'b' for convenience in the query.
    join authors as a
    -- **Concept: Join Condition**
    -- 'on b.author_id = a.author_id' specifies how to match rows between 'books' and 'authors'.
    -- Matches books to their authors using the 'author_id' column.
    -- Only books with a valid 'author_id' (non-null and existing in 'authors') are included.
    on b.author_id = a.author_id;

-- **Concept: Left Join (Left Outer Join)**
-- A left join includes all rows from the left table ('authors') and matching rows from the right table ('books').
-- If there’s no match, columns from the right table are returned as null.
select a.author_name, b.title, b.book_id
from authors as a 
    left join books as b on a.author_id = b.author_id;
    -- **Concept: Use Case of Left Join**
    -- This query lists all authors, even those without books.
    -- For authors with no books, 'title' and 'book_id' will be null.
    -- Useful for identifying authors who haven’t published books in the database.

-- **Concept: Right Join (Right Outer Join)**
-- A right join includes all rows from the right table ('books') and matching rows from the left table ('authors').
-- If there’s no match, columns from the left table are returned as null.
select a.author_name, b.title, b.book_id
from authors as a 
    right join books as b on a.author_id = b.author_id;
    -- **Concept: Use Case of Right Join**
    -- This query lists all books, even those without an assigned author.
    -- For books with 'author_id' as null, 'author_name' will be null.
    -- Useful for identifying books that lack an author in the database.
