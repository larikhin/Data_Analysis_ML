COUNT (выражение) или (*)
MIN/MAX (выражение)
AVG (numbers)
SUM (numbers)

SELECT
FROM
WHERE фильтрация аргументов перед функцией LIKE '%text%' 't__t' 't___' 't%' '___t' '%t'
GROUP BY группировка
HAVING фильтрация результатов вычисления функции
ORDER BY ... DESC ASC сортировка

SELECT COUNT (*) AS Number_of_students from students
SELECT max (birthdate) from students
SELECT MIN (birthdate), MAX (birthdate) from students
SELECT count(*), MAX (birthdate) from students
SELECT count(*) from students where groupcode='M2020_1'
SELECT count(*) from students where groupcode='B2020_1' or groupcode='B2020_2'
SELECT count(groupcode) from students
SELECT COUNT(DISTINCT groupcode) from students
SELECT COUNT(*) from students Group BY groupcode
SELECT groupcode, COUNT(*) from students Group BY groupcode
SELECT groupcode, COUNT(*) FROM students GROUP by groupcode HAVING COUNT(*) < 8
SELECT groupcode, COUNT(*) from students GROUP by groupcode HAVING COUNT(*)>3 AND groupcode LIKE 'B%'
SELECT groupcode, count(*) FROM students WHERE studentid < 345577 group BY groupcode HAVING COUNT(*)<8
SELECT groupcode, count(*) FROM students group BY groupcode ORDER by COUNT(*) ASC
SELECT groupcode, count(*) FROM students group BY groupcode ORDER by COUNT(*) DESC
select count(distinct carrier_board_num) from track where route_number = 31 and id_vehicle = 1


SELECT count(*) FROM Exam_Result WHERE StudentId = 345576
SELECT count(*) FROM Exam_Result WHERE StudentId IN (345576)
SELECT count(Grade) FROM Exam_Result WHERE StudentId = 345576
SELECT StudentId, AVG(Grade) FROM Exam_Result GROUP BY StudentId
SELECT  min(grade), max(grade) FROM Exam_Result
SELECT MIN(Grade) as Min_Grade, MAX(Grade) as Max_Grade FROM Exam_Result
SELECT  COUNT(DISTINCT studentid) FROM Exam_Result
SELECT sum(grade) FROM Exam_Result where studentid = '345588'
SELECT StudentId, COUNT(*) FROM Exam_Result GROUP BY StudentId
SELECT StudentId, COUNT(DISTINCT Grade) FROM Exam_Result GROUP BY StudentId
SELECT StudentId FROM Exam_Result GROUP BY StudentId HAVING avg(grade) = 5

Вложенный запрос 
для соединения или сопоставления нескольких таблиц
после 
SELECT
WHERE 
HAVING
в скобки
SELECT studentname, birthdate from students WHERE birthdate=(SELECT max(birthdate) FROM students)

SELECT groupcode FROM st_group WHERE specialization='Nanotechnology'
SELECT studentname FROM students WHERE groupcode='M2020_1'
\/
SELECT studentname FROM students WHERE groupcode=(SELECT groupcode FROM st_group WHERE specialization='Nanotechnology')

SELECT groupcode FROM st_group WHERE specialization='Nanotechnology' or specialization='Health Research'
SELECT groupcode FROM st_group WHERE specialization IN ('Nanotechnology','Health Research')
\/
SELECT studentname FROM students WHERE groupcode IN (SELECT groupcode FROM st_group WHERE specialization='Nanotechnology' or specialization='Health Research')


select studentname, groupcode, (SELECT specialization FROM st_group WHERE st_group.groupcode=students.groupcode) FROM students


EXIST существует
ANY хотябы один
ALL все
SELECT studentid, studentname FROM students WHERE EXISTS (SELECT * FROM phone_list WHERE students.studentid=phone_list.studentid)
SELECT studentid, studentname FROM students WHERE NOT EXISTS (SELECT * FROM phone_list WHERE students.studentid=phone_list.studentid)

SELECT studentname FROM students WHERE 2=ANY(SELECT DISTINCT grade FROM exam_result WHERE students.studentid=exam_result.studentid)
SELECT StudentName FROM STUDENTS WHERE StudentId
IN (SELECT DISTINCT StudentId FROM EXAM_RESULT WHERE Grade = 2)
SELECT studentid, studentname FROM students WHERE 2=ANY(SELECT grade FROM exam_result WHERE students.studentid=exam_result.studentid)
SELECT studentid, studentname FROM students WHERE 3<ALL(SELECT grade FROM exam_result WHERE students.studentid=exam_result.studentid)
SELECT StudentName FROM STUDENTS WHERE StudentId
IN (SELECT StudentId FROM EXAM_RESULT WHERE Grade = MAX(Grade))
SELECT (SELECT TeacherName FROM TEACHER WHERE
TEACHER.TeacherId = EXAM_SHEET.TeacherId) AS TeacherName, ExamDate, ClassRoom FROM EXAM_SHEET
SELECT (SELECT CourseTitle FROM Course WHERE
Course.CourseId = EXAM_SHEET.CourseId) AS CourseTitle, ExamDate FROM EXAM_SHEET

UNION объединение (все)
UNION ALL объединение с дубликатами
INTERSECT пересечение (внутри)
EXCEPT/MINUS разность (снаружи)
must be: Ncolumn=Ncolumn and data types

SELECT studentid, studentname, birthdate FROM students WHERE birthdate<'01/01/1999' 
UNION SELECT studentid, studentname, birthdate FROM students where birthdate>'06/01/1998'
diferent tables:
SELECT teacherid as ID, teachername as Name FROM teacher
UNION SELECT studentid as ID,studentname as Name FROM students
SELECT teacherid as ID, teachername as Name, 'teacher' AS Status_column FROM teacher
UNION SELECT studentid as ID,studentname as Name, 'student'AS Status_column FROM students

SELECT studentid, studentname, birthdate FROM students WHERE birthdate<'01/01/1999' 
INTERSECT SELECT studentid, studentname, birthdate FROM students where birthdate>'06/01/1998'

SELECT studentid, studentname, birthdate FROM students WHERE birthdate<'01/01/1999' 
EXCEPT SELECT studentid, studentname, birthdate FROM students where birthdate>'04/01/1998'

Cartesian product/Декартово произведение
SELECT * FROM teacher, course ORDER by teachername
SELECT groupcode,specialization,coursetitle FROM st_group, course

and/и
SELECT StudentId FROM EXAM_RESULT WHERE GRADE = 2
INTERSECT
SELECT StudentId FROM EXAM_RESULT WHERE GRADE = 5

or/или
SELECT StudentId,grade FROM EXAM_RESULT WHERE GRADE = 2
UNION
SELECT StudentId,grade FROM EXAM_RESULT WHERE GRADE = 5

SELECT StudentId FROM students
EXCEPT SELECT studentid FROM EXAM_RESULT

SELECT teacherid FROM teacher
EXCEPT
SELECT teacherid FROM exam_sheet WHERE courseid = 1

SELECT teachername from teacher WHERE teacherid IN 
(SELECT teacherid FROM teacher
EXCEPT
SELECT teacherid FROM exam_sheet WHERE courseid = 1)

SELECT teachername FROM teacher
WHERE teacherid not in(
SELECT teacherid FROM exam_sheet WHERE courseid in (SELECT courseid FROM course WHERE coursetitle='Data processing and analysis')
)

JOIN
SELECT * 
FROM table_1 JOIN table_2  какие таблицы соединяем
ON table_1.field1=table_2.field2 критерий соединения

SELECT *
FROM t1, t2 
WHERE t1.f1=t2.f2

inner join (только совпадающие)
SELECT * 
FROM students JOIN phone_list
ON students.studentid=phone_list.studentid

left join (все из левой и совпадающие из правой)
SELECT * 
FROM students  LEFT JOIN phone_list
ON students.studentid=phone_list.studentid

FULL JOIN все строки всех таблиц, соединенные в местах совпадения

SELF JOIN

SELECT a.studentname, B.studentname
FROM students as A JOIN students as B
ON a.studentname<>B.studentname
ORDER BY a.studentname,B.studentname

3 table JOIN
SELECT examsheetid,coursetitle,teachername,classroom,examdate
FROM exam_sheet 
JOIN course
on exam_sheet.courseid=course.courseid
JOIN teacher
ON exam_sheet.teacherid=teacher.teacherid

SELECT CourseTitle, ExamDate, ClassRoom FROM EXAM_SHEET
JOIN
COURSE ON EXAM_SHEET.CourseId = COURSE.CourseId
SELECT CourseTitle, ExamDate, ClassRoom FROM EXAM_SHEET, COURSE
WHERE EXAM_SHEET.CourseId = COURSE.CourseId

SELECT StudentName, Grade FROM EXAM_RESULT, STUDENTS
WHERE EXAM_RESULT.StudentID = STUDENTS.StudentID 

SELECT StudentName, Grade FROM EXAM_RESULT
JOIN
STUDENTS ON EXAM_RESULT.StudentID = STUDENTS.StudentID

SELECT DISTINCT teachername FROM teacher
join exam_sheet
on  teacher.teacherid=exam_sheet.teacherid WHERE classroom=2410

SELECT DISTINCT coursetitle FROM course
join exam_sheet
on  course.courseid=exam_sheet.courseid WHERE classroom=2410

SELECT teachername,examdate FROM teacher,exam_sheet 
WHERE teacher.teacherid=exam_sheet.teacherid

SELECT coursetitle,classroom,examdate FROM course,exam_sheet 
WHERE course.courseid=exam_sheet.courseid
