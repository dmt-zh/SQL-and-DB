-- Необходимо составить рейтинг сотрудников по размеру заработной платы независимо по каждому департаменту.alter

SELECT
    DENSE_RANK() OVER w AS rank,
    name,
    department,
    salary
FROM employees
WINDOW w AS (PARTITION BY department ORDER by salary DESC)
ORDER BY department, rank, id;

-- Query result:
-- rank	name	department	salary
-- 1	Борис	hr	78
-- 2	Дарья	hr	70
-- 1	Иван	it	120
-- 2	Леонид	it	104
-- 2	Марина	it	104
-- 3	Ксения	it	90
-- 4	Елена	it	84
-- 1	Анна	sales	100
-- 2	Вероника	sales	96
-- 2	Григорий	sales	96