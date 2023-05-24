SELECT DISTINCT t1.id, t2.course_id
FROM takes t1
INNER JOIN teaches t2 ON t1.course_id = t2.course_id
                    AND t1.sec_id = t2.sec_id
WHERE t2.course_id IN ('CS-101', 'CS-347', 'CS-315');