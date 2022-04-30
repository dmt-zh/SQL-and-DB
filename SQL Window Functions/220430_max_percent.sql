-- Предположим, мы хотим для каждого сотрудника увидеть, сколько процентов составляет его зарплата от максимальной в городе.
-- Напишите запрос, который это сделает. 


SELECT
    name,
    city,
    salary,
    round(salary * 100/last_value(salary) OVER w) AS percent
FROM employees
WINDOW w AS (
             partition by city
             order by salary
             rows between unbounded preceding and unbounded following
            )
ORDER BY city, salary, id;


-- Query result:
-- +----------+--------+--------+---------+
-- | name     | city   | salary | percent |
-- +----------+--------+--------+---------+
-- | Ксения   | Москва | 90     | 75      |
-- | Вероника | Москва | 96     | 80      |
-- | Анна     | Москва | 100    | 83      |
-- | Марина   | Москва | 104    | 87      |
-- | Иван     | Москва | 120    | 100     |
-- | Дарья    | Самара | 70     | 67      |
-- | Борис    | Самара | 78     | 75      |
-- | Елена    | Самара | 84     | 81      |
-- | Григорий | Самара | 96     | 92      |
-- | Леонид   | Самара | 104    | 100     |
-- +----------+--------+--------+---------+