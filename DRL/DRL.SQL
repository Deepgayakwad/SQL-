CREATE DATABASE temp;

USE temp;

CREATE TABLE student (

   id INT PRIMARY KEY,
   name VARCHAR(255),
   address TEXT,
   branch VARCHAR(255),
   nickname TEXT
);
INSERT INTO temp.student(id,name,address,branch,nickname)
VALUES
(1,'Dipak','Dhule','Computer','Spiderman'),
(2,'Vedant','Dhule','IT','Vedu'),
(3,'Vinay','Shirur','IT','Sheth'),
(4,'Atharv','Junnar','Computer','Nigga');


--  SELECT * FROM student;     * is used for select the all data of the table
-- SELECT id,name,address FROM student;        here only select the id,name, address from the table
-- SELECT name FROM student;            here only selects the name from the table      


--     use of WHERE COMMAND 
-- SELECT * FROM student WHERE id > 2;     it selects all data of table whoses id is greter than 2 

--       use of BETWEEN command 
-- SELECT * FROM student WHERE id BETWEEN 1 AND 3;          it selects all the data from table whose id is between 1 to 3(inclusive)


--     use of IN to selects multiple options and reduces work of OR command
-- SELECT * FROM student WHERE address IN ('Dhule', 'Shirur')    select all the table data whose address is dhule , shirur 
-- SELECT name FROM student WHERE address IN ('Dhule')            slects all the names from table whose address is dhule 

--    use of NOT IN Command 
-- SELECT name FROM student WHERE address NOT IN ('Dhule')         it selects all the names whose address is not dhule 


INSERT INTO student(id,name,address,branch,nickname)
VALUES 
('5','saurabh','malegaon',NULL,'golu');

--              use of NULL Command 
-- SELECT * FROM student where branch IS NULL;


--       WILDCARD      USE OF LIKE AND '%' AND '-' CHARACTER
-- SELECT * FROM student WHERE name LIKE '%d%';         -- it return all the table of data whose name contain d as letter 
-- SELECT * FROM student WHERE name LIKE '_i%';             it return all the data of a table whose name contain second later as i 

--      use of ORDER BY  FOR SORTING THE DATA 
-- SELECT * FROM student ORDER BY name ASC;             -- IT RETURN ALL THE DATA FROM TABLE BY SORT IN ASCENDING ORDER BASED ON NAME 
-- SELECT * FROM student ORDER BY name DESC;            -- IT RETURN ALL THE DATA FROM TABLE BY SORT IN DESCENDING ORDER BASED ON NAME 


--       USE OF DISTINCT KEYWORD 
-- SELECT branch FROM student;                             -- it return all the branch as multiple branch same     
-- SELECT DISTINCT branch FROM student;                  -- it return all the distinct branch name 


-- USE OF GROUP BY 
-- SELECT branch, COUNT(branch) FROM student GROUP BY branch;     it return all the count of  student of every branch
                                                                 -- here COUNT(branch) is aggregation function without using it above command behave similar ot distinct command 
                                                                 
--   here we add the new column to the table salary and fill the info regarding to each name
ALTER TABLE student
ADD salary INT;

UPDATE student
SET salary = '100000'
WHERE id = 1;

UPDATE student
SET salary = '300000'
WHERE id = 2;

UPDATE student
SET salary = '500000'
WHERE id = 3;

UPDATE student
SET salary = '50000'
WHERE id = 4;

UPDATE student
SET salary = '80000'
WHERE id = 5;



-- USE OF AVG 
-- SELECT branch,AVG(salary) FROM student GROUP BY branch        it display the average salary of each branch 

--   USE OF MIN 
-- SELECT branch, MIN(salary) FROM student GROUP BY branch           it return the minimum salary of each department 

-- USE OF MAX 
-- SELECT branch, MAX(salary) FROM student GROUP BY branch            IT RETURN THE MAXIMUM SALARY OF EACH BRANCH

-- USE OF SUM 
-- SELECT branch, SUM(salary) FROM student GROUP BY branch             IT RETURN THE TOTAL SALARY OF EACH DEPARTMENT 

USE temp;
INSERT INTO temp.student(id,name,address,branch,nickname)
VALUES
(6,'Shubham','Sangamner','Computer','shubhu');


--   USE OF GRUOUP BY HAVING 
--  SELECT branch,COUNT(branch) FROM student GROUP BY branch HAVING COUNT(branch) > 2;         it select the brach whose student count is greater than 2 
  