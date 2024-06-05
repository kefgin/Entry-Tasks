
CREATE TABLE Ma (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 0),
    Last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Gender CHAR(1),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Ma (Manager_Id, First_name, Last_Name, DOB, Age, Last_update, Gender, Department, Salary)
VALUES 
(1, 'John', 'Doe', '1980-05-15', 44, CURRENT_TIMESTAMP, 'M', 'IT', 30000.00),
(2, 'Aaliya', 'Singh', '1985-08-20', 38, CURRENT_TIMESTAMP, 'F', 'HR', 27000.00),
(3, 'Michael', 'Brown', '1975-12-10', 48, CURRENT_TIMESTAMP, 'M', 'Finance', 32000.00),
(4, 'Susan', 'Miller', '1990-01-25', 34, CURRENT_TIMESTAMP, 'F', 'IT', 26000.00),
(5, 'Robert', 'Wilson', '1988-04-30', 36, CURRENT_TIMESTAMP, 'M', 'Marketing', 28000.00),
(6, 'Linda', 'Taylor', '1982-07-18', 41, CURRENT_TIMESTAMP, 'F', 'IT', 35000.00),
(7, 'David', 'Anderson', '1992-11-05', 31, CURRENT_TIMESTAMP, 'M', 'HR', 29000.00),
(8, 'Karen', 'Thomas', '1978-03-17', 46, CURRENT_TIMESTAMP, 'F', 'Finance', 31000.00),
(9, 'James', 'Jackson', '1983-09-25', 40, CURRENT_TIMESTAMP, 'M', 'Marketing', 27000.00),
(10, 'Patricia', 'Martinez', '1995-06-10', 28, CURRENT_TIMESTAMP, 'F', 'IT', 33000.00);
SELECT First_name, Last_Name, DOB
FROM Ma
WHERE Manager_Id = 1;

SELECT First_name, Last_Name, (Salary * 12) AS Annual_Income
FROM Ma;

SELECT *
FROM Ma
WHERE First_name <> 'Aaliya';

SELECT *
FROM Ma
WHERE Department = 'IT' AND Salary > 25000.00;

SELECT *
FROM Ma
WHERE Salary BETWEEN 10000.00 AND 35000.00;

