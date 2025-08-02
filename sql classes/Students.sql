-- Create the student_enrollment table
CREATE TABLE student_enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_name TEXT NOT NULL CHECK (LENGTH(TRIM(student_name)) <= 50),
    course_name TEXT CHECK (LENGTH(TRIM(course_name)) <= 50),
    enrollment_date DATE NOT NULL,
    credits INT NOT NULL CHECK (credits >= 0 AND credits <= 6),
    tuition_fee DECIMAL(10, 2) NOT NULL CHECK (tuition_fee >= 0)
);

-- Insert 105 student enrollment records
INSERT INTO student_enrollment (student_name, course_name, enrollment_date, credits, tuition_fee) VALUES
    ('Alice Smith', 'Mathematics 101', '2023-01-10', 3, 450.00),
    ('Bob Johnson', 'Physics 201', '2022-09-15', 4, 600.00),
    ('Clara Lee', 'Computer Science 101', '2024-01-20', 3, 500.00),
    ('David Brown', 'Chemistry 101', '2021-08-25', 4, 550.00),
    ('Emma Wilson', 'Biology 101', '2023-02-12', 3, 450.00),
    ('Frank Davis', 'History 101', '2022-01-30', 3, 400.00),
    ('Grace Taylor', 'English Literature', '2024-09-05', 3, 400.00),
    ('Henry Moore', 'Calculus I', '2021-09-10', 4, 600.00),
    ('Isabella Clark', 'Data Structures', '2023-01-15', 4, 650.00),
    ('James White', 'Organic Chemistry', '2022-08-20', 4, 600.00),
    ('Kelly Adams', 'World History', '2024-02-10', 3, 400.00),
    ('Liam Martinez', 'Physics 102', '2021-01-25', 4, 550.00),
    ('Mia Garcia', 'Intro to Programming', '2023-09-01', 3, 500.00),
    ('Noah Rodriguez', 'Statistics 101', '2022-02-15', 3, 450.00),
    ('Olivia Lopez', 'Microeconomics', '2024-01-12', 3, 450.00),
    ('Peter Walker', 'Macroeconomics', '2021-08-30', 3, 450.00),
    ('Quinn Harris', 'Algorithms', '2023-02-20', 4, 650.00),
    ('Rachel Young', 'Biochemistry', '2022-09-10', 4, 600.00),
    ('Samuel King', 'American Literature', '2024-01-05', 3, 400.00),
    ('Tara Scott', 'Calculus II', '2021-09-15', 4, 600.00),
    ('Uma Patel', 'Database Systems', '2023-01-20', 4, 650.00),
    ('Victor Nguyen', 'Physics 301', '2022-08-25', 4, 600.00),
    ('Wendy Green', 'Psychology 101', '2024-02-15', 3, 450.00),
    ('Xander Hill', 'Sociology 101', '2021-01-30', 3, 400.00),
    ('Yara Evans', 'Machine Learning', '2023-09-05', 4, 700.00),
    ('Zoe Carter', 'Art History', '2022-02-10', 3, 400.00),
    ('Adam Foster', 'Linear Algebra', '2024-01-10', 4, 600.00),
    ('Bella Reed', 'Operating Systems', '2021-08-20', 4, 650.00),
    ('Caleb Turner', 'Philosophy 101', '2023-01-15', 3, 400.00),
    ('Daisy Phillips', 'Environmental Science', '2022-09-01', 3, 450.00),
    ('Ethan Ward', 'Discrete Math', '2024-02-05', 4, 600.00),
    ('Fiona Hayes', 'Political Science', '2021-09-10', 3, 400.00),
    ('George Parker', 'Quantum Physics', '2023-01-25', 4, 650.00),
    ('Hannah Bell', 'Anthropology 101', '2022-08-15', 3, 400.00),
    ('Ian Brooks', 'Software Engineering', '2024-01-20', 4, 650.00),
    ('Julia Cox', 'Calculus III', '2021-02-10', 4, 600.00),
    ('Kevin Diaz', 'Economics 101', '2023-09-05', 3, 450.00),
    ('Lila Murphy', 'Organic Chemistry II', '2022-01-30', 4, 600.00),
    ('Mason Perry', 'Computer Networks', '2024-02-15', 4, 650.00),
    ('Nora Russell', 'Poetry Writing', '2021-08-25', 3, 400.00),
    ('Owen Gray', 'Genetics', '2023-01-10', 4, 600.00),
    ('Piper Ford', 'Ethics', '2022-09-01', 3, 400.00),
    ('Quincy Hart', 'Artificial Intelligence', '2024-01-05', 4, 700.00),
    ('Rose Bennett', 'Astronomy 101', '2021-09-15', 3, 450.00),
    ('Sean Fisher', 'Numerical Analysis', '2023-02-20', 4, 600.00),
    ('Tina Ortiz', 'Creative Writing', '2022-08-10', 3, 400.00),
    ('Ulysses Cruz', 'Cloud Computing', '2024-01-12', 4, 650.00),
    ('Vera Stone', 'Modern History', '2021-01-30', 3, 400.00),
    ('Walter Long', 'Biomedical Engineering', '2023-09-05', 4, 650.00),
    ('Xena Price', 'Music Theory', '2022-02-15', 3, 400.00),
    ('Yuri Cole', 'Cybersecurity', '2024-01-20', 4, 700.00),
    ('Zara Wells', 'Geology 101', '2021-08-20', 3, 450.00),
    ('Aaron Hunt', 'Graph Theory', '2023-01-15', 4, 600.00),
    ('Beth Lane', 'Public Speaking', '2022-09-10', 3, 400.00),
    ('Cody Meyer', 'Data Analysis', '2024-02-10', 4, 650.00),
    ('Diana Ross', 'Neuroscience', '2021-09-05', 4, 600.00),
    ('Eli Fox', 'Game Theory', '2023-01-30', 4, 600.00),
    ('Faith Kim', 'Journalism 101', '2022-08-25', 3, 400.00),
    ('Gabe Ellis', 'Robotics', '2024-01-15', 4, 650.00),
    ('Hazel Dean', 'Film Studies', '2021-02-10', 3, 400.00),
    ('Isaac Ray', 'Parallel Computing', '2023-09-01', 4, 650.00),
    ('Jade West', 'Linguistics 101', '2022-01-25', 3, 400.00),
    ('Kyle Dunn', 'Bioinformatics', '2024-02-05', 4, 650.00),
    ('Luna Vega', 'Cultural Studies', '2021-08-30', 3, 400.00),
    ('Miles Shaw', 'Quantum Computing', '2023-01-20', 4, 700.00),
    ('Nina Boyd', 'Archaeology 101', '2022-09-15', 3, 400.00),
    ('Oscar Dean', 'Web Development', '2024-01-10', 4, 650.00),
    ('Pia Moss', 'Gender Studies', '2021-09-10', 3, 400.00),
    ('Quentin Lowe', 'Cryptography', '2023-02-15', 4, 650.00),
    ('Rita Hale', 'Theater Arts', '2022-08-20', 3, 400.00),
    ('Sam Blake', 'Data Mining', '2024-01-05', 4, 650.00),
    ('Tara Fox', 'Marine Biology', '2021-01-30', 3, 450.00),
    ('Umar Reid', 'Distributed Systems', '2023-09-05', 4, 650.00),
    ('Vicky Lane', 'Logic 101', '2022-02-10', 3, 400.00),
    ('Will Cook', 'Deep Learning', '2024-01-20', 4, 700.00),
    ('Xena Hart', 'Photography 101', '2021-08-25', 3, 400.00),
    ('Yusuf Ali', 'Blockchain', '2023-01-15', 4, 650.00),
    ('Zoe Dunn', 'Ecology 101', '2022-09-01', 3, 450.00),
    ('Alan Perez', 'Number Theory', '2024-02-15', 4, 600.00),
    ('Bea Rose', 'Graphic Design', '2021-09-05', 3, 400.00),
    ('Cory Wade', 'Signal Processing', '2023-01-30', 4, 650.00),
    ('Dina Cole', 'Urban Studies', '2022-08-10', 3, 400.00),
    ('Evan Holt', 'Computer Vision', '2024-01-12', 4, 650.00),
    ('Faye Wood', 'Ethics in AI', '2021-02-20', 3, 400.00),
    ('Greg Sims', 'Astrophysics', '2023-09-10', 4, 600.00),
    ('Hana Lee', 'Creative Nonfiction', '2022-01-15', 3, 400.00),
    ('Ivan Chen', 'Network Security', '2024-02-10', 4, 650.00),
    ('Jill Hart', 'Social Psychology', '2021-08-20', 3, 400.00),
    ('Kian Ross', 'Computational Biology', '2023-01-25', 4, 650.00),
    ('Lia Fox', 'Film Production', '2022-09-05', 3, 400.00),
    ('Max Dean', 'Augmented Reality', '2024-01-30', 4, 650.00),
    ('Nia Cole', 'Mythology', '2021-09-15', 3, 400.00),
    ('Omar Reid', 'Virtual Reality', '2023-02-10', 4, 650.00),
    ('Pia Lane', 'Dance Studies', '2022-08-25', 3, 400.00),
    ('Quincy Bell', 'Big Data', '2024-01-15', 4, 650.00),
    ('Rhea King', 'Animal Behavior', '2021-01-20', 3, 450.00),
    ('Seth Ward', 'Game Development', '2023-09-01', 4, 650.00),
    ('Tina Ray', 'Poetry 101', '2022-02-15', 3, 400.00),
    ('Umar Cole', 'Cloud Architecture', '2024-01-10', 4, 650.00),
    ('Vera Dunn', 'World Religions', '2021-08-30', 3, 400.00),
    ('Will Fox', 'Human-Computer Interaction', '2023-01-20', 4, 650.00),
    ('Xena Reid', 'Sculpture 101', '2022-09-10', 3, 400.00),
    ('Yuri Lane', 'Natural Language Processing', '2024-02-05', 4, 700.00),
    ('Zoe Hart', 'Oceanography', '2021-09-05', 3, 450.00);

-- Add scholarship column
ALTER TABLE student_enrollment
ADD scholarship DECIMAL(5, 2) CHECK (scholarship >= 0 AND scholarship <= 100);

-- Update scholarship for specific courses
UPDATE student_enrollment
SET scholarship = 15.00
WHERE course_name LIKE '%Computer%' OR course_name LIKE '%Data%';

UPDATE student_enrollment
SET scholarship = 10.00
WHERE course_name LIKE '%Physics%' OR course_name LIKE '%Chemistry%';

-- Add campus column
ALTER TABLE student_enrollment
ADD campus VARCHAR(50);

-- Update campus for students
UPDATE student_enrollment
SET campus = 'Main Campus'
WHERE student_name IN (
    'Alice Smith', 'Clara Lee', 'Emma Wilson', 'Henry Moore', 'James White', 'Liam Martinez',
    'Noah Rodriguez', 'Peter Walker', 'Rachel Young', 'Tara Scott', 'Victor Nguyen', 'Xander Hill',
    'Zoe Carter', 'Bella Reed', 'Ethan Ward', 'George Parker', 'Ian Brooks', 'Kevin Diaz',
    'Mason Perry', 'Owen Gray', 'Sean Fisher', 'Ulysses Cruz', 'Walter Long', 'Yuri Cole',
    'Aaron Hunt', 'Cody Meyer', 'Eli Fox', 'Gabe Ellis', 'Isaac Ray', 'Kyle Dunn', 'Miles Shaw',
    'Oscar Dean', 'Quentin Lowe', 'Sam Blake', 'Umar Reid', 'Will Cook', 'Yuri Lane'
);

UPDATE student_enrollment
SET campus = 'East Campus'
WHERE student_name IN (
    'Bob Johnson', 'Frank Davis', 'Isabella Clark', 'Mia Garcia', 'Quinn Harris', 'Samuel King',
    'Wendy Green', 'Adam Foster', 'Caleb Turner', 'Fiona Hayes', 'Julia Cox', 'Nora Russell',
    'Quincy Hart', 'Tina Ortiz', 'Vera Stone', 'Beth Lane', 'Faith Kim', 'Jade West', 'Pia Moss',
    'Rita Hale', 'Hana Lee', 'Jill Hart', 'Lia Fox', 'Nia Cole', 'Pia Lane', 'Tina Ray'
);

UPDATE student_enrollment
SET campus = 'West Campus'
WHERE student_name IN (
    'David Brown', 'Grace Taylor', 'Kelly Adams', 'Olivia Lopez', 'Uma Patel', 'Yara Evans',
    'Daisy Phillips', 'Hannah Bell', 'Luna Vega', 'Piper Ford', 'Rose Bennett', 'Vicky Lane',
    'Zara Wells', 'Diana Ross', 'Hazel Dean', 'Lila Murphy', 'Rhea King', 'Vera Dunn', 'Xena Hart'
);

-- Analysis Tasks (Write SQL queries for each task using only the specified SQL concepts)
-- Task 1: Select all columns for enrollments where student_name is 'Alice Smith'.
-- Task 2: Select all columns for enrollments where enrollment_id is less than 10.
-- Task 3: Select all columns for enrollments where enrollment_id is greater than or equal to 15.
-- Task 4: Select all columns for enrollments where enrollment_id is not equal to 5.
-- Task 5: Select all columns for enrollments where enrollment_id is between 5 and 12 (inclusive).
-- Task 6: Select all columns for enrollments where scholarship is NULL.
-- Task 7: Select all columns for enrollments where course_name is in ('Mathematics 101', 'Physics 201', 'Computer Science 101').
-- Task 8: Select all columns for enrollments where course_name is not in ('Mathematics 101', 'Physics 201', 'Computer Science 101').
-- Task 9: Select all columns for enrollments where student_name starts with 'A'.
-- Task 10: Select all columns for enrollments where course_name ends with '101'.
-- Task 11: Select all columns for enrollments where student_name does not start with 'B'.
-- Task 12: Select all columns for enrollments where course_name LIKE '%Computer%' and scholarship is greater than 0.
-- Task 13: Select all columns for enrollments where campus is 'Main Campus' and credits = 4.
-- Task 14: Select all columns for enrollments where campus is 'East Campus' or tuition_fee is less than 450.
-- Task 15: Select only student_name and tuition_fee for all enrollments.
-- Task 16: Add a new column grade_point (DECIMAL(3, 2)) to the student_enrollment table.
-- Task 17: Update grade_point to 3.50 for enrollments where campus is 'Main Campus'.
-- Task 18: Update grade_point to 3.75 for enrollments where student_name is 'Clara Lee'.
-- Task 19: Update grade_point to 3.00 for all enrollments.
-- Task 20: Select unique campus values from the student_enrollment table.
-- Task 21: Select student_name, course_name, and enrollment_date for the first 7 enrollments.
-- Task 22: Select student_name, course_name, and enrollment_date for 5 enrollments, sorted by enrollment_date in descending order, skipping the first 15.
-- Task 23: Find the earliest enrollment_date.
-- Task 24: Find the latest enrollment_date.
-- Task 25: Count the total number of enrollments.
-- Task 26: Count the number of enrollments with a non-NULL scholarship.
-- Task 27: Select all columns for enrollments with a NULL campus.
-- Task 28: Calculate the sum of credits for all enrollments.
-- Task 29: Calculate the average tuition_fee of all enrollments.
-- Task 30: Calculate the maximum tuition_fee for enrollments where campus is 'West Campus'.
-- Task 31: Calculate the minimum credits for enrollments where course_name LIKE '%Physics%'.
-- Task 32: Select all columns for enrollments where tuition_fee is greater than 500 and credits = 4.
-- Task 33: Select all columns for enrollments where enrollment_date is in 2023.
-- Task 34: Select all columns for enrollments where course_name does not contain 'History'.
-- Task 35: Drop the grade_point column from the student_enrollment table.