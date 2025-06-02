
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



###################################################### 🔹 Additional Resources

- [SQL Tutorial](https://www.w3schools.com/sql/)
- [SQLZoo](https://sqlzoo.net/)
- [LeetCode SQL Problems](https://leetcode.com/problemset/all/?filters=tag%3ADatabase)
- [Mode Analytics SQL Tutorial](https://mode.com/sql-tutorial/)
- [Kaggle Datasets][def]

[def]: https://www.kaggle.com/datasets

## 🔹 Community & Support

- [Stack Overflow SQL Tag](https://stackoverflow.com/questions/tagged/sql)
- [Reddit r/SQL](https://www.reddit.com/r/SQL/)
- [SQL Server Central](https://www.sqlservercentral.com/)
- [Database Administrators Stack Exchange](https://dba.stackexchange.com/)

## 🔹 License

MIT License
This cheat sheet is licensed under the MIT License. Feel free to use, modify, and distribute it as needed.
## 🔹 Contributing  
Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a Pull Request.
## 🔹 Contact
For any questions, suggestions, or issues, please open an issue in the repository or contact me via email at [your-email@example.com](mailto:your-email@example.com). 
## 🔹 Acknowledgments
This cheat sheet was created to help developers, engineers, and testers quickly reference SQL commands and concepts. Special thanks to the SQL community for their contributions and resources that made this possible.
## 🔹 Version History
- **v1.0** - Initial release with basic SQL commands and concepts.
- **v1.1** - Added advanced topics like transactions, stored procedures, and triggers.
- **v1.2** - Included best practices, testing utilities, and additional resources.
- **v1.3** - Updated with new SQL functions and community resources.
## 🔹 Feedback
Your feedback is valuable! If you have suggestions for improvements or additional topics to cover, please open an issue or submit a pull request. Your contributions help make this cheat sheet better for everyone.
## 🔹 Frequently Asked Questions (FAQ)
### Q: What is SQL?
A: SQL (Structured Query Language) is a standard programming language used to manage and manipulate relational databases. It allows users to perform tasks such as querying data, updating records, and managing database structures.
### Q: What is the difference between SQL and MySQL?
A: SQL is a language used for managing databases, while MySQL is a specific relational database management system (RDBMS) that uses SQL as its query language. Other RDBMSs include PostgreSQL, Oracle, and Microsoft SQL Server.
### Q: How do I connect to a MySQL database?
A: You can connect to a MySQL database using various methods, such as command-line tools, programming languages (like Python, Java, or PHP), or GUI tools like MySQL Workbench or phpMyAdmin. The connection typically requires a hostname, username, password, and database name.
### Q: What is a primary key?
A: A primary key is a unique identifier for each record in a database table. It ensures that no two records can have the same value in the primary key column(s) and is often used to establish relationships between tables.
### Q: What is a foreign key?
A: A foreign key is a column or a set of columns in one table that refers to the primary key in another table. It establishes a relationship between the two tables, ensuring referential integrity by enforcing that the value in the foreign key column must match a value in the referenced primary key column.
### Q: How do I optimize SQL queries?
A: To optimize SQL queries, consider the following:
- Use indexes on columns that are frequently searched or used in joins.
- Avoid using `SELECT *`; specify only the columns you need.
- Use `JOIN` instead of subqueries when possible.
- Analyze query execution plans using `EXPLAIN`.
- Limit the number of rows returned using `LIMIT`.
### Q: What is normalization?
A: Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves dividing a database into smaller, related tables and defining relationships between them. The goal is to eliminate duplicate data and ensure that each piece of information is stored in only one place.
### Q: What is a view in SQL?
A: A view is a virtual table in SQL that is based on the result of a query. It does not store data itself but provides a way to present data from one or more tables in a specific format. Views can simplify complex queries, enhance security by restricting access to certain data, and provide a consistent interface for users.
## 🔹 Conclusion
This SQL cheat sheet provides a quick reference to essential SQL commands and concepts. Whether you're a beginner or an experienced developer, these resources can help you improve your SQL skills and tackle database challenges more effectively.
## 🔹 Additional Resources
- [SQL Cheat Sheet by DataCamp](https://www.datacamp.com/community/blog/sql-cheat-sheet)
- [SQL Cheat Sheet by Guru99](https://www.guru99.com/sql-cheat-sheet.html)
- [SQL Cheat Sheet by SQLBolt](https://sqlbolt.com/)
## 🔹 Additional Topics
- SQL Functions
- SQL Performance Tuning
- SQL Security Best Practices
- SQL Data Modeling
## 🔹 Additional Topics
- SQL Data Warehousing
- SQL Big Data Integration
- SQL NoSQL Integration
- SQL Cloud Database Management
## 🔹 Additional Topics
- SQL Database Migration
- SQL Data Backup and Recovery
- SQL Data Visualization
- SQL Data Governance
## 🔹 Additional Topics
- SQL Data Analytics
- SQL Machine Learning Integration
- SQL Data Science Applications
## 🔹 Additional Topics 
- SQL Data Engineering
- SQL Data Architecture
- SQL Data Quality Management
## 🔹 Additional Topics
- SQL Data Integration
- SQL Data Transformation
- SQL Data Pipeline Management
## 🔹 Additional Topics
- SQL Data Cataloging
- SQL Data Lineage
- SQL Data Stewardship
## 🔹 Additional Topics
- SQL Data Privacy
- SQL Data Compliance
- SQL Data Ethics
## 🔹 Additional Topics
- SQL Data Auditing
- SQL Data Monitoring
- SQL Data Profiling
## 🔹 Additional Topics
- SQL Data Enrichment
- SQL Data Cleansing
- SQL Data Deduplication
## 🔹 Additional Topics
- SQL Data Archiving
- SQL Data Retention Policies
- SQL Data Lifecycle Management
## 🔹 Additional Topics
- SQL Data Migration Strategies
- SQL Data Transformation Techniques
- SQL Data Integration Patterns
## 🔹 Additional Topics
