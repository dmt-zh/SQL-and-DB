-- Посчитайте среднее число купленных товаров по стране и среднюю цену товара, сгруппировав данные по странам,
-- и отсортируйте по убыванию средней цены товара. Обратите внимание, что в данных встречаются строки с Description 'Manual',
-- которые включают данные об удаленных из чека позициях. Для получения правильного ответа такие строки необходимо отфильтровать.


SELECT
    avg(Quantity) AS avg_products,
    avg(UnitPrice) AS avg_price,
    Country
FROM retail
WHERE Description != 'Manual'
GROUP BY Country
ORDER BY avg_price DESC
LIMIT 10