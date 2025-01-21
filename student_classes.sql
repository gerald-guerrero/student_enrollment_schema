SELECT stu.first_name, stu.last_name, cla.class_id, cou.course_name, cla.building, cla.room
FROM Students stu
JOIN Enrollments enr ON stu.student_id = enr.student_id
JOIN Classes cla ON enr.class_id = cla.class_id
Join Courses cou ON cla.course_id = cou.course_id
WHERE stu.student_id = 1;