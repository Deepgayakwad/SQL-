CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee(

     Id INT,
     fname VARCHAR(255),
     lname VARCHAR(255),
     department VARCHAR(255),
     joining_date DATE,
     salary INT

);

SHOW TABLES;   -- IT GIVES ALL THE TABLES INFORMATION IN GIVEN DATABASE
SHOW DATABASES;    -- IT GIVES THE INFORMATION OF ALL DATABASES NAMES 


CREATE DATABASE ENG;           -- THIS QUERY CREATES A DATABASE ENG
DROP DATABASE ENG;             -- THIS QUERY IS USED TO DELETE THE DATABASE ENG 