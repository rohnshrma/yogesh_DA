-- Creating the vehicle_inventory table
CREATE TABLE vehicle_inventory (
    dealership_id INTEGER,
    dealership_name CHARACTER VARYING(50),
    vehicle_model CHARACTER VARYING(50),
    quantity INTEGER,
    unit_cost INTEGER
);

-- Inserting 50 rows of sample data into vehicle_inventory
INSERT INTO vehicle_inventory (dealership_id, dealership_name, vehicle_model, quantity, unit_cost) VALUES
(1, 'City Motors 1', 'Toyota Camry', 3, 25000),
(1, 'City Motors 1', 'Honda Civic', 2, 22000),
(1, 'City Motors 1', 'Ford Mustang', 1, 35000),
(1, 'City Motors 1', 'Tesla Model 3', 2, 40000),
(1, 'City Motors 1', 'Chevrolet Bolt', 4, 30000),
(2, 'Auto Haven 2', 'Toyota Camry', 2, 25500),
(2, 'Auto Haven 2', 'Honda Accord', 3, 27000),
(2, 'Auto Haven 2', 'Tesla Model Y', 1, 50000),
(2, 'Auto Haven 2', 'Ford F-150', 2, 32000),
(2, 'Auto Haven 2', 'Hyundai Tucson', 3, 26000),
(3, 'Drive Easy 3', 'Toyota RAV4', 2, 28000),
(3, 'Drive Easy 3', 'Honda CR-V', 3, 29000),
(3, 'Drive Easy 3', 'Tesla Model 3', 1, 41000),
(3, 'Drive Easy 3', 'Chevrolet Equinox', 2, 27000),
(3, 'Drive Easy 3', 'Ford Mustang', 1, 36000),
(4, 'Speed Wheels 4', 'Toyota Camry', 2, 25000),
(4, 'Speed Wheels 4', 'Honda Civic', 3, 22500),
(4, 'Speed Wheels 4', 'Tesla Model S', 1, 80000),
(4, 'Speed Wheels 4', 'Ford F-150', 2, 32500),
(4, 'Speed Wheels 4', 'Hyundai Sonata', 2, 24000),
(1, 'City Motors 1', 'Honda Accord', 2, 27500),
(1, 'City Motors 1', 'Toyota RAV4', 3, 28500),
(1, 'City Motors 1', 'Tesla Model Y', 1, 51000),
(2, 'Auto Haven 2', 'Chevrolet Bolt', 2, 30500),
(2, 'Auto Haven 2', 'Ford Mustang', 1, 35500),
(3, 'Drive Easy 3', 'Hyundai Tucson', 2, 26500),
(3, 'Drive Easy 3', 'Toyota Camry', 1, 25500),
(3, 'Drive Easy 3', 'Honda Civic', 2, 22500),
(4, 'Speed Wheels 4', 'Tesla Model 3', 1, 40500),
(4, 'Speed Wheels 4', 'Chevrolet Equinox', 2, 27500),
(1, 'City Motors 1', 'Ford F-150', 2, 32000),
(1, 'City Motors 1', 'Hyundai Sonata', 3, 24500),
(2, 'Auto Haven 2', 'Toyota RAV4', 2, 28500),
(2, 'Auto Haven 2', 'Honda CR-V', 1, 29500),
(3, 'Drive Easy 3', 'Tesla Model Y', 1, 50500),
(3, 'Drive Easy 3', 'Ford F-150', 2, 32500),
(4, 'Speed Wheels 4', 'Honda Accord', 2, 27000),
(4, 'Speed Wheels 4', 'Toyota Camry', 1, 25500),
(1, 'City Motors 1', 'Tesla Model S', 1, 81000),
(1, 'City Motors 1', 'Chevrolet Bolt', 2, 30500),
(2, 'Auto Haven 2', 'Hyundai Tucson', 2, 26000),
(2, 'Auto Haven 2', 'Ford Mustang', 1, 35000),
(3, 'Drive Easy 3', 'Honda Civic', 2, 22500),
(3, 'Drive Easy 3', 'Toyota Camry', 1, 25500),
(4, 'Speed Wheels 4', 'Tesla Model Y', 1, 51000),
(4, 'Speed Wheels 4', 'Ford F-150', 2, 32000),
(1, 'City Motors 1', 'Honda CR-V', 2, 29000),
(2, 'Auto Haven 2', 'Chevrolet Equinox', 2, 27000),
(3, 'Drive Easy 3', 'Hyundai Sonata', 2, 24500),
(4, 'Speed Wheels 4', 'Toyota RAV4', 1, 28500);

-- Task 1: Basic CTE - Find Vehicles with Above-Average Unit Cost
-- Objective: Identify vehicles where the unit cost is greater than the average unit cost across all vehicles in the inventory.
-- Requirements: Use a single CTE to calculate the average unit cost, then select vehicles with unit_cost above this average. Order by unit_cost descending.

-- Task 2: Basic CTE - Count Vehicles per Dealership
-- Objective: Count the number of distinct vehicle models per dealership and list them in descending order of count.
-- Requirements: Use a CTE to group by dealership_id and dealership_name, counting distinct vehicle models. Select from the CTE and order by count descending.

-- Task 3: Basic CTE - Vehicles with High Quantity
-- Objective: Find vehicles where the quantity is greater than the average quantity across all vehicles in the inventory.
-- Requirements: Use a single CTE to calculate the average quantity, then select vehicles with quantity above this average. Order by quantity descending.

-- Task 4: Basic CTE - Total Inventory Value per Dealership
-- Objective: Calculate the total inventory value (quantity * unit_cost) for each dealership.
-- Requirements: Use a single CTE to compute the sum of quantity * unit_cost per dealership, grouped by dealership_id and dealership_name. Select from the CTE and order by total value descending.

-- Task 5: Multiple CTEs - Vehicles with Above-Average Total Cost per Dealership
-- Objective: Find vehicles where the total cost (quantity * unit_cost) is greater than the average total cost for their respective dealership.
-- Requirements: Use two CTEs: one to calculate the average total cost per dealership, and another to compute total cost per vehicle. Join them to filter vehicles above the dealership's average total cost. Order by dealership_id and total cost descending.

-- Task 6: Multiple CTEs - Dealerships with High-Value Inventory
-- Objective: Identify dealerships where the total inventory value (sum of quantity * unit_cost) is above the overall average inventory value across all dealerships, and list the top vehicle model by total cost for each qualifying dealership.
-- Requirements: Use three CTEs: one for total inventory value per dealership, one for the average inventory value across dealerships, and one to find the top vehicle model per dealership using a window function. Join them to select qualifying dealerships and their top vehicle. Order by total inventory value descending.

-- Task 7: Basic CTE - Vehicles with Below-Average Unit Cost per Dealership
-- Objective: Find vehicles where the unit cost is below the average unit cost for their respective dealership.
-- Requirements: Use a single CTE to calculate the average unit cost per dealership, then select vehicles with unit_cost below this average. Order by dealership_id and unit_cost ascending.

-- Task 8: Multiple CTEs - Dealerships with Above-Average Vehicle Models
-- Objective: Identify dealerships that have more distinct vehicle models than the average number of distinct vehicle models across all dealerships.
-- Requirements: Use two CTEs: one to count distinct vehicle models per dealership, and another to calculate the average number of distinct models across all dealerships. Join them to filter dealerships above the average. Order by model count descending.

-- Task 9: Multiple CTEs - High-Value Vehicles by Dealership
-- Objective: For each dealership, find the vehicle with the highest total cost (quantity * unit_cost) and include the dealership’s total inventory value.
-- Requirements: Use two CTEs: one to calculate the total inventory value per dealership, and another to rank vehicles by total cost within each dealership using a window function. Select the top-ranked vehicle per dealership and join with the total inventory value. Order by dealership_id.

-- Task 10: Multiple CTEs - Dealerships with High Quantity and Cost
-- Objective: Identify dealerships where both the total quantity of vehicles and the total inventory value (quantity * unit_cost) are above their respective averages across all dealerships.
-- Requirements: Use three CTEs: one for total quantity per dealership, one for total inventory value per dealership, and one for the averages of quantity and value across all dealerships. Join them to filter dealerships where both metrics exceed the averages. Order by total inventory value descending.