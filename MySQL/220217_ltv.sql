-- Найти LTV на клиента (сколько в среднем заработали на одном клиенте)

WITH total_revenue AS 
(
	SELECT
		SUM(quantity * price) AS total_revenue
	FROM
		orders_log AS l
	LEFT JOIN (
			SELECT
				l.order_id,
				l.article_id,
				l.quantity,
				r.price,
				CAST(r.date_price_change AS DATE) AS date_price_change
			FROM
				orders_items AS l
			INNER JOIN products AS r
				ON l.article_id = r.id
			WHERE
				date_price_change >= (
										SELECT
											min(payment_day) AS min_date
										FROM (
												SELECT
													order_id,
													CAST(date AS DATE) AS payment_day
												FROM
													orders_log
												WHERE status_old = 5) as d
									 )
				) AS r
			ON l.order_id = r.order_id
	WHERE status_old = 5
),
total_users AS
(
	SELECT
		count(*) AS total_users
	FROM
		orders
)

SELECT
	ROUND(total_revenue/total_users, 2) AS LTV
FROM total_revenue
CROSS JOIN total_users;