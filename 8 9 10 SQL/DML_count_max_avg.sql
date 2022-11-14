COUNT (выражение) или (*)
MIN/MAX (выражение)
AVG (numbers)
SUM (numbers)

SELECT
FROM
WHERE фильтрация аргументов перед функцией
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
equal
SELECT studentname FROM students WHERE groupcode=(SELECT groupcode FROM st_group WHERE specialization='Nanotechnology')

SELECT groupcode FROM st_group WHERE specialization='Nanotechnology' or specialization='Health Research'
SELECT groupcode FROM st_group WHERE specialization IN ('Nanotechnology','Health Research')
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
