CREATE DATABASE IF NOT EXISTS Pranay_2520080061;
use Pranay_2520080061;

DROP TABLE IF EXISTS class_info;
DROP TABLE IF EXISTS class;

CREATE TABLE class (
    id INT,
    name VARCHAR(30)
);

CREATE TABLE class_info (
    id INT,
    address VARCHAR(30)
);

INSERT INTO class VALUES
(1, 'abhi'),
(2, 'adam'),
(3, 'alex'),
(4, 'anu');

INSERT INTO class_info VALUES
(1, 'DELHI'),
(2, 'MUMBAI'),
(3, 'CHENNAI');

SELECT *
FROM class
CROSS JOIN class_info;

SELECT *
FROM class
INNER JOIN class_info
ON class.id = class_info.id;

SELECT class.name, class_info.address
FROM class
INNER JOIN class_info
ON class.id = class_info.id;

SELECT *
FROM class
NATURAL JOIN class_info;

INSERT INTO class VALUES
(5, 'ashish');

INSERT INTO class_info VALUES
(7, 'NOIDA'),
(8, 'PANIPAT');

SELECT *
FROM class
LEFT OUTER JOIN class_info
ON class.id = class_info.id;

SELECT *
FROM class
LEFT JOIN class_info
ON class.id = class_info.id
WHERE class_info.id IS NULL;

SELECT *
FROM class
RIGHT OUTER JOIN class_info
ON class.id = class_info.id;

SELECT *
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id
WHERE class.id IS NULL;

SELECT
    class.id AS class_id,
    class.name,
    class_info.id AS info_id,
    class_info.address
FROM class
LEFT JOIN class_info
ON class.id = class_info.id

UNION

SELECT
    class.id AS class_id,
    class.name,
    class_info.id AS info_id,
    class_info.address
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id;

SELECT
    class.id AS class_id,
    class.name,
    class_info.id AS info_id,
    class_info.address
FROM class
LEFT JOIN class_info
ON class.id = class_info.id
WHERE class_info.id IS NULL

UNION

SELECT
    class.id AS class_id,
    class.name,
    class_info.id AS info_id,
    class_info.address
FROM class
RIGHT JOIN class_info
ON class.id = class_info.id
WHERE class.id IS NULL;

DROP TABLE IF EXISTS first_table;
DROP TABLE IF EXISTS second_table;

CREATE TABLE first_table (
    id INT,
    name VARCHAR(30)
);

CREATE TABLE second_table (
    id INT,
    name VARCHAR(30)
);

INSERT INTO first_table VALUES
(1, 'abhi'),
(2, 'adam');

INSERT INTO second_table VALUES
(2, 'adam'),
(3, 'chester');

SELECT *
FROM first_table
UNION
SELECT *
FROM second_table;

SELECT name
FROM first_table
UNION
SELECT name
FROM second_table;

SELECT *
FROM first_table
UNION ALL
SELECT *
FROM second_table;

SELECT COUNT(*) AS total_records
FROM (
    SELECT *
    FROM first_table
    UNION ALL
    SELECT *
    FROM second_table
) AS A;

SELECT f.id, f.name
FROM first_table f
INNER JOIN second_table s
ON f.id = s.id
AND f.name = s.name;

SELECT DISTINCT f.name
FROM first_table f
INNER JOIN second_table s
ON f.name = s.name;

SELECT f.id, f.name
FROM first_table f
WHERE NOT EXISTS (
    SELECT 1
    FROM second_table s
    WHERE s.id = f.id
    AND s.name = f.name
);

SELECT DISTINCT f.name
FROM first_table f
WHERE NOT EXISTS (
    SELECT 1
    FROM second_table s
    WHERE s.name = f.name
);

SELECT c.id, c.name, ci.address
FROM class c
INNER JOIN class_info ci
ON c.id = ci.id;

SELECT
    c.id,
    c.name,
    CASE
        WHEN ci.address IS NULL THEN 'Address Missing'
        ELSE 'Address Available'
    END AS Status
FROM class c
LEFT JOIN class_info ci
ON c.id = ci.id;

SELECT * FROM class;
SELECT * FROM class_info;
SELECT * FROM first_table;
SELECT * FROM second_table;

