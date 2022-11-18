DDL
CREATE <object> [options] создание 
ALTER <object> [options] изменение
DROP <object> [options] удаление

DML
SELECT
INSERT
UPDATE
DELETE
TRUNCATE

DCL
GRANT права
REVOKE отзыв прав

CREATE DATABASE db_name []
CREATE USER []
CREATE SCHEMA []

CREATE TABLE NAME 
    name
    type
    default_value
    integrity_rules

CREATE TABLE students
(
  studentid INTEGER,
  Studentname VARCHAR(100),
  GroupCode VARCHAR(32),
  BirthDate DATE,
  address VARCHAR(100)
)

DROP TABLE students

ALTER TABLE students
(add|drop|ALTER COLUMN
    name
    type
    default_value
    integrity_rules
  studentid_1 INTEGER,
);

ALTER TABLE students
DROP COLUMN studentid_1;

ALTER TABLE students
add COLUMN studentid_1 INTEGER;

ALTER TABLE students
ALTER COLUMN studentid_1 CHAR(10);

INSERT INTO students
VALUES (1345568, 'William Johnson', 'M2020_1', '01/02/1999', 'Some roads, London');

INSERT INTO students (  studentid,
                        Studentname,
                        GroupCode,
                        BirthDate,
                        address)
            VALUES (    1231221,
                        'Lily Brown',
                        'M2020_1',
                        to_date('17.05.1999','dd.mm.yyyy'),
                        'Manchester road, London');
                        
INSERT INTO students (  studentid,
                        Studentname,
                        GroupCode,
                        BirthDate,
                        address)
            VALUES (    1231221,
                        'Lily Brown',
                        'M2020_1',
                        to_date('17.05.1999','DD/MM/YYYY'),
                        'Manchester road, London');

DELETE FROM students WHERE studentid=1231221;
DELETE FROM students WHERE studentname like '%ily%';

