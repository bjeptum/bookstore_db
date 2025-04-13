# 📚 Bookstore Database Management System

## 🧾 Overview

This project is focused on building a **MySQL-based relational database** for a bookstore. 

The goal is to organize and store information about the bookstore's operations, including books, authors, customers, orders, shipping, and more. The database efficiently stores all necessary data and allows for quick retrieval and analysis.



## 🎯 Project Objective

Create a normalized relational database that:

- Stores all key data for bookstore operations
- Supports fast and easy data retrieval
- Allows querying for useful business insights
- Implements user roles and access control for database security


## 🛠 Tools & Technologies

- **MySQL** – Used for creating, managing, and querying the database
- **Draw.io** – Used to design and visualize the Entity Relationship Diagram (ERD)
- **GitHub** – Used for project collaboration and version control


## 🧪 Step-by-Step Instructions

1. **Create the database** in MySQL.
2. **Design the ERD** using Draw.io to map out tables and relationships.
3. **Write SQL** to create the tables and apply relationships.
4. **Insert sample data** to simulate real operations.
5. **Set up users and roles** for controlled access.
6. **Write SQL queries** to test and analyze the data.


## 📈 Learning Outcomes

By completing this project, the collaborators(learners) gained practical experience in:

- Working together on GitHub for version control
- Structuring normalized relational databases for real-world use
- Writing SQL DDL (Data Definition Language) and DML (Data Manipulation Language) statements
- Creating ER diagrams to plan complex data relationships
- Managing user roles and applying database security best practices
- Writing queries to extract data


## 🗂️ Tables Created

| Table Name         | Description |
|--------------------|-------------|
| `book`             | Details of books in the store |
| `book_author`      | Manages the many-to-many relationship between books and authors |
| `author`           | List of authors |
| `book_language`    | Languages books are written in |
| `publisher`        | Book publishers |
| `customer`         | Customer information |
| `customer_address` | Connects customers to their addresses |
| `address_status`   | Status of each address (e.g., current, old) |
| `address`          | Full list of addresses |
| `country`          | Countries related to addresses |
| `cust_order`       | Customer orders |
| `order_line`       | Books in each order |
| `shipping_method`  | Shipping options available |
| `order_history`    | History log of each order |
| `order_status`     | Status options for orders (e.g., pending, delivered) |


## 👥 Collaborators

This project was completed with contributions from the following collaborators:

- [Jeptum Brenda](https://github.com/bjeptum)
- [Mercy Ochieng](https://github.com/254punchlinez)
- [Amy Wanjala](https://github.com/wat-tanya)


