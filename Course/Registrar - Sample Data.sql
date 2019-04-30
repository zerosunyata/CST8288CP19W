USE Registrar;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM ClassRep;
DELETE FROM Tuition;
DELETE FROM Students;
DELETE FROM Registry;
DELETE FROM Courses;

SET SQL_SAFE_UPDATES = 1;

INSERT INTO `Courses` (`course_num`, `name`) VALUES
('MAT8001C', 'Technical Math for Computer Science'),
('CST8101', 'Computer Essentials'),
('CST8300', 'Achieving Success in Changing Environments'),
('CST8110', 'Intro to Computer Programing'),
('CST8215', 'Database'),
('ENL1813T', 'Communications I'),
('GED0336', 'Gen. Ed. Elective'),
('CST8102', 'Operating System Fund.'),
('CST8284', 'OOP'),
('CST8285', 'Web Programing'),
('CST2355', 'Database Systems'),
('ENL2019T', 'Technical Communication for Eng. Tech.'),
('CST8109', 'Network Programing'),
('CST8288', 'OOP II'),
('CST2335', 'Mobile Graphical Interface Programing'),
('CST2234', 'System Analysis and Design'),
('CST8283', 'Business Programming(Cobol)'),
('CST8130', 'Data Structures'),
('CST8234', 'C Language and Network Programming'),
('CST8390', 'Business Intelligence and Data Analytics'),
('CST8333', 'Programing Language Research Project'),
('CST8277', 'Enterprise Appl. Programing'),
('CST8334', 'Software Development Project'),
('CST8276', 'Advanced Database Topics');

INSERT INTO `Students` (`student_num`, `first_name`, `last_name`, `date_birth`, `enrolled`) VALUES 
(100000001, 'John1', 'Doe1', '1901-01-01', '2017-09-01'),
(100000002, 'John2', 'Doe2', '1902-02-02', '2017-09-01'),
(100000003, 'John3', 'Doe3', '1903-03-03', '2017-09-01'),
(100000004, 'John4', 'Doe4', '1904-04-04', '2017-09-01'),
(100000005, 'John5', 'Doe5', '1905-05-05', '2017-09-01'),
(100000006, 'John6', 'Doe6', '1906-06-06', '2017-09-02'),
(100000007, 'John7', 'Doe7', '1907-07-07', '2017-09-02'),
(100000008, 'John8', 'Doe8', '1908-08-08', '2017-09-02'),
(100000009, 'John9', 'Doe9', '1909-09-09', '2017-09-03');

INSERT INTO `ClassRep` (`student_num`, `course_num`, `term`, `year`) VALUES 
(100000001, 'CST8288', 'W', 19),
(100000001, 'CST8130', 'W', 19),
(100000003, 'CST2355', 'W', 19),
(100000004, 'CST2335', 'W', 19),
(100000005, 'CST8109', 'W', 19);

INSERT INTO `Tuition` (`student_num`, `paid`, `remainder`) VALUES
 (100000001, 10000, 15000),
 (100000002, 20000, 16000),
 (100000003, 30000, 17000),
 (100000004, 40000, 18000),
 (100000005, 50000, 19000),
 (100000006, 60000, 20000),
 (100000007, 70000, 21000),
 (100000008, 80000, 22000),
 (100000009, 90000, 23000);

INSERT INTO `Registry` (`student_num`, `course_num`, `term`, `year`) VALUES 
(100000001, 'CST8288', 'W', 19),
(100000001, 'CST8130', 'W', 19),
(100000002, 'CST8288', 'W', 19),
(100000002, 'CST8130', 'W', 19),
(100000003, 'CST8288', 'W', 19),
(100000003, 'CST2355', 'W', 19),
(100000004, 'CST8288', 'W', 19),
(100000004, 'CST2335', 'W', 19),
(100000005, 'CST2355', 'W', 19),
(100000005, 'CST8109', 'W', 19),
(100000006, 'CST8288', 'W', 19),
(100000006, 'CST8109', 'W', 19),
(100000007, 'CST2335', 'W', 19),
(100000007, 'CST8109', 'W', 19),
(100000008, 'CST2335', 'W', 19),
(100000008, 'CST8109', 'W', 19),
(100000009, 'CST8130', 'W', 19),
(100000009, 'CST8109', 'W', 19);