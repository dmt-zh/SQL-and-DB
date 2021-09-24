-- Задание
-- Вывести  автора и название  книг, количество которых принадлежит интервалу от 2 до 14 (включая границы).
-- Информацию  отсортировать сначала по авторам (в обратном алфавитном порядке), а затем по названиям книг (по алфавиту).

-- Результат:

-- +------------------+--------------------+
-- | author           | title              |
-- +------------------+--------------------+
-- | Достоевский Ф.М. | Братья Карамазовы  |
-- | Достоевский Ф.М. | Идиот              |
-- | Булгаков М.А.    | Белая гвардия      |
-- | Булгаков М.А.    | Мастер и Маргарита |
-- +------------------+--------------------+


SELECT author, title
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC , title;