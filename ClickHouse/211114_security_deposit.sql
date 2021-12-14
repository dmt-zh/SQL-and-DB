-- Теперь сгруппируйте данные по типу жилья и выведите средние значения цены за ночь, размера депозита и цены уборки.
-- Обратите внимание на тип данных, наличие значка $ и запятых в больших суммах. Для какого типа жилья среднее значение залога наибольшее?

-- room_type – тип сдаваемого жилья 
-- price – цена за ночь
-- security_deposit – залог за сохранность имущества
-- cleaning_fee – плата за уборку


SELECT
    room_type,
    round(avg(toFloat32OrNull(replaceRegexpAll(security_deposit, '[$,]', ''))),2) AS security_deposit,
    round(avg(toFloat32OrNull(replaceRegexpAll(price, '[$,]', ''))), 2) AS price,
    round(avg(toFloat32OrNull(replaceRegexpAll(cleaning_fee, '[$,]', ''))), 2) AS cleaning_fee
FROM listings
GROUP BY room_type
ORDER BY security_deposit DESC