-- UNION , INTERSECION(INNER JOIN) , MINUS(LEFT JOIN)

CREATE DATABASE department;
USE department;

CREATE TABLE depart1(
  
   empid INT,
   name VARCHAR(255),
   role VARCHAR(255)

);

CREATE TABLE depart2(
       
	empid INT,
    name VARCHAR(255),
    role VARCHAR(255)
);

INSERT INTO depart1(empid,name,role)
VALUES 
(1,'A','ENGINEER'),
(2,'B','SALESMAN'),
(3,'C','MANAGER'),
(4,'D','SALESMAN'),
(5,'E','ENGINEER');

INSERT INTO depart2(empid,name,role)
VALUES
(3,'C','MANAGER'),
(6,'F','MARKETING'),
(7,'G','SALESMAN');

SELECT * FROM depart1;

-- ------ set operations ------------------------------

-- list out the all employees in the company 
SELECT * FROM depart1
UNION 
SELECT * FROM depart2;

-- 
-- list all the employees in all department who works as salesmans
SELECT * FROM depart1 WHERE role = 'SALESMAN'
UNION
SELECT * FROM depart2 WHERE role = 'SALESMAN';


-- INTERSECTION(INNER JOIN)
-- list out the all employees who works for both department
SELECT * FROM depart1 INNER JOIN depart2 using(empid);
SELECT depart1.* FROM depart1 INNER JOIN depart2 using(empid);


-- MINUS SET OPERATION (LEFT JOIN)
-- list out the employee which are only work in depart1;
SELECT depart1.* FROM depart1 LEFT JOIN depart2 using(empid)
WHERE depart2.empid is NULL;



-- --------------------------------------- Sub Queries(alternative of joins)------------------

-- employee with age greater than 30 
-- query inside query is subquery 
USE company_db;
SELECT * FROM Employee WHERE age IN (SELECT age FROM Employee WHERE age > 30);

-- WHERE CLAUSE DIFFERENT TABLES
-- employee details working more than 1 project 
SELECT * FROM Employee WHERE id IN(
SELECT empID FROM Project GROUP BY empID having COUNT(empID) > 1);

-- single value subquery 
-- employee details having age greater than average age 
SELECT AVG(age) from Employee;       -- gives average age 
SELECT * FROM Employee WHERE age > (SELECT AVG(age) from Employee);

-- from clause --derived tables 
-- select max(age) person whose first name contains 'a';
SELECT MAX(age) FROM (SELECT * FROM Employee WHERE fname like '%a%') AS TEMP; 


-- CORELATED SUBQUERY 
-- FIND 3RD OLDEST EMPLOYEE IN TABLE 

SELECT * 
FROM Employee e1
WHERE 3 = (
 SELECT COUNT(e2.age)
 FROM Employee e2
 WHERE e2.age >=e1.age
 );
 
 
-- ----------  VIEW --------------------------------  WHICH CONTAIN ONLY COLUMN YOU SPECIFY 
SELECT * FROM Employee;

-- creating a view
CREATE VIEW custom_view AS SELECT fname, age FROM Employee;

-- VIEWING FROM VIEW 
SELECT * FROM custom_view;

-- ALTERING THE VIEW                        it add some column to the already created view 
ALTER VIEW custom_view AS SELECT fname, lname, age FROM Employee;
SELECT * FROM custom_view;

-- DROP THE VIEW 
DROP VIEW IF EXISTS custom_view;
