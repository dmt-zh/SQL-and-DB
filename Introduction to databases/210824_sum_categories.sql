-- Задание
-- Выведите список всех категорий продуктов и количество продаж товаров, относящихся к данной категории. 
-- Под количеством продаж товаров подразумевается суммарное количество единиц товара данной категории, фигурирующих
--  в заказах с любым статусом.
-- Ожидаемый формат результата:
-- +---------------------+----------+
-- | name                | sale_num |
-- +---------------------+----------+
-- | category 1          |       11 |
-- | category 2          |       25 |
-- | category 3        |       13 |
-- ...


SELECT 
    c.name AS name, COUNT(s.number) AS sale_num
FROM category AS c
        LEFT OUTER JOIN category_has_good AS chg ON c.id = chg.category_id
        LEFT OUTER JOIN good AS g ON chg.good_id = g.id
        LEFT OUTER JOIN sale_has_good AS shg ON shg.good_id = g.id
        LEFT OUTER JOIN sale AS s ON s.id = shg.sale_id
GROUP BY name
ORDER BY name;