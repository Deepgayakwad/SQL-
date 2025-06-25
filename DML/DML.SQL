CREATE TABLE account2(

    id INT,
    name VARCHAR(255),
    balance INT NOT NULL DEFAULT 0          -- this indicate that the default value of balance is zero 
);

INSERT INTO account2(id,name)          -- here not specify the balance as parameter but it also include in table as default value is 0 
VALUES
(101,'XYZ'),
(102,'ABC');

-- SELECT * FROM account2;

-- *************************************************************************************
-- alter operation ADD , MODIFY , CHANGE COLUMN , DROP COLUMN  , RENAME 

--   ADD NEW COLUMN 
-- ALTER TABLE account2 ADD acc_validity INT NOT NULL DEFAULT 1;     -- add the new column to the table account
-- SELECT * FROM account2;

--   MODIFY                                                -- MODIFY THE DATA TYPE OF BALANCE FROM INT TO DOUBLE
-- ALTER TABLE account2 MODIFY balance DOUBLE NOT NULL;
-- DESC account2;                                            -- IT DESCRIBE ABOUT THE VARIOURS TABLE FIELDS


USE temp;
-- CHANGE COLUMN -- RENAME THE COLUMN NAME 
-- ALTER TABLE account2 CHANGE COLUMN balance curr_balance DOUBLE NOT NULL;
-- SELECT * FROM account2;


-- DROP THE PARTICULAR COLUMN 
-- ALTER TABLE account2 DROP COLUMN acc_validity;                IT IS USED TO DELETE THE PARTICULAR COLUMN

-- RENAME THE TABLE NAME 
ALTER TABLE account2 RENAME TO account_details;

DESC account_details;


-- ****************************************************************************
--             ----    DATA MANIPULATION LANGUAGE  ---
--   INSERT , UPDATE , DELETE , REPLACE 

-- INSERT INTO account_details(name,curr_balance)
-- VALUES 
-- ('PQR',3000);                                     it will display name as null because it is not given in parameter passing 

-- SELECT * FROM account_details;

-- UPDATE 
USE temp;
UPDATE account_details SET name='EFG' WHERE id = 102;      
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM account_details;


-- UPDATE THE MULTIPLE ROWS 
-- UPDATE account_details SET curr_balance = 5000;              it update the all curr_balance value equal to 5000
-- UPDATE account_details SET curr_balance = curr_balance + 1;
-- SELECT * FROM account_details;

-- SET SQL_SAFE_UPDATES = 1;

-- DELETE THE PARTICULAR ROW 
-- DELETE FROM account_details WHERE name = 'PQR';
-- SELECT * FROM account_details;

USE temp;
-- 4..USE OF REPLACE
-- REPLACE INTO account_details(id,name,balance)
-- VALUES(
SELECT * FROM account_details;

REPLACE INTO account_details(id,name,curr_balance)
VALUES(101,'DP',100000);

REPLACE INTO account_details SET id = 102 , name = 'pp' , curr_balance = 500000;
SELECT * FROM account_details;

ALTER TABLE account_details
ADD UNIQUE (id);

ALTER TABLE account_details
ADD CONSTRAINT pk_account_id PRIMARY KEY (id);

USE TEMP;
DELETE FROM account_details
WHERE id = 101;
SELECT * FROM account_details;


SET SQL_SAFE_UPDATES = 0;
DELETE FROM account_details
WHERE id = 101;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO account_details(id,name,curr_balance)
VALUES 
(101,'ABC',606060);

SELECT * FROM account_details;
REPLACE INTO account_details (id, name, curr_balance)
VALUES (101, 'aaa', 9999);

DELETE FROM account_details
WHERE id IN (101,102);

ALTER TABLE account_details
ADD CONSTRAINT pk_account_id PRIMARY KEY (id);

INSERT INTO account_details(id,name,curr_balance)
VALUES 
(101,'ABC',202020),
(102,'PQR',303030);

SELECT * FROM account_details;

-- REPLACE INTO account_details(id,name,curr_balance)
-- VALUES                                                   REPLACES THE NAME AND CURR_BALANCE OF ID 101
-- (101,'XYZ',500);

REPLACE INTO account_details SET id = 102 , name = 'dp', curr_balance = 1000;

-- REPLACE INTO account_details(id,name,curr_balance)
-- VALUES                                                            NEW ENTRIES ARE INSERTED BECAUSE 103 IS NOT FOUND IN TABLE 
-- (103,'LPLP',600);
