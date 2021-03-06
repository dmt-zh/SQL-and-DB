-- Задание
-- Выведите все позиций списка товаров принадлежащие какой-либо категории с названиями товаров и названиями категорий.
-- Список должен быть отсортирован по названию товара, названию категории. Для соединения таблиц необходимо использовать оператор INNER JOIN.
-- NB! 
-- Выборки, полученные с помощью оператора SELECT могут быть отсортированы по нескольким атрибутам. 
-- Для этого необходимо в операторе ORDER BY указать набор атрибутов через запятую в необходимом порядке.
-- В запросе для соединения нескольких источников данных операцию соединения можно использовать многократно. 
-- Например, для соединения таблиц A, B и C можно использовать запрос вида:


select good.name as good_name,
category.name as category_name
from category_has_good
inner join good on category_has_good.good_id = good.id
inner join category on category_has_good.category_id = category.id
order by good.name, category.name



