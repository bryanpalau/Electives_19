-- Table for storing student information
CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name TEXT NOT NULL
);

-- Table for storing courses
CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_name TEXT NOT NULL
);

-- Table for storing grades
CREATE TABLE grades (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    grade INTEGER,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table for storing elective courses
CREATE TABLE elective_courses (
    course_id INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    required_grade INTEGER
);

-- Table for storing taken courses
CREATE TABLE taken_courses (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    course_name TEXT NOT NULL,
    elective_type TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, course_id, elective_type),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Table for storing selected courses
CREATE TABLE selected_courses (
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    course_name TEXT NOT NULL,
    elective_type TEXT NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (student_id, elective_type),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create indexes for improved query performance
CREATE INDEX idx_student_id ON students (student_id);
CREATE INDEX idx_course_id ON courses (course_id);
CREATE INDEX idx_student_id_taken_courses ON taken_courses (student_id);
CREATE INDEX idx_course_id_taken_courses ON taken_courses (course_id);

-- Insert additional dummy data into students table
INSERT INTO students (student_id, student_name) VALUES
(000, 'Test'),
(701, 'Alice Johnson'),
(702, 'Bob Brown'),
(703, 'Charlie Davis'),
(704, 'Kenny Lu'),
(705, 'Ben Al'),
(706, 'Cate Smith'),
(707, 'Tom Lin'),
(708, 'Justin Lee');

-- Insert additional dummy data into courses table
INSERT INTO courses (course_id, course_name) VALUES
(NULL, 'Introduction to Art'),
(NULL, 'History of Art'),
(NULL, 'Creative Writing'),
(NULL, 'Music Theory'),
(NULL, 'Fine Arts'),
(NULL, 'Dance'),
(NULL, 'Advanced Mathematics'),
(NULL, 'Physics'),
(NULL, 'Introduction to Programming'),
(NULL, 'Environmental Science');

-- Insert additional dummy data into elective_courses table
INSERT INTO elective_courses (course_id, course_name, required_grade) VALUES
(103, 'Creative Writing', 90),
(104, 'Music Theory', 80),
(105, 'Fine Arts', NULL),
(106, 'Dance', NULL),
(203, 'Introduction to Programming', NULL),
(204, 'Environmental Science', NULL);

-- Insert additional dummy data into taken_courses table
INSERT INTO taken_courses (student_id, course_id, course_name, elective_type) VALUES
(703, 101, 'Introduction to Art', 'elective_1'),
(703, 202, 'Physics', 'elective_2'),
(704, 102, 'History of Art', 'elective_1'),
(704, 201, 'Advanced Mathematics', 'elective_2'),
(705, 101, 'Introduction to Art', 'elective_1'),
(703, 106, 'Dance', 'elective_1'),
(705, 202, 'Physics', 'elective_2');

-- Insert additional dummy data into grades table
INSERT INTO grades (student_id, course_id, grade) VALUES
(703, 101, 78),
(703, 202, 92),
(704, 102, 85),
(704, 201, 88),
(705, 101, 80),
(705, 202, 91),
(703, 103, 78),
(703, 106, 100),
(703, 104, 98);

-- Insert additional dummy data into selected_courses table
INSERT INTO selected_courses (student_id, course_id, course_name, elective_type) VALUES
(000, 100, 'SDG', 'elective_100');
