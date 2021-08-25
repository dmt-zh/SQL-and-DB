-- Задание
-- Выведите список источников, из которых не было клиентов, либо клиенты пришедшие из которых не совершали заказов
--  или отказывались от заказов. Под клиентами, которые отказывались от заказов, необходимо понимать клиентов, у которых 
-- есть заказы, которые на момент выполнения запроса находятся в состоянии 'rejected'. В запросе необходимо использовать 
-- оператор UNION для объединения выборок по разным условиям.
-- Ожидаемый формат результата:
-- +-------------+
-- | source_name |
-- +-------------+
-- | source 1    |
-- | source 2    |
-- | source 3    |
-- ......
--  
-- NB! 
-- Для проверки существования записей в каких-либо таблицах можно использовать оператор EXISTS в условии WHERE. Например, 
-- вывести список категорий, к которым не принадлежат никакие товары можно следующим образом:
-- SELECT c.id, c.name FROM category AS c 
--   WHERE NOT EXISTS (SELECT * FROM category_has_good AS cg
--         WHERE cg.category_id = c.id)


SELECT 
    src.name AS source_name
FROM source AS src
WHERE NOT EXISTS(SELECT * FROM client WHERE client.source_id = src.id) 
UNION SELECT 
    src.name AS source_name
FROM source AS src
        INNER JOIN client AS clt ON clt.source_id = src.id
        INNER JOIN sale AS s ON s.client_id = clt.id
        INNER JOIN status AS st ON st.id = s.status_id
WHERE st.name = 'rejected';