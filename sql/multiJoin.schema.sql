-- USE THIS SCHEMA FOR A 1-MANY MULTI JOIN RELATIONSHIP

DROP DATABASE IF EXISTS school3_db;
CREATE DATABASE school3_db;

USE school3_db; 

CREATE TABLE departments (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(30) NOT NULL
);

CREATE TABLE teachers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(30) NOT NULL,
  department_id INT,
  FOREIGN KEY (department_id)
   REFERENCES departments(id)
   ON DELETE SET NULL
);

CREATE TABLE students (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(30) NOT NULL,
  teacher_id INT,
  FOREIGN KEY (teacher_id)
   REFERENCES teachers(id)
   ON DELETE SET NULL
);

INSERT INTO departments(name)
VALUES 
  ("Math"),
  ("Science"),
  ("English"),
  ("Social Studies"),
  ("Phys Ed");

INSERT INTO teachers(name, department_id)
VALUES 
  ("Bob Jones", 1),
  ("Mary Smith", 2),
  ("Alice Johnson", 3),
  ("Fay Taylor", 4),
  ("Eddie Duke", 1),
  ("Marge Thomas", 3),
  ("Henry Burns", 2);

INSERT INTO students(name, teacher_id)
VALUES
  ("Mary", 1),
  ("Fran", 3),
  ("Gwen", 3),
  ("Rick", 2),
  ("Wyatt", 2),
  ("Paul", 1),
  ("Sally", 4);

-- SAMPLE MULTI JOIN STATEMENT --
SELECT s.name AS student, t.name AS teacher, d.name AS department
FROM teachers t
INNER JOIN students s ON s.teacher_id = t.id
  INNER JOIN departments d ON d.id = t.department_id;

-- BASED ON THE CODE ABOVE, SEE IF YOU CAN WRITE THIS MULTI JOIN USING 
-- ONE OR MORE LEFT JOINS INSTEAD OF INNER JOINS