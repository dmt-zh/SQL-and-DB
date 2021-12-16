-- Вернемся к таблице AirBnb. Предположим, что в выборе жилья нас интересует только два параметра: 
-- наличие кухни (kitchen) и гибкой системы отмены (flexible), причем первый в приоритете.

-- Создайте с помощью оператора CASE колонку с обозначением группы, в которую попадает жилье из таблицы listings:
-- 'good', если в удобствах (amenities) присутствует кухня и система отмены (cancellation_policy) гибкая
-- 'ok', если в удобствах есть кухня, но система отмены не гибкая
-- 'not ok' во всех остальных случаях
-- Результат отсортируйте по новой колонке по возрастанию, установите ограничение в 5 строк, в качестве ответа укажите host_id первой строки.


SELECT
    host_id,
    CASE
        WHEN multiSearchAnyCaseInsensitiveUTF8(amenities, ['Kitchen']) != 0
             AND (cancellation_policy == 'flexible') != 0 THEN 'good'
        WHEN multiSearchAnyCaseInsensitiveUTF8(amenities, ['Kitchen']) != 0
             AND (cancellation_policy == 'flexible') = 0 THEN 'ok'
        ELSE 'not ok'
    END AS category
FROM listings
ORDER BY category ASC
LIMIT 5