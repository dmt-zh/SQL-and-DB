-- Будем работать с таблицей checks, которая содержит данные о покупках в интернет-магазине крупной розничной сети по дням:
-- 	UserID — идентификатор пользователя;
-- 	Rub — суммарный чек пользователя на дату;
-- 	BuyDate — дата, за которую собрана статистика.

-- Мы хотим сформировать новую акцию к 8 марта, и для этого нас интересуют самые крупные покупки, совершенные в этот день в прошлом году.
-- Выведите информацию о продажах, которые были совершены 8 марта 2019 года, Количество строк для извлечения – 10.

SELECT
    Rub,
    BuyDate,
    UserID
FROM checks 
WHERE BuyDate = '2019-03-08'
ORDER BY Rub DESC
LIMIT 10