-- Задание
-- Вывести студентов, которые сдавали дисциплину «Основы баз данных», указать дату 
-- попытки и результат. Информацию вывести по убыванию результатов тестирования.


SELECT name_student, date_attempt, result
FROM (SELECT * FROM subject WHERE name_subject = 'Основы баз данных') _query
    INNER JOIN attempt USING(subject_id)
    INNER JOIN student USING(student_id)
ORDER BY result DESC

-- Query result:
-- +-----------------+--------------+--------+
-- | name_student    | date_attempt | result |
-- +-----------------+--------------+--------+
-- | Яковлева Галина | 2020-04-21   | 100    |
-- | Баранов Павел   | 2020-03-23   | 67     |
-- | Яковлева Галина | 2020-03-26   | 0      |
-- +-----------------+--------------+--------+
-- Affected rows: 3