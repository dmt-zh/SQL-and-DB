-- Задание
-- Включить новых авторов в таблицу author с помощью запроса на добавление, а затем вывести все данные из таблицы author.  
-- Новыми считаются авторы, которые есть в таблице supply, но нет в таблице author.

INSERT INTO author (name_author)
SELECT supply.author
FROM author RIGHT JOIN supply
     on author.name_author = supply.author
WHERE name_author IS Null;

SELECT * FROM author;

-- Query result:
-- +-----------+------------------+
-- | author_id | name_author      |
-- +-----------+------------------+
-- | 1         | Булгаков М.А.    |
-- | 2         | Достоевский Ф.М. |
-- | 3         | Есенин С.А.      |
-- | 4         | Пастернак Б.Л.   |
-- | 5         | Лермонтов М.Ю.   |
-- | 6         | Стивенсон Р.Л.   |
-- +-----------+------------------+
-- Affected rows: 6