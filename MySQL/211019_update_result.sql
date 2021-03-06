-- Задание
-- Студент прошел тестирование (то есть все его ответы занесены в таблицу testing), далее 
-- необходимо вычислить результат(запрос) и занести его в таблицу attempt для соответствующей 
-- попытки.  Результат попытки вычислить как количество правильных ответов, деленное на 3 
-- (количество вопросов в каждой попытке) и умноженное на 100. Результат округлить до целого.

--  Будем считать, что мы знаем id попытки,  для которой вычисляется результат, в нашем 
--  случае это 8. В таблицу testing занесены следующие ответы пользователя:

-- +------------+------------+-------------+-----------+
-- | testing_id | attempt_id | question_id | answer_id |
-- +------------+------------+-------------+-----------+
-- | 22         | 8          | 7           | 19        |
-- | 23         | 8          | 6           | 17        |
-- | 24         | 8          | 8           | 22        |
-- +------------+------------+-------------+-----------+


UPDATE attempt 
SET result = (
			  SELECT ROUND(100 * AVG(is_correct), 2)
              FROM answer
                INNER JOIN testing USING (answer_id)
              WHERE attempt_id = 8
              )
WHERE attempt_id = 8;

SELECT * FROM attempt;

-- Query result:
-- +------------+------------+------------+--------------+--------+
-- | attempt_id | student_id | subject_id | date_attempt | result |
-- +------------+------------+------------+--------------+--------+
-- | 1          | 1          | 2          | 2020-03-23   | 67     |
-- | 2          | 3          | 1          | 2020-03-23   | 100    |
-- | 3          | 4          | 2          | 2020-03-26   | 0      |
-- | 4          | 1          | 1          | 2020-04-15   | 33     |
-- | 5          | 3          | 1          | 2020-04-15   | 67     |
-- | 6          | 4          | 2          | 2020-04-21   | 100    |
-- | 7          | 3          | 1          | 2020-05-17   | 33     |
-- | 8          | 1          | 2          | 2020-06-12   | 67     |
-- +------------+------------+------------+--------------+--------+
-- Affected rows: 8
