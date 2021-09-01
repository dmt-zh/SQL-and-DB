			-- Задание-- 
-- Удалите из таблицы 'client' поля 'code' и 'source_id'.
-- NB! Для удаления поля, являющегося внешним ключом, необходимо удалить ограничение внешнего ключа оператором 'DROP FOREIGN KEY <fk_name>', 
-- для данного задание имя первичного ключа: fk_client_source1. Удаление ограничения внешнего ключа и поля таблицы необходимо производить в 
-- рамках одного вызова ALTER TABLE. При выполнении ALTER TABLE не следует указывать название схемы.

ALTER TABLE `client`
    DROP COLUMN `code`,
    DROP COLUMN `source_id`,
    DROP FOREIGN KEY `fk_client_source1`