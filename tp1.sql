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

/*5*/



/*6*/
SELECT s.name AS student_name, t.id AS professor_name, c.title AS course_name, s.dept_name AS department
FROM student s
JOIN takes tks ON s.id = tks.id
JOIN teaches t ON tks.course_id = t.course_id AND tks.sec_id = t.sec_id AND tks.semester = t.semester AND tks.year = t.year
JOIN course c ON t.course_id = c.course_id
WHERE tks.grade = 'A';

La requête que j'ai fournie sélectionne les informations suivantes à partir du schéma de base de données :

s.name AS student_name: Le nom de l'étudiant.
t.name AS professor_name: Le nom du professeur.
c.name AS course_name: Le nom du cours.
s.dept_name AS department: Le département de l'étudiant.
La requête utilise les jointures entre les tables suivantes :

students (étudiants)
takes (cours suivis par les étudiants)
teaches (cours enseignés par les professeurs)
courses (informations sur les cours)
La condition WHERE tks.grade = 'A' permet de sélectionner uniquement les étudiants qui ont obtenu un A.

En résumé, cette requête récupère les noms des étudiants qui ont obtenu un A, ainsi que le nom du professeur, le nom du cours et le département correspondant à chaque étudiant.