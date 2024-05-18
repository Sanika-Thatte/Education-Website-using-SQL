CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role ENUM('student', 'teacher') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    teacher_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES Users(user_id)
);
CREATE TABLE Lessons (
    lesson_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    submission_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grade INT,
    feedback TEXT,
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id),
    FOREIGN KEY (student_id) REFERENCES Users(user_id)
);
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    student_id INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (student_id) REFERENCES Users(user_id)
);
INSERT INTO Users (username, password, email, role) VALUES ('john_doe', 'securepassword', 'john@example.com', 'student');
INSERT INTO Courses (course_name, description, teacher_id) VALUES ('Introduction to SQL', 'Learn the basics of SQL.', 2);
INSERT INTO Enrollments (course_id, student_id) VALUES (1, 1);
INSERT INTO Lessons (course_id, title, content) VALUES (1, 'Lesson 1: Introduction', 'This is the content of the first lesson.');
INSERT INTO Assignments (course_id, title, description, due_date) VALUES (1, 'Assignment 1', 'Complete the following exercises...', '2024-06-01');
INSERT INTO Submissions (assignment_id, student_id, grade, feedback) VALUES (1, 1, 85, 'Good job!');
