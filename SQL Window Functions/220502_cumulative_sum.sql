-- Предположим, мы хотим посчитать фонд оплаты труда нарастающим итогом независимо для каждого департамент.
-- Напишите запрос, который это сделает.

SELECT
    id,
    name,
    department,
    salary,
    sum(salary) OVER w AS total
FROM employees
WINDOW w AS (
             PARTITION BY department
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            )
ORDER BY id, department, salary;


-- uery result:
-- +----+----------+------------+--------+-------+
-- | id | name     | department | salary | total |
-- +----+----------+------------+--------+-------+
-- | 11 | Дарья    | hr         | 70     | 70    |
-- | 12 | Борис    | hr         | 78     | 148   |
-- | 21 | Елена    | it         | 84     | 84    |
-- | 22 | Ксения   | it         | 90     | 174   |
-- | 23 | Леонид   | it         | 104    | 278   |
-- | 24 | Марина   | it         | 104    | 382   |
-- | 25 | Иван     | it         | 120    | 502   |
-- | 31 | Вероника | sales      | 96     | 96    |
-- | 32 | Григорий | sales      | 96     | 192   |
-- | 33 | Анна     | sales      | 100    | 292   |
-- +----+----------+------------+--------+-------+