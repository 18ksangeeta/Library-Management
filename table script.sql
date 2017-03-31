create database libraryhome;

use library;

drop table book;

CREATE TABLE book (
    isbn VARCHAR(10) PRIMARY KEY,
    title VARCHAR(200)
);

drop table BOOK_TEMP;

CREATE TABLE BOOK_TEMP (
	author_id int primary key auto_increment,
    isbn VARCHAR(10),
    title VARCHAR(200),
    author varchar(100)
);

ALTER TABLE BOOK_TEMP AUTO_INCREMENT = 101001;

drop table book_authors;

CREATE TABLE book_authors (
    author_id INTEGER REFERENCES authors (author_id),
    isbn VARCHAR(10) REFERENCES book (isbn),
	primary key(author_id,isbn)
);

drop table authors;

CREATE TABLE authors (
    author_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

ALTER TABLE authors AUTO_INCREMENT = 101001;

drop table borrower;

CREATE TABLE borrower (
    card_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    ssn VARCHAR(12) UNIQUE,
    fname VARCHAR(50),
    lname VARCHAR(50),
    address INTEGER REFERENCES address (address_id),
    phone varchar(20)
);

drop table borrower_TEMP;

CREATE TABLE borrower_temp (
    card_id VARCHAR(7),
    SSn varchar(12) UNIQUE,
    fname VARCHAR(50),
    lname VARCHAR(50),
    address_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(100),
    city VARCHAR(20),
    state VARCHAR(2),
    phone varchar(20)
);

ALTER TABLE borrower_temp AUTO_INCREMENT = 201;

drop table address;

CREATE TABLE address (
    address_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(50),
    city VARCHAR(20),
    state VARCHAR(2)
);

ALTER TABLE address AUTO_INCREMENT = 201;

drop table book_loans;

CREATE TABLE book_loans (
    loan_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(10) REFERENCES book (isbn),
    card_id INTEGER REFERENCES borrower (card_id),
    date_out DATE,
    due_date DATE,
    date_in DATE
);

alter table book_loans auto_increment = 7001;

drop table fines;

CREATE TABLE fines (
    loan_id INTEGER primary key REFERENCES book_loans (loan_id),
    fine_amt FLOAT,
    paid VARCHAR(1)
);