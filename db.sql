-- DB File --
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- create book languages
CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100)
);

-- create publishers table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(255)
);

-- creating book table
CREATE TABLE book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    language_id INT,
    publisher_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- create author
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(255) NOT NULL
);

-- create book_author
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- create country
CREATE TABLE country (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_name VARCHAR(100)
);

-- create address
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- create address status
CREATE TABLE address_status (
    status_id INT PRIMARY KEY AUTO_INCREMENT,
    status_name VARCHAR(50)
);

-- create customer
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- create customer address
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- create order status
CREATE TABLE order_status (
    status_id INT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- create shipping method
CREATE TABLE shipping_method (
    method_id INT PRIMARY KEY,
    method_name VARCHAR(50),
    shipping_cost DECIMAL(10,2)
);

-- create customer order
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME,
    status_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

-- create order history
CREATE TABLE order_history(
    order_history_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    status_id INT,
    change_date DATETIME,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);

--creater order_line
CREATE TABLE order_line(
    order_line_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- inserting values to the data
INSERT INTO book_language (language_name) VALUES
 ('English'), ('Spanish'), ('French');

INSERT INTO publisher (name) VALUES
 ('Penguin Random House'), 
 ('HarperCollins'),
 ('Simon & Schuster');

INSERT INTO author (name) VALUES
 ('J.K. Rowling'), 
 ('George R.R. Martin'),
 ('J.R.R. Tolkien');

INSERT INTO book (title, language_id, publisher_id, price, stock) VALUES
 (Harry Potter and the Sorcerer\'s Stone', 1, 1, 19.99, 100),
 ('A Game of Thrones', 1, 2, 29.99, 50),
 ('The Hobbit', 1, 3, 15.99, 75);

INSERT INTO book_author (book_id, author_id) VALUES
 (1, 1), 
 (2, 2), 
 (3, 3);

-- Insert into country
INSERT INTO country (country_id, country_name) VALUES
(1, 'USA'),
(2, 'UK'),
(3, 'Germany'),
(4, 'Kenya'),
(5, 'Japan');

-- Insert into address
INSERT INTO address (address_id, city, postal_code, country_id) VALUES
(1, 'New York', '10001', 1),
(2, 'London', 'SW1A 1AA', 2),
(3, 'Berlin', '10115', 3),
(4, 'Nairobi', '00100', 4),
(5, 'Tokyo', '100-0001', 5);

-- Insert into address_status
INSERT INTO address_status (status_id, status_name) VALUES
(1, 'Home'),
(2, 'Work'),
(3, 'Billing'),
(4, 'Shipping'),
(5, 'Temporary');

-- Insert into customer
INSERT INTO customer (customer_id, first_name, last_name, email, phone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '+123456789'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '+1987654321'),
(3, 'Ali', 'Khan', 'ali.khan@example.com', '+254712345678'),
(4, 'Maria', 'Garcia', 'maria.garcia@example.com', '+4915123456789'),
(5, 'Kenji', 'Tanaka', 'kenji.tanaka@example.com', '+819012345678');

-- Insert into customer_address
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1), -- John, New York, Home
(2, 2, 2), -- Jane, London, Work
(3, 4, 1), -- Ali, Nairobi, Home
(4, 3, 3), -- Maria, Berlin, Billing
(5, 5, 1); -- Kenji, Tokyo, Home


-- Insert into order_status
INSERT INTO order_status (status_id, status_name) VALUES
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered'),
(4, 'Cancelled'),
(5, 'Returned'),
(6, 'Refunded'),
(7, 'Processing'),
(8, 'On Hold');

-- Insert into shipping_method
INSERT INTO shipping_method (method_id, method_name, shipping_cost) VALUES
(1, 'Standard Shipping', 5.00),
(2, 'Express Shipping', 15.00),
(3, 'Overnight Shipping', 25.00);

-- Insert into cust_order
INSERT INTO cust_order (customer_id, order_date, status_id) VALUES
(1, '2023-10-01 10:00:00', 1),
(2, '2023-10-02 11:30:00', 2),
(3, '2023-10-03 12:45:00', 3),
(4, '2023-10-04 14:15:00', 4),
(5, '2023-10-05 15:30:00', 5);

-- Insert into order_history
INSERT INTO order_history (order_id, status_id, change_date) VALUES
(1, 1, '2023-10-01 10:00:00'),
(2, 2, '2023-10-02 11:30:00'),
(3, 3, '2023-10-03 12:45:00'),
(4, 4, '2023-10-04 14:15:00'),
(5, 5, '2023-10-05 15:30:00');

-- Insert into order_line
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 2, 39.98),
(2, 2, 1, 29.99),
(3, 3, 3, 47.97);
