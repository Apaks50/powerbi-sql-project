CREATE DATABASE matrix26_db
CREATE TABLE department(id INT PRIMARY KEY, title VARCHAR(250), studentid INT)
SELECT*FROM students
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(1, 'apakama', 'ugochukwu', 'm', '08148050712')
ALTER TABLE students DROP COLUMN phonenumber
ALTER TABLE students ADD phonenumber TEXT
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(2, 'obiekezie', 'anthony', 'm', '07079040214')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(3, 'cajetan', 'mary', 'f', '09012597970')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(4, 'anuonye', 'chiamaka', 'f', '09132301592')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(5, 'stanley', 'nwakaeze', 'm', '09073325085')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(6, 'franklin', 'oliver', 'm', '08020886090')
SELECT*FROM department
INSERT INTO department(id, title, studentid) VALUES(1, 'information technology', 001)
INSERT INTO department(id, title, studentid) VALUES(2, 'computer science', 002)
INSERT INTO department(id, title, studentid) VALUES(3, 'information technology', 003)
CREATE TABLE tutors(tutorsid INT PRIMARY KEY, firstname VARCHAR(250), lastname VARCHAR(250), gender VARCHAR(10), phonenumber TEXT, coursetaught VARCHAR(250))
SELECT*FROM tutors
INSERT INTO tutors(tutorsid, firstname, lastname, gender, phonenumber, coursetaught) VALUES(1, 'amarachi', 'vincent', 'm', '09012597970', 'data analysis')
INSERT INTO tutors(tutorsid, firstname, lastname, gender, phonenumber, coursetaught) VALUES(2, 'chinedu', 'francis', 'm', '08161314783', 'cyber security')
INSERT INTO tutors(tutorsid, firstname, lastname, gender, phonenumber, coursetaught) VALUES(3, 'odera', 'jeremiah', 'm', '08128375320', 'graphics designer')
INSERT INTO tutors(tutorsid, firstname, lastname, gender, phonenumber, coursetaught) VALUES(4, 'chiemelie', 'melikam', 'm', '08160006990', 'frontend developer')
CREATE TABLE office(officeid INT PRIMARY KEY, officename VARCHAR(250), numberofseats INT, workinghours TEXT)
SELECT*FROM office
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(7, 'david', 'okoli', 'm', '08038953045')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(8, 'ezeoke', 'emmanuel', 'm', '07060566025')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(9, 'amarachi', 'vincent', 'm', '07083197840')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(10, 'onyeka', 'chioma', 'f', '09115625141')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(11, 'okoye', 'victor', 'm', '09129695991')
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(12, 'umeiheukwu', 'chidubem', 'm', '08148441135')
ALTER TABLE students ADD age INT
SELECT*FROM department
DROP TABLE department
CREATE TABLE department(department_id INT PRIMARY KEY, title VARCHAR(250))
SELECT*FROM department
INSERT INTO department(department_id, title) VALUES(1, 'backend development')
INSERT INTO department(department_id, title) VALUES(2, 'data analysis')
ALTER TABLE students ADD department_id INT
UPDATE students SET age= 19, department_id= 2
UPDATE students SET age= 20, department_id= 2 WHERE id= 3
UPDATE students SET age= 18, department_id= 2 WHERE id= 4
UPDATE students SET age= 22, department_id= 2 WHERE id= 5
UPDATE students SET age= 23, department_id= 2 WHERE id= 6
UPDATE students SET age= 30, department_id= 1 WHERE id= 7
UPDATE students SET age= 19, department_id= 1 WHERE id= 8
UPDATE students SET age= 50, department_id= 1 WHERE id= 9
UPDATE students SET age= 21, department_id= 2 WHERE id= 10
UPDATE students SET age= 14, department_id= 1 WHERE id= 11
UPDATE students SET age= 12, department_id= 1 WHERE id= 12
DELETE FROM students WHERE id= 12
INSERT INTO students(id, firstname, lastname, gender, phonenumber) VALUES(12, 'umeiheukwu', 'chidubem', 'm', '08148441135')
UPDATE students SET age= 12, department_id= 1 WHERE id= 12
SELECT COUNT(gender) FROM students WHERE gender= 'f'
SELECT COUNT(gender) FROM students WHERE gender= 'm'
SELECT gender, COUNT(gender) FROM students GROUP BY gender
SELECT gender FROM students GROUP BY gender
SELECT gender, count(gender) FROM students
SELECT firstname FROM students WHERE COUNT(age) >14
SELECT firstname FROM students WHERE age >14
SELECT firstname FROM students WHERE age >14 ORDER BY firstname DESC
SELECT firstname FROM students WHERE age >14 ORDER BY firstname ASC
SELECT COUNT(firstname) FROM students GROUP BY department
SELECT COUNT(firstname) FROM department GROUP BY title
SELECT title, COUNT(firstname) 
FROM students INNER JOIN department ON students.department_id= department.department_id GROUP BY title
--Q1 How many department does the academy have?
SELECT COUNT(title) AS [Total No of Department] FROM department
--Q2 How many students do we have in the cohort?
SELECT COUNT(firstname) AS [Total No of Students] FROM students
--Q3 What is the average age of the students?
SELECT AVG(age) AS [Average Age of Students] FROM students
--Q4 how many males do we have in the cohort?
SELECT gender, COUNT(firstname) AS [Students by Gender] 
FROM students INNER JOIN department 
ON students.department_id=department.department_id GROUP BY gender
--Q5. What is the Maximum age?
SELECT MAX(age) AS [Maximum Age] FROM students
--Q6. What is the Minimum age?
SELECT MIN(age) AS [Minimum Age] FROM students
--Q7 how many students are present in each department?
SELECT title, COUNT(firstname) AS [Total No Of Students in each Department]
FROM students INNER JOIN department
ON students.department_id=department.department_id GROUP BY title
--Q8 Which department has the highest number of students?
SELECT TOP 1 department.title AS [department], COUNT(students.id) AS [Number Of Students] 
FROM department INNER JOIN students 
ON department.department_id=students.department_id GROUP BY department.title 
ORDER BY COUNT(students.id) DESC;
