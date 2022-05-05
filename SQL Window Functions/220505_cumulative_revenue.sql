-- Посчитайте выручку нарастающим итогом по каждому тарифному плану за первые три месяца 2020 года.

SELECT
    plan,
    year,
    month,
    revenue,
    sum(revenue) OVER w AS total
FROM sales
WHERE year = 2020 AND quarter = 1
WINDOW w AS (
             PARTITION BY plan
             ORDER BY plan, month
             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            )
ORDER BY plan, month;


-- Query result:
-- +----------+------+-------+---------+--------+
-- | plan     | year | month | revenue | total  |
-- +----------+------+-------+---------+--------+
-- | gold     | 2020 | 1     | 14400   | 14400  |
-- | gold     | 2020 | 2     | 29040   | 43440  |
-- | gold     | 2020 | 3     | 31200   | 74640  |
-- | platinum | 2020 | 1     | 7200    | 7200   |
-- | platinum | 2020 | 2     | 13200   | 20400  |
-- | platinum | 2020 | 3     | 16800   | 37200  |
-- | silver   | 2020 | 1     | 27000   | 27000  |
-- | silver   | 2020 | 2     | 61200   | 88200  |
-- | silver   | 2020 | 3     | 42000   | 130200 |
-- +----------+------+-------+---------+--------+