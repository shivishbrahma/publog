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

## Time Series

1.⁠ ⁠Calculate daily user retention for a 30-day cohort window.

```sql
with daily_activity as (
    select date(event_ts) event_date, count(distinct user_id) as daily_user_count from events
    group by 1
)
select
    event_date, 
    daily_user_count - lag(daily_user_count) over(order by event_date) daily_user_count_diff,
    (daily_user_count - lag(daily_user_count) over(order by event_date)) *100 / (lag(daily_user_count) over(order by event_date)) daily_user_retention
from daily_activity;
```

2.⁠ ⁠Retrieve the latest 3 events per user using window functions.

```sql
select events.*, row_number() over (partition by user_id order by event_ts desc) rn
from events
qualify rn <= 3;
```

3.⁠ ⁠Detect out-of-order events in time-series logs using timestamps.

```sql
with ordered_events as (
    select 
        user_id, event_name, event_ts, 
        row_number() over(partition by user_id order by event_ts) as event_order
    from events
),
out_of_order_events AS (
    SELECT 
        a.user_id,
        a.event_name AS current_event,
        a.event_ts AS current_event_ts,
        b.event_name AS previous_event,
        b.event_ts AS previous_event_ts
    FROM 
        ordered_events a
    JOIN 
        ordered_events b ON a.user_id = b.user_id AND a.event_order = b.event_order + 1
    WHERE 
        a.event_ts < b.event_ts
)
SELECT 
    user_id,
    current_event,
    current_event_ts,
    previous_event,
    previous_event_ts
FROM 
    out_of_order_events
ORDER BY 
    user_id, current_event_ts;
```

4.⁠ ⁠Backfill missing dates in a partitioned dataset using calendar table.

```sql
```

5.⁠ ⁠Compute rolling 7-day distinct active users per platform.

```sql
select 
    date(event_ts) as event_date,
    platform_name,
    count(distinct user_id) over (partition by platform_name order by date(event_ts) rows between 6 preceding and current row) as active_users
from events
group by 1, 2;
```

6.⁠ ⁠Identify users with no activity in the last 30 days (churn analysis).

```sql
select user_id
from events
where event_ts > current_timestamp - interval '30' day
group by user_id
having count(*) = 0;
```

7.⁠ ⁠Perform multi-level aggregation (category → subcategory → product).

```sql
```

8.⁠ ⁠Compare current vs previous month revenue per region.

```sql
with monthly_revenue as (
    select region,
        extract(month from order_date) as month_name,
        sum(revenue) as total_revenue
    from orders
    group by 1, 2
)
select distinct
    region,
    month_name,
    total_revenue current_month_revenue,
    lag(total_revenue) over (partition by region order by month_name) as previous_month_revenue,
    previous_month_revenue - current_month_revenue as revenue_difference
from monthly_revenue;
```

9.⁠ ⁠Join fact and dimension tables with SCD Type 2 handling.

10.⁠ ⁠Detect schema drift between raw and curated layers via metadata.

11.⁠ ⁠Calculate 95th percentile of transaction amounts by user.

12.⁠ ⁠Fetch top 3 categories contributing to 80% of total revenue.

13.⁠ ⁠Identify seasonal patterns in monthly product sales.

14.⁠ ⁠Use broadcast join hints to optimize small dimension lookups.

15.⁠ ⁠Flag revenue anomalies using z-score or standard deviation.

16.⁠ ⁠Remove duplicates using ROW_NUMBER on ingestion timestamp.

17.⁠ ⁠Calculate session time from login-logout events.

18.⁠ ⁠Compare revenue growth across last 3 quarters per product line.

19.⁠ ⁠Identify users who upgraded to premium but never used the features.

20.⁠ ⁠Track update frequency on records in an SCD Type 2 table.

1.⁠ ⁠Write a SQL query using Delta tables to compute cumulative revenue per day
2.⁠ ⁠Retrieve the first and last login per user from a huge event log table
3.⁠ ⁠Find the top 3 customers by spend in each region (use window functions)
4.⁠ ⁠Detect duplicate records in a transactional table and delete extras safely
5.⁠ ⁠Get users who made purchases in 3 consecutive months
6.⁠ ⁠Identify skewed joins in SQL and propose fixes using broadcast hints
7.⁠ ⁠Compute a 7-day moving average of product sales on Delta Lake
8.⁠ ⁠Pivot daily sales into month-wise columns
9.⁠ ⁠Find customers who bought products every month in a year
10.⁠ ⁠Rank products by sales per year, resetting rank each year
11.⁠ ⁠Find employees earning more than their department average
12.⁠ ⁠Find the median transaction amount (no built-in median)
13.⁠ ⁠Get all users who placed their first order in the last 30 days
14.⁠ ⁠Compare price change between two dates for each product
15.⁠ ⁠Identify customers whose first and last transaction is on the same day
16.⁠ ⁠Calculate the percentage of returning users for each month
17.⁠ ⁠Retrieve products that have never been sold
18.⁠ ⁠Detect schema drift in historical Delta data snapshots
19.⁠ ⁠Find departments where at least 2 employees have identical salaries
20.⁠ ⁠Group users by login streaks of 3+ consecutive days.
