-- Составьте рейтинг месяцев 2020 года с точки зрения количества продаж (quantity) по каждому из тарифов.
-- Чем больше подписок тарифа P было продано в месяц M, тем выше место M в рейтинге по тарифу P.

WITH data AS (
SELECT
   year,
   month,
   plan,
   quantity,
   rank() OVER w as qrank
FROM sales
WHERE year = 2020
WINDOW w AS (PARTITION BY plan ORDER BY quantity desc)
)

SELECT
   year,
   month,
   sum(CASE WHEN plan='silver' THEN qrank ELSE 0 END) AS silver,
   sum(CASE WHEN plan='gold' THEN qrank ELSE 0 END) AS gold,
   sum(CASE WHEN plan='platinum' THEN qrank ELSE 0 END) AS platinum
FROM data
GROUP BY year, month
ORDER BY month;


-- Query result:
-- +------+-------+--------+------+----------+
-- | year | month | silver | gold | platinum |
-- +------+-------+--------+------+----------+
-- | 2020 | 1     | 12     | 12   | 12       |
-- | 2020 | 2     | 3      | 8    | 10       |
-- | 2020 | 3     | 8      | 7    | 8        |
-- | 2020 | 4     | 8      | 3    | 4        |
-- | 2020 | 5     | 10     | 6    | 5        |
-- | 2020 | 6     | 6      | 2    | 2        |
-- | 2020 | 7     | 7      | 4    | 3        |
-- | 2020 | 8     | 11     | 9    | 10       |
-- | 2020 | 9     | 5      | 9    | 9        |
-- | 2020 | 10    | 4      | 5    | 7        |
-- | 2020 | 11    | 2      | 1    | 1        |
-- | 2020 | 12    | 1      | 9    | 6        |
-- +------+-------+--------+------+----------+


