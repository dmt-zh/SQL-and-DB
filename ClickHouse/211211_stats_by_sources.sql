-- Рассчитайте общую выручку, а также минимальный, максимальный и средний чек. Выведите нужные показатели 
-- по источнику.


SELECT
    Source,
    sum(Rub) AS total_sum,
    avg(Rub) AS avg_rub,
    max(Rub) AS max_rub
FROM checks as ch
JOIN devices AS d ON ch.UserID = d.UserID
JOIN installs AS i ON d.DeviceID = i.DeviceID
GROUP BY Source
ORDER BY Source