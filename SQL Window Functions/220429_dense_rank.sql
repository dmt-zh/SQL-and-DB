-- Необходимо составить рейтинг сотрудников по размеру заработной платы.

SELECT
    DENSE_RANK() over w AS rank,
    name,
    department,
    salary
FROM employees
WINDOW w AS (ORDER by salary DESC)
ORDER BY salary DESC, id;


-- Query result:
-- rank	name	department	salary
-- 1	Иван	it	120
-- 2	Леонид	it	104
-- 2	Марина	it	104
-- 3	Анна	sales	100
-- 4	Вероника	sales	96
-- 4	Григорий	sales	96
-- 5	Ксения	it	90
-- 6	Елена	it	84
-- 7	Борис	hr	78
-- 8	Дарья	hr	70
