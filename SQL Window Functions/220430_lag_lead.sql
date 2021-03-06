-- Предположим, мы хотим для каждого сотрудника увидеть зарплаты предыдущего и следующего коллеги.
-- Напишите запрос, который это сделает.

SELECT
    name,
    department,
    lag(salary, 1) OVER w AS prev,
    salary,
    lead(salary, 1) OVER w AS next
FROM employees
WINDOW w AS (order by salary)
ORDER BY salary, id

-- Query result:
-- +----------+------------+------+--------+------+
-- | name     | department | prev | salary | next |
-- +----------+------------+------+--------+------+
-- | Дарья    | hr         | NULL | 70     | 78   |
-- | Борис    | hr         | 70   | 78     | 84   |
-- | Елена    | it         | 78   | 84     | 90   |
-- | Ксения   | it         | 84   | 90     | 96   |
-- | Вероника | sales      | 90   | 96     | 96   |
-- | Григорий | sales      | 96   | 96     | 100  |
-- | Анна     | sales      | 96   | 100    | 104  |
-- | Леонид   | it         | 100  | 104    | 104  |
-- | Марина   | it         | 104  | 104    | 120  |
-- | Иван     | it         | 104  | 120    | NULL |
-- +----------+------------+------+--------+------+