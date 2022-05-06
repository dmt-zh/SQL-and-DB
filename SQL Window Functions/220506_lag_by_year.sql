-- Посчитайте выручку по кварталам 2020 года. Для каждого квартала дополнительно укажите:
-- * выручку за аналогичный квартал 2019 года (prev);
-- * процент, который составляет выручка текущего квартала от prev (perc).
-- Процент округлите до целого.

WITH data AS (
  SELECT
      year,
      quarter,
      sum(revenue) as revenue,
      lag(sum(revenue), 4) over w as prev,
      round(sum(revenue) * 100.0 / lag(sum(revenue), 4) OVER w) as perc
  FROM sales
  GROUP BY year, quarter
  WINDOW w AS (order by year, quarter)
)
SELECT
    year,
    quarter,
    revenue,
    prev,
    perc
FROM data
WHERE year = 2020
ORDER BY quarter

-- Query result:
-- +------+---------+---------+--------+------+
-- | year | quarter | revenue | prev   | perc |
-- +------+---------+---------+--------+------+
-- | 2020 | 1       | 242040  | 155040 | 156  |
-- | 2020 | 2       | 338040  | 162600 | 208  |
-- | 2020 | 3       | 287520  | 204120 | 141  |
-- | 2020 | 4       | 377340  | 200700 | 188  |
-- +------+---------+---------+--------+------+