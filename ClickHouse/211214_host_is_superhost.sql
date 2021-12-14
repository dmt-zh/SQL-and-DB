-- Посмотрим на среднюю частоту ответа среди хозяев (f) и суперхозяев (t).
-- Значения частоты ответа хранятся как строки и включают значок %, который необходимо заменить на пустоту (''). 
-- После этого приведите столбец к нужному типу данных с помощью toInt32OrNull() и посчитайте среднюю частоту отклика
-- в разбивке по тому, является ли хост суперхозяином или нет. В качестве ответа укажите наибольшее среднее.

-- host_response_rate – частота ответа
-- host_is_superhost – является ли суперхозяином

SELECT
    host_is_superhost,
    round(avg(rating), 2) AS mean_rating
FROM (
        SELECT
            DISTINCT host_id,
            host_is_superhost,
            toInt32OrNull(replaceAll(host_response_rate, '%', '')) AS rating
        FROM listings
     )
GROUP BY host_is_superhost