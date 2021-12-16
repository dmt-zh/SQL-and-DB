-- Используйте таблицу checks и разделите всех покупателей на сегменты:
-- NB! Правые границы берутся не включительно, например, чек в 10 рублей будет относиться к сегменту С

-- А — средний чек покупателя менее 5 ₽
-- B — средний чек покупателя от 5-10 ₽
-- C — средний чек покупателя от 10-20 ₽
-- D — средний чек покупателя от 20 ₽
-- Отсортируйте результирующую таблицу по возрастанию UserID и укажите сегмент четвертого пользователя.

SELECT
    UserID,
    CASE
        WHEN avg(Rub) < 5 THEN 'A' 
        WHEN 5 <= avg(Rub) AND avg(Rub) < 10 THEN 'B'
        WHEN 10 <= avg(Rub) AND avg(Rub) < 20 THEN 'C'
        ELSE 'D'
    END AS segments,
    avg(Rub) AS avg_check
FROM checks
GROUP BY UserID
ORDER BY UserID
LIMIT 5