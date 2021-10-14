-- Задание
-- Сравнить ежемесячную выручку от продажи книг за текущий и предыдущий годы. Для этого вывести год, месяц, 
-- сумму выручки в отсортированном сначала по возрастанию месяцев, затем по возрастанию лет виде. Название 
-- столбцов: Год, Месяц, Сумма.


SELECT 
    YEAR(date_step_end) AS Год,
    MONTHNAME(date_step_end) AS Месяц,
    SUM(bk.amount * price) AS Сумма
FROM buy_step AS bs
        INNER JOIN step USING (step_id)
        INNER JOIN buy USING (buy_id)
        INNER JOIN buy_book AS bk USING (buy_id)
        INNER JOIN book USING (book_id)
WHERE name_step = 'Оплата'AND date_step_end IS NOT NULL
GROUP BY 1, 2 
UNION SELECT 
    YEAR(date_payment) AS Год,
    MONTHNAME(date_payment) AS Месяц,
    SUM(price * amount) AS Сумма
FROM buy_archive
GROUP BY 1, 2
ORDER BY 2, 1;

-- Query result:
-- +------+----------+---------+
-- | Год  | Месяц    | Сумма   |
-- +------+----------+---------+
-- | 2019 | February | 5626.30 |
-- | 2020 | February | 3309.37 |
-- | 2019 | March    | 6857.50 |
-- | 2020 | March    | 2131.49 |
-- +------+----------+---------+
-- Affected rows: 4