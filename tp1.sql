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

/*3*/

SELECT t1.name
FROM instructor t1
INNER JOIN advisor t2 ON t1.id = t2.i_id
INNER JOIN student t3 ON t2.s_id = t3.id
WHERE t3.tot_credit > 50
GROUP BY t1.name
HAVING COUNT(DISTINCT t2.s_id) > 1;
