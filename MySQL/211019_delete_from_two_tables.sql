-- Задание
-- Удалить из таблицы attempt все попытки, выполненные раньше 1 мая 2020 года. 
-- Также удалить и все соответствующие этим попыткам вопросы из таблицы testing, которая создавалась следующим запросом:

-- CREATE TABLE testing (
--     testing_id INT PRIMARY KEY AUTO_INCREMENT, 
--     attempt_id INT, 
--     question_id INT, 
--     answer_id INT,
--     FOREIGN KEY (attempt_id)  REFERENCES attempt (attempt_id) ON DELETE CASCADE
-- );

DELETE FROM attempt
WHERE date_attempt < '2020-05-01';

SELECT * FROM attempt;
SELECT * FROM testing;


-- Query result:
-- +------------+------------+------------+--------------+--------+
-- | attempt_id | student_id | subject_id | date_attempt | result |
-- +------------+------------+------------+--------------+--------+
-- | 7          | 3          | 1          | 2020-05-17   | 33     |
-- | 8          | 1          | 2          | 2020-06-12   | 67     |
-- +------------+------------+------------+--------------+--------+
-- Affected rows: 2

-- Query result:
-- +------------+------------+-------------+-----------+
-- | testing_id | attempt_id | question_id | answer_id |
-- +------------+------------+-------------+-----------+
-- | 19         | 7          | 1           | 3         |
-- | 20         | 7          | 4           | 11        |
-- | 21         | 7          | 5           | 16        |
-- | 22         | 8          | 7           | 19        |
-- | 23         | 8          | 6           | 17        |
-- | 24         | 8          | 8           | 22        |
-- +------------+------------+-------------+-----------+
-- Affected rows: 6