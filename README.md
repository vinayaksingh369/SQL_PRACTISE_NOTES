
# 📘 SQL Cheat Sheet

A comprehensive SQL cheat sheet covering **MySQL**, **ANSI SQL**, and universal database concepts for **engineers**, **developers**, and **testers**.

---

## 🔹 Basics

```sql
-- Create Database
CREATE DATABASE db_name;

-- Use Database
USE db_name;

-- Create Table
CREATE TABLE table_name (
    id INT PRIMARY KEY AUTO_INCREMENT,
    column1 VARCHAR(100),
    column2 INT,
    column3 DATE
);

-- Drop Table
DROP TABLE table_name;

-- Rename Table
RENAME TABLE old_name TO new_name;

-- Alter Table
ALTER TABLE table_name ADD column_name datatype;
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name MODIFY column_name datatype;
ALTER TABLE table_name RENAME TO new_table_name;
```

---

## 🔹 Data Types (MySQL & ANSI)

| Type         | Description                |
|--------------|----------------------------|
| `INT`        | Integer number             |
| `DECIMAL(x,y)` | Decimal value            |
| `VARCHAR(n)` | Variable-length string     |
| `CHAR(n)`    | Fixed-length string        |
| `TEXT`       | Long text                  |
| `DATE`       | 'YYYY-MM-DD'               |
| `DATETIME`   | 'YYYY-MM-DD HH:MM:SS'      |
| `BOOLEAN`    | TRUE / FALSE               |
| `BLOB`       | Binary large object        |

---

## 🔹 Data Manipulation

```sql
-- Insert
INSERT INTO table_name (col1, col2) VALUES ('value1', 'value2');

-- Update
UPDATE table_name SET col1 = 'value' WHERE condition;

-- Delete
DELETE FROM table_name WHERE condition;

-- Select
SELECT * FROM table_name;
SELECT col1, col2 FROM table_name;
SELECT DISTINCT col1 FROM table_name;

-- Limit
SELECT * FROM table_name LIMIT 10 OFFSET 5;
```

---

## 🔹 Clauses

```sql
WHERE col = value
AND, OR, NOT
BETWEEN val1 AND val2
IN (val1, val2, ...)
LIKE 'A%'    -- Starts with A
IS NULL / IS NOT NULL
```

---

## 🔹 Sorting & Grouping

```sql
-- Sorting
SELECT * FROM table_name ORDER BY col1 ASC, col2 DESC;

-- Grouping
SELECT col, COUNT(*) FROM table_name GROUP BY col;

-- HAVING
SELECT col, COUNT(*) FROM table_name GROUP BY col HAVING COUNT(*) > 1;
```

---

## 🔹 Joins

```sql
-- Inner Join
SELECT * FROM A
JOIN B ON A.id = B.a_id;

-- Left Join
SELECT * FROM A
LEFT JOIN B ON A.id = B.a_id;

-- Right Join
SELECT * FROM A
RIGHT JOIN B ON A.id = B.a_id;

-- Full Outer Join (MySQL doesn’t support it directly)
SELECT * FROM A
LEFT JOIN B ON A.id = B.a_id
UNION
SELECT * FROM A
RIGHT JOIN B ON A.id = B.a_id;
```

---

## 🔹 Subqueries & Aliases

```sql
-- Subquery
SELECT * FROM employees WHERE department_id IN (
    SELECT id FROM departments WHERE name = 'Sales'
);

-- Aliases
SELECT col1 AS alias_name FROM table_name;
```

---

## 🔹 Set Operations

```sql
-- UNION
SELECT col FROM A
UNION
SELECT col FROM B;

-- INTERSECT (Not in MySQL)
-- Use INNER JOIN workaround in MySQL

-- EXCEPT / MINUS (Not in MySQL)
-- Use LEFT JOIN with NULL filter
```

---

## 🔹 Indexes

```sql
-- Create Index
CREATE INDEX idx_name ON table_name(column_name);

-- Drop Index (MySQL)
DROP INDEX idx_name ON table_name;
```

---

## 🔹 Constraints

```sql
-- Primary Key
PRIMARY KEY (column)

-- Foreign Key
FOREIGN KEY (col) REFERENCES other_table(id)

-- Unique
UNIQUE (column)

-- Not Null
column_name datatype NOT NULL

-- Default
column_name datatype DEFAULT 'value'

-- Check (MySQL 8+)
CHECK (col > 0)
```

---

## 🔹 Views

```sql
-- Create View
CREATE VIEW view_name AS
SELECT col1, col2 FROM table_name WHERE condition;

-- Drop View
DROP VIEW view_name;
```

---

## 🔹 Transactions

```sql
START TRANSACTION;
-- SQL statements
COMMIT;  -- or ROLLBACK;
```

---

## 🔹 Stored Procedures & Functions

```sql
-- Procedure
DELIMITER //
CREATE PROCEDURE proc_name()
BEGIN
  -- statements
END //
DELIMITER ;

-- Call Procedure
CALL proc_name();

-- Function
DELIMITER //
CREATE FUNCTION func_name(x INT) RETURNS INT
BEGIN
  RETURN x * 2;
END //
DELIMITER ;
```

---

## 🔹 Triggers

```sql
CREATE TRIGGER trigger_name
BEFORE INSERT ON table_name
FOR EACH ROW
BEGIN
  -- logic
END;
```

---

## 🔹 Useful Functions

| Category     | Functions |
|--------------|----------|
| **String**   | `CONCAT()`, `UPPER()`, `LOWER()`, `SUBSTRING()`, `TRIM()` |
| **Math**     | `ROUND()`, `CEIL()`, `FLOOR()`, `MOD()` |
| **Date/Time**| `NOW()`, `CURDATE()`, `DATE_ADD()`, `DATEDIFF()` |
| **Aggregate**| `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()` |

---

## 🔹 Testing & QA Utilities

```sql
-- Check Table Structure
DESCRIBE table_name;

-- Show All Tables
SHOW TABLES;

-- Show Create Table
SHOW CREATE TABLE table_name;

-- Sample Data
SELECT * FROM table_name LIMIT 5;

-- Debug Queries
EXPLAIN SELECT * FROM table_name WHERE column = 'value';
```

---

## 🔹 Best Practices

- Always use `WHERE` with `UPDATE`/`DELETE`.
- Use `LIMIT` for pagination.
- Use `EXPLAIN` to analyze queries.
- Normalize data to reduce redundancy.
- Use indexes wisely on searchable fields.
- Backup data before major changes.

---

## 🔹 Tools

- **MySQL Workbench**
- **DBeaver**
- **phpMyAdmin**
- **PostgreSQL pgAdmin**
- **Sequel Ace / Pro**
- **DBVisualizer**

---

Feel free to **fork**, **star**, or **contribute**!
