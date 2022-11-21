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

CAST
CAST (value) AS (type)
SELECT CAST ('5' as INTEGER)
SELECT CAST (5 as DECIMAL(3,2))
SELECT CAST (5 as char(7))
SELECT CAST (5 AS INTEGER) /* FROM DUAL in Oracle*/
SELECT CAST (studentid AS INTEGER) from students
SELECT CAST (studentid AS CHAR(7)) from students
SELECT 'number - ' || CAST (studentid AS CHAR(7)) from students

SELECT CURRENT_CATALOG
SELECT CURRENT_USER
SELECT CURRENT_TIME
SELECT CURRENT_DATE
SELECT CURRENT_TIMESTAMP
SELECT CURRENT_ROLE
SELECT CURRENT_SCHEMA

oracle SELECT SYSDATE FROM DUAL
PostgreSQL SELECT CURRENT_DATE
SQLserver SELECT GETDATE()

SELECT CAST ('01/01/2017' as DATE)
SELECT CAST (CURRENT_DATE as TEXT)
SELECT CAST ('01.01.2017' as DATE)
SELECT CAST (CURRENT_TIMESTAMP as CHAR(28))
SELECT to_date('28/02/2020 18:24','DD/MM/YYYY HH24:MI')
SELECT to_char (CURRENT_DATE,'YYYY-MM-DD')
ADD_MONTHS
CURRENT_DATE / NOW / GETDATE
EXTRACT / DATE_PART / DATEPART
NEXT_DAY
-/ DATEDIFF
TRUNC / DATE_TRUNC
SELECT TO_DATE('28/02/2020','DD/MM/YYYY') + 100 /*ADD 100 DAYS*/
SELECT MAX(birthdate)-MIN(birthdate) FROM students
SELECT EXTRACT (YEAR FROM max(birthdate)) FROM students
SELECT EXTRACT (MONTH FROM max(birthdate)) FROM students
SELECT EXTRACT (DAY FROM max(birthdate)) FROM students
SELECT EXTRACT (MONTH FROM CURRENT_DATE)

SELECT * FROM students WHERE EXTRACT (MONTH FROM birthdate)=5 
SELECT * FROM students WHERE EXTRACT (MONTH FROM birthdate)=5 ORDER BY EXTRACT (DAY FROM birthdate)

ABS
SIGN
POWER
SQRT
TRUNC
ROUND
MOD
SIN
COS
LOG
LN
EXP
CEIL

SELECT AVG(grade), studentid FROM exam_result GROUP BY studentid
SELECT trunc(AVG(grade)), studentid FROM exam_result GROUP BY studentid /*округление вниз*/
SELECT trunc(AVG(grade),2), studentid FROM exam_result GROUP BY studentid /*округление вниз*/
SELECT CEIL(AVG(grade)), studentid FROM exam_result GROUP BY studentid /*округление вверх*/
