-- Необходимо найти среднее время от совершения заказа до его оплаты

SELECT 
    AVG(datediff(payment_day, create_day)) AS avg_pay_period
FROM (
		SELECT
			CAST(date AS DATE) AS payment_day,
			order_id
		FROM orders_log
		WHERE status_old = 5
        GROUP BY payment_day, order_id
	 ) as l
LEFT JOIN 
	(
		SELECT
			CAST(date AS DATE) AS create_day,
			order_id
		FROM orders_log
        WHERE status_old = 0
        GROUP BY create_day, order_id
	) as r
ON l.order_id = r.order_id;
