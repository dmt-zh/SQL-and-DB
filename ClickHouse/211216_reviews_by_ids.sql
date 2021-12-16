-- Давайте найдем в таблице calendar_summary те доступные (available='t') объявления, у которых число отзывов от уникальных пользователей 
-- в таблице reviews выше среднего. Для этого с помощью конструкции WITH посчитайте среднее число уникальных reviewer_id из таблицы reviews 
-- на каждое жильё, потом проведите джойн таблиц calendar_summary и reviews по полю listing_id (при этом из таблицы calendar_summary должны 
-- быть отобраны уникальные listing_id, отфильтрованные по правилу available='t'). Результат отфильтруйте так, чтобы остались только записи, 
-- у которых число отзывов от уникальных людей выше среднего.

-- Отсортируйте результат по возрастанию listing_id и в качестве ответа впишите количество отзывов от уникальных пользователей из первой строки.

WITH (
        SELECT 
            avg(unique_reviews) AS avg_reviews
        FROM (
                SELECT count(DISTINCT reviewer_id) AS unique_reviews
                FROM reviews
                GROUP BY listing_id
             )
     ) AS avg_review_ids

SELECT 
    listing_id,
    count(reviewer_id) AS reviews
FROM reviews AS rv
JOIN (
        SELECT 
            DISTINCT listing_id,
            available
        FROM calendar_summary
        WHERE available == 't'
     ) as cs on rv.listing_id = cs.listing_id
GROUP BY listing_id
HAVING reviews > avg_review_ids
ORDER BY listing_id
LIMIT 10