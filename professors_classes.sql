SELECT pro.first_name, pro.last_name, cou.course_name, cla.building, cla.room
FROM Professors pro
JOIN Classes cla ON pro.professor_id = cla.professor_id
JOIN Courses cou ON cla.course_id = cou.course_id;