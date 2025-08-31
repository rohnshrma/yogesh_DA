# SQL Assignment: Practicing Joins with Publishers and Magazines

## Objective

Create a database to manage information about publishers and their magazines. Practice inner, left, and right joins to query relationships between publishers and magazines, handling cases where some magazines may not have a publisher and some publishers may not have magazines.

## Prewritten Data

Below is the SQL code to create the tables and insert sample data, similar in structure to the authors and books example.

```sql
-- Create table for publishers
create table publishers (
    publisher_id serial primary key,
    publisher_name varchar(100) not null,
    country varchar(50)
);

-- Create table for magazines
create table magazines (
    magazine_id serial primary key,
    title varchar(200) not null,
    publication_year int,
    publisher_id int,
    foreign key (publisher_id) references publishers(publisher_id)
);

-- Insert sample data into publishers table
INSERT INTO publishers (publisher_name, country) VALUES
    ('Conde Nast', 'United States'),
    ('Time Inc.', 'United States'),
    ('Hearst Magazines', 'United States'),
    ('Bauer Media', 'Germany'),
    ('Nature Publishing Group', 'United Kingdom'),
    ('Independent Press', 'Canada'),
    ('Vogue Media', 'France'),
    ('Guardian News', 'United Kingdom'),
    ('Rodale Inc.', 'United States'),
    ('Future Publishing', 'United Kingdom');

-- Insert sample data into magazines table
INSERT INTO magazines (title, publication_year, publisher_id) VALUES
    ('Vogue', 1892, 1),              -- Links to Conde Nast (publisher_id = 1)
    ('Time', 1923, 2),               -- Links to Time Inc. (publisher_id = 2)
    ('National Geographic', 1888, null), -- No publisher assigned
    ('Cosmopolitan', 1886, 3),       -- Links to Hearst Magazines (publisher_id = 3)
    ('Scientific American', 1845, null), -- No publisher assigned
    ('The Economist', 1843, null),   -- No publisher assigned
    ('Wired', 1993, 1),              -- Links to Conde Nast (publisher_id = 1)
    ('Nature', 1869, 5),             -- Links to Nature Publishing Group (publisher_id = 5)
    ('Runner''s World', 1966, 9);    -- Links to Rodale Inc. (publisher_id = 9)
```

## `Assignment Tasks`

Create the publishers and magazines tables (already provided above).
Insert the sample data into both tables (already provided above).
Write queries to:

- Select all magazines (all columns from the magazines table).
- Select all publisher names (only the publisher_name column from the publishers table).
- Perform an inner join to show magazines with their publishers, including magazine_id, title, publisher_name, country, and publication_year.
- Perform a left join to show all magazines, including those without publishers, with the same columns as the inner join.
- Perform a right join to show all publishers, including those without magazines, with the same columns as the inner join.

### Add comments to each query to explain:

- The purpose of the query.
- The SQL concepts involved (e.g., inner join, left join, right join, table aliases, null values, foreign key relationships).
- How the join condition works and what the query results represent.
