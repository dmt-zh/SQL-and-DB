-- Задание
-- Выбрать всех клиентов, которые заказывали книги Достоевского, информацию вывести в отсортированном по алфавиту виде.


SELECT name_client
FROM client
        INNER JOIN buy USING (client_id)
        INNER JOIN buy_book USING (buy_id)
        INNER JOIN book USING (book_id)
        INNER JOIN author USING (author_id)
WHERE name_author = 'Достоевский Ф.М.'
GROUP BY 1
ORDER BY 1

-- Query result:
-- +---------------+
-- | name_client   |
-- +---------------+
-- | Абрамова Катя |
-- | Баранов Павел |
-- +---------------+
-- Affected rows: 2