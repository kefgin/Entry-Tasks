-- Create the Count12 table if not exists
CREATE TABLE IF NOT EXISTS Count1 (
    CountyID INT PRIMARY KEY,
    CountyName VARCHAR(255)
);

-- Insert some sample data
INSERT INTO Count1 (CountyID, CountyName) VALUES (1, 'County A'), (2, 'County B');

-- Create the Persons12 table if not exists
CREATE TABLE IF NOT EXISTS Persons1 (
    PersonID INT PRIMARY KEY,
    Name VARCHAR(255),
    CountyID INT,
    DOB DATE,
    FOREIGN KEY (CountyID) REFERENCES Count1(CountyID)
);


-- Insert some sample data
INSERT INTO Persons1 (PersonID, Name, CountyID, DOB) VALUES (1, 'John Doe', 1, '1990-01-01'), (2, 'Jane Smith', 2, '1985-05-15');

-- Calculate Age function
DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE()) - 
              (RIGHT(CURDATE(), 5) < RIGHT(DOB, 5));
    RETURN Age;
END //

DELIMITER ;

-- Select query to fetch the Age of all persons using the function
SELECT PersonID, Name, DOB, CalculateAge(DOB) AS Age
FROM Persons1;

-- Inner join query
SELECT p.PersonID, p.Name, p.DOB, c.CountyName
FROM Persons1 p
INNER JOIN Count1 c ON p.CountyID = c.CountyID;


-- Perform LEFT JOIN
SELECT p.PersonID, p.Name, p.DOB, c.CountyName
FROM Persons1 p
LEFT JOIN Count1 c ON p.CountyID = c.CountyID;

Select* From Persons1;
Select* From Count1;

-- Perform RIGHT JOIN

SELECT p.PersonID, p.Name, p.DOB, c.CountyName
FROM Persons1 p
RIGHT JOIN Count1 c ON p.CountyID = c.CountyID;

