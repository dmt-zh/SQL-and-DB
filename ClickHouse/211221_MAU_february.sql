-- Посмотреть на динамику изменения числа активных пользователей в месяц в Великобритании, Австралии и Нидерландах.
-- Полученная вами результирующая таблица должна иметь вид: страна - число уникальных пользователей за февраль 2011.

-- MAU (monthly active users) – число уникальных пользователей за месяц. Активные пользователи – те, кто сделал хотя
-- бы один заказ за выбранный промежуток времени (месяц).

SELECT
    Country,
    uniqExact(CustomerID) AS Customers_number,
    toStartOfMonth(InvoiceDate) AS Date
FROM retail
WHERE Date = '2011-02-01'
GROUP BY Country, Date
HAVING Country IN ('United Kingdom', 'Australia', 'Netherlands')
ORDER BY Customers_number DESC