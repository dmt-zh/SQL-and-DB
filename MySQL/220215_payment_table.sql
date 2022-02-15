-- Выгрузить количество заказов по дням с Site, по столбцам типы оплаты (по строкам дни)

SELECT 
    l.create_date AS order_date,
    Cash,
    Card,
    Bonuses
FROM (
		SELECT 
			l.create_date,
			Cash,
			Card
		FROM (
				SELECT 
					m.create_date,
					COUNT(m.order_number) AS Cash
			FROM (
					SELECT 
						CAST(l.date_create AS DATE) AS create_date,
						l.order_number AS order_number,
						r.Name AS payment_type
					FROM orders AS l
					LEFT JOIN payment_method AS r
						ON l.payment_method = r.id
					WHERE l.order_source = 0
                    ) AS m
			WHERE m.payment_type = 'Наличка'
			GROUP BY m.create_date) AS l
	LEFT JOIN (
				SELECT 
					c.create_date, COUNT(c.order_number) AS Card
					FROM (
							SELECT 
								CAST(l.date_create AS DATE) AS create_date,
								l.order_number AS order_number,
								r.Name AS payment_type
							FROM
								orders AS l
							LEFT JOIN payment_method AS r
								ON l.payment_method = r.id
							WHERE l.order_source = 0
                            ) AS c
					WHERE c.payment_type = 'Карта'
					GROUP BY c.create_date
				) AS r 
		ON l.create_date = r.create_date
) AS l
LEFT JOIN
		(
			SELECT 
				b.create_date, COUNT(b.order_number) AS Bonuses
				FROM (
						SELECT 
							CAST(l.date_create AS DATE) AS create_date,
							l.order_number AS order_number,
							r.Name AS payment_type
						FROM 
							orders AS l
						LEFT JOIN payment_method AS r
							ON l.payment_method = r.id
					WHERE l.order_source = 0
					) AS b
		WHERE
			b.payment_type = 'Бонусы'
		GROUP BY b.create_date
        ) AS r
	ON l.create_date = r.create_date
ORDER BY order_date;
	
	

