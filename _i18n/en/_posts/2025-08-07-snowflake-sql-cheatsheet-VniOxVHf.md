---
layout: post
title: "Snowflake SQL Cheatsheet"
date: '2025-08-07 11:15:02 +05:30'
tags: snowflake sql cheatsheet
---

## SQL Essentials

### Joins

|Join Type|Description|Syntax|
|-|-|-|
|INNER|Returns rows that match on both sides of the join|`SELECT * FROM table1 INNER JOIN table2 ON table1.column = table2.column`|
|LEFT|Returns all rows from the left table, and the matched rows from the right table|`SELECT * FROM table1 LEFT JOIN table2 ON table1.column = table2.column`|
|RIGHT|Returns all rows from the right table, and the matched rows from the left table|`SELECT * FROM table1 RIGHT JOIN table2 ON table1.column = table2.column`|
|FULL OUTER|Returns all rows when there is a match on either left or right table|`SELECT * FROM table1 FULL OUTER JOIN table2 ON table1.column = table2.column`|

```sql
-- INNER JOIN usage
SELECT 
    o.order_id, 
    o.order_date, 
    oi.product_name, 
    oi.quantity, 
    oi.price
FROM orders o
INNER JOIN order_items oi ON o.order_id = oi.order_id;

-- LEFT JOIN usage
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    mgr.first_name AS manager_first_name,
    mgr.last_name AS manager_last_name
FROM employees e
LEFT JOIN employees mgr ON e.manager_id = mgr.employee_id;

-- RIGHT JOIN usage
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN usage
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;
```

### Window Functions

|Function|Description|Syntax|
|-|-|-|
|`ROW_NUMBER()`|Assigns a unique number to each row within a partition|`ROW_NUMBER() OVER (PARTITION BY column ORDER BY column)`|
|`RANK()`|Assigns a rank to each row within a partition|`RANK() OVER (PARTITION BY column ORDER BY column)`|
|`DENSE_RANK()`|Assigns a dense rank to each row within a partition|`DENSE_RANK() OVER (PARTITION BY column ORDER BY column)`|
|`AVG()`|Calculates the average of a column within a window|`AVG(column) OVER (PARTITION BY column ORDER BY column)`|
|`COUNT()`|Calculates the count of rows within a window|`COUNT(*) OVER (PARTITION BY column ORDER BY column)`|
|`SUM()`|Calculates the sum of a column within a window|`SUM(column) OVER (PARTITION BY column ORDER BY column)`|
|`MIN()`|Calculates the minimum value of a column within a window|`MIN(column) OVER (PARTITION BY column ORDER BY column)`|
|`MAX()`|Calculates the maximum value of a column within a window|`MAX(column) OVER (PARTITION BY column ORDER BY column)`|
|`FIRST_VALUE()`|Retrieves the first value within a window|`FIRST_VALUE(column) OVER (PARTITION BY column ORDER BY column)`|
|`LAST_VALUE()`|Retrieves the last value within a window|`LAST_VALUE(column) OVER (PARTITION BY column ORDER BY column)`|
|`NTILE()`|Divides a window into equal parts and assigns a number to each row|`NTILE(3) OVER (PARTITION BY column ORDER BY column)`|
|`LAG()`|Retrieves the value from a previous row within a window|`LAG(column) OVER (PARTITION BY column ORDER BY column)`|
|`LEAD()`|Retrieves the value from a subsequent row within a window|`LEAD(column) OVER (PARTITION BY column ORDER BY column)`|

```sql
-- ROW_NUMBER() usage
SELECT
    employee_id,
    first_name,
    last_name,
    ROW_NUMBER() OVER (ORDER BY employee_id) AS row_num
FROM employees;

-- RANK() usage
SELECT
    employee_id,
    first_name,
    last_name,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- DENSE_RANK() usage
SELECT
    employee_id,
    first_name,
    last_name,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

-- AVG() usage
SELECT
    department_id,
    AVG(salary) OVER (PARTITION BY department_id) AS avg_salary
FROM employees;

-- COUNT() usage
SELECT
    department_id,
    COUNT(*) OVER (PARTITION BY department_id) AS employee_count
FROM employees;

-- SUM() usage
SELECT
    department_id,
    salary,
    SUM(salary) OVER (PARTITION BY department_id) AS total_salary,
    SUM(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS cumulative_salary,
    salary / SUM(salary) OVER (PARTITION BY department_id) * 100 AS salary_percentage
FROM employees;

-- MIN() usage
SELECT
    department_id,
    salary,
    MIN(salary) OVER (PARTITION BY department_id) AS min_salary
FROM employees;

-- MAX() usage
SELECT
    department_id,
    salary,
    MAX(salary) OVER (PARTITION BY department_id) AS max_salary
FROM employees;

-- FIRST_VALUE() usage
SELECT
    employee_id,
    first_name,
    last_name,
    FIRST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS highest_salary
FROM employees;

-- LAST_VALUE() usage
    SELECT
        employee_id,
        first_name,
        last_name,
        LAST_VALUE(salary) OVER (PARTITION BY department_id ORDER BY salary ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS highest_salary
    FROM employees;

-- LAG() usage
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    LAG(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS previous_salary
FROM employees;

-- LEAD() usage
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    LEAD(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS next_salary
FROM employees;
```

### CTEs (Common Table Expressions) and Subqueries

```sql
-- CTE usage
WITH emp_dept AS (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.salary,
    c.avg_salary
FROM employees e
JOIN emp_dept c ON e.department_id = c.department_id;

-- Subquery usage
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    (SELECT AVG(salary) FROM employees e1 WHERE e1.department_id = e.department_id) AS avg_department_salary
FROM employees e;
```

### Aggregations

|Function|Description|Syntax|
|-|-|-|
|`COUNT()`|Counts the number of rows in a group|`COUNT(*)`|
|`SUM()`|Calculates the sum of a column|`SUM(column)`|
|`AVG()`|Calculates the average of a column|`AVG(column)`|
|`MIN()`|Retrieves the minimum value of a column|`MIN(column)`|
|`MAX()`|Retrieves the maximum value of a column|`MAX(column)`|

```sql
-- COUNT() usage
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

-- SUM() usage
SELECT
    department_id,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- AVG() usage
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

-- MIN() usage
SELECT
    department_id,
    MIN(salary) AS min_salary
FROM employees
GROUP BY department_id;

-- MAX() usage
SELECT
    department_id,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department_id;
```

<!-- 
Aggregations: COUNT(), SUM(), GROUP BY, HAVING
NULL Handling: COALESCE(), NULLIF()
String Functions: CONCAT(), SUBSTRING(), TRIM()
Date Functions: CURRENT_DATE, DATEADD(), DATEDIFF()
Conditional: CASE WHEN ... THEN ... ELSE ... END -->
