-- Есть таблица сотрудников employees. Предположим, для каждого человека мы хотим посчитать количество сотрудников,
-- которые получают такую же или большую зарплату (ge_cnt). Напишите запрос, который это сделает.

SELECT
    id,
    name,
    salary,
    count(*) OVER w as ge_cnt
FROM employees
WINDOW w AS (
             ORDER BY salary
             GROUPS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
            )
ORDER BY salary, id;


-- id	name	salary	ge_cnt
-- 11	Дарья	70	      10
-- 12	Борис	78	      9
-- 21	Елена	84	      8
-- 22	Ксения	90	      7
-- 31	Вероника 96	      6
-- 32	Григорий 96	      6
-- 33	Анна	100	      4
-- 23	Леонид	104	      3
-- 24	Марина	104	      3
-- 25	Иван	120	      1