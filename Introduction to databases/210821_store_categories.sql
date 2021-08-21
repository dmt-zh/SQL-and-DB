-- Задание
-- Выведите список товаров с названиями товаров и названиями категорий, в том числе товаров, не принадлежащих ни одной из категорий.
-- Ожидаемый формат результата:
-- +-------------+----------------+
-- | good_name   | category_name  |
-- +-------------+----------------+
-- | good 1      | category 1     |
-- | good 1      | category 2     |
-- | good 2      | category 3     |
-- | good 2      | category 4     |
-- | good 3      | category 7     |


SELECT 
    good.name AS good_name, category.name AS category_name
FROM
    category_has_good
        LEFT OUTER JOIN
    category ON category_has_good.category_id = category.id
        RIGHT OUTER JOIN
    good ON category_has_good.good_id = good.id
ORDER BY good.name , category.name