-- 1. DDL: Data Definition Language
CREATE DATABASE school_management;

USE school_management;

CREATE TABLE courses (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	credits INT NOT NULL
);

-- DML: Data Manipulation Language

INSERT INTO courses (course_name, credits) VALUES 
					('Java Programming', 70),
                    ('SQL Basics', 50),
                    ('Web Development', 80),
                    ('.NET Programming', 70),
                    ('C# Programming', 60);
                    
SELECT * FROM courses;
SELECT course_name FROM courses;
                    
UPDATE courses SET credits = 100 
WHERE id = 1;

DELETE FROM courses WHERE id = 4;

-- DQL: Data Query Language

CREATE TABLE student (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	class_group VARCHAR(50) NOT NULL,
	create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO student (name, class_group) 
VALUES ('Erik Andersson', 'G1'),
       ('Anna Johansson', 'G1'),
       ('Lars Karlsson', 'G2'),
       ('Maria Nilsson', 'G2'),
       ('Gustav Eriksson', 'G1'),
       ('Ingrid Larsson', 'G3'),
       ('Olof Olsson', 'G3'),
       ('Karin Persson', 'G1'),
       ('Maja Gustafsson', 'G2'),
       ('Nils Pettersson', 'G3');
       
SELECT * FROM student;

SELECT name FROM student WHERE class_group = 'G1';

SELECT name, class_group FROM student WHERE class_group = 'G1';

SELECT name, class_group FROM student WHERE class_group = 'G3';

SELECT * FROM student WHERE name LIKE 'J%';

SELECT * FROM student WHERE name LIKE 'N%';

SELECT * FROM student WHERE name LIKE '%n';

SELECT * FROM student WHERE name LIKE 'n%n';

-- Joins and Relationships

CREATE TABLE attendance (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_Id INT NOT NULL,
    attendance_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    status ENUM('Present', 'Absent') NOT NULL,
    
    FOREIGN KEY (student_Id) REFERENCES student(id),
    UNIQUE (student_Id, attendance_date)
);

INSERT INTO attendance (student_Id, attendance_date, status)
VALUES 	(1, '2024-01-01', 'Present'),
		(2, '2024-01-01', 'Absent'),
        (3, '2024-01-01', 'Present'),
        (4, '2024-01-01', 'Present'),
        (5, '2024-01-01', 'Absent'),
        (6, '2024-01-01', 'Present'),
        (7, '2024-01-01', 'Present'),
        (8, '2024-01-01', 'Present'),
        (9, '2024-01-01', 'Absent'),
        (10, '2024-01-01', 'Present'),
        (1, '2024-01-02', 'Present'),
        (2, '2024-01-02', 'Absent'),
        (3, '2024-01-02', 'Present'),
        (4, '2024-01-02', 'Present'),
        (5, '2024-01-02', 'Absent'),
        (6, '2024-01-02', 'Present'),
        (7, '2024-01-02', 'Absent'),
        (8, '2024-01-02', 'Present'),
        (9, '2024-01-02', 'Present'),
        (10, '2024-01-02', 'Absent'),
        (1, '2024-01-03', 'Present'),
        (2, '2024-01-03', 'Present'),
        (3, '2024-01-03', 'Present'),
        (4, '2024-01-03', 'Absent'),
        (5, '2024-01-03', 'Present'),
        (6, '2024-01-03', 'Present'),
        (7, '2024-01-03', 'Absent'),
        (8, '2024-01-03', 'Present'),
        (9, '2024-01-03', 'Present'),
        (10, '2024-01-03', 'Absent'),
        (1, '2024-01-04', 'Present'),
        (2, '2024-01-04', 'Present'),
        (3, '2024-01-04', 'Absent'),
        (4, '2024-01-04', 'Present'),
        (5, '2024-01-04', 'Present'),
        (6, '2024-01-04', 'Present'),
        (7, '2024-01-04', 'Present'),
        (8, '2024-01-04', 'Absent'),
        (9, '2024-01-04', 'Present'),
        (10, '2024-01-04', 'Present'),
		(1, '2024-01-05', 'Absent'),
        (2, '2024-01-05', 'Present'),
        (3, '2024-01-05', 'Present'),
        (4, '2024-01-05', 'Present'),
        (5, '2024-01-05', 'Absent'),
        (6, '2024-01-05', 'Present'),
        (7, '2024-01-05', 'Present'),
        (8, '2024-01-05', 'Present'),
        (9, '2024-01-05', 'Absent'),
        (10, '2024-01-05', 'Present'),
        (1, '2024-01-06', 'Present'),
        (2, '2024-01-06', 'Absent'),
        (3, '2024-01-06', 'Present'),
        (4, '2024-01-06', 'Present');

SELECT * FROM attendance;

SELECT student.id, student.name, attendance.status
FROM student
INNER JOIN attendance ON student.id = attendance.student_Id;

SELECT student.id, student.name, attendance.status
FROM student
LEFT JOIN attendance ON student.id = attendance.student_Id;

-- Aggregation and Grouping

SELECT COUNT(*) FROM student;

SELECT COUNT(*) AS "No of Students" FROM student;

SELECT COUNT(*) AS "No of Present" 
FROM attendance
WHERE status = 'Present'
GROUP BY status;

SELECT COUNT(*) AS "No of Absent" 
FROM attendance
WHERE status = 'Absent'
GROUP BY status;

SELECT student.name, COUNT(*) AS "No of Days Present"
FROM student
INNER JOIN attendance ON student.id = attendance.student_Id
WHERE attendance.status = 'Present'
GROUP BY student.id, student.name;