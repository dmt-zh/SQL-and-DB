-- Задание
-- Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга 
-- (фамилии и инициалы сотрудников, город ,  длительность командировки в днях, при 
-- этом первый и последний день относится к периоду командировки). Последний столбец 
-- назвать Длительность. Информацию вывести в упорядоченном по убыванию длительности 
-- поездки, а потом по убыванию названий городов (в обратном алфавитном порядке).

-- Структура и наполнение таблицы trip
-- +---------+---------------+-----------------+----------+------------+------------+
-- | trip_id | name          | city            | per_diem | date_first | date_last  |
-- +---------+---------------+-----------------+----------+------------+------------+
-- | 1       | Баранов П.Е.  | Москва          | 700.00   | 2020-01-12 | 2020-01-17 |
-- | 2       | Абрамова К.А. | Владивосток     | 450.00   | 2020-01-14 | 2020-01-27 |
-- | 3       | Семенов И.В.  | Москва          | 700.00   | 2020-01-23 | 2020-01-31 |
-- | 4       | Ильиных Г.Р.  | Владивосток     | 450.00   | 2020-01-12 | 2020-02-02 |
-- | 5       | Колесов С.П.  | Москва          | 700.00   | 2020-02-01 | 2020-02-06 |
-- | 6       | Баранов П.Е.  | Москва          | 700.00   | 2020-02-14 | 2020-02-22 |
--                           ...
-- | 19      | Абрамова К.А. | Владивосток     | 450.00   | 2020-07-02 | 2020-07-13 |
-- | 20      | Баранов П.Е.  | Воронеж         | 450.00   | 2020-07-19 | 2020-07-25 |
-- +---------+---------------+-----------------+----------+------------+------------+


SELECT name,city,DATEDIFF(date_last,date_first)+1 as Длительность
FROM trip
WHERE city NOT IN ('Москва','Санкт-Петербург') 
ORDER BY Длительность DESC, city DESC;

-- Query result:
-- +---------------+-------------+--------------+
-- | name          | city        | Длительность |
-- +---------------+-------------+--------------+
-- | Ильиных Г.Р.  | Владивосток | 22           |
-- | Баранов П.Е.  | Новосибирск | 17           |
-- | Колесов С.П.  | Новосибирск | 15           |
-- | Абрамова К.А. | Владивосток | 14           |
-- | Лебедев Т.К.  | Томск       | 12           |
-- | Абрамова К.А. | Владивосток | 12           |
-- | Федорова А.Ю. | Новосибирск | 11           |
-- | Колесов С.П.  | Новосибирск | 10           |
-- | Федорова А.Ю. | Томск       | 7            |
-- | Баранов П.Е.  | Воронеж     | 7            |
-- +---------------+-------------+--------------+
-- Affected rows: 10