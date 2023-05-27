/*1*/
select distinct s.name
from student s,takes t, teaches c, instructor i
where s.id = t.id
and t.course_id = c.course_id
and t.sec_id = c.sec_id
and c.id = i.id
and i.id = '10101';


/*2*/
select t1.dept_name from department t1 , department t2
where t1.budget > t2.budget and t2.dept_name = 'Music' 
order by t1.dept_name desc;

/*3*/
SELECT t1.name
FROM instructor t1
WHERE t1.id IN (
    SELECT t2.i_id
    FROM advisor t2
    INNER JOIN student t3 ON t2.s_id = t3.id
    WHERE t3.tot_cred > 50
    GROUP BY t2.i_id
    HAVING COUNT(DISTINCT t2.s_id) > 1
);

/*4*/
SELECT t1.name
FROM instructor t1
WHERE NOT EXISTS (
    SELECT t2.course_id
    FROM course t2
    WHERE t2.dept_name = t1.dept_name
    AND t2.course_id NOT IN (
        SELECT t3.course_id
        FROM teaches t3
        WHERE t3.id = t1.id
    )
);
