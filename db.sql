-- DB File --

-- creating the database
CREATE DATABASE bookstore;
USE BookstoreDB;

-- creating the tables
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

CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE book_language (
    language_id INT PRIMARY KEY AUTO_INCREMENT,
    language_name VARCHAR(100)
);

CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255)
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
 ('Harry Potter and the Sorcerer\'s Stone', 1, 1, 19.99, 100),
 ('A Game of Thrones', 1, 2, 29.99, 50),
 ('The Hobbit', 1, 3, 15.99, 75);

INSERT INTO book_author (book_id, author_id) VALUES
 (1, 1), 
 (2, 2), 
 (3, 3);

