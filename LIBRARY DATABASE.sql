-- Create the database
CREATE DATABASE library;

-- Use the library database
USE library;

-- Create Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create Books table
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

-- Create Customer table
CREATE TABLE Customers (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

-- Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customers(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Return_cust) REFERENCES Customers(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


-- Insert data into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '123 Main St', '123-456-7890'),
(2, 102, '456 Elm St', '234-567-8901'),
(3, 103, '789 Maple St', '345-678-9012');

SELECT* FROM Branch;

-- Insert data into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(101, 'John Doe', 'Manager', 60000, 1),
(102, 'Jane Smith', 'Manager', 62000, 2),
(103, 'Emily Davis', 'Manager', 63000, 3),
(104, 'Michael Brown', 'Librarian', 45000, 1),
(105, 'Laura Wilson', 'Librarian', 47000, 2),
(106, 'Kevin Johnson', 'Librarian', 50000, 3),
(107, 'Chris Lee', 'Assistant', 35000, 1),
(108, 'Anna White', 'Assistant', 36000, 2);

SELECT* FROM Employee;

-- Insert data into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('978-3-16-1484', 'History of Time', 'History', 30.00, 'yes', 'Stephen Hawking', 'Bantam'),
('978-1-40-2894', 'Data Science Handbook', 'Science', 45.00, 'no', 'Jake VanderPlas', 'O\'Reilly Media'),
('978-0-13-4685', 'Introduction to Algorithms', 'Technology', 55.00, 'yes', 'Thomas H. Cormen', 'MIT Press'),
('978-1-59-3275', 'Eloquent JavaScript', 'Technology', 25.00, 'no', 'Marijn Haverbeke', 'No Starch Press'),
('978-0-06-2301', 'Astrophysics for People in a Hurry', 'Science', 20.00, 'yes', 'Neil deGrasse Tyson', 'W.W. Norton & Company');

SELECT* FROM Books;

-- Insert data into Customer table
INSERT INTO Customers (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'Alice Johnson', '100 First St', '2021-12-20'),
(2, 'Bob Martin', '200 Second St', '2022-02-15'),
(3, 'Cathy Brown', '300 Third St', '2023-01-10'),
(4, 'David Lee', '400 Fourth St', '2021-11-05');

SELECT* FROM Customers;

-- Insert data into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 2, 'Data Science Handbook', '2023-06-10', '978-1-40-2894'),
(2, 3, 'Eloquent JavaScript', '2023-06-20', '978-1-59-3275');

SELECT* FROM IssueStatus;


-- Insert data into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 2, 'Data Science Handbook', '2023-07-10', '978-1-40-2894'),
(2, 3, 'Eloquent JavaScript', '2023-07-20', '978-1-59-3275');

SELECT* FROM ReturnStatus;

-- 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customers c ON i.Issued_cust = c.Customer_Id;

-- 4. Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT c.Customer_name
FROM Customers c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Customers c ON i.Issued_cust = c.Customer_Id
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';

-- 9. Retrieve book_title from book table containing history.
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.
SELECT e.Emp_name, b.Branch_address
FROM Branch b
JOIN Employee e ON b.Manager_Id = e.Emp_Id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
SELECT DISTINCT c.Customer_name
FROM IssueStatus i
JOIN Books b ON i.Isbn_book = b.ISBN
JOIN Customers c ON i.Issued_cust = c.Customer_Id
WHERE b.Rental_Price > 25;
