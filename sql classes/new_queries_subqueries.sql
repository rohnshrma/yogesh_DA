
-- basic query
select * from authors;



-- basic query with conditions
select author_name , nationality
from authors
where nationality = 'British';


-- basic join query
select b.title , b.publication_year , a.author_name
from books as b
join authors as a on b.author_id  = a.author_id ;


-- Left Join Query: Include All Books (Even Without Authors)
select b.title , b.publication_year , a.author_name
from books as b
left join authors as a on b.author_id  = a.author_id ;


-- simple subquery : find authors who have written books

select author_name, nationality
from authors
where author_id in (select author_id  from books);



-- subquery in select : counter books per author
select author_name , nationality,(
	select count(*) 
	from books
	where books.author_id = authors.author_id) as no_of_books_written
from authors;



-- subquery with aggregation : find authors with more than one book
select author_name, nationality
from authors
where author_id in (
select author_id 
from books
group by author_id 
having count(*) > 1
);


book b1 | book b2



-- correlated subquery
-- find books published after an author's first book


select title , publication_year
from books as b1
where publication_year > (
	select min(publication_year)
	from books b2
	where b2.author_id  = b1.author_id 
);



-- nested subquery - authors with books after 2000

select author_name
from authors
where author_id in (
	select author_id 
	from books
	where publication_year > 2000
);


-- subquery in from : Average publication year per author
select a.author_name, avg_years.avg_publication_year
from authors as a
join (
select author_id ,  avg(publication_year) as avg_publication_year
from books
where author_id is not null
group by author_id
) as avg_years on a.author_id  = avg_years.author_id ;







-- result of subquery in from
select author_id, avg(publication_year) as avg_publication_year
from books
where author_id is not null
group by author_id;












-- ========================== Explanations



-- 1. Basic Query
-- This query retrieves all columns and rows from the authors table
select * from authors;
-- * 'select *' means fetch all columns (e.g., author_id, author_name, nationality)
-- * 'from authors' specifies the table to query
-- * Concept: This is the simplest query to view all data in a table
-- * Use Case: Use when you want to see all data, like a full list of authors

-- 2. Basic Query with Conditions
-- This query selects specific columns and filters rows based on a condition
select author_name, nationality
from authors
where nationality = 'British';
-- * 'select author_name, nationality' chooses only these two columns
-- * 'from authors' specifies the authors table as the data source
-- * 'where nationality = ''British''' filters to show only rows where nationality is 'British'
-- * Concept: The WHERE clause filters rows based on a condition
-- * Use Case: Use to get specific data, like listing only British authors

-- 3. Basic Join Query
-- This query combines data from books and authors tables using a JOIN
select b.title, b.publication_year, a.author_name
from books as b
join authors as a on b.author_id = a.author_id;
-- * 'select b.title, b.publication_year, a.author_name' selects specific columns
-- * 'from books as b' specifies the books table, aliased as 'b' for brevity
-- * 'join authors as a' combines with the authors table, aliased as 'a'
-- * 'on b.author_id = a.author_id' links tables by matching author_id values
-- * Concept: INNER JOIN (implied by 'join') includes only rows with matches in both tables
-- * Use Case: Use to combine related data, like book titles with author names

-- 4. Left Join Query
-- This query includes all books, even those without a matching author
select b.title, b.publication_year, a.author_name
from books as b
left join authors as a on b.author_id = a.author_id;
-- * 'select b.title, b.publication_year, a.author_name' selects specific columns
-- * 'from books as b' specifies the books table, aliased as 'b'
-- * 'left join authors as a' includes all books, with matching authors if available
-- * 'on b.author_id = a.author_id' links tables by author_id
-- * Concept: LEFT JOIN includes all rows from the left table (books); unmatched rows have NULL for authors' columns
-- * Use Case: Use when you want all books, even if some lack author data

-- 5. Simple Subquery
-- This query finds authors who have written at least one book
select author_name, nationality
from authors
where author_id in (select author_id from books);
-- * 'select author_name, nationality' retrieves these columns from authors
-- * 'from authors' specifies the authors table
-- * 'where author_id in (...)' filters authors whose author_id is in the subquery result
-- * '(select author_id from books)' is a subquery that returns all author_id values from books
-- * Concept: A subquery is a query in parentheses that runs first; its result is used by the outer query
-- * Use Case: Use to filter based on related data, like authors with published books

-- 6. Subquery in SELECT Clause
-- This query counts books per author using a subquery in the SELECT clause
select author_name, nationality, (
    select count(*)
    from books
    where books.author_id = authors.author_id
) as no_of_books_written
from authors;
-- * 'select author_name, nationality, (...)' selects columns and a subquery result
-- * '(select count(*) from books where books.author_id = authors.author_id)' counts books for each author
-- * 'count(*)' counts rows in books for the matching author_id
-- * 'as no_of_books_written' names the subquery result column
-- * 'from authors' specifies the authors table
-- * Concept: A subquery in SELECT runs for each row, adding a calculated value
-- * Use Case: Use to add computed data, like the number of books per author

-- 7. Subquery with Aggregation
-- This query finds authors who have written more than one book
select author_name, nationality
from authors
where author_id in (
    select author_id
    from books
    group by author_id
    having count(*) > 1
);
-- * 'select author_name, nationality' retrieves these columns from authors
-- * 'from authors' specifies the authors table
-- * 'where author_id in (...)' filters authors based on the subquery
-- * '(select author_id ...)' is a subquery:
-- * 'select author_id from books' selects author_id from books
-- * 'group by author_id' groups rows by author_id
-- * 'having count(*) > 1' filters groups with more than one book
-- * Concept: GROUP BY aggregates data; HAVING filters aggregated results
-- * Use Case: Use to find authors meeting a condition based on aggregated data

-- 8. Correlated Subquery
-- This query finds books published after an author's first book
select title, publication_year
from books as b1
where publication_year > (
    select min(publication_year)
    from books b2
    where b2.author_id = b1.author_id
);
-- * 'select title, publication_year' selects these columns from books
-- * 'from books as b1' specifies the books table, aliased as 'b1'
-- * 'where publication_year > (...)' filters books based on the subquery
-- * '(select min(publication_year) ...)' is a correlated subquery:
-- * 'select min(publication_year)' finds the earliest publication year
-- * 'from books b2' uses books table, aliased as 'b2'
-- * 'where b2.author_id = b1.author_id' links to the outer query’s author_id
-- * Concept: A correlated subquery references the outer query, running for each row
-- * Use Case: Use to compare rows against related data, like books after an author’s first

-- 9. Nested Subquery
-- This query finds authors with books published after 2000
select author_name
from authors
where author_id in (
    select author_id
    from books
    where publication_year > 2000
);
-- * 'select author_name' retrieves author_name from authors
-- * 'from authors' specifies the authors table
-- * 'where author_id in (...)' filters authors based on the subquery
-- * '(select author_id ...)' is a subquery:
-- * 'select author_id from books' selects author_id from books
-- * 'where publication_year > 2000' filters books published after 2000
-- * Concept: A nested subquery runs independently, providing a list for the outer query
-- * Use Case: Use to filter based on conditions in a related table

-- 10. Subquery in FROM Clause
-- This query calculates the average publication year per author
select a.author_name, avg_years.avg_publication_year
from authors as a
join (
    select author_id, avg(publication_year) as avg_publication_year
    from books
    where author_id is not null
    group by author_id
) as avg_years on a.author_id = avg_years.author_id;
-- * 'select a.author_name, avg_years.avg_publication_year' selects columns
-- * 'from authors as a' specifies authors table, aliased as 'a'
-- * 'join (...)' joins with a subquery:
-- * '(select author_id, avg(publication_year) ...)' is a subquery:
-- * 'select author_id, avg(publication_year)' calculates average publication year
-- * 'from books' uses books table
-- * 'where author_id is not null' excludes rows with null author_id
-- * 'group by author_id' groups by author_id for aggregation
-- * 'as avg_years' names the subquery result as a temporary table
-- * 'on a.author_id = avg_years.author_id' links the subquery to authors
-- * Concept: A subquery in FROM acts like a temporary table
-- * Use Case: Use to precompute aggregated data before joining

-- 11. Result of Subquery in FROM (Standalone)
-- This query shows the subquery used above, run independently
select author_id, avg(publication_year) as avg_publication_year
from books
where author_id is not null
group by author_id;
-- * 'select author_id, avg(publication_year)' selects author_id and average publication year
-- * 'from books' specifies the books table
-- * 'where author_id is not null' excludes rows with null author_id
-- * 'group by author_id' groups rows by author_id for aggregation
-- * 'as avg_publication_year' names the calculated column
-- * Concept: GROUP BY aggregates data for each author_id
-- * Use Case: Use to compute summary statistics, like average publication year per author


