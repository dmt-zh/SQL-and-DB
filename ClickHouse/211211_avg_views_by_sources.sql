-- Проверим, сколько товаров (events) в среднем просматривают пользователи с разных платформ (Platform), и пришедшие из разных источников  (Source).
-- Для этого объедините таблицы events и installs, и посчитайте, сколько просмотров в среднем приходится на каждую пару платформа-канал привлечения.
-- Отсортируйте полученную табличку по убыванию среднего числа просмотров. В качестве ответа укажите платформу и источник, пользователи которого в
-- среднем просматривали товары бóльшее число раз.

SELECT
    avg(events) AS avg_views,
    Source,
    Platform
FROM installs as i
JOIN events AS e ON i.DeviceID = e.DeviceID 
GROUP BY Source, Platform
ORDER BY avg_views DESC
LIMIT 1

-- avg  source     platform
-- 124	Source_20	iOS