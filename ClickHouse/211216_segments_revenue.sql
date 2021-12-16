-- Посчитайте, сколько клиентов приходится на каждый сегмент и сколько доходов он приносит. 
-- Отсортируйте результат по убыванию суммы доходов на сегмент и в качестве ответа укажите наибольшую сумму.

SELECT
    segments,
    sum(Rub) AS total_sum,
    count(DISTINCT UserID) AS number_of_clients
FROM (
        SELECT
            UserID,
            CASE
                WHEN avg(Rub) < 5 THEN 'A' 
                WHEN 5 <= avg(Rub) AND avg(Rub) < 10 THEN 'B'
                WHEN 10 <= avg(Rub) AND avg(Rub) < 20 THEN 'C'
                WHEN avg(Rub) >= 20 THEN 'D'
            END AS segments,
            avg(Rub) AS avg_check
        FROM checks
        GROUP BY UserID
     ) AS nt
JOIN checks AS ch ON nt.UserID = ch.UserID
GROUP BY segments
ORDER BY total_sum DESC