DROP TABLE IF EXISTS students, professors, courses, classes, schedules, enrollments;

CREATE TABLE Students (
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	major VARCHAR(50),
	enrollment_date DATE
);

CREATE TABLE Professors (
	professor_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	department VARCHAR(50)
);

CREATE TABLE Courses (
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(50),
	credits INT
);

CREATE TABLE Classes (
	class_id SERIAL PRIMARY KEY,
	course_id INT REFERENCES Courses(course_id),
	professor_id INT REFERENCES Professors(professor_id),
	building VARCHAR(30),
	room VARCHAR(10)
);

CREATE TABLE Schedules (
	schedule_id SERIAL PRIMARY KEY,
	class_id INT REFERENCES Classes(class_id),
	class_day VARCHAR(10),
	start_time TIME,
	end_time TIME
);

CREATE TABLE Enrollments (
	student_id INT REFERENCES Students(student_id),
	class_id INT REFERENCES Classes(class_id),
	semester_enrolled VARCHAR(10),
	year_enrolled INT,
	PRIMARY KEY (student_id, class_id)
);

INSERT INTO students (first_name, last_name, major, enrollment_date)
VALUES
('Tom', 'Anderson', 'Computer Science', '2024-08-01'),
('Max', 'Johnson', 'Computer Science', '2025-01-01'),
('Sarah', 'Williams', 'Math', '2025-01-01'),
('Alice', 'Brown', 'Math', '2024-08-01'),
('James', 'Davis', 'Business', '2024-08-01');

INSERT INTO professors (first_name, last_name, department)
VALUES
('Robert', 'Matthews', 'Engineering'),
('Emily', 'Roberts', 'Mathematics'),
('Carlos', 'Garcia', 'Business');

INSERT INTO courses (course_name, credits)
Values
('Intro To Computer Science', 4),
('Calculus 1', '4'),
('Intro To Business', 3);

INSERT INTO classes (course_id, professor_id, building, room)
Values
(1, 1, 'Building 1', '10'),
(1, 1, 'Building 1', '15'),
(2, 2, 'Building 2', '5'),
(2, 2, 'Building 2', '2'),
(3, 3, 'Building 3', '20');

INSERT INTO schedules (class_id, class_day, start_time, end_time)
Values
(1, 'Monday', '09:00:00', '10:30:00'),
(1, 'Wednesday', '09:00:00', '10:30:00'),
(2, 'Tuesday', '09:30:00', '11:00:00'),
(2, 'Thursday', '09:30:00', '11:00:00'),
(3, 'Monday', '12:00:00', '01:30:00'),
(3, 'Wednesday', '12:00:00', '01:30:00'),
(4, 'Tuesday', '11:30:00', '13:00:00'),
(4, 'Thursday', '11:30:00', '13:00:00'),
(5, 'Monday', '14:00:00', '15:30:00'),
(5, 'Wednesday', '14:00:00', '15:30:00');

INSERT INTO enrollments (student_id, class_id, semester_enrolled, year_enrolled)
Values
(1, 1, 'Fall', 2024),
(1, 3, 'Fall', 2024),
(2, 2, 'Spring', 2025),
(2, 4, 'Spring', 2025),
(3, 1, 'Spring', 2025),
(3, 3, 'Spring', 2025),
(4, 4, 'Fall', 2024),
(4, 5, 'Fall', 2024),
(5, 2, 'Fall', 2024),
(5, 5, 'Fall', 2024);
