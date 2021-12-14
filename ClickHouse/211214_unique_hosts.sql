-- Пользователи, сдающие квартиры на Airbnb, зарегистрировались в разное время. Кто-то – очень давно, а кто-то совсем недавно.
-- Давайте проверим, в какой месяц и год зарегистрировалось наибольшее количество новых хостов. В качестве ответа введите дату
-- следующего формата: 2010-12

-- host_id – идентификатор хозяина
-- host_since – дата регистрации как хост

SELECT
    count(DISTINCT host_id) AS num_unique_hosts,
    toStartOfMonth(toDateOrNull(host_since)) AS registration_period
FROM listings
GROUP BY registration_period
ORDER BY unique_hosts DESC
LIMIT 10