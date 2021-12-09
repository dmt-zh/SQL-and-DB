-- Посчитайте среднюю цену товара клиента (UnitPrice) с группировкой по id покупателя, выведите строки с покупками тех покупателей,
-- у которых самая высокая средняя цена купленного товара в марте. Не забывайте отфильтровать строки по условию Description != 'Manual'.

SELECT
    avg(UnitPrice) AS avg_price,
    CustomerID
FROM retail
WHERE (Description != 'Manual') AND (toStartOfMonth(InvoiceDate) = '2011-03-01')
GROUP BY  CustomerID
ORDER BY avg_price DESC
