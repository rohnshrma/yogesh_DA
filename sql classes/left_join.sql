/* 
Yeh complete PostgreSQL code hai jo `customers` aur `orders` tables create karta hai, unme data insert karta hai, aur LEFT JOIN ka use karke data retrieve karta hai. Niche har line aur concept ko detail se explain kiya gaya hai.

### 1. Creating the `customers` Table
- `CREATE TABLE customers`: Yeh command ek nayi table banata hai jisme customers ki details store hongi.
- `customer_id SERIAL PRIMARY KEY`: `customer_id` ek unique identifier hai jo automatically increment hota hai (1, 2, 3...). `SERIAL` ek PostgreSQL data type hai jo auto-incrementing integers generate karta hai. `PRIMARY KEY` ensure karta hai ki har `customer_id` unique ho aur NULL na ho.
- `customer_name VARCHAR(100)`: Customer ka naam store karta hai, maximum 100 characters tak. `VARCHAR` variable-length string data type hai jo specified length tak text store karta hai.
- `email VARCHAR(100)`: Customer ka email address store karta hai, maximum 100 characters tak. Yeh bhi `VARCHAR` use karta hai, jo emails ke liye suitable hai.

### 2. Creating the `orders` Table
- `CREATE TABLE orders`: Yeh command ek nayi table banata hai jisme customers ke orders ki details store hongi.
- `order_id SERIAL PRIMARY KEY`: `order_id` har order ke liye unique identifier hai, jo automatically increment hota hai. `SERIAL` aur `PRIMARY KEY` same kaam karte hain jaise `customers` table mein.
- `customer_id INT`: Yeh column `customers` table ke `customer_id` se link karta hai. `INT` (integer) data type use hota hai kyunki yeh `customers` ke `customer_id` (jo SERIAL/INTEGER hai) se match karta hai.
- `order_date DATE`: Order ki date store karta hai. `DATE` data type dates ko YYYY-MM-DD format mein store karta hai (e.g., '2025-06-10').
- `amount DECIMAL(10,2)`: Order ki monetary value store karta hai. `DECIMAL(10,2)` 10 digits tak ka number store kar sakta hai, jisme 2 digits decimal ke baad honge (e.g., 12345678.90). Yeh precise calculations ke liye ideal hai.
- `FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE`: Yeh constraint ensure karta hai ki `orders` table ka `customer_id` sirf wahi values le sakta hai jo `customers` table ke `customer_id` mein exist hain. `ON DELETE CASCADE` ka matlab hai agar koi customer `customers` table se delete hota hai, to uske saare related orders bhi `orders` table se automatically delete ho jayenge. Yeh referential integrity aur data consistency ke liye important hai.

### 3. Inserting Data into `customers` Table
- `INSERT INTO customers (customer_name, email) VALUES`: Yeh command `customers` table mein naye records add karta hai. `(customer_name, email)` specify karta hai ki hum kaunse columns mein data daal rahe hain, aur `VALUES` actual data provide karta hai.
- `('Rohan Sharma', 'rohan.sharma@example.com')`: Yeh ek customer ka data hai. `customer_id` automatically generate hoga (1) kyunki yeh SERIAL hai.
- `('Anjali Mehta', 'anjali.mehta@example.com')`: Doosra customer, jiska `customer_id` 2 hoga.
- `('Vikram Singh', 'vikram.singh@example.com')`: Teesra customer, jiska `customer_id` 3 hoga.

### 4. Inserting Data into `orders` Table
- `INSERT INTO orders (customer_id, order_date, amount) VALUES`: Yeh command `orders` table mein naye records add karta hai. `(customer_id, order_date, amount)` specify karta hai ki hum kaunse columns mein data daal rahe hain.
- `(1, '2025-06-10', 250.50)`: Yeh Rohan Sharma (customer_id 1) ka order hai, dated 2025-06-10, aur amount 250.50 hai. `order_id` automatically 1 generate hoga.
- `(2, '2025-07-05', 175.25)`: Yeh Anjali Mehta (customer_id 2) ka order hai, dated 2025-07-05, aur amount 175.25 hai. `order_id` 2 hoga.
- **Note**: Vikram Singh (customer_id 3) ka koi order nahi insert kiya gaya, jo LEFT JOIN ke effect ko dikhane mein help karega.

### 5. Performing LEFT JOIN Query
- `SELECT`: Yeh command specify karta hai ki hum kaunse columns retrieve karna chahte hain.
- `c.customer_id, c.customer_name, c.email`: Yeh `customers` table se columns hain, jahan `c` table ka alias hai.
- `o.order_id, o.order_date, o.amount`: Yeh `orders` table se columns hain, jahan `o` table ka alias hai.
- `FROM customers c`: Yeh batata hai ki hum `customers` table (alias `c`) se data le rahe hain. Yeh left table hai.
- `LEFT JOIN orders o`: Yeh `orders` table (alias `o`) ko join karta hai using LEFT JOIN. LEFT JOIN ka matlab hai ki `customers` table ke saare records aayenge, chahe `orders` table mein unka koi match ho ya na ho. Agar match nahi hota, to `orders` table ke columns mein NULL values aayengi.
- `ON c.customer_id = o.customer_id`: Yeh condition specify karta hai ki dono tables kaise link honge. `customers` ka `customer_id` `orders` ke `customer_id` se match karega.

### Expected Output
Query ka result kuch aisa hoga:
| customer_id | customer_name | email                    | order_id | order_date  | amount  |
|-------------|---------------|--------------------------|----------|-------------|---------|
| 1           | Rohan Sharma  | rohan.sharma@example.com | 1        | 2025-06-10  | 250.50  |
| 2           | Anjali Mehta  | anjali.mehta@example.com | 2        | 2025-07-05  | 175.25  |
| 3           | Vikram Singh  | vikram.singh@example.com | NULL     | NULL        | NULL    |

### Key Observations
- `customers` table ke saare 3 customers (Rohan, Anjali, Vikram) result mein hain, kyunki LEFT JOIN left table ke saare records include karta hai.
- Vikram Singh ka koi order nahi hai, isliye uske `order_id`, `order_date`, aur `amount` columns mein NULL values hain.
- `ON DELETE CASCADE` ensure karta hai ki agar Rohan (customer_id 1) delete hota hai, to uska order (order_id 1) bhi delete ho jayega.

### Why LEFT JOIN?
LEFT JOIN isliye useful hai kyunki yeh left table ke saare records ko preserve karta hai, aur right table se sirf matching records laata hai. Is case mein, hume saare customers ki list chahiye thi, chahe unhone order kiya ho ya na kiya ho, aur LEFT JOIN ne yeh perfectly achieve kiya.

Agar aapko aur koi clarification chahiye ya kisi specific aspect ko aur detail mein samajhna hai, to mujhe batayein!
*/
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

INSERT INTO customers (customer_name, email) VALUES
('Rohan Sharma', 'rohan.sharma@example.com'),
('Anjali Mehta', 'anjali.mehta@example.com'),
('Vikram Singh', 'vikram.singh@example.com');

INSERT INTO orders (customer_id, order_date, amount) VALUES
(1, '2025-06-10', 250.50),
(2, '2025-07-05', 175.25);

SELECT 
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;