CREATE DATABASE company_db;
USE company_db;

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    fname VARCHAR(50),
    lname VARCHAR(50),
    Age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50)
);

CREATE TABLE Client (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    emailID VARCHAR(100),
    PhoneNo VARCHAR(20),
    City VARCHAR(50),
    empID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id)
);

CREATE TABLE Project (
    id INT PRIMARY KEY,
    empID INT,
    name VARCHAR(50),
    startdate DATE,
    clientID INT,
    FOREIGN KEY (empID) REFERENCES Employee(id),
    FOREIGN KEY (clientID) REFERENCES Client(id)
);

INSERT INTO Employee (id, fname, lname, Age, emailID, PhoneNo, City) VALUES
(1, 'Aman', 'Proto', 32, 'aman@gmail.com', '898', 'Delhi'),
(2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', '222', 'Palam'),
(3, 'Rahul', 'BD', 22, 'rahul@gmail.com', '444', 'Kolkata'),
(4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', '666', 'Raipur'),
(5, 'PK', 'Pandey', 21, 'pk@gmail.com', '555', 'Jaipur');

INSERT INTO Client (id, first_name, last_name, age, emailID, PhoneNo, City, empID) VALUES
(1, 'Mac', 'Rogers', 47, 'mac@hotmail.com', '333', 'Kolkata', 3),
(2, 'Max', 'Poirier', 27, 'max@gmail.com', '222', 'Kolkata', 3),
(3, 'Peter', 'Jain', 24, 'peter@abc.com', '111', 'Delhi', 1),
(4, 'Sushant', 'Aggarwal', 23, 'sushant@yahoo.com', '45454', 'Hyderabad', 5),
(5, 'Pratap', 'Singh', 36, 'p@xyz.com', '77767', 'Mumbai', 2);

INSERT INTO Project (id, empID, name, startdate, clientID) VALUES
(1, 1, 'A', '2021-04-21', 3),
(2, 2, 'B', '2021-03-12', 1),
(3, 3, 'C', '2021-01-16', 5),
(4, 3, 'D', '2021-04-27', 2),
(5, 5, 'E', '2021-05-01', 4);

SELECT * FROM Employee;
SELECT * FROM Client;
SELECT * FROM Project;

USE company_db;

--  INNER JOIN CONTAIN ALL THE COMMON INFO INTO SINGLE COLUMN AND REMAINING INTO OF TWO TABLE ARE MERGE OF PARAMETERS MENTION IN JOIN
SELECT e.id,e.fname,e.lname,p.id,p.name,p.startdate FROM Employee AS e 
INNER JOIN Project AS p ON e.id = p.empID;

-- QUESION --inner join without using the INNER JOIN KEYWORD
SELECT e.id,e.fname,e.lname,p.id,p.name,p.startdate FROM Employee AS e ,
Project AS p WHERE e.id = p.empID;


-- fetch out all the employee ids, their contact details 
-- who is working from jaipur with client name workin in hyderabad 
SELECT e.id , e.emailID, e.PhoneNo, e.City FROM Employee as e 
INNER JOIN Client as c ON e.id = empID Where e.City = 'Jaipur' AND c.City = 'Hyderabad';


-- LEFT JOIN 
-- FETCH OUT EACH PROJECT ALLOCATED TO EACH EMPLOYEE
SELECT * FROM Employee as e 
LEFT JOIN Project as p ON e.id = p.empID;

-- RIGHT JOIN 
-- list out the all the project along with the employee name and their contact details
SELECT p.id , p.name , e.id, e.fname, e.lname , e.emailID FROM project as p
RIGHT JOIN Employee as e ON p.empID = e.id;


-- CROSS JOIN 
-- list out the all the combinations of employee id and project allocation 
SELECT e.id , e.fname,e.lname , p.id, p.name FROM Employee as e
CROSS JOIN Project as p ;