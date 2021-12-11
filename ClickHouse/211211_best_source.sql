-- Давайте проверим, пользователи пришедшие из какого источника совершили наибольшее число покупок. 
-- В качестве ответа выберите название Source, юзеры которого совершили больше всего покупок.

SELECT
    Source,
    count(UserID) AS num
FROM installs
JOIN devices USING(DeviceID)
GROUP BY Source
ORDER BY num DESC