-- Задание
-- Включить в таблицу applicant_order новый столбец str_id целого типа , расположить его перед первым.

ALTER TABLE applicant_order ADD str_id INT FIRST;
DESCRIBE applicant_order;

-- Query result:
-- +-------------+------+------+-----+---------+-------+
-- | Field       | Type | Null | Key | Default | Extra |
-- +-------------+------+------+-----+---------+-------+
-- | str_id      | int  | YES  |     | None    |       |
-- | program_id  | int  | YES  |     | None    |       |
-- | enrollee_id | int  | YES  |     | None    |       |
-- | itog        | int  | YES  |     | None    |       |
-- +-------------+------+------+-----+---------+-------+
-- Affected rows: 4
