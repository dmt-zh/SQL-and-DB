-- Задание
-- Создать вспомогательную таблицу applicant,  куда включить id образовательной программы, id абитуриента, 
-- сумму баллов абитуриентов (столбец itog) в отсортированном сначала по id образовательной программы, а 
-- потом по убыванию суммы баллов виде.



CREATE TABLE applicant AS SELECT pe.program_id, pe.enrollee_id, SUM(result) AS itog 
FROM enrollee AS enr
        INNER JOIN program_enrollee AS pe ON enr.enrollee_id = pe.enrollee_id
        INNER JOIN program AS p ON pe.program_id = p.program_id
        INNER JOIN program_subject AS ps ON p.program_id = ps.program_id
        INNER JOIN enrollee_subject AS es ON ps.subject_id = es.subject_id
        AND es.enrollee_id = enr.enrollee_id
GROUP BY 1 , 2
ORDER BY 1 , 3 DESC;

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
-- | 3          | 1           | 179  |
-- | 4          | 6           | 270  |
-- | 4          | 3           | 242  |
-- | 4          | 5           | 192  |
-- | 4          | 1           | 179  |
-- +------------+-------------+------+
-- Affected rows: 14