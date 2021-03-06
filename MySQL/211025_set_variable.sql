-- Задание
-- Занести в столбец str_id таблицы applicant_order нумерацию абитуриентов, которая начинается с 1 для каждой образовательной программы.

SET @row_num = 0;
SET @counter = 0;

UPDATE applicant_order 
SET str_id = IF(program_id = @row_num, @counter := @counter + 1, @counter := 1 AND @row_num := program_id);

SELECT * FROM applicant_order;


-- Query result:
-- +--------+------------+-------------+------+
-- | str_id | program_id | enrollee_id | itog |
-- +--------+------------+-------------+------+
-- | 1      | 1          | 3           | 235  |
-- | 2      | 1          | 2           | 226  |
-- | 3      | 1          | 1           | 219  |
-- | 1      | 2          | 6           | 276  |
-- | 2      | 2          | 3           | 235  |
-- | 3      | 2          | 2           | 226  |
-- | 1      | 3          | 6           | 270  |
-- | 2      | 3          | 4           | 239  |
-- | 3      | 3          | 5           | 200  |
-- | 1      | 4          | 6           | 270  |
-- | 2      | 4          | 3           | 247  |
-- | 3      | 4          | 5           | 200  |
-- +--------+------------+-------------+------+
-- Affected rows: 12