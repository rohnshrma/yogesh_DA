create table authors(
author_id serial primary key,
author_name varchar(100) not null,
nationality varchar(50)
);


create table books(
book_id serial primary key,
title varchar(200) not null,
publication_year int,
author_id int,
foreign key (author_id) references authors(author_id)
);



INSERT INTO authors (author_name, nationality) VALUES
    ('J.K. Rowling', 'British'),       
    ('George R.R. Martin', 'American'),
    ('Haruki Murakami', 'Japanese'),
    ('Toni Morrison', 'American'),         
    ('Gabriel García Márquez', 'Colombian'), 
    ('Jane Austen', 'British'),           
    ('Chimamanda Ngozi Adichie', 'Nigerian'),
    ('Fyodor Dostoevsky', 'Russian'),
     ('Isabel Allende', 'Chilean'),
    ('Salman Rushdie', 'British-Indian'),
    ('Agatha Christie', 'British'),
    ('Ngũgĩ wa Thiong''o', 'Kenyan'),
    ('Virginia Woolf', 'British');


INSERT INTO books (title, publication_year, author_id) values
	('Harry Potter and the Philosopher''s Stone', 1997, 1), -- Links to J.K. Rowling (author_id = 1)
    ('A Game of Thrones', 1996, 2),                        -- Links to George R.R. Martin (author_id = 2)
    ('Norwegian Wood', 1987, 3),                           -- Links to Haruki Murakami (author_id = 3)
    ('Harry Potter and the Chamber of Secrets', 1998, 1),
    ('Harry Potter and the Goblet of Fire', 2000, null),    -- No author assigned
    ('1Q84', 2009, null),                                   -- No author assigned
    ('Harry Potter and the Order of the Phoenix', 2003, 1), -- Links to J.K. Rowling
    ('The Wind-Up Bird Chronicle', 1994, null),             -- No author assigned
    ('Harry Potter and the Deathly Hallows', 2007, 1);  	-- Links to J.K. Rowling

    
    
select * from books;
    

select * from authors;



-- inner join 
-- An inner join combines rows from two tables where there is a match based on a condition.
-- Only rows with matching values in both tables are included in the result.



select b.book_id , b.title , a.author_name, a.nationality , b.publication_year
from books as b
join authors as a
on b.author_id = a.author_id;


-- left join
-- A left join includes all rows from the left table ('authors') and matching rows from the right table ('books').
-- If there’s no match, columns from the right table are returned as null.


select b.book_id , b.title , a.author_name, a.nationality , b.publication_year
from books as b
left join authors as a
on b.author_id = a.author_id;






-- right join
-- -- A right join includes all rows from the right table ('books') and matching rows from the left table ('authors').
-- If there’s no match, columns from the left table are returned as null.



select b.book_id , b.title , a.author_name, a.nationality , b.publication_year
from books as b
right join authors as a
on b.author_id = a.author_id;



