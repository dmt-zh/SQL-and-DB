-- Есть таблица сотрудников employees. Предположим, для каждого человека мы хотим увидеть ближайшую большую зарплату (next_salary):

-- ┌────┬──────────┬────────┬─────────────┐
-- │ id │   name   │ salary │ next_salary │
-- ├────┼──────────┼────────┼─────────────┤
-- │ 11 │ Дарья    │ 70     │ 78          │
-- │ 12 │ Борис    │ 78     │ 84          │
-- │ 21 │ Елена    │ 84     │ 90          │
-- │ 22 │ Ксения   │ 90     │ 96          │
-- │ 31 │ Вероника │ 96     │ 100         │
-- │ 32 │ Григорий │ 96     │ 100         │
-- │ 33 │ Анна     │ 100    │ 104         │
-- │ 23 │ Леонид   │ 104    │ 120         │
-- │ 24 │ Марина   │ 104    │ 120         │
-- │ 25 │ Иван     │ 120    │             │
-- └────┴──────────┴────────┴─────────────┘
-- Напишите запрос, который это сделает.

SELECT
    id,
    name,
    salary,
    last_value(salary) OVER w as next_salary
FROM employees
WINDOW w AS (
             ORDER BY salary
             GROUPS BETWEEN 1 FOLLOWING AND 1 FOLLOWING
            )
ORDER BY salary, id;