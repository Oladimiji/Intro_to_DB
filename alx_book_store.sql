-- Use the alx_book_store database
USE alx_book_store;

-- Create the authors table
CREATE TABLE AUTHORS (
    -- Fill in columns from Task 0, e.g.:
    AUTHOR_ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    BIRTH_YEAR INT,
    -- ... other columns
    -- Add unique constraints, default values, etc. as per Task 0
);

-- Create the books table
CREATE TABLE BOOKS (
    BOOK_ID INT PRIMARY KEY AUTO_INCREMENT,
    TITLE VARCHAR(255) NOT NULL,
    AUTHOR_ID INT,
    PRICE DECIMAL(10, 2) NOT NULL,
    PUBLICATION_DATE DATE,
    -- Add foreign key constraint to AUTHORS table
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
    -- ... other columns
);

-- Create the customers table
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    ADDRESS VARCHAR(255),
    PHONE_NUMBER VARCHAR(20),
    -- ... other columns
);

-- Create the orders table
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_ID INT,
    ORDER_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TOTAL_AMOUNT DECIMAL(10, 2) NOT NULL,
    -- Add foreign key constraint to CUSTOMERS table
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
    -- ... other columns
);

-- Create the order_details table (Note: "order details" should probably be order_details or OrderDetails for SQL)
-- Assuming "order details" refers to order_details
CREATE TABLE ORDER_DETAILS (
    ORDER_DETAIL_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY INT NOT NULL,
    UNIT_PRICE DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
    -- Add composite primary key if needed, e.g., PRIMARY KEY (ORDER_ID, BOOK_ID)
    -- ... other columns
);