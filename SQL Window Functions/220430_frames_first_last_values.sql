-- Посмотрим, как зарплата сотрудника соотносится с минимальной и максимальной зарплатой в его департаменте.
-- Напишите запрос, который это сделает.

SELECT
    name,
    department,
    salary,
    first_value(salary) OVER w AS low,
    last_value(salary) OVER w AS high
FROM employees
WINDOW w AS (
             partition by department
             order by salary
             rows between unbounded preceding and unbounded following
            )
ORDER BY department, salary, id;

-- Query result:
-- +----------+------------+--------+-----+------+
-- | name     | department | salary | low | high |
-- +----------+------------+--------+-----+------+
-- | Дарья    | hr         | 70     | 70  | 78   |
-- | Борис    | hr         | 78     | 70  | 78   |
-- | Елена    | it         | 84     | 84  | 120  |
-- | Ксения   | it         | 90     | 84  | 120  |
-- | Леонид   | it         | 104    | 84  | 120  |
-- | Марина   | it         | 104    | 84  | 120  |
-- | Иван     | it         | 120    | 84  | 120  |
-- | Вероника | sales      | 96     | 96  | 100  |
-- | Григорий | sales      | 96     | 96  | 100  |
-- | Анна     | sales      | 100    | 96  | 100  |
-- +----------+------------+--------+-----+------+