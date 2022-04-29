В компании работают сотрудники из Москвы и Самары. Предположим, мы хотим разбить их на две
группы по зарплате в каждом из городов. Напишите запрос, который это сделает.

SELECT
    NTILE(2) OVER w AS tile,
    name,
    city,
    salary
FROM employees
WINDOW w AS (PARTITION BY city ORDER by salary)
ORDER BY city, salary, id;

-- Query result:
-- +------+----------+--------+--------+
-- | tile | name     | city   | salary |
-- +------+----------+--------+--------+
-- | 1    | Ксения   | Москва | 90     |
-- | 1    | Вероника | Москва | 96     |
-- | 1    | Анна     | Москва | 100    |
-- | 2    | Марина   | Москва | 104    |
-- | 2    | Иван     | Москва | 120    |
-- | 1    | Дарья    | Самара | 70     |
-- | 1    | Борис    | Самара | 78     |
-- | 1    | Елена    | Самара | 84     |
-- | 2    | Григорий | Самара | 96     |
-- | 2    | Леонид   | Самара | 104    |
-- +------+----------+--------+--------+