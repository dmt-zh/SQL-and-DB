-- Посчитайте выручку для тарифа gold по месяцам 2020 года. Для каждого месяца дополнительно укажите:
-- выручку за предыдущий месяц (prev);
-- процент, который составляет выручка текущего месяца от prev (perc).
-- Процент округлите до целого.

SELECT
    year,
    month,
    revenue,
    lag(revenue, 1) OVER (ORDER BY month) AS prev,
    round(revenue * 100.0 / lag(revenue, 1) OVER (ORDER BY month)) as perc
FROM sales
WHERE year = 2020 AND plan = 'gold'
ORDER BY month;


-- Query result:
-- +------+-------+---------+-------+------+
-- | year | month | revenue | prev  | perc |
-- +------+-------+---------+-------+------+
-- | 2020 | 1     | 14400   | NULL  | NULL |
-- | 2020 | 2     | 29040   | 14400 | 202  |
-- | 2020 | 3     | 31200   | 29040 | 107  |
-- | 2020 | 4     | 43200   | 31200 | 138  |
-- | 2020 | 5     | 34560   | 43200 | 80   |
-- | 2020 | 6     | 44880   | 34560 | 130  |
-- | 2020 | 7     | 40320   | 44880 | 90   |
-- | 2020 | 8     | 28800   | 40320 | 71   |
-- | 2020 | 9     | 28800   | 28800 | 100  |
-- | 2020 | 10    | 36000   | 28800 | 125  |
-- | 2020 | 11    | 51840   | 36000 | 144  |
-- | 2020 | 12    | 28800   | 51840 | 56   |
-- +------+-------+---------+-------+------+