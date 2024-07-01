CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice', 'Math', 12, 50000),
(2, 'Bob', 'Science', 8, 48000),
(3, 'Charlie', 'English', 5, 45000),
(4, 'David', 'History', 3, 42000),
(5, 'Eve', 'Art', 10, 47000),
(6, 'Frank', 'Music', 15, 55000),
(7, 'Grace', 'Physical Education', 7, 44000),
(8, 'Hank', 'Geography', 6, 46000);

SELECT* FROM teachers;

-- Create Trigger
DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'salary cannot be negative';
    END IF;
END //

DELIMITER ;

-- Create after insert trigger and teacher log table
CREATE TABLE teacher_log1 (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME
);

DELIMITER //
CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log1 (teacher_id, action, timestamp)
    VALUES (NEW.id, 'INSERT', NOW());
END;

DELIMITER ;

SELECT* FROM teacher_log1;

-- create a before delete trigger 

DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END;

DELIMITER ;

SELECT* FROM teachers;

-- Create a after delete trigger 
DELIMITER //
CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp)
    VALUES (OLD.id, 'DELETE', NOW());
END;


DELIMITER ;





