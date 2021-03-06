-- Разбейте месяцы 2020 года на три группы по выручке:
-- * tile = 1 — высокая,
-- * tile = 2 — средняя,
-- * tile = 3 — низкая.
-- Результат отсортируйте по убыванию выручки.

SELECT
    year,
    month,
    sum(revenue) AS revenue,
    ntile(3) OVER w AS tile
FROM sales
WHERE year = 2020
GROUP BY year, month
WINDOW w AS (ORDER BY sum(revenue) DESC)
ORDER BY tile, revenue DESC;

-- Query result:
-- +------+-------+---------+------+
-- | year | month | revenue | tile |
-- +------+-------+---------+------+
-- | 2020 | 11    | 150540  | 1    |
-- | 2020 | 6     | 130080  | 1    |
-- | 2020 | 7     | 115920  | 1    |
-- | 2020 | 12    | 115800  | 1    |
-- | 2020 | 10    | 111000  | 2    |
-- | 2020 | 4     | 110400  | 2    |
-- | 2020 | 2     | 103440  | 2    |
-- | 2020 | 5     | 97560   | 2    |
-- | 2020 | 9     | 96600   | 3    |
-- | 2020 | 3     | 90000   | 3    |
-- | 2020 | 8     | 75000   | 3    |
-- | 2020 | 1     | 48600   | 3    |
-- +------+-------+---------+------+