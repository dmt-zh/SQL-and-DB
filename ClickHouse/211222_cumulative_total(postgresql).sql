-- Давайте посмотрим на продажи авокадо в двух городах (NewYork, LosAngeles) и узнаем, сколько авокадо 
-- типа organic было продано в целом к концу каждой недели (накопительная сумма продаж), начиная с 
-- начала периода наблюдений (04/01/15). 

SELECT
    region,
    date,
    total_volume,
    sum(total_volume) OVER w AS cumulative_total 
FROM avocado
WHERE region IN ('NewYork', 'LosAngeles') AND type = 'organic'
WINDOW w AS (
             PARTITION BY region
             ORDER BY date
             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            )
ORDER BY region DESC, date