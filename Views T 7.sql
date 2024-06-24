CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);


INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Elm St', 'Los Angeles', 'California', '90001', 'US'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '123-456-7891', '456 Oak St', 'San Francisco', 'California', '94101', 'US'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7892', '789 Pine St', 'New York', 'New York', '10001', 'US'),
(4, 'Bob', 'Brown', 'bob.brown@example.com', '123-456-7893', '101 Maple St', 'Chicago', 'Illinois', '60601', 'US'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '123-456-7894', '202 Birch St', 'Houston', 'Texas', '77001', 'US'),
(6, 'Eva', 'Miller', 'eva.miller@example.com', '123-456-7895', '303 Cedar St', 'Phoenix', 'Arizona', '85001', 'US'),
(7, 'Frank', 'Wilson', 'frank.wilson@example.com', '123-456-7896', '404 Spruce St', 'Philadelphia', 'Pennsylvania', '19101', 'US'),
(8, 'Grace', 'Moore', 'grace.moore@example.com', '123-456-7897', '505 Aspen St', 'San Antonio', 'Texas', '78201', 'US'),
(9, 'Hank', 'Taylor', 'hank.taylor@example.com', '123-456-7898', '606 Redwood St', 'Dallas', 'Texas', '75201', 'US'),
(10, 'Ivy', 'Anderson', 'ivy.anderson@example.com', '123-456-7899', '707 Willow St', 'Austin', 'Texas', '73301', 'US'),
(11, 'Jack', 'Thomas', 'jack.thomas@example.com', '123-456-7900', '808 Cherry St', 'Los Angeles', 'California', '90002', 'US');


SELECT* FROM Customer;

-- CREATE THE CUSTOMER_INFO VIEW 
CREATE VIEW customer_info AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name, 
    Email
FROM 
    Customer;
    
 -- SELECT OPERATION FOR CUSTOMER_INFO VIEW
 SELECT * FROM customer_info;
 
 -- CREATE US_COUSTOMERS VIEW
 CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'US';

-- CREATE THE COUSTOMER_DETAILS VIEW
CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_name, 
    Email, 
    Phone_no, 
    State
FROM 
    Customer;

-- UPDATE PHONE NO. WHO LIVE IN CALIFORNIA FOR COUSTOMER DETAILS VIEW
UPDATE Customer
SET Phone_no = 'New_Phone_Number'
WHERE State = 'California';

-- COUNT THE NO. OF CUSTOMERS IN EACH STATE AND SHOW ONLY STATES WITH MORE THAN 5 CUSTOMERS
SELECT State, COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;

-- TO RETURN THE NO. OF CUSTOMERS IN EACH STATE BASED ON THE 'STATE' COLUMN IN THE CUSTOMER DETAILS 
SELECT State, COUNT(*) AS Customer_Count
FROM Customer_details
GROUP BY State;

-- TO RETURN ALL THE COLUMNS FROM THE CUSTOMER_DETAILS VIEW SORTED BY THE STATE COLUMN IN ASCENDING ORDER
SELECT * 
FROM Customer_details
ORDER BY State ASC;




 


