-- Задание
-- Выведите список всех источников клиентов и суммарный объем заказов по каждому источнику. Результат должен включать также записи для источников, 
-- по которым не было заказов.
-- Ожидаемый формат результата:
-- +-------------+----------------+
-- | source_name | sale_sum       |
-- +-------------+----------------+
-- | source 1    | 111.00         |
-- | source 2    | 222.00         |
-- | source 3    | 333.00         |
-- ...

SELECT 
    source.name AS source_name, SUM(sale.sale_sum) AS sale_sum
FROM source
	LEFT OUTER JOIN client ON client.source_id = source.id
	LEFT OUTER JOIN sale ON sale.client_id = client.id
GROUP BY source_name;