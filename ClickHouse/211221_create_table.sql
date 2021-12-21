-- Ваш менее опытный коллега не уверен, что его таблица retail действительно создалась и добавилась в базу данных. 
-- Напишите запрос, который создаст таблицу, если она еще не существует (IF NOT EXISTS), со следующими параметрами:

-- Название: retail
-- База: test

-- Столбцы:
-- - InvoiceNo – идентификатор заказа, строковое значение
-- - StockCode – идентификатор товара, строковое значение
-- - Description – описание товара, строковое значение
-- - Quantity – количество единиц товара, добавленных в корзину (особенность данных – значения могут быть отрицательными, 32 бита)
-- - InvoiceDate – дата и время создания заказа (транзакции), часовой пояс – 'Europe/London'
-- - UnitPrice – цена за единицу товара (особенность данных – значения могут быть отрицательными, точность – три знака после точки, 64 бита)
-- - CustomerID – идентификатор пользователя, целое положительное число, 32 бита.
-- - Country – страна, строковое значение. 

-- Движок: MergeTree
-- Сортировка: InvoiceDate, CustomerID


CREATE TABLE IF NOT EXISTS test.retail
(
`InvoiceNo` String,
`StockCode` String,
`Description` String,
`Quantity` Int32,
`InvoiceDate` DateTime('Europe/London'),
`UnitPrice` Decimal64(3),
`CustomerID` UInt32,
`Country` String
)
ENGINE=MergeTree()
ORDER BY(InvoiceDate, CustomerID)