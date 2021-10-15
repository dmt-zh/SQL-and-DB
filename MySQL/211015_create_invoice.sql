-- Задание
-- Создать счет (таблицу buy_pay) на оплату заказа с номером 5, в который включить название книг,
-- их автора, цену, количество заказанных книг и  стоимость. Последний столбец назвать Стоимость. 
-- Информацию в таблицу занести в отсортированном по названиям книг виде.

CREATE TABLE buy_pay AS
SELECT title, name_author, price, bb.amount, (price * bb.amount) AS Стоимость
FROM buy_book AS bb
	JOIN book USING (book_id)
	JOIN author USING (author_id)
WHERE buy_id = 5
ORDER BY title;

SELECT * FROM buy_pay;

-- Query result:
-- +---------------+----------------+--------+--------+-----------+
-- | title         | name_author    | price  | amount | Стоимость |
-- +---------------+----------------+--------+--------+-----------+
-- | Белая гвардия | Булгаков М.А.  | 540.50 | 1      | 540.50    |
-- | Лирика        | Пастернак Б.Л. | 518.99 | 2      | 1037.98   |
-- +---------------+----------------+--------+--------+-----------+
-- Affected rows: 2