-- Задание
-- Вывести все заказы Баранова Павла (id заказа, какие книги, по какой цене и в каком количестве он заказал) 
-- в отсортированном по номеру заказа и названиям книг виде.

SELECT b.buy_id, bk.title, bk.price, bb.amount
FROM client AS c
    INNER JOIN buy AS b ON c.client_id = b.client_id
    INNER JOIN buy_book AS bb ON bb.buy_id = b.buy_id
    INNER JOIN book AS bk ON bb.book_id=bk.book_id
WHERE c.name_client ='Баранов Павел' 
ORDER BY bb.buy_id, bk.title; 

-- Query result:
-- +--------+--------------------+--------+--------+
-- | buy_id | title              | price  | amount |
-- +--------+--------------------+--------+--------+
-- | 1      | Идиот              | 460.00 | 1      |
-- | 1      | Мастер и Маргарита | 670.99 | 1      |
-- | 1      | Черный человек     | 570.20 | 2      |
-- | 4      | Игрок              | 480.50 | 1      |
-- +--------+--------------------+--------+--------+
-- Affected rows: 4