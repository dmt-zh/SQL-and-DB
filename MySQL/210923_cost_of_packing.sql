-- Задание
-- Для упаковки каждой книги требуется 1 лист бумаги, цена которого 1 рубль 65 копеек. Посчитать стоимость упаковки
--  для каждой книги (сколько денег потребуется, чтобы упаковать все экземпляры книги). В запросе вывести название книги,
--  ее количество и стоимость упаковки, последний столбец назвать pack.

-- Результат:

-- +-----------------------+--------+-------+
-- | title                 | amount | pack  |
-- +-----------------------+--------+-------+
-- | Мастер и Маргарита    | 3      | 4.95  |
-- | Белая гвардия         | 5      | 8.25  |
-- | Идиот                 | 10     | 16.50 |
-- | Братья Карамазовы     | 2      | 3.30  |
-- | Стихотворения и поэмы | 15     | 24.75 |
-- +-----------------------+--------+-------+


SELECT title, amount, 1.65 * amount AS pack
FROM book;