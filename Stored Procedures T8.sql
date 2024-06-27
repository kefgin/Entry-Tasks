
DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //

DELIMITER ;


-- Adding Workers Details
CALL AddWorker(1, 'John', 'Doe', 50000, '2023-01-01', 'HR');
CALL AddWorker(2, 'Jane', 'Smith', 60000, '2022-06-15', 'Finance');
CALL AddWorker(3, 'Mike', 'Johnson', 55000, '2021-03-10', 'IT');
CALL AddWorker(4, 'Emily', 'Davis', 48000, '2020-08-20', 'HR');
CALL AddWorker(5, 'Robert', 'Brown', 62000, '2019-11-05', 'Finance');
CALL AddWorker(6, 'Linda', 'Wilson', 47000, '2021-12-12', 'IT');
CALL AddWorker(7, 'David', 'Taylor', 52000, '2022-01-30', 'HR');
CALL AddWorker(8, 'Susan', 'Anderson', 53000, '2018-04-22', 'Finance');
CALL AddWorker(9, 'James', 'Thomas', 58000, '2019-05-15', 'IT');
CALL AddWorker(10, 'Patricia', 'Jackson', 49000, '2023-02-14', 'HR');

-- Procedure to retrieve the salary of a worker
DELIMITER //

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,
    OUT p_Salary INT
)
BEGIN
    SELECT Salary INTO p_Salary
    FROM Worker
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- Procedure call
CALL GetWorkerSalary(1, @salary);
SELECT @salary;

-- Procedure to update the department of a worker
 DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,
    IN p_Department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_Department
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

-- Procedure to retrieve the number of workers in a department
DELIMITER //

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;

CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount;

-- Procedure to retrieve the average salary of a workers in a department 
DELIMITER //

CREATE PROCEDURE GetAvgSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_Department;
END //

DELIMITER ;


-- Procedure call
CALL GetAvgSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary;



