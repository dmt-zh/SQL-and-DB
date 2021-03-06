-- Будем работать с таблицей checks, которая содержит данные о покупках в интернет-магазине крупной розничной сети по дням:
-- 	UserID — идентификатор пользователя;
-- 	Rub — суммарный чек пользователя на дату;
-- 	BuyDate — дата, за которую собрана статистика.

-- Посчитайте, сколько покупок приходится на каждого клиента, указав имя столбца как NumChecks. Результирующую таблицу с UserID, NumChecks 
-- отсортируйте по убыванию (DESC) нового столбца. Ограничение вывода – 10.


SELECT 
    UserID,
    count(BuyDate) AS NumChecks
FROM checks 
GROUP BY UserID
ORDER BY NumChecks DESC
LIMIT 10