-- Посчитайте среднее расстояние до центра города и выведите идентификаторы объявлений о сдаче отдельных комнат,
-- для которых расстояние оказалось меньше среднего. Результат отсортируйте по убыванию, тем самым выбрав комнату,
-- которая является наиболее удаленной от центра, но при этом расположена ближе, чем остальные комнаты в среднем. 

-- id – идентификатор объявления
-- host_id – идентификатор хозяина
-- room_type – тип жилья ('Private room')
-- latitude – широта
-- longitude – долгота
-- 52.5200 с.ш., 13.4050 в.д – координаты центра Берлина

-- В качестве ответа укажите идентификатор хозяина (host_id), сдающего данную комнату.

SELECT 
    host_id,
    geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)) AS distance_from_centre
FROM listings
WHERE room_type = 'Private room' 
      AND distance_from_centre < (
                                    SELECT
                                        avg(geoDistance(13.4050, 52.5200, toFloat64OrNull(longitude), toFloat64OrNull(latitude)))
                                    FROM listings
                                    WHERE room_type = 'Private room'
                                 )
ORDER BY distance_from_centre DESC
LIMIT 1