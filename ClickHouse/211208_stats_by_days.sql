-- Будем работать с таблицей checks, которая содержит данные о покупках в интернет-магазине крупной розничной сети по дням:
-- 	UserID — идентификатор пользователя;
-- 	Rub — суммарный чек пользователя на дату;
-- 	BuyDate — дата, за которую собрана статистика.

-- Теперь давайте попробуем с помощью группировки и агрегатных функций посмотреть динамику трат клиентов. Для этого нужно посчитать по дням 
-- минимальный, средний, и максимальный чек. Иными словами, необходимо сгруппироваться по датам, и использовать агрегатные функции MIN, AVG, MAX.
-- Выведите минимальный (MinCheck), максимальный (MaxCheck) и средний (AvgCheck) чек по дням. В результирующей таблице используйте сортировку по убыванию столбца BuyDate.


SELECT
    BuyDate,
    min(Rub) AS MinCheck,
    max(Rub) AS MaxCheck,
    avg(Rub) AS AvgCheck
FROM checks 
GROUP BY
    BuyDate
ORDER BY
    BuyDate DESC
LIMIT 10