-- Посчитаем разницу между максимальной и минимальной установленной ценой у каждого хозяина. 
-- В качестве ответа укажите идентификатор хоста, у которого разница оказалась наибольшей. 

-- host_id – идентификатор хозяина
-- id – идентификатор жилья
-- price – цена за ночь в конкретном месте


SELECT
    host_id,
    groupArray(id) AS ad_ids,
    min(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS min_price,
    max(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))) AS max_price,
    max_price - min_price AS price_diff
FROM listings
GROUP BY host_id
ORDER BY price_diff DESC
LIMIT 1