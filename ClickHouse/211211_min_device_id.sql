-- Выведите идентификаторы устройств пользователей, которые совершили как минимум одну покупку за последний месяц (октябрь 2019).
-- Используйте сортировку по возрастанию DeviceID и укажите минимальное значение.

SELECT
    DeviceID,
    count(Rub)
FROM checks as ch
JOIN devices AS d ON ch.UserID = d.UserID
WHERE BuyDate BETWEEN '2019-10-01' AND '2019-10-31'
GROUP BY DeviceID
ORDER BY DeviceID
LIMIT 10