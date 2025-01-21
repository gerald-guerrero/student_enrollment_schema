SELECT cla.class_id, cou.course_name, sch.class_day, sch.start_time, sch.end_time
FROM Classes cla
JOIN Courses cou ON cla.course_id = cou.course_id
JOIN Schedules sch ON cla.class_id = sch.class_id