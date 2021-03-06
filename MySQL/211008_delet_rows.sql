-- Задание
-- Удалить всех авторов и все их книги, общее количество книг которых меньше 20.

-- Таблица book
-- +---------+-----------------------+-----------+----------+--------+--------+
-- | book_id | title                 | author_id | genre_id | price  | amount |
-- +---------+-----------------------+-----------+----------+--------+--------+
-- | 1       | Мастер и Маргарита    | 1         | 1        | 670.99 | 3      |
-- | 2       | Белая гвардия         | 1         | 1        | 540.50 | 12     |
-- | 3       | Идиот                 | 2         | 1        | 437.11 | 13     |
-- | 4       | Братья Карамазовы     | 2         | 1        | 799.01 | 3      |
-- | 5       | Игрок                 | 2         | 1        | 480.50 | 10     |
-- | 6       | Стихотворения и поэмы | 3         | 2        | 650.00 | 15     |
-- | 7       | Черный человек        | 3         | 2        | 570.20 | 12     |
-- | 8       | Лирика                | 4         | 2        | 518.99 | 2      |
-- | 9       | Доктор Живаго         | 4         | 1        | 380.80 | 4      |
-- | 10      | Стихотворения и поэмы | 5         | 2        | 255.90 | 4      |
-- | 11      | Остров сокровищ       | 6         | 3        | 599.99 | 5      |
-- +---------+-----------------------+-----------+----------+--------+--------+

-- Таблица author                          Таблица genre
-- +-----------+------------------+	+----------+-------------+			
-- | author_id | name_author      |	| genre_id | name_genre  |			
-- +-----------+------------------+	+----------+-------------+			
-- | 1         | Булгаков М.А.    |	| 1        | Роман       |			
-- | 2         | Достоевский Ф.М. |	| 2        | Поэзия      |			
-- | 3         | Есенин С.А.      |	| 3        | Приключения |			
-- | 4         | Пастернак Б.Л.   |	+----------+-------------+			
-- | 5         | Лермонтов М.Ю.   |
-- | 6         | Стивенсон Р.Л.   |
-- +-----------+------------------+

DELETE FROM author
WHERE author_id IN (SELECT author_id 
                    FROM book
                    GROUP BY author_id
                    HAVING sum(amount) < 20);

SELECT * FROM author;

SELECT * FROM book;


-- Query result:
-- +-----------+------------------+
-- | author_id | name_author      |
-- +-----------+------------------+
-- | 2         | Достоевский Ф.М. |
-- | 3         | Есенин С.А.      |
-- +-----------+------------------+
-- Affected rows: 2

-- Query result:
-- +---------+-----------------------+-----------+----------+--------+--------+
-- | book_id | title                 | author_id | genre_id | price  | amount |
-- +---------+-----------------------+-----------+----------+--------+--------+
-- | 3       | Идиот                 | 2         | 1        | 437.11 | 13     |
-- | 4       | Братья Карамазовы     | 2         | 1        | 799.01 | 3      |
-- | 5       | Игрок                 | 2         | 1        | 480.50 | 10     |
-- | 6       | Стихотворения и поэмы | 3         | 2        | 650.00 | 15     |
-- | 7       | Черный человек        | 3         | 2        | 570.20 | 12     |
-- +---------+-----------------------+-----------+----------+--------+--------+
-- Affected rows: 5	



