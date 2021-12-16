-- Представим, что вы планируете снять жилье в Берлине на 7 дней, используя более хитрые фильтры, чем предлагаются на сайте.
-- В этой задаче можно потренироваться в написании подзапросов, но задание можно решить и без них.

-- Отберите объявления из таблицы listings, которые:
-- находятся на расстоянии от центра меньше среднего (здесь нам пригодится запрос из предыдущего задания)
-- обойдутся дешевле 100$ в день (price с учетом cleaning_fee, который добавляется к общей сумме за неделю, т.е его нужно делить на кол-во дней)
-- имеют последние отзывы (last_review), начиная с 1 сентября 2018 года
-- имеют WiFi в списке удобств (amenities)
-- Отсортируйте полученные значения по убыванию review_scores_rating (не забудьте перевести строку к численному виду) и в качестве ответа укажите host_id из первой строки.

SELECT 
    host_id,
    geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)) AS distance_from_centre,
    toFloat32OrNull(replaceRegexpAll(price, '[$,]', '')) AS price,
    toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]', '')) AS cleaning_fee,
    price + cleaning_fee / 7 AS total_per_night,
    toFloat32OrNull(review_scores_rating) AS review_rating,
    toStartOfMonth(toDateOrNull(last_review)) AS last_review
FROM listings
WHERE distance_from_centre < (
                                SELECT
                                    avg(geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)))
                                FROM listings
                              )
     AND total_per_night < 100
     AND last_review > '2018-09-01'
     AND multiSearchAnyCaseInsensitiveUTF8(amenities, ['Wifi']) > 0
ORDER BY review_rating DESC
LIMIT 10 