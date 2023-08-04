-- USE THIS SCHEMA FOR A 1-MANY RELATIONSHIP

DROP DATABASE IF EXISTS school2_db;
CREATE DATABASE school2_db;

USE school2_db; 

CREATE TABLE teachers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(30) NOT NULL
);

CREATE TABLE students (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(30) NOT NULL,
  teacher_id INT,
  FOREIGN KEY (teacher_id)
   REFERENCES teachers(id)
   ON DELETE SET NULL
);

INSERT INTO teachers(name)
VALUES 
  ("Bob Jones"),
  ("Mary Smith"),
  ("Alice Johnson"),
  ("Fay Taylor"),
  ("Eddie Duke"),
  ("Marge Thomas"),
  ("Henry Burns");

INSERT INTO students(name, teacher_id)
VALUES
  ("Mary", 1),
  ("Fran", 3),
  ("Gwen", 3),
  ("Rick", 2),
  ("Wyatt", 2),
  ("Paul", 1),
  ("Sally", 4);

-- SAMPLE INNER JOIN STATEMENT --
SELECT s.name AS student, t.name AS teacher
FROM teachers t
INNER JOIN students s ON s.teacher_id = t.id;

-- BASED ON THE CODE ABOVE, SEE IF YOU CAN WRITE LEFT AND RIGHT JOIN STATEMENTS