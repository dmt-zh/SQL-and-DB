-- Задание
-- Случайным образом отберите 3 вопроса по дисциплине «Основы баз данных». 
-- В результат включите столбцы question_id и name_question.


SELECT question_id, name_question
FROM
    (SELECT q.question_id, name_question
    FROM question AS q
		INNER JOIN subject USING (subject_id)
    WHERE name_subject = 'Основы баз данных') AS _query
ORDER BY RAND()
LIMIT 3;


-- Query result:
-- +-------------+-----------------------------------------------------+
-- | question_id | name_question                                       |
-- +-------------+-----------------------------------------------------+
-- | 9           | Какой тип данных не допустим в реляционной таблице? |
-- | 7           | Отношение - это:                                    |
-- | 8           | Концептуальная модель используется для              |
-- +-------------+-----------------------------------------------------+
-- Affected rows: 3