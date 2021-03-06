-- Задание
-- Есть список городов, хранящийся в таблице city:

-- city_id	name_city
-- 1		Москва
-- 2		Санкт-Петербург
-- 3		Владивосток

-- Необходимо в каждом городе провести выставку книг каждого автора в течение 2020 года. Дату проведения выставки выбрать случайным образом. 
-- Создать запрос, который выведет город, автора и дату проведения выставки. Последний столбец назвать Дата. Информацию вывести, отсортировав 
-- сначала в алфавитном порядке по названиям городов, а потом по убыванию дат проведения выставок.


SELECT name_city, 
       name_author, 
       DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY) as Дата
FROM author CROSS JOIN city
ORDER BY name_city, Дата DESC;


-- Query result:
-- +-----------------+------------------+------------+
-- | name_city       | name_author      | Дата       |
-- +-----------------+------------------+------------+
-- | Владивосток     | Лермонтов М.Ю.   | 2020-08-04 |
-- | Владивосток     | Есенин С.А.      | 2020-07-16 |
-- | Владивосток     | Булгаков М.А.    | 2020-06-16 |
-- | Владивосток     | Пастернак Б.Л.   | 2020-05-13 |
-- | Владивосток     | Достоевский Ф.М. | 2020-01-14 |
-- | Москва          | Есенин С.А.      | 2020-12-26 |
-- | Москва          | Достоевский Ф.М. | 2020-09-23 |
-- | Москва          | Булгаков М.А.    | 2020-08-09 |
-- | Москва          | Лермонтов М.Ю.   | 2020-06-19 |
-- | Москва          | Пастернак Б.Л.   | 2020-03-28 |
-- | Санкт-Петербург | Булгаков М.А.    | 2020-12-29 |
-- | Санкт-Петербург | Пастернак Б.Л.   | 2020-11-12 |
-- | Санкт-Петербург | Есенин С.А.      | 2020-07-09 |
-- | Санкт-Петербург | Достоевский Ф.М. | 2020-05-14 |
-- | Санкт-Петербург | Лермонтов М.Ю.   | 2020-04-01 |
-- +-----------------+------------------+------------+
-- Affected rows: 15