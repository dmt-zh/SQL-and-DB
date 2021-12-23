-- Теперь посчитайте скользящее среднее цены авокадо (average_price) в Нью-Йорке с разбивкой
-- по типу авокадо. В качестве окна используйте текущую неделю и предыдущие две.

SELECT
    date,
    average_price,
    avg(average_price) OVER w AS rolling_price
FROM avocado
WHERE region = 'NewYork' AND type = 'conventional'
WINDOW w AS (
             PARTITION BY type
             ORDER BY date
             ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
            )
ORDER BY date