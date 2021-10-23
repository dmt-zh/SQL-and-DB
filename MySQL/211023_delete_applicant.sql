-- Задание
-- Из таблицы applicant, созданной на предыдущем шаге, удалить записи, если абитуриент на выбранную 
-- образовательную программу не набрал минимального балла хотя бы по одному предмету 
-- (использовать запрос из предыдущего урока).


DELETE applicant
FROM applicant
	INNER JOIN program_subject USING(program_id)
	INNER JOIN enrollee_subject USING(enrollee_id, subject_id)
WHERE result < min_result;

SELECT * FROM applicant;


-- Query result:
-- +------------+-------------+------+
-- | program_id | enrollee_id | itog |
-- +------------+-------------+------+
-- | 1          | 3           | 230  |
-- | 1          | 2           | 226  |
-- | 1          | 1           | 213  |
-- | 2          | 6           | 276  |
-- | 2          | 3           | 230  |
-- | 2          | 2           | 226  |
-- | 3          | 6           | 270  |
-- | 3          | 4           | 238  |
-- | 3          | 5           | 192  |
-- | 4          | 6           | 270  |
-- | 4          | 3           | 242  |
-- | 4          | 5           | 192  |
-- +------------+-------------+------+
-- Affected rows: 12