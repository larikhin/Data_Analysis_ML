COUNT (выражение) или (*)
MIN/MAX (выражение)
AVG (numbers)
SUM (numbers)

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
