-- Есть таблица сотрудников employees.
-- Напишите запрос, который для каждого сотрудника выведет:
-- размер з/п предыдущего по зарплате сотрудника (среди коллег по департаменту);
-- максимальную з/п по департаменту.


SELECT
    id,
    name,
    department,
    salary,
    first_value(salary) OVER w AS prev_salary,
    last_value(salary) OVER w AS max_salary
FROM employees
WINDOW w AS (
             PARTITION BY department
             ORDER BY salary
             ROWS BETWEEN 1 PRECEDING AND UNBOUNDED FOLLOWING
            )
ORDER BY department, salary, id;

-- Query result:
-- +----+----------+------------+--------+-------------+------------+
-- | id | name     | department | salary | prev_salary | max_salary |
-- +----+----------+------------+--------+-------------+------------+
-- | 11 | Дарья    | hr         | 70     | 70          | 78         |
-- | 12 | Борис    | hr         | 78     | 70          | 78         |
-- | 21 | Елена    | it         | 84     | 84          | 120        |
-- | 22 | Ксения   | it         | 90     | 84          | 120        |
-- | 23 | Леонид   | it         | 104    | 90          | 120        |
-- | 24 | Марина   | it         | 104    | 104         | 120        |
-- | 25 | Иван     | it         | 120    | 104         | 120        |
-- | 31 | Вероника | sales      | 96     | 96          | 100        |
-- | 32 | Григорий | sales      | 96     | 96          | 100        |
-- | 33 | Анна     | sales      | 100    | 96          | 100        |
+----+----------+------------+--------+-------------+------------+