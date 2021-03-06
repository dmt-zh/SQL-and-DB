-- Задание
-- Создать таблицу student,  в которую включить абитуриентов, которые могут быть 
-- рекомендованы к зачислению  в соответствии с планом набора. Информацию отсортировать 
-- сначала в алфавитном порядке по названию программ, а потом по убыванию итогового балла.


CREATE TABLE student AS 
SELECT name_program, name_enrollee, itog 
FROM applicant_order
	INNER JOIN program USING (program_id)
    INNER JOIN enrollee USING (enrollee_id)
WHERE str_id <= plan
ORDER BY 1 , 3 DESC;


-- Query result:
-- +-------------------------------------+-----------------+------+
-- | name_program                        | name_enrollee   | itog |
-- +-------------------------------------+-----------------+------+
-- | Математика и компьютерные науки     | Степанова Дарья | 276  |
-- | Мехатроника и робототехника         | Степанова Дарья | 270  |
-- | Мехатроника и робототехника         | Семенов Иван    | 247  |
-- | Мехатроника и робототехника         | Попов Илья      | 200  |
-- | Прикладная математика и информатика | Семенов Иван    | 235  |
-- | Прикладная математика и информатика | Абрамова Катя   | 226  |
-- | Прикладная механика                 | Степанова Дарья | 270  |
-- | Прикладная механика                 | Яковлева Галина | 239  |
-- +-------------------------------------+-----------------+------+