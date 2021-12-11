-- Давайте теперь посчитаем конверсию из инсталла в просмотр с разбивкой по платформе инсталла – в данном случае это доля DeviceID,
-- для которых есть просмотры, от всех DeviceID в инсталлах. 

SELECT
    count(DISTINCT ev.DeviceID) AS unique_devices_by_events,
    count(DISTINCT ins.DeviceID) AS all_unique_devices,
    round(unique_devices_by_events/all_unique_devices, 2) AS conversion_rate,
    Platform
FROM events AS ev
RIGHT JOIN installs AS ins USING(DeviceID)
GROUP BY Platform
