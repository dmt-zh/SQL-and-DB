-- Есть таблица сотрудников employees. Для каждого сотрудника мы посчитали, сколько процентов составляет его зарплата от средней по компании.
-- А теперь еще хотим посчитать, сколько процентов составляет зарплата сотрудника от средней по Москве и средней по Самаре.
-- Напишите запрос, который это сделает.

SELECT
    id,
    name,
    salary,
    round(salary * 100 / avg(salary) OVER ()) AS "perc",
    round(salary * 100 / avg(salary) FILTER(where city <> 'Самара') OVER w) AS msk,
    round(salary * 100 / avg(salary) FILTER(where city <> 'Москва') OVER w) AS sam
FROM employees
WINDOW w AS (
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
            )
ORDER BY id;

-- ┌────┬──────────┬────────┬──────┬─────┬─────┐
-- │ id │   name   │ salary │ perc │ msk │ sam │
-- ├────┼──────────┼────────┼──────┼─────┼─────┤
-- │ 11 │ Дарья    │ 70     │ 74   │ 69  │ 81  │
-- │ 12 │ Борис    │ 78     │ 83   │ 76  │ 90  │
-- │ 21 │ Елена    │ 84     │ 89   │ 82  │ 97  │
-- │ 22 │ Ксения   │ 90     │ 96   │ 88  │ 104 │
-- │ 23 │ Леонид   │ 104    │ 110  │ 102 │ 120 │
-- │ 24 │ Марина   │ 104    │ 110  │ 102 │ 120 │
-- │ 25 │ Иван     │ 120    │ 127  │ 118 │ 139 │
-- │ 31 │ Вероника │ 96     │ 102  │ 94  │ 111 │
-- │ 32 │ Григорий │ 96     │ 102  │ 94  │ 111 │
-- │ 33 │ Анна     │ 100    │ 106  │ 98  │ 116 │
-- └────┴──────────┴────────┴──────┴─────┴─────┘