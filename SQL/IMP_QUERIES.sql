CREATE DATABASE org;
USE org;

CREATE TABLE Worker (
    WORKER_ID INT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50)
);

-- Step 2: Insert the data
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(002, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');


CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID)
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(1, 5000, '2016-02-20 00:00:00'),
(2, 3000, '2016-06-11 00:00:00'),
(3, 4000, '2016-02-20 00:00:00'),
(1, 4500, '2016-02-20 00:00:00'),
(2, 3500, '2016-06-11 00:00:00');

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE VARCHAR(50),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID)
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(1, 'Manager', '2016-02-20 00:00:00'),
(2, 'Executive', '2016-06-11 00:00:00'),
(8, 'Executive', '2016-06-11 00:00:00'),
(4, 'Manager', '2016-06-11 00:00:00'),
(5, 'Asst. Manager', '2016-06-11 00:00:00'),
(7, 'Executive', '2016-06-11 00:00:00');

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(FIRST_NAME) FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker;

-- Q-4. Write an SQL query to print the first three characters of FIRST_NAME from Worker table.
SELECT SUBSTRING(FIRST_NAME,1,3) FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT INSTR(FIRST_NAME,'B') FROM Worker WHERE FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(FIRST_NAME) FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT ,LENGTH(DEPARTMENT) FROM worker ;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing 'a' with 'A'.
SELECT REPLACE(FIRST_NAME,'a','A') FROM Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME)  FROM Worker;
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS COMPLETE_NAME FROM Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker ORDER BY first_name ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by
-- FIRST NAME ASCENDING AND DEPARTMENT DESCENDING 
SELECT * FROM Worker ORDER BY FIRST_NAME ASC , DEPARTMENT DESC;


-- Q-13. Write an SQL query to print details for Workers with the first name as "Vipul" and "Satish" from Worker table.
SELECT * FROM Worker 
WHERE FIRST_NAME IN ('VIPUL','SATISH');


-- Q-14. Write an SQL query to print details of workers excluding first names, "Vipul" and "Satish" from Worker table.
SELECT * FROM Worker 
WHERE FIRST_NAME NOT IN ('VIPUL','SATISH');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as "Admin*".
SELECT * FROM Worker WHERE DEPARTMENT LIKE 'Admin%';     -- IT WILL PRINT ALL THE DEPARTMANT NAMES STARTING WITH ADMIN 

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'a'.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with 'h' and contains six alphabets.
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;     -- NOTE THAT 100000 AND 500000 IS INCLUSIVE 

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb'2014.
SELECT * FROM Worker WHERE YEAR(JOINING_DATE) = 2014 AND MONTH(JOINING_DATE) = 02;


-- Q-21. Write an SQL query to fetch the count of employees working in the department 'Admin'.
SELECT DEPARTMENT,COUNT(DEPARTMENT) FROM Worker WHERE DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS FULL_NAME FROM Worker WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT DEPARTMENT,COUNT(WORKER_ID) FROM Worker GROUP BY DEPARTMENT ORDER BY COUNT(WORKER_ID) DESC ;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT * FROM Worker AS W  INNER JOIN TITLE AS t ON W.WORKER_ID = t.WORKER_REF_ID  WHERE t.WORKER_TITLE = 'manager';
SELECT w.* FROM Worker AS W  INNER JOIN TITLE AS t ON W.WORKER_ID = t.WORKER_REF_ID  WHERE t.WORKER_TITLE = 'manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same title in ORG of different types
SELECT WORKER_TITLE,COUNT(WORKER_TITLE) FROM TITLE GROUP BY WORKER_TITLE HAVING COUNT(WORKER_TITLE) > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD(WORKER_ID , 2) != 0 ;
SELECT * FROM Worker WHERE MOD(WORKER_ID , 2) <> 0 ;       -- != AND <> ARE BEHAVE AS NOT EQUAL TO SIGN 

-- Q-27. Write an SQL query to show only even rows from a table.
SELECT * FROM Worker WHERE MOD(WORKER_ID,2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE Worker_clone LIKE Worker;
INSERT INTO Worker_clone SELECT * FROM Worker;
SELECT * FROM Worker_clone;


-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT worker.* FROM Worker INNER JOIN Worker_clone using(WORKER_ID);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT WORKER.* FROM Worker LEFT JOIN Worker_clone using(WORKER_ID) WHERE Worker_clone.WORKER_ID IS NULL;
SELECT * FROM Worker LEFT JOIN Worker_clone using(WORKER_ID) WHERE Worker_clone.WORKER_ID IS NULL;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
SELECT curdate();   -- this will give you curr date 
SELECT now();      -- it will give you current date and time 

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker ORDER BY SALARY DESC LIMIT 4,1;            -- IT INDICATE EXCEPT FIRST FOUR ENTRIES GIVE 1ST THAT IS 5TH ENTRY 

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT salary FROM Worker as w1
WHERE 4 = (
SELECT COUNT(DISTINCT(w2.salary))
FROM Worker w2
WHERE w2.salary >= w1.salary

);


-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT * FROM Worker w1, Worker w2 WHERE w1.salary = w2.salary AND w1.WORKER_ID != w2.WORKER_ID ;
SELECT w1.* FROM Worker w1, Worker w2 WHERE w1.salary = w2.salary AND w1.WORKER_ID != w2.WORKER_ID ;

-- Q-36. Write an SQL query to show the second highest salary from a table using subquery 
SELECT MAX(SALARY) FROM Worker 
WHERE SALARY NOT IN (SELECT MAX(SALARY) FROM WORKER);

-- Q-37. Write an SQL query to show one row twice in results from a table.
select * from worker
UNION ALL
select * from worker ORDER BY WORKER_ID;

select * from worker
UNION 
select * from worker;

-- PLEASE NOTE THE DIFFERENCE BEETWEEN ABOVE TWO QUERIES 

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT WORKER_ID FROM WORKER WHERE WORKER_ID NOT IN (SELECT WORKER_REF_ID FROM BONUS);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.

SELECT * FROM Worker WHERE WORKER_ID <= (SELECT COUNT(WORKER_ID)/ 2 FROM Worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT,COUNT(DEPARTMENT) AS COUNT FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT,COUNT(DEPARTMENT) AS NO_OF_PEOPLE FROM Worker GROUP BY DEPARTMENT ;


-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker WHERE WORKER_ID  = (SELECT MAX(WORKER_ID) FROM Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker WHERE WORKER_ID  = (SELECT MIN(WORKER_ID) FROM Worker);

-- Q-44.Write an SQL query to fetch the last five records from a table.
(SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5) ORDER BY WORKER_ID;

-- Q-45
-- Write an SQL query to print the name of employees having the highest salary in each department.
SELECT FIRST_NAME , LAST_NAME,DEPARTMENT,SALARY FROM Worker WHERE SALARY IN (SELECT MAX(SALARY) FROM Worker GROUP BY DEPARTMENT);

-- Q-46. Write an SQL query to fetch three max salaries from a table. WITHOUT USING LIMIT KEYWORD 
SELECT DISTINCT SALARY FROM WORKER AS W1
WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W1.SALARY <= W2.SALARY) ORDER BY W1.SALARY DESC;

-- Q-47. Write an SQL query to fetch three min salaries from a table. WITHOUT USING LIMIT KEYWORD 
SELECT DISTINCT SALARY FROM WORKER AS W1
WHERE 3 >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W1.SALARY >= W2.SALARY) ORDER BY W1.SALARY;

-- Q-48 . Write an SQL query to fetch nth max salaries from a table.
SELECT DISTINCT SALARY FROM WORKER AS W1
WHERE n >= (SELECT COUNT(DISTINCT SALARY) FROM WORKER AS W2 WHERE W1.SALARY <= W2.SALARY) ORDER BY W1.SALARY DESC;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT DEPARTMENT,SUM(SALARY) AS TOTAL_SALARY FROM Worker GROUP BY DEPARTMENT ORDER BY TOTAL_SALARY DESC;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT FIRST_NAME , LAST_NAME , SALARY FROM WORKER WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER);


USE org;

CREATE TABLE PAIRS(
   
    A INT,
    B INT

);
INSERT INTO PAIRS VALUES (1,2),(2,4),(2,1),(4,2),(3,2),(2,3),(5,6),(7,8);
SELECT * FROM PAIRS;

-- REMOVE REVERSE PAIR 
-- METHOD 1-- JOIN 
SELECT lt.* FROM PAIRS lt LEFT JOIN PAIRS rt ON lt.A = rt.B AND lt.B = rt.A WHERE rt.A IS NULL OR lt.A < rt.A;

-- METHOD 2 
-- CORELATED SUBQUERY 
SELECT * FROM PAIRS AS P1 WHERE NOT EXISTS (SELECT * FROM PAIRS P2 WHERE P1.B = P2.A AND P1.A = P2.B AND P1.A > P2.A);




