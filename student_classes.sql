SELECT stu.first_name, stu.last_name, cla.class_id, cou.course_name, cla.building, cla.room
FROM Students stu
JOIN Enrollments enr ON enr.student_id = stu.student_id
JOIN Classes cla ON cla.class_id = enr.class_id
Join Courses cou ON cou.course_id = cla.course_id
WHERE stu.student_id = 1;