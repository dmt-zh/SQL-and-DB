-- Задание
-- Вывести номера заказов (buy_id) и названия этапов,  на которых они в данный момент находятся. 
-- Если заказ доставлен –  информацию о нем не выводить. Информацию отсортировать по возрастанию buy_id.

SELECT buy_id, name_step
FROM buy_step
        INNER JOIN step USING (step_id)
WHERE date_step_beg IS NOT NULL AND date_step_end IS NULL;

-- Query result:
-- +--------+-----------------+
-- | buy_id | name_step       |
-- +--------+-----------------+
-- | 2      | Транспортировка |
-- | 3      | Доставка        |
-- | 4      | Оплата          |
-- +--------+-----------------+
-- Affected rows: 3