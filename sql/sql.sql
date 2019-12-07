DROP TABLE IF EXISTS students;
CREATE TABLE students (
	sid CHAR(9),
	name VARCHAR(20),
	login CHAR(8),
	age INTEGER,
	gpa REAL
);

DROP TABLE IF EXISTS takes;
CREATE TABLE takes (
	sid CHAR(9),
	courseid CHAR(6)
);

DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
	courseid CHAR(6),
	name CHAR(20)
);

INSERT INTO students VALUES 
(1,'Cesar','Ces_Ch', 22, 9.0),
(2,'Manuel','Man_Ch', 23, 8.0);

INSERT INTO courses VALUES 
(1, 'Math'),
(2, 'Physics');

INSERT INTO takes VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2);


