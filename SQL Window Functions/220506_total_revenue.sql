-- Посчитайте, какой вклад (в процентах) внес каждый из тарифов в общую выручку за год.
-- Процент округлите до целого.

SELECT
    year,
    plan,
    sum(revenue) AS revenue,
    sum(sum(revenue)) OVER w AS total,
    round(sum(revenue) * 100 / sum(sum(revenue)) OVER w) AS perc
FROM sales
GROUP BY plan, year
WINDOW w AS (PARTITION BY year ORDER BY year)
ORDER BY year, plan;


-- Query result:
-- +------+----------+---------+---------+------+
-- | year | plan     | revenue | total   | perc |
-- +------+----------+---------+---------+------+
-- | 2019 | gold     | 252960  | 722460  | 35   |
-- | 2019 | platinum | 168000  | 722460  | 23   |
-- | 2019 | silver   | 301500  | 722460  | 42   |
-- | 2020 | gold     | 411840  | 1244940 | 33   |
-- | 2020 | platinum | 249600  | 1244940 | 20   |
-- | 2020 | silver   | 583500  | 1244940 | 47   |
-- +------+----------+---------+---------+------+