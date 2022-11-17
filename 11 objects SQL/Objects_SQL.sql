Константы
Названия столбцов
Круглые скобки (приоритет)
Сравнение (<,>,=...)
Логические (NOT, AND, OR)
Арифметические (*,/,+,-,%)
Конкатенация (||,+)
Функции

SELECT <Выражение>
FROM х
WHERE <Выражение>
GROUP BY <Выражение>
HAVING <Выражение>
ORDER BY <Выражение>

SELECT students FROM students
список списков

SELECT studentid,studentname FROM students
3 column
SELECT studentid,studentname, '1 year student' as Student FROM students
3 to 2 column ||
SELECT studentid,studentname || ' 1 year student' as Student FROM students

SELECT studentid, examsheetid, grade*100/5 as Score FROM exam_result

SELECT studentid, SUM(grade*100/5) as Total FROM exam_result GROUP By studentid
SELECT studentid, SUM(grade)*100/5,SUM(grade*100/5) as Total FROM exam_result GROUP By studentid

SELECT 
FROM
WHERE логическое выражение 1,0,null
SELECT * FROM students WHERE studentid < 345569
SELECT * FROM students WHERE studentid +1 < 345570 (low speed)
SELECT * FROM students WHERE studentid < 345574 or studentid > 345586

SELECT * FROM exam_sheet WHERE classroom=2411
SELECT * FROM exam_sheet WHERE NOT classroom=2411
+null
SELECT * FROM exam_sheet
EXCEPT /*MINUS*/
SELECT * FROM exam_sheet WHERE NOT classroom=2411

SELECT grade, COUNT(*) as amount, grade *100/5 as score FROM exam_result GROUP by grade ORDER by grade
SELECT studentid, min(grade) FROM exam_result GROUP BY studentid HAVING MIN(grade) >=4
SELECT studentid, min(grade) FROM exam_result GROUP BY studentid HAVING MIN(grade) >=4 and COUNT(*)>1

SELECT studentid FROM exam_result GROUP by studentid HAVING MAX(grade)-MIN(grade) = 0
SELECT studentid, avg(grade) FROM exam_result GROUP by studentid HAVING MAX(grade)-MIN(grade) = 0

SELECT studentname FROM students ORDER by studentname
SELECT studentname FROM students ORDER by groupcode
SELECT studentname FROM students ORDER by groupcode DESC
SELECT studentname,groupcode FROM students ORDER by groupcode DESC, studentname
SELECT studentname,groupcode FROM students ORDER by studentname || groupcode
SELECT studentname || groupcode AS order_group, studentname,groupcode FROM students ORDER by studentname || groupcode

SELECT StudentId FROM phone_list WHERE phone LIKE '%34%' AND phonetype='cell'
SELECT DISTINCT examdate FROM exam_sheet WHERE groupcode LIKE 'B%'
SELECT DISTINCT examdate FROM exam_sheet WHERE groupcode LIKE 'B%' AND classroom = 2410
SELECT Count(*) AS Number_of_exams FROM exam_sheet WHERE groupcode LIKE 'B%' AND classroom = 2410 
SELECT Count(*)    Number_of_exams FROM exam_sheet WHERE groupcode LIKE 'B%' AND classroom = 2410
