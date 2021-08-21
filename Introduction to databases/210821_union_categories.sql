-- База данных магазина `store`
-- Задание
-- Выведите список товаров с названиями категорий, в том числе товаров, не принадлежащих ни к одной из категорий, 
-- в том числе категорий не содержащих ни одного товара.
-- Ожидаемый формат результата:
-- +-------------+----------------+
-- | good_name   | category_name  |
-- +-------------+----------------+
-- | good 1      | category 1     |
-- | good 1      | category 2     |
-- | good 2      | category 3     |
-- | good 2      | category 4     |
-- | good 3      | category 7     |
-- ...


SELECT 
    g.name AS good_name, c.name AS category_name
FROM
    category_has_good AS ct
        LEFT OUTER JOIN
    category AS c ON ct.category_id = c.id
        RIGHT OUTER JOIN
    good AS g ON ct.good_id = g.id 
UNION SELECT 
    g.name AS good_name, c.name AS category_name
FROM
    category_has_good AS ct
        RIGHT OUTER JOIN
    category AS c ON ct.category_id = c.id
        LEFT OUTER JOIN
    good AS g ON ct.good_id = g.id