-- Задание
-- Для каждой отдельной книги необходимо вывести информацию о количестве проданных экземпляров и их 
-- стоимости за текущий и предыдущий год. Вычисляемые столбцы назвать Количество и Сумма. Информацию 
-- отсортировать по убыванию стоимости.


SELECT title, SUM(Количество) AS Количество, SUM(Сумма) as Сумма
FROM (
		SELECT title, SUM(bk.amount) AS Количество, sum(bk.amount * price) as Сумма
			FROM buy_step AS bs
				INNER JOIN step USING (step_id)
				INNER JOIN buy USING (buy_id)
				INNER JOIN buy_book AS bk USING (buy_id)
				INNER JOIN book USING (book_id)
		WHERE name_step = 'Оплата'AND date_step_end IS NOT NULL
		GROUP BY 1
		UNION ALL 
		SELECT title, SUM(ba.amount) as Количество, SUM(ba.price * ba.amount) as Сумма
			FROM buy_archive as ba
				INNER JOIN book USING (book_id)
		GROUP BY 1
    ) as query_in
GROUP BY title
ORDER BY Сумма DESC;


-- Query result:
-- +-----------------------+------------+---------+
-- | title                 | Количество | Сумма   |
-- +-----------------------+------------+---------+
-- | Братья Карамазовы     | 8          | 6247.20 |
-- | Мастер и Маргарита    | 6          | 4024.38 |
-- | Идиот                 | 5          | 2281.80 |
-- | Белая гвардия         | 3          | 1581.10 |
-- | Черный человек        | 2          | 1140.40 |
-- | Лирика                | 2          | 1037.98 |
-- | Игрок                 | 2          | 961.80  |
-- | Стихотворения и поэмы | 1          | 650.00  |
-- +-----------------------+------------+---------+