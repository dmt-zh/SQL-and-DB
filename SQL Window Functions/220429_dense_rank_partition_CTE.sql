-- Предположим, мы хотим узнать самых высокооплачиваемых людей по каждому департаменту:
-- ┌────┬───────┬────────────┬────────┐
-- │ id │ name  │ department │ salary │
-- ├────┼───────┼────────────┼────────┤
-- │ 12 │ Борис │ hr         │ 78     │
-- │ 25 │ Иван  │ it         │ 120    │
-- │ 33 │ Анна  │ sales      │ 100    │
-- └────┴───────┴────────────┴────────┘

-- Напишите запрос, который это сделает.


WITH table_rank AS (
SELECT
    DENSE_RANK() OVER w AS score,
    id,
    name,
    department,
    salary
FROM employees
WINDOW w AS (PARTITION BY department ORDER by salary DESC)
ORDER BY score
)

SELECT
    id,
    name,
    department,
    salary
FROM table_rank
WHERE score = 1;
