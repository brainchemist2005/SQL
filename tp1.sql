/*1*/
SELECT DISTINCT t1.id, t2.course_id
FROM takes t1
INNER JOIN teaches t2 ON t1.course_id = t2.course_id
                    AND t1.sec_id = t2.sec_id
WHERE t2.course_id IN ('CS-101', 'CS-347', 'CS-315');


/*2*/
select t1.dept_name from department t1 , department t2
where t1.budget > t2.budget and t2.dept_name = 'Music' 
order by t1.dept_name desc;