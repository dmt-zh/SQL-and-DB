-- Задание
-- Посчитать, сколько дополнительных баллов получит каждый абитуриент. 
-- Столбец с дополнительными баллами назвать Бонус. Информацию вывести в отсортированном по фамилиям виде.

SELECT name_enrollee, IFNULL(SUM(bonus), 0) AS Бонус
FROM enrollee
    LEFT JOIN enrollee_achievement USING(enrollee_id)
    LEFT JOIN achievement USING(achievement_id)
GROUP BY enrollee_id
ORDER BY name_enrollee;

-- Query result:
-- +-----------------+-------+
-- | name_enrollee   | Бонус |
-- +-----------------+-------+
-- | Абрамова Катя   | 0     |
-- | Баранов Павел   | 6     |
-- | Попов Илья      | 8     |
-- | Семенов Иван    | 5     |
-- | Степанова Дарья | 0     |
-- | Яковлева Галина | 1     |
-- +-----------------+-------+
-- Affected rows: 6