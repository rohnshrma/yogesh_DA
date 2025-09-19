-- Creates a table named 'employee' to store employee data
CREATE TABLE employee (
    -- 'employee_id' is an auto-incrementing integer that uniquely identifies each employee
    -- 'serial' automatically generates sequential integers (1, 2, 3, ...)
    -- 'primary key' ensures employee_id is unique and not null
    employee_id serial primary key,
    -- 'employee_name' is a variable-length string with a maximum of 100 characters
    -- Used to store the full name of the employee
    employee_name varchar(100),
    -- 'department_id' is an integer that links to the department table
    -- Represents the department the employee works in
    department_id int,
    -- 'manager_id' is an integer that references the employee_id of the employee's manager
    -- Can be NULL for employees with no manager (e.g., top-level managers)
    manager_id int
);

-- Inserts 20 rows of data into the 'employee' table
-- Each row provides values for employee_name, department_id, and manager_id
INSERT INTO employee (employee_name, department_id, manager_id) VALUES
    -- 'Alice Smith' is in department 1 (HR), has no manager (NULL)
    ('Alice Smith', 1, NULL),
    -- 'Bob Johnson' is in department 1, managed by employee_id 1 (Alice)
    ('Bob Johnson', 1, 1),
    -- 'Charlie Brown' is in department 2 (Engineering), managed by employee_id 1 (Alice)
    ('Charlie Brown', 2, 1),
    -- 'Diana Prince' is in department 3 (Marketing), has no manager (NULL)
    ('Diana Prince', 3, NULL),
    -- 'Evan Davis' is in department 2, managed by employee_id 3 (Charlie)
    ('Evan Davis', 2, 3),
    -- 'Fiona Green' is in department 4 (Sales), managed by employee_id 3 (Charlie)
    ('Fiona Green', 4, 3),
    -- 'George Hill' is in department 1, managed by employee_id 2 (Bob)
    ('George Hill', 1, 2),
    -- 'Hannah Lee' is in department 5 (Finance), has no manager (NULL)
    ('Hannah Lee', 5, NULL),
    -- 'Ian Clark' is in department 2, managed by employee_id 5 (Hannah)
    ('Ian Clark', 2, 5),
    -- 'Julia Adams' is in department 3, managed by employee_id 5 (Hannah)
    ('Julia Adams', 3, 5),
    -- 'Kevin Moore' is in department 6 (IT), has no manager (NULL)
    ('Kevin Moore', 6, NULL),
    -- 'Laura Wilson' is in department 1, managed by employee_id 7 (George)
    ('Laura Wilson', 1, 7),
    -- 'Mike Taylor' is in department 2, managed by employee_id 7 (George)
    ('Mike Taylor', 2, 7),
    -- 'Nancy White' is in department 3, managed by employee_id 9 (Ian)
    ('Nancy White', 3, 9),
    -- 'Oliver King' is in department 4, managed by employee_id 9 (Ian)
    ('Oliver King', 4, 9),
    -- 'Pamela Scott' is in department 7 (Operations), has no manager (NULL)
    ('Pamela Scott', 7, NULL),
    -- 'Quinn Baker' is in department 1, managed by employee_id 12 (Laura)
    ('Quinn Baker', 1, 12),
    -- 'Rachel Young' is in department 2, managed by employee_id 12 (Laura)
    ('Rachel Young', 2, 12),
    -- 'Sam Carter' is in department 3, managed by employee_id 14 (Nancy)
    ('Sam Carter', 3, 14),
    -- 'Tina Evans' is in department 4, managed by employee_id 14 (Nancy)
    ('Tina Evans', 4, 14);

-- Creates a table named 'department' to store department data
CREATE TABLE department (
    -- 'department_id' is an auto-incrementing integer that uniquely identifies each department
    -- 'serial' ensures automatic generation of unique IDs
    -- 'primary key' enforces uniqueness and non-null constraint
    department_id serial primary key,
    -- 'department_name' is a variable-length string with a maximum of 100 characters
    -- Stores the name of the department (e.g., HR, Engineering)
    department_name varchar(100)
);

-- Inserts 10 rows of data into the 'department' table
-- Each row provides a department_name
INSERT INTO department (department_name) VALUES
    -- Department names for the organization
    ('HR'),
    ('Engineering'),
    ('Marketing'),
    ('Sales'),
    ('Finance'),
    ('IT'),
    ('Operations'),
    ('Research'),
    ('Legal'),
    ('Support');

-- Performs a FULL OUTER JOIN between 'employee' and 'department' tables
-- FULL OUTER JOIN includes all rows from both tables, matching where possible
SELECT 
    -- Selects the employee_name from the 'employee' table
    e.employee_name,
    -- Selects the department_name from the 'department' table
    d.department_name
FROM 
    -- 'employee' table aliased as 'e' for brevity
    employee e
    -- FULL OUTER JOIN ensures all employees and departments are included
    -- If an employee has no department or a department has no employees, NULL appears
    FULL OUTER JOIN department d
    -- Joins tables where department_id matches in both tables
    ON d.department_id = e.department_id;

-- Performs a CROSS JOIN between 'employee' and 'department' tables
-- CROSS JOIN creates a Cartesian product, combining every employee with every department
SELECT 
    -- Selects the employee_id from the 'employee' table
    e.employee_id,
    -- Selects the employee_name from the 'employee' table
    e.employee_name,
    -- Selects the department_name from the 'department' table
    d.department_name
FROM 
    -- 'employee' table aliased as 'e'
    employee e
    -- CROSS JOIN pairs every row from 'employee' with every row from 'department'
    -- Results in 20 employees * 10 departments = 200 rows
    CROSS JOIN department d;

-- Performs a SELF JOIN on the 'employee' table to show employee-manager relationships
-- A SELF JOIN joins a table with itself to relate rows within the same table
SELECT 
    -- Selects the employee_name from the first instance of the 'employee' table (e1) as 'employee'
    e1.employee_name AS employee,
    -- Selects the employee_name from the second instance of the 'employee' table (e2) as 'manager'
    -- Will be NULL if the employee has no manager
    e2.employee_name AS manager
FROM 
    -- First instance of 'employee' table aliased as 'e1' (represents employees)
    employee e1
    -- LEFT JOIN ensures all employees are included, even if they have no manager
    -- Joins with a second instance of 'employee' table aliased as 'e2' (represents managers)
    LEFT JOIN employee e2
    -- Matches employee’s manager_id (e1) with the employee_id of the manager (e2)
    ON e1.manager_id = e2.employee_id;