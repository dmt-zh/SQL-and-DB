-- Задание
-- Вывести номера всех оплаченных заказов и даты, когда они были оплачены.

SELECT buy_id, date_step_end
FROM buy_step
WHERE step_id = 1 and date_step_end IS NOT NULL

-- Query result:
-- +--------+---------------+
-- | buy_id | date_step_end |
-- +--------+---------------+
-- | 1      | 2020-02-20    |
-- | 2      | 2020-02-28    |
-- | 3      | 2020-03-05    |
-- +--------+---------------+
-- Affected rows: 3