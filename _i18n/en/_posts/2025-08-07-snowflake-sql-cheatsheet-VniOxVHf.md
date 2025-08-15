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


```

### Window Functions

`ROW_NUMBER()`, `RANK()`, `SUM() OVER()`, `AVG() OVER()`

CTEs: WITH cte_name AS (SELECT ...)
Subqueries: (SELECT ... FROM ... WHERE ...)
Aggregations: COUNT(), SUM(), GROUP BY, HAVING
NULL Handling: COALESCE(), NULLIF()
String Functions: CONCAT(), SUBSTRING(), TRIM()
Date Functions: CURRENT_DATE, DATEADD(), DATEDIFF()
Conditional: CASE WHEN ... THEN ... ELSE ... END
