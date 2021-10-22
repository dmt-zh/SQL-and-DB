-- Задание
-- Вывести образовательные программы, на которые для поступления необходимы 
-- предмет «Информатика» и «Математика» в отсортированном по названию программ виде.

SELECT name_program
FROM program
	INNER JOIN program_subject USING (program_id)
	INNER JOIN subject USING (subject_id)
WHERE name_subject IN ('Информатика' , 'Математика')
GROUP BY 1
HAVING COUNT(name_subject) > 1
ORDER BY 1;

-- Query result:
-- +-------------------------------------+
-- | name_program                        |
-- +-------------------------------------+
-- | Математика и компьютерные науки     |
-- | Прикладная математика и информатика |
-- +-------------------------------------+
-- Affected rows: 2