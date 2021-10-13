-- Задание
-- Вывести жанр (или жанры), в котором было заказано больше всего экземпляров книг, указать это количество. Последний столбец назвать Количество.

SELECT name_genre, SUM(buy_book.amount) AS Количество 
FROM genre
    JOIN book USING (genre_id)
    JOIN buy_book USING (book_id)
GROUP BY name_genre
HAVING SUM(buy_book.amount) = (
                                SELECT MAX(summ)
                                FROM (
                                      SELECT (SUM(buy_book.amount)) AS summ
                                      FROM genre 
                                            JOIN book USING (genre_id)
                                            JOIN buy_book USING (book_id)
                                      GROUP BY name_genre) AS queri
								);
                                
                                
-- Query result:
-- +------------+------------+
-- | name_genre | Количество |
-- +------------+------------+
-- | Роман      | 7          |
-- +------------+------------+
-- Affected rows: 1