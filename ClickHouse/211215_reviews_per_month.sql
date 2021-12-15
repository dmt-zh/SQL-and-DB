-- Сначала оставьте только те объявления, в которых оценка на основе отзывов выше среднего, а число отзывов
-- в месяц составляет строго меньше трёх. Затем отсортируйте по убыванию две колонки: сначала по числу отзывов 
-- в месяц, потом по оценке. В качестве ответа укажите id объявления из первой строки.

SELECT
    id,
    toFloat32OrNull(review_scores_rating) AS review_scores_rating,
    reviews_per_month
FROM listings
WHERE review_scores_rating > (SELECT avg(toFloat32OrNull(review_scores_rating)) FROM listings)
      AND reviews_per_month < 3
ORDER BY reviews_per_month DESC, review_scores_rating DESC
LIMIT 1