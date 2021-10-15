-- Задание
-- Создать общий счет (таблицу buy_pay) на оплату заказа с номером 5. Куда включить номер заказа, 
-- количество книг в заказе (название столбца Количество) и его общую стоимость (название столбца Итого). 
-- Для решения используйте ОДИН запрос.


CREATE TABLE buy_pay AS
    SELECT buy_id,
           SUM(buy_book.amount) AS Количество,
           SUM(buy_book.amount * book.price) AS Итого
    FROM buy_book
        INNER JOIN book ON buy_book.book_id = book.book_id
    WHERE buy_id = 5;
    
SELECT * FROM buy_pay;

-- Query result:
-- +--------+------------+---------+
-- | buy_id | Количество | Итого   |
-- +--------+------------+---------+
-- | 5      | 3          | 1578.48 |
-- +--------+------------+---------+
-- Affected rows: 1