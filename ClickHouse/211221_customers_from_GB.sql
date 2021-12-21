-- Укажите число уникальных пользователей из Великобритании. 

SELECT
    Country,
    uniqExact(CustomerID) AS Customers_number
FROM retail
WHERE Country = 'United Kingdom'
GROUP BY Country
ORDER BY Customers_number DESC