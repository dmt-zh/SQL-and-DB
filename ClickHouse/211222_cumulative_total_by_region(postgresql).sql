-- Давайте посмотрим на продажи авокадо в двух городах (NewYork, LosAngeles) и узнаем,
-- сколько авокадо типа organic было продано в целом к концу каждого года (year). Таким образом,
-- в конце февраля 2016 года объем составит уже не продажи за 2015 и январь-февраль 2016, а только январь-февраль 2016.
-- Когда объемы продаж органических авокадо в Нью-Йорке превысили объемы продаж в Лос-Анджелесе?

SELECT
    region,
    date,
    total_volume,
    year,
    sum(total_volume) OVER w AS cumulative_total 
FROM avocado
WHERE region IN ('NewYork', 'LosAngeles') AND type = 'organic'
WINDOW w AS (
             PARTITION BY region, year
             ORDER BY date
             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            )
ORDER BY region DESC