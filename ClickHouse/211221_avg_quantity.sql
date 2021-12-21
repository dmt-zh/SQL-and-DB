-- Сколько товаров пользователи обычно добавляют в корзину? Посчитайте среднее количество товаров, 
-- добавленных в корзину, с разбивкой по странам. 
-- В качестве ответа укажите среднее число товаров в заказе среди пользователей в Канаде (Canada).

SELECT
    Country AS country,
    avg(total_quantity) AS avg_quantity
FROM (
        SELECT
            InvoiceNo,
            Country,
            sum(Quantity) AS total_quantity
        FROM retail
        GROUP BY InvoiceNo, Country
     )
GROUP BY country
HAVING country = 'Canada'	