---
layout: post
title: "Top SQL Interview Questions"
date: '2025-06-27 11:09:04 +05:30'
tags: sql interview mysql postgresql
---

1. Write an SQL query to fetch the second-highest salary from an `employees` table.

    ```sql
    SELECT MAX(salary) AS SecondHighestSalary
    FROM employees
    WHERE salary < (SELECT MAX(salary) FROM employees);
    ```

    ```sql
    SELECT salary AS SecondHighestSalary
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1;
    ```

    ```sql
    SELECT salary AS SecondHighestSalary
    FROM (
        SELECT salary, row_number() OVER (ORDER BY salary DESC) AS rank
        FROM employees
    ) AS RankedSalaries
    WHERE rank = 2;
    ```

2. Write an SQL query to get the duplicate records from a table.

    ```sql
    SELECT column_name, COUNT(*) AS count
    FROM table_name
    GROUP BY column_name
    HAVING COUNT(*) > 1;
    ```

3. Write a query to find the employees who earn more than their managers.

    ```sql
    SELECT e1.*
    FROM employees e1
    JOIN employees e2 ON e1.manager_id = e2.id
    WHERE e1.salary > e2.salary;
    ```

4. Write an SQL query to retrieve the top `N` records from a table.

    ```sql
    SELECT *
    FROM table_name
    ORDER BY column_name DESC
    LIMIT N;
    ```

5. Write an SQL query to count the number of employees in each department.

    ```sql
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department;
    ```

6. Write a query to find the department with the highest number of employees.

    ```sql
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
    ORDER BY employee_count DESC
    LIMIT 1;
    ```

7. Write a query to retrieve employees who have the same salary.

    ```sql
    SELECT e1.*
    FROM employees e1
    JOIN employees e2 ON e1.salary = e2.salary
    WHERE e1.id != e2.id;
    ```

8. Write an SQL query to list all employees whose name starts with 'A'.

    ```sql
    SELECT *
    FROM employees
    WHERE name LIKE 'A%';
    ```

9. Write an SQL query to get the last record from a table.

    ```sql
    SELECT *
    FROM employees
    ORDER BY employee_id DESC
    LIMIT 1;
    ```

10. Write a query to get employees who joined in the last 6 months.

    ```sql
    SELECT *
    FROM employees
    WHERE join_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);
    ```

11. Write an SQL query to find the `Nth` highest salary from a table.

    ```sql
    SELECT DISTINCT salary AS NthHighestSalary
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET N-1;
    ```

    ```sql
    SELECT salary AS NthHighestSalary
    FROM (
        SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
        FROM employees
    ) AS RankedSalaries
    WHERE rank = N;
    ```

12. Write a query to remove duplicate rows from a table without using `DISTINCT`.

    ```sql
    DELETE FROM sales
    WHERE id NOT IN (
        SELECT id
        FROM (
            SELECT id, ROW_NUMBER() OVER (PARTITION BY order_date, product_name, customer_id ORDER BY id) AS rnk
        ) AS RankedSales
        WHERE rnk = 1
    )
    ```

13. Write a query to find missing numbers in a sequence of IDs.

    ```sql
    SELECT t1.id + 1 AS MissingID
    FROM employees t1
    LEFT JOIN employees t2 ON t1.id + 1 = t2.id
    WHERE t2.id IS NULL
    ORDER BY MissingID;
    ```

14. Write an SQL query to display the first and last name in a single column.

    ```sql
    SELECT CONCAT(first_name, ' ', last_name) AS full_name
    FROM employees;
    ```

15. Write an SQL query to get the cumulative sum of salaries for each employee.

    ```sql
    SELECT id, name, salary, SUM(salary) OVER (ORDER BY id) AS cumulative_salary
    FROM employees;
    ```

16. Write an SQL query to swap the values of two columns without using a third variable.

    ```sql
    UPDATE employees
    SET column1 = column2, column2 = column1
    WHERE condition;
    ```

17. Write a query to fetch employees whose names contain only vowels.

    ```sql
    SELECT *
    FROM employees
    WHERE name REGEXP '^[aeiouAEIOU]+$';
    ```

18. Write an SQL query to transpose rows into columns.

    | Year | Product | Amount |
    | ---- | ------- | ------ |
    | 2023 | A       | 100    |
    | 2023 | B       | 150    |
    | 2024 | A       | 200    |
    | 2024 | B       | 250    |

    | Year | Product_A | Product_B |
    | ---- | --------- | --------- |
    | 2023 | 100       | 150       |
    | 2024 | 200       | 250       |

    ```sql
    SELECT 
        Year,
        SUM(CASE WHEN Product = 'A' THEN Amount ELSE 0 END) AS Product_A,
        SUM(CASE WHEN Product = 'B' THEN Amount ELSE 0 END) AS Product_B
    FROM 
        Sales
    GROUP BY 
        Year
    ORDER BY 
        Year;
    ```

19. Write an SQL query to find the employees with the highest salary in each department.

    ```sql
    SELECT id, name, department, salary
    FROM (
        SELECT
            e.*,
            RANK() OVER (PARTITION BY department ORDER BY salary DESC) as rnk
        FROM employees e
    ) sub
    WHERE rnk = 1;
    ```

20. Write a query to find customers who made multiple purchases on the same day.

    ```sql
    SELECT customer_id, order_date, COUNT(*) AS purchase_count
    FROM orders
    GROUP BY customer_id, order_date
    HAVING COUNT(*) > 1;
    ```

21. Write a query to get the moving average of sales for the last 3 months.

    ```sql
    SELECT 
        month,
        AVG(sales) OVER (ORDER BY month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS moving_average
    FROM Sales
    ORDER BY month;
    ```

22. Write an SQL query to rank employees by salary in each department.

    ```sql
    SELECT 
        id, 
        name, 
        department, 
        salary, 
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
    FROM employees;
    ```

23. Write an SQL query to find employees who have more than one manager.

    ```sql
    SELECT employee_id, COUNT(DISTINCT manager_id) AS manager_count
    FROM employee_managers
    GROUP BY employee_id
    HAVING manager_count > 1;
    ```

24. Write a query to retrieve the most frequent order date from an `orders` table.

    ```sql
    SELECT order_date, COUNT(*) AS order_count
    FROM orders
    GROUP BY order_date
    ORDER BY order_count DESC
    LIMIT 1;
    ```

25. Write an SQL query to compare two tables and find mismatched records.

    ```sql
    SELECT *
    FROM TableA a
    FULL OUTER JOIN TableB b ON a.id = b.id
    WHERE a.id IS NULL OR b.id IS NULL;
    ```

26. Write an SQL query to calculate the difference between consecutive rows.

    ```sql
    SELECT 
        id, 
        value,
        value - LAG(value) OVER (ORDER BY id) AS difference
    FROM TableName;
    ```

27. Write a query to pivot table data dynamically.

    ```sql
    -- Outer SELECT to choose all columns resulting from the PIVOT operation
    SELECT *
    FROM (
        -- Inner SELECT to retrieve the raw data of city, year, and sales
        SELECT city, year, sales
        FROM sales
    )
    -- PIVOT operation to convert rows to columns
    PIVOT (
        SUM(sales) 
        -- Specify the year values to pivot and alias them as Sales_<year>
        FOR year IN (2019 AS Sales_2019, 2020 AS Sales_2020, 2021 AS Sales_2021)
    )
    ORDER BY city;
    ```

28. Write a query to delete every alternate row from a table.

    ```sql
    WITH CTE AS (
        SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS row_num
        FROM table_name
    )
    DELETE FROM table_name
    WHERE id IN (SELECT id FROM CTE WHERE row_num % 2 = 0);
    ```

29. Write an SQL query to get the first purchase date for each customer.

    ```sql
    SELECT customer_id, MIN(ordered_at) AS first_purchase_date
    FROM orders
    GROUP BY customer_id;
    ```

30. Write an SQL query to get the running total of sales per month.

    ```sql
    WITH MonthlySales AS (
        SELECT 
            month,
            count(distinct order_id) AS monthly_sales
        FROM orders
        WHERE ordered_at IS NOT NULL
        AND cancelled_at IS NULL
        GROUP BY month
    )
    SELECT 
        month,
        monthly_sales,
        SUM(monthly_sales) OVER (ORDER BY month) AS running_total
    FROM MonthlySales
    ORDER BY month;
    ```

31. Write an SQL query to assign a rank to employees based on their salaries.

    ```sql
    SELECT 
        id, 
        name, 
        salary,
        RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees;
    ```

32. Write an SQL query to find the percentage contribution of each employee’s salary to the total salary.

    ```sql
    SELECT 
        id, 
        name, 
        salary,
        (salary / SUM(salary) OVER ()) * 100 AS salary_percentage
    FROM employees;
    ```

33. Write a query to find the cumulative sum of sales using a window function.

    ```sql
    SELECT
        order_date,
        sales_amount,
        SUM(sales_amount) OVER (ORDER BY order_date) AS cumulative_sales
    FROM orders;
    ```

34. Write an SQL query to get the difference between two consecutive transactions.

    ```sql
    SELECT 
        id, 
        transaction_date, 
        amount,
        amount - LAG(amount) OVER (ORDER BY transaction_date) AS transaction_difference
    FROM transactions;
    ```

35. Write an SQL query to find the `LEAD()` and `LAG()` salary for each employee.

    ```sql
    SELECT 
        id, 
        name, 
        salary,
        LEAD(salary) OVER (ORDER BY id) AS next_salary,
        LAG(salary) OVER (ORDER BY id) AS previous_salary
    FROM
        employees;
    ```
