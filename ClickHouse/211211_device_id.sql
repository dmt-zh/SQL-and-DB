-- У пользователя может быть два идентификатора – UserID и DeviceID. В таблице checks есть только UserID, в остальных – только DeviceID. 
-- Во вспомогательной таблице devices есть и UserID, и DeviceID.  Давайте с помощью JOIN дополним таблицу events данными о UserID пользователей 
-- из таблицы devices. Для некоторых DeviceID не будет пары UserID из таблицы devices – подумайте, какой вид JOIN подойдет, чтобы не потерять те строки,
-- где DeviceID есть в events, но нет в devices.

-- Укажите UserID из первой строки результирующей таблицы, используя сортировку по убыванию по полю DeviceID.

SELECT e.DeviceID, UserID
FROM events AS e
LEFT JOIN devices USING(DeviceID)
ORDER BY e.DeviceID DESC
LIMIT 10