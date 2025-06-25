CREATE DATABASE HOTEL;

USE HOTEL;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100)
);
CREATE TABLE `Order` (
    order_id INT PRIMARY KEY,
    customer_id INT,
    room_number INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE     -- if you not use on delete cascade entry from parent table is not deleted 
);                                                     -- here only write as ON DELETE SET NULL  for on delete null where parent id deleted child id not deleted set as null 



USE HOTEL;
INSERT INTO customer(customer_id,name,contact_number,email)
VALUES
(1,'DIPAK','9699880446','DIPAK@GMAIL.COM');

INSERT INTO `order`(order_id,customer_id,room_number)
VALUES 
(101,1,1001);



-- REFERENTIAL CONSTRAINSTS
-- 1..ON DELETE CASCADE
DELETE FROM Customer WHERE customer_id = 1;     -- WE DELETE FROM CUSTOMER BUT ALSO IT IS DELETE FROM ORDER DETAILS WHICH CONTAIN 
                                                -- KEY 
-- SELECT * FROM `order`;                       -- all entries you are seeing null 


-- 2..ON DELETE NULL





CREATE TABLE account(
    id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT
    CONSTRAINT acc_balance_chk CHECK(balance > 2000)
);

INSERT INTO account
VALUES
(1,'A',3000);

-- INSERT INTO account
-- VALUES                             THESE THREE LINES GIVES ERROR BECAUSE NAME IS UNIQUE YOU TRY TO INSERT A TWICE 
-- (1,'A',4000);

-- INSERT INTO account
-- VALUES                             THESE GIVES CONSTRAINT ACC_BALANCE_CHK IS VIOLATED BECAUSE BALANCED IS 300 WHICH IS LESS THAN 2000
-- (1,'A',300);


-----    use of default constraint
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