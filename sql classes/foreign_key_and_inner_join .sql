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