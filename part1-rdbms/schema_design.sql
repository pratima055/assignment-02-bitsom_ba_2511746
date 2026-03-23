-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- Products Table
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- Sales Representatives Table
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(255) NOT NULL
);

-- Orders Table
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    sales_rep_id VARCHAR(10),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- SAMPLE INSERTS (minimum 5 each)

INSERT INTO customers VALUES
('C101','Amit Shah','amit@gmail.com','Mumbai'),
('C102','Priya Mehta','priya@gmail.com','Delhi'),
('C103','Rahul Jain','rahul@gmail.com','Pune'),
('C104','Sneha Patil','sneha@gmail.com','Mumbai'),
('C105','Karan Verma','karan@gmail.com','Bangalore');

INSERT INTO products VALUES
('P201','Laptop','Electronics',50000),
('P202','Shirt','Clothing',1500),
('P203','Rice','Groceries',100),
('P204','Mobile','Electronics',20000),
('P205','Shoes','Clothing',3000);

INSERT INTO sales_reps VALUES
('S1','Raj Kumar','raj@gmail.com','Delhi Office'),
('S2','Neha Singh','neha@gmail.com','Mumbai HQ'),
('S3','Aman Gupta','aman@gmail.com','Pune Office'),
('S4','Riya Das','riya@gmail.com','Delhi Office'),
('S5','Vikas Jain','vikas@gmail.com','Mumbai HQ');

INSERT INTO orders VALUES
('ORD1','C101','S1','2024-01-01'),
('ORD2','C102','S2','2024-01-02'),
('ORD3','C103','S3','2024-01-03'),
('ORD4','C104','S4','2024-01-04'),
('ORD5','C105','S5','2024-01-05');

INSERT INTO order_items VALUES
(1,'ORD1','P201',1),
(2,'ORD2','P202',2),
(3,'ORD3','P203',5),
(4,'ORD4','P204',1),
(5,'ORD5','P205',2);