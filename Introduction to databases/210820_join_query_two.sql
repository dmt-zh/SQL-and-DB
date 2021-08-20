/* База данных магазина `store` 
Выведите список клиентов (имя, фамилия) и количество заказов данных клиентов, имеющих статус "new".
Ожидаемый формат результата:
+------------+------------+----------------------+
| first_name | last_name  | new_sale_num         |
+------------+------------+----------------------+
| Ivan       | Ivanov     |                   10 |
| Petr       | Petrov     |                    7 |
| Semen      | Sidorov    |                    7 |
| Frank     | Sinatra    |                    2 |
| Ella       | Fitzgerald |                    1 |
...
 
NB! 
Если необходимо в результате использовать группировку, то в операторе GROUP BY должны быть указаны все атрибуты, 
которые не являются аргументами аггрегирующих функций. */



select client.first_name, client.last_name,  count(status.id) as new_sale_num
from sale
inner join status on sale.status_id = status.id
inner join client on sale.client_id = client.id
where status.name = 'new'
group by client.first_name, client.last_name
order by new_sale_num desc;