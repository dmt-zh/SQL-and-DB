-- Напишите запрос для создания таблицы со следующими параметрами, также подобрав подходящий тип данных.
-- Название таблицы: reviews. База данных: test
-- Столбцы:
-- - listing_id – идентификатор объявления, может быть только положительным и целым числом, 32-битный тип данных
-- - id – идентификатор хозяина, может быть только положительным и целым числом, 32-битный тип данных
-- - date – дата со временем (2020-01-01 00:00:00), часовой пояс – 'Europe/Moscow'
-- - reviewer_id – идентификатор ревьюера, может быть только положительным и целым числом, 32-битный тип данных
-- - reviewer_name – имя того, кто оставил отзыв
-- - comments - текст отзыва

-- Движок: MergeTree
-- Сортировка: listing_id, id


CREATE TABLE test.reviews
(
`listing_id` UInt32,
`id` UInt32,
`date` DateTime('Europe/Moscow'),
`reviewer_id` UInt32,
`reviewer_name` String,
`comments` String
)
ENGINE=MergeTree()
ORDER BY(listing_id, id)