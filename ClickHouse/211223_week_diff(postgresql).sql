-- Посмотрим более подробно на объемы продаж авокадо в Нью-Йорке (NewYork) в 2018 году. 
-- Создайте колонку с разницей объемов продаж за неделю и за неделю до этого для каждого типа авокадо.
-- Найдите день, когда продажи авокадо типа organic увеличились по сравнению с предыдущей неделей,
-- а conventional – наоборот упали.

SELECT
    date,
    type,
    total_volume,
    total_volume - (LAG(total_volume, 1) OVER w) AS week_diff
FROM avocado
WHERE region = 'NewYork' AND year = 2018
-- WHERE region = 'TotalUS' AND type = 'conventional'
WINDOW w AS (
             PARTITION BY type
             ORDER BY date
             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            )
ORDER BY type DESC, date

-- 18/02/2018, 18/03/2018 