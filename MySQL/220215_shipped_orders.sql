-- Найти количество заказов, которые были отправлены

SELECT
	count(distinct order_id) AS shipped_orders
FROM (
		SELECT
			l.order_id,
            r.Name AS order_status
		FROM orders_log AS l
        LEFT JOIN status AS r
			ON l.status_old = r.id
	) as t
WHERE order_status = 'Отправлен';