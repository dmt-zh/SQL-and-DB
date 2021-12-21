-- Теперь проанализируем сами заказы. Посчитайте среднюю сумму заказа (AOV – average order value) в каждой из стран.
-- Из представленных вариантов ответа выберите страны, входящие в топ-3 по величине средней суммы заказа.

SELECT
    Country AS country,
    round(avg(TotalPrice), 2) AS avg_invoice
FROM (
        SELECT
            InvoiceNo,
            sum(Quantity * UnitPrice) AS TotalPrice,
            Country
        FROM retail
        GROUP BY InvoiceNo, Country
        HAVING TotalPrice > 0
     )
GROUP BY country
ORDER BY avg_invoice DESC
LIMIT 3