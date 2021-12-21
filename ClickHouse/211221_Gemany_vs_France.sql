-- Давайте посмотрим на динамику изменения числа активных пользователей в месяц уже для всех стран, кроме Великобритании. 
-- В каких месяцах число активных пользователей во Франции было больше, чем в Германии?

SELECT
    Country,
    uniqExact(CustomerID) AS Customers_number,
    toStartOfMonth(InvoiceDate) AS Date
FROM retail
GROUP BY Country, Date
HAVING Country IN ('Germany', 'France')
ORDER BY Date DESC, Customers_number DESC