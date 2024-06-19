CREATE TABLE Country_CC (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(255),
    Population INT,
    Area FLOAT
);

SELECT* FROM Country_CC;

CREATE TABLE Persons_PP (
    Id INT PRIMARY KEY,
    Fname VARCHAR(255),
    Lname VARCHAR(255),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    Country_name VARCHAR(255),
    FOREIGN KEY (Country_Id) REFERENCES Country_CC(Id)
);

-- Insert 10 rows into Country_CC table
INSERT INTO Country_CC (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331002651, 9833520),
(2, 'Canada', 37742154, 9984670),
(3, 'Mexico', 128932753, 1964375),
(4, 'UK', 67886011, 243610),
(5, 'Germany', 83783942, 357022),
(6, 'France', 65273511, 551695),
(7, 'Italy', 60461826, 301340),
(8, 'Spain', 46754778, 505992),
(9, 'Australia', 25499884, 7692024),
(10, 'India', 1380004385, 3287263);

SELECT* FROM Country_CC;

-- Insert 10 rows into Persons_PP table
INSERT INTO Persons_PP (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 1000, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 1200, 4.2, 2, 'Canada'),
(3, 'Carlos', 'Lopez', 1100, 4.8, 3, 'Mexico'),
(4, 'Emma', 'Brown', 900, 4.7, 4, 'UK'),
(5, 'Liam', 'Johnson', 800, 4.6, 5, 'Germany'),
(6, 'Sophia', 'Davis', 700, 4.9, 6, 'France'),
(7, 'James', 'Wilson', 600, 4.1, 7, 'Italy'),
(8, 'Olivia', 'Martinez', 500, 4.3, 8, 'Spain'),
(9, 'William', 'Anderson', 400, 4.4, 9, 'Australia'),
(10, 'Ava', 'Taylor', 300, 4.0, 10, 'India');

SELECT* FROM Persons_PP;

-- print the first three characters of Country_name from the Country_CC table
SELECT LEFT(Country_name, 3) AS FirstThreeChars FROM Country_CC;

-- Concatenate first name and last name from Persons_PP table
SELECT CONCAT(Fname, ' ', Lname) AS FullName FROM Persons_PP;

-- count the number of unique country names from Persons_PP table
SELECT COUNT(DISTINCT Country_name) AS UniqueCountryNames FROM Persons_PP;

-- print the maximum population from the Country_CC table
SELECT MAX(Population) AS MaxPopulation FROM Country_CC;

-- print the minimum population from Persons_PP table
SELECT MIN(Population) AS MinPopulation FROM Persons_PP;

-- Insert 2 new rows to the Persons_PP table with Lname as NULL and count Lname from Persons_PP table
INSERT INTO Persons_PP (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(11, 'Noah', NULL, 250, 4.2, 1, 'USA'),
(12, 'Mia', NULL, 150, 4.3, 2, 'Canada');

SELECT COUNT(Lname) AS LnameCount FROM Persons_PP;

-- find the number of rows in the Persons_PP table
SELECT COUNT(*) AS TotalRows FROM Persons_PP;

-- return the current date and time
SELECT NOW() AS CurrentDateTime;

-- show the population of the Country_CC table for the first 3 rows
SELECT Population FROM Country_CC
ORDER BY Id
LIMIT 3;

-- print 3 random rows of countries
SELECT * FROM Country_CC
ORDER BY RAND()
LIMIT 3;










