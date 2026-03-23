-- DuckDB Cross-Format Querying
-- This demonstrates querying CSV, JSON, and Parquet directly (Data Lake approach)
-- Note: orders.json does not contain product_id, so full relational joins are limited
-- All queries tested successfully in DuckDB

-- Q1 - Customers + total orders
SELECT 
    c.customer_id,
    c.name AS customer_name,
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/customers.csv') c
LEFT JOIN read_json_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.name
ORDER BY total_orders DESC;


-- Q2 - Top 3 customers by spending
SELECT 
    c.customer_id,
    c.name AS customer_name,
    SUM(o.total_amount) AS total_spent
FROM read_csv_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/customers.csv') c
JOIN read_json_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/orders.json') o
    ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, 
    c.name
ORDER BY total_spent DESC
LIMIT 3;


-- Q3 - Products associated with Bangalore customers
-- Note: No product_id exists in orders.json, so a direct relational join is not possible.
SELECT DISTINCT 
    p.product_name
FROM read_csv_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/customers.csv') c
JOIN read_json_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/orders.json') o
    ON c.customer_id = o.customer_id
JOIN read_parquet('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/products.parquet') p
    ON TRUE
WHERE c.city = 'Bangalore';


-- Q4 - Combined view (best possible join)
-- Note: No product_id exists in orders.json, so product linkage is not truly relational.
-- The join with products is demonstrative only.

SELECT 
    c.name AS customer_name,
    o.order_date,
    p.product_name,
    o.num_items AS quantity
FROM read_csv_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/customers.csv') c
JOIN read_json_auto('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/orders.json') o
    ON c.customer_id = o.customer_id
JOIN read_parquet('C:/Users/Pratima/OneDrive/Documents/assignment-02-bitsom_ba_2511746/datasets/products.parquet') p
    ON TRUE;