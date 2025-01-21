# Student Enrollment Schema

## Requirements
psql (PostgreSQL) 17.2
PGAdmin 4 v8

## Directions
To run `student_enrollment_tables.sql` code to create and manage the table
1. Open PGAdmin and in the Object Explorer access Servers > PostgreSQL with your password
2. Right-click PostgreSQL 17 then select Create > Database and enter a database name
3. In the Object Explorer, access Servers > PostgreSQL > Databases
4. Right-click the newly created database and select Query Tool
5. In the Query Tool, select the open file icon and select the student_enrollment_tables.sql file
6. Select the Execute Script icon
7. To see all classes a student is registered for, select open file > student_classes.sql and Execute Script
8. To see all classes each professors is teaching, select open file > professors_classes.sql and Execute Script
9. To see all classes and their schedules, select open file > class_schedules.sql and Execute Script

## Normalization Write-Up
I started the normalization process by creating an unnormalized Enrollment table of related 
attributes for a school enrollment system. This includes information such as names for students, 
courses, and professors as well as the schedules and other class information. While this table 
contains the relevant information for the system, it contains multiple issues due to how it is only one 
table that encapsulates all relative information.
I then normalized the schema to the first normal form which fixes some of the issues seen in the 
unnormalized table. Part of the solution requires splitting the single table into 3 tables for 
Students, courses, and course enrollments. The Students table contains information for all 
students, the Courses table contains data for each course, and the Course_Enrollments table 
contains information about who is registered for what class and the semester they are 
registered. There are no repeating groups and columns are atomic, so 1NF is met.
To meet the requirements for 2NF, I re-wrote the schema to include all professor-related 
information in the Class table since the professor data was only relying on the class_id part of 
the composite primary key in the Course_Enrollments table. I also took out the schedule 
attributes in the Course table and moved it to its own Schedule table in order to reduce repeated 
course data.
To meet 3NF requirements, I removed all transitive properties by taking the professor name and 
department attributes and putting them in their own Professors table. This is due to the 
department attribute depending more on the professor rather than the class information, and the 
professor data could be separated into its own entity.
For final edits to the normalized design, I made small changes to the table names which has no 
meaningful impact on its functionality.


## Unnormalized to Final Normalized Design
**Unnormalized**
- Enrollment(Enrollment_id [PK], student_name, major, enrollment_date, professor_name, course_name, credits, schedule)

**First Normal Form**
- Students(student_id [PK], first_name, last_name, major, enrollment_date)
- Course(course_id [PK], course_name, credits, schedule_day, schedule_start, schedule_end)
- Course_Enrollments(student_id - course_id [PK], professor_first_name, professor_last_name, department, semester, year, location)

**Second Normal Form**
- Students(student_id [PK], first_name, last_name, major, enrollment_date)
- Course(course_id [PK], course_name, credits)
- Class(class_id [PK], course_id [FK], professor_first_name, professor_last_name, department, location)
- Schedule(schedule_id [PK], class_id[FK], day, start_time, end_time)
- Course_Enrollments(student_id - class_id [PK], semester, year)

**Third Normal Form**
- Students(student_id [PK], first_name, last_name, major, enrollment_date)
- Professors(professor_id [PK], first_name, last_name, department)
- Course(course_id [PK], course_name, credits)
- Class(class_id [PK], course_id [FK], professor_id [FK], location)
- Schedule(schedule_id [PK], class_id [FK], day, start_time, end_time)
- Course_Enrollments(student_id - class_id [PK], semester, year)

**Final Normalized Design**
- Students(
    - student_id [PK], 
    - first_name, 
    - last_name, 
    - major, 
    - enrollment_date
    
    )
- Professors(
    - professor_id [PK], 
    - first_name, 
    - last_name, 
    - department
    
    )
- Courses(
    - course_id [PK], 
    - course_name, 
    - credits
    
    )
- Classes(
    - class_id [PK], 
    - course_id [FK], 
    - professor_id [FK], 
    - building
    - room
    
    )
- Schedules(
    - schedule_id [PK], 
    - class_id [FK], 
    - class_day, 
    - start_time, 
    - end_time
    
    )
- Enrollments(
    - student_id - class_id [PK], 
    - semester_enrolled, 
    - year_enrolled
    
    )