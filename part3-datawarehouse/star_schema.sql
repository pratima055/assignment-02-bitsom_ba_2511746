-- =========================
-- DIM DATE (from actual data)
-- =========================

INSERT INTO dim_date VALUES
(1, '2023-01-02', 1, 2023, 'January'),
(2, '2023-01-04', 1, 2023, 'January'),
(3, '2023-01-05', 1, 2023, 'January'),
(4, '2023-01-07', 1, 2023, 'January'),
(5, '2023-01-09', 1, 2023, 'January');

-- =========================
-- DIM STORE (real stores)
-- =========================

INSERT INTO dim_store VALUES
(1, 'Chennai Anna', 'Chennai', 'Tamil Nadu'),
(2, 'Bangalore MG', 'Bangalore', 'Karnataka'),
(3, 'Mumbai Central', 'Mumbai', 'Maharashtra'),
(4, 'Pune FC Road', 'Pune', 'Maharashtra');

-- =========================
-- DIM PRODUCT (cleaned categories)
-- =========================

INSERT INTO dim_product VALUES
(101, 'Speaker', 'Electronics'),
(102, 'Smartwatch', 'Electronics'),
(103, 'Jeans', 'Clothing'),
(104, 'Jacket', 'Clothing'),
(105, 'Atta 10kg', 'Grocery');

-- =========================
-- FACT TABLE (REAL DATA)
-- =========================

INSERT INTO fact_sales (date_id, store_id, product_id, quantity, unit_price, total_amount) VALUES
(1, 1, 101, 3, 49262.78, 147788.34),
(2, 2, 102, 3, 58851.01, 176553.03),
(3, 3, 103, 13, 2317.47, 30127.11),
(4, 2, 104, 6, 30187.24, 181123.44),
(5, 1, 105, 9, 52464.00, 472176.00),
(1, 3, 101, 5, 49262.78, 246313.90),
(2, 4, 102, 2, 58851.01, 117702.02),
(3, 1, 103, 7, 2317.47, 16222.29),
(4, 2, 104, 4, 30187.24, 120748.96),
(5, 3, 105, 8, 52464.00, 419712.00);