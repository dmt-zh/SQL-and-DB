-- Задание
-- Повысить итоговые баллы абитуриентов в таблице applicant на значения 
-- дополнительных баллов (использовать запрос из предыдущего урока).


UPDATE applicant
INNER JOIN
		(
		 SELECT enrollee_id, SUM(bonus) AS bonus
         FROM enrollee_achievement
			INNER JOIN achievement USING (achievement_id)
		 GROUP BY 1
         ) query_ ON applicant.enrollee_id = query_.enrollee_id 
SET itog = itog + bonus;

SELECT * FROM applicant;

-- Query result:
-- +------------+-------------+------+
-- | program_id | enrollee_id | itog |
-- +------------+-------------+------+
-- | 1          | 3           | 235  |
-- | 1          | 2           | 226  |
-- | 1          | 1           | 219  |
-- | 2          | 6           | 276  |
-- | 2          | 3           | 235  |
-- | 2          | 2           | 226  |
-- | 3          | 6           | 270  |
-- | 3          | 4           | 239  |
-- | 3          | 5           | 200  |
-- | 4          | 6           | 270  |
-- | 4          | 3           | 247  |
-- | 4          | 5           | 200  |
-- +------------+-------------+------+
-- Affected rows: 12