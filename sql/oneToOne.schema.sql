-- USE THIS SCHEMA FOR A 1-1 RELATIONSHIP

DROP DATABASE IF EXISTS school_db;
CREATE DATABASE school_db;

USE school_db; 

CREATE TABLE subjects (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  title VARCHAR(30) NOT NULL
);

CREATE TABLE teachers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(30) NOT NULL,
  subject_id INT,
  FOREIGN KEY (subject_id)
   REFERENCES subjects(id)
   ON DELETE SET NULL
);

INSERT INTO subjects(title)
VALUES
  ("English"),
  ("Biology"),
  ("Physics"),
  ("Math"),
  ("History");

INSERT INTO teachers(name, subject_id)
VALUES 
  ("Bob Jones", 1),
  ("Mary Smith", 2),
  ("Alice Johnson", 3),
  ("Fay Taylor", 2),
  ("Eddie Duke", 1),
  ("Marge Thomas", 4);


INSERT INTO teachers(name)
VALUES("Henry Burns");



-- SAMPLE INNER JOIN STATEMENT --
SELECT name, title
FROM teachers t
INNER JOIN subjects s ON t.subject_id = s.id;

-- LEFT JOIN: SHOW ALL TEACHERS BUT ONLY MATCHED SUBJECTS
SELECT name, title
FROM teachers t
LEFT JOIN subjects s ON t.subject_id = s.id;

-- RIGHT JOIN: SHOW ALL SUBJECTS BUT ONLY MATCHED TEACHERS
SELECT name, title
FROM teachers t
RIGHT JOIN subjects s ON t.subject_id = s.id;