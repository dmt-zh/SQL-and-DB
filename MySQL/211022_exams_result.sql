-- Задание
-- Посчитать количество баллов каждого абитуриента на каждую образовательную программу, на которую 
-- он подал заявление, по результатам ЕГЭ. В результат включить название образовательной программы, 
-- фамилию и имя абитуриента, а также столбец с суммой баллов, который назвать itog. Информацию вывести 
-- в отсортированном сначала по образовательной программе, а потом по убыванию суммы баллов виде.


SELECT 
    name_program,
    name_enrollee,
    SUM(result) AS itog
FROM enrollee JOIN program_enrollee USING(enrollee_id)
              JOIN program USING(program_id)
              JOIN program_subject USING(program_id)
              JOIN subject USING(subject_id)
              JOIN enrollee_subject USING(subject_id, enrollee_id)
GROUP BY 1, 2
ORDER BY 1, 3 DESC;


-- Query result:
-- +-------------------------------------+-----------------+------+
-- | name_program                        | name_enrollee   | itog |
-- +-------------------------------------+-----------------+------+
-- | Математика и компьютерные науки     | Степанова Дарья | 276  |
-- | Математика и компьютерные науки     | Семенов Иван    | 230  |
-- | Математика и компьютерные науки     | Абрамова Катя   | 226  |
-- | Мехатроника и робототехника         | Степанова Дарья | 270  |
-- | Мехатроника и робототехника         | Семенов Иван    | 242  |
-- | Мехатроника и робототехника         | Попов Илья      | 192  |
-- | Мехатроника и робототехника         | Баранов Павел   | 179  |
-- | Прикладная математика и информатика | Семенов Иван    | 230  |
-- | Прикладная математика и информатика | Абрамова Катя   | 226  |
-- | Прикладная математика и информатика | Баранов Павел   | 213  |
-- | Прикладная механика                 | Степанова Дарья | 270  |
-- | Прикладная механика                 | Яковлева Галина | 238  |
-- | Прикладная механика                 | Попов Илья      | 192  |
-- | Прикладная механика                 | Баранов Павел   | 179  |
-- +-------------------------------------+-----------------+------+
-- Affected rows: 14