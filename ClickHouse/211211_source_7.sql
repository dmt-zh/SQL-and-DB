-- Выясним, сколько всего уникальных юзеров что-то купили в нашем приложении.
-- Объедините нужные таблицы, посчитайте число уникальных UserID для каждого источника (Source),
-- и в качестве ответа укажите число пользователей, пришедших из Source_7.

SELECT
    Source,
    count(DISTINCT ch.UserID) AS num_users
FROM checks as ch
JOIN devices AS d ON ch.UserID = d.UserID
JOIN installs AS i ON d.DeviceID = i.DeviceID
GROUP BY Source
HAVING Source = 'Source_7'