-- USE THIS SCHEMA FOR A MANY-MANY RELATIONSHIP

DROP DATABASE IF EXISTS school4_db;
CREATE DATABASE school4_db;

USE school4_db; 

CREATE TABLE subjects (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  title VARCHAR(30) NOT NULL
);

CREATE TABLE teachers (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(30) NOT NULL
);

CREATE TABLE teacher_subject (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  teacher_id INT, 
  subject_id INT, 
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE SET NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id) ON DELETE SET NULL
);

INSERT INTO subjects(title)
VALUES
  ("English"),
  ("Biology"),
  ("Physics"),
  ("Math"),
  ("History");

INSERT INTO teachers(name)
VALUES 
  ("Bob Jones"),
  ("Mary Smith"),
  ("Alice Johnson"),
  ("Fay Taylor"),
  ("Eddie Duke"),
  ("Marge Thomas");

INSERT INTO teacher_subject(teacher_id, subject_id)
VALUES
  (1,1),
  (1,2),
  (2,2),
  (2,4),
  (3,1),
  (3,3),
  (3,5),
  (4,1),
  (4,4);


-- SAMPLE INNER JOIN STATEMENT --
SELECT t.name, s.title
FROM teachers t
  INNER JOIN teacher_subject ts ON t.id = ts.teacher_id 
  INNER JOIN subjects s ON s.id = ts.subject_id;


-- HERE WE GROUP THE OUTPUT BY SUBJECT --
SELECT t.name, s.title
FROM teachers t
  INNER JOIN teacher_subject ts ON t.id = ts.teacher_id 
  INNER JOIN subjects s ON s.id = ts.subject_id
GROUP BY s.title, t.name;
