-- Create database
CREATE SCHEMA LibraryManagement;
USE LibraryManagement;

-- Create authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

-- Create genres table
CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

-- Create books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

-- Create users table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Create borrowed_books table
CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- Insert authors
INSERT INTO authors (author_name) VALUES
('John Smith'),
('Maria Garcia');

-- Insert genres
INSERT INTO genres (genre_name) VALUES
('Science Fiction'),
('Mystery');

-- Insert books
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('The Future World', 2020, 1, 1),
('Mystery of the Lake', 2021, 2, 2);

-- Insert users
INSERT INTO users (username, email) VALUES
('reader1', 'reader1@example.com'),
('reader2', 'reader2@example.com');

-- Insert borrowed books
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2024-02-20', '2024-03-20'),
(2, 2, '2024-02-21', '2024-03-21');