-- Create 'regions' table to store information about geographic regions
CREATE TABLE regions (
    -- 'region_id' is a unique identifier for each region
    region_id SERIAL PRIMARY KEY,
    -- 'region_name' stores the region's name (e.g., city or county)
    region_name VARCHAR(100) NOT NULL,
    -- 'state' stores the state where the region is located
    state VARCHAR(50)
);

-- Create 'residents' table to store information about individuals in the population
CREATE TABLE residents (
    -- 'resident_id' is a unique identifier for each resident
    resident_id SERIAL PRIMARY KEY,
    -- 'resident_name' stores the resident's name
    resident_name VARCHAR(100) NOT NULL,
    -- 'email' stores the resident's email, nullable
    email VARCHAR(100),
    -- 'region_id' links to the region where the resident lives, nullable
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Create 'occupations' table to store information about job types
CREATE TABLE occupations (
    -- 'occupation_id' is a unique identifier for each occupation
    occupation_id SERIAL PRIMARY KEY,
    -- 'occupation_name' stores the occupation's name
    occupation_name VARCHAR(100) NOT NULL,
    -- 'industry' stores the industry type, nullable
    industry VARCHAR(50)
);

-- Create 'employment_records' table to track employment status of residents
CREATE TABLE employment_records (
    -- 'record_id' is a unique identifier for each employment record
    record_id SERIAL PRIMARY KEY,
    -- 'resident_id' links to the resident, nullable for untracked records
    resident_id INT,
    -- 'occupation_id' links to the occupation
    occupation_id INT,
    -- 'record_date' stores the date of the employment record
    record_date DATE,
    -- 'employment_status' stores the status (e.g., Employed, Unemployed), nullable
    employment_status VARCHAR(20),
    FOREIGN KEY (resident_id) REFERENCES residents(resident_id),
    FOREIGN KEY (occupation_id) REFERENCES occupations(occupation_id)
);

-- Insert data into 'regions' table (6 records)
INSERT INTO regions (region_name, state) VALUES
    ('Manhattan', 'New York'),
    ('Suffolk County', 'Massachusetts'),
    ('Cook County', 'Illinois'),
    ('King County', 'Washington'),
    ('Miami-Dade', 'Florida'),
    ('San Diego', 'California');

-- Insert data into 'residents' table (20 records, including 5 with NULL region_id or email)
INSERT INTO residents (resident_name, email, region_id) VALUES
    ('Alice Smith', 'alice@example.com', 1),
    ('Bob Jones', 'bob@example.com', 2),
    ('Cathy Lee', NULL, 3),
    ('David Brown', 'david@example.com', 4),
    ('Emma Wilson', 'emma@example.com', 5),
    ('Frank Davis', NULL, 6),
    ('Grace Taylor', 'grace@example.com', 1),
    ('Henry Moore', 'henry@example.com', 2),
    ('Isabella Clark', NULL, 3),
    ('James White', 'james@example.com', 4),
    ('Kelly Adams', 'kelly@example.com', 5),
    ('Liam Martinez', NULL, NULL),
    ('Mia Garcia', 'mia@example.com', 6),
    ('Noah Rodriguez', 'noah@example.com', 1),
    ('Olivia Lopez', 'olivia@example.com', 2),
    ('Peter Walker', NULL, NULL),
    ('Quinn Harris', 'quinn@example.com', 3),
    ('Rachel Young', 'rachel@example.com', 4),
    ('Samuel King', 'samuel@example.com', 5),
    ('Tara Scott', 'tara@example.com', NULL);

-- Insert data into 'occupations' table (10 records, including 2 with NULL industry)
INSERT INTO occupations (occupation_name, industry) VALUES
    ('Software Developer', 'Technology'),
    ('Nurse', 'Healthcare'),
    ('Teacher', 'Education'),
    ('Electrician', 'Construction'),
    ('Accountant', 'Finance'),
    ('Retail Worker', 'Retail'),
    ('Librarian', 'Public Services'),
    ('Mechanic', 'Automotive'),
    ('Freelancer', NULL),
    ('Consultant', NULL);

-- Insert data into 'employment_records' table (30 records, including 5 with NULL resident_id and 10 with NULL employment_status)
INSERT INTO employment_records (resident_id, occupation_id, record_date, employment_status) VALUES
    (1, 1, '2025-01-10', 'Employed'),
    (1, 2, '2025-01-12', NULL),
    (2, 3, '2025-01-15', 'Employed'),
    (3, 4, '2025-01-18', 'Employed'),
    (4, 5, '2025-02-01', NULL),
    (5, 6, '2025-02-05', 'Employed'),
    (6, 7, '2025-02-10', 'Unemployed'),
    (7, 8, '2025-02-12', NULL),
    (8, 9, '2025-02-15', 'Employed'),
    (9, 10, '2025-02-18', 'Employed'),
    (10, 1, '2025-03-01', NULL),
    (11, 2, '2025-03-05', 'Employed'),
    (12, 3, '2025-03-10', 'Unemployed'),
    (13, 4, '2025-03-12', NULL),
    (14, 5, '2025-03-15', 'Employed'),
    (15, 6, '2025-03-18', NULL),
    (1, 7, '2025-04-01', 'Employed'),
    (2, 8, '2025-04-02', NULL),
    (3, 9, '2025-04-03', 'Employed'),
    (4, 10, '2025-04-04', 'Unemployed'),
    (5, 1, '2025-04-05', NULL),
    (6, 2, '2025-04-06', 'Employed'),
    (7, 3, '2025-04-07', NULL),
    (8, 4, '2025-04-08', 'Employed'),
    (NULL, 5, '2025-04-09', NULL),
    (NULL, 6, '2025-04-10', 'Employed'),
    (NULL, 7, '2025-04-11', NULL),
    (NULL, 8, '2025-04-12', 'Unemployed'),
    (NULL, 9, '2025-04-13', 'Employed'),
    (1, 10, '2025-04-14', NULL);

-- Task 1: Select all columns from 'employment_records' where resident_name is 'Alice Smith' using INNER JOIN with 'residents'

select er.*
from employment_records er
inner join residents r on er.resident_id = r.resident_id
where r.resident_name = 'Alice Smith'

-- Task 2: Select all columns from 'employment_records' where record_id is less than 5
-- Task 3: Select all columns from 'employment_records' where record_id is greater than or equal to 10
-- Task 4: Select all columns from 'employment_records' where record_id is not equal to 3
-- Task 5: Select all columns from 'employment_records' where record_id is between 5 and 15 (inclusive)
-- Task 6: Add a salary column (DECIMAL(10, 2), CHECK constraint >= 0) to 'employment_records' table
-- Task 7: Update salary to 50000.00 for records where employment_status is 'Employed'

update employment_records
set salary = 50000.00
where employment_status = 'Employed';

-- Task 8: Select all columns from 'employment_records' where salary is not NULL
-- Task 9: Select all columns from 'employment_records' where occupation_id is in (1, 2, 3)
-- Task 10: Select all columns from 'employment_records' where occupation_id is not in (1, 2, 3)
-- Task 11: Select all columns from 'residents' where resident_name starts with 'A'
-- Task 12: Select all columns from 'occupations' where occupation_name ends with 'r'
-- Task 13: Select all columns from 'residents' where resident_name does not start with 'B'
-- Task 14: Select all columns from 'employment_records' where record_date is in 2025

select *
from employment_records
where extract (year from record_date) = 2025;

-- Task 15: Select resident_name and occupation_name for all employment records using INNER JOIN
-- Task 16: Select all residents, including those not in any region, using LEFT JOIN with 'residents' as left table

select r.* rg.region_name , rg.state
from residents r
left join regions rg on rg.region_id = r.region_id


-- Task 17: Select all regions, including those without residents, using LEFT JOIN with 'regions' as left table
-- Task 18: Select all residents, including those without employment records,
--  using RIGHT JOIN with 'residents' as right table


select r.* er.record_id , er.occupation_id , er.record_date, er.employment_status
from employment_records er
right join residents r on r.resident_id = er.resident_id



-- Task 19: Select all employment records, including those without residents, using RIGHT JOIN with 'employment_records' as right table
-- Task 20: Select unique state values from 'regions' table
-- Task 21: Select resident_name, occupation_name, and record_date for the first 10 employment records, sorted by record_date ascending
-- Task 22: Select resident_name, occupation_name, and record_date for 5 employment records, sorted by record_date descending, skipping the first 10
-- Task 23: Find the earliest record_date
-- Task 24: Find the latest record_date
-- Task 25: Count the total number of employment records
-- Task 26: Count the number of employment records with a non-NULL employment_status
-- Task 27: Select all columns from 'employment_records' where salary is NULL
-- Task 28: Calculate the sum of occupation_id values in 'employment_records' (as a proxy for record activity)
-- Task 29: Calculate the average salary for employment records where salary is not NULL
-- Task 30: Calculate the maximum salary for employment records 
--  where region_id is not NULL (join with 'residents')

select max(er.salary)
from employment_records er
inner join residents r on er.resident_id = r.resident_id
where r.region_id is not null


-- Task 31: Calculate the minimum record_date for employment 
--  records where occupation_id is in (1, 2)
-- Task 32: Select all columns from 'employment_records' where occupation_id = 1 and salary is not NULL
-- Task 33: Select all columns from 'occupations' where industry does not contain 'Tech'
-- Task 34: Delete employment records where employment_status is 'Unemployed'
-- Task 35: Drop the salary column from 'employment_records' table
-- Task 36: Select all columns from 'residents' where email is NULL
-- Task 37: Update email to 'unknown@example.com' for residents with NULL email
-- Task 38: Select all columns from 'employment_records' where resident_id is NULL
-- Task 39: Select all columns from 'residents' where region_id is NULL
-- Task 40: Select resident_name and occupation_name for records where 
--  record_date is in April 2025 using INNER JOIN

select r.resident_name, o.occupation_name
from employment_records er
inner join residents r on r.resident_id = er.resident_id
inner join occupations o on er.occupation_id = o.occupation_id
where extract (year from er.record_date) = 2025 and (month from er.record_date) = 4 



-- Task 41: Select all regions and their resident count 
-- using LEFT JOIN and GROUP BY

select rg.region_name , rg.state , count(r.resident_id) as resident_count
from regions rg
left join residents r on rg.region_id= r.region_id
group by rg.region_id , rg.region_name, rg.state




-- Task 42: Select all residents and their employment record count using RIGHT JOIN and GROUP BY
-- Task 43: Select all occupations, including those not in employment records, using LEFT JOIN with 'occupations' as left table
-- Task 44: Select all employment records, including those with no occupation (if possible), using RIGHT JOIN with 'occupations' as right table
-- Task 45: Add a status column (VARCHAR(20)) to 'residents' table
-- Task 46: Update status to 'Active' for residents with at least one employment record
-- Task 47: Select all columns from 'employment_records' where salary > 40000 and record_date is in March 2025

select * 
from  employment_records
where salary > 40000 
and extract(year from record_date) = 2025 
and extract(month from record_date) = 3;


-- Task 48: Delete residents who have no employment records

delete from residents
where residents_id 
not in (select distinct resident_id 
from employment_records where resident_id is not null)




-- Task 49: Select all columns from 'occupations' where occupation_name 
--  contains 'er'



-- Task 50: Calculate the total number of employment records per state 
-- using LEFT JOIN and GROUP BY



select rg.state , count(er.record_id) as employement_record_count
from regions rg
left join residents r on r.region_id = rg.region_idauthors a 
left join employment_records er on r.resident_id = er.resident_id
group by rg.state




