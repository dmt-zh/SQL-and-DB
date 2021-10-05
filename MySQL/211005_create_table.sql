-- Задание
-- Перепишите запрос на создание таблицы book , чтобы ее структура соответствовала структуре, 
-- показанной на логической схеме (таблица genre уже создана, порядок следования столбцов - как 
-- на логической схеме в таблице book, genre_id  - внешний ключ) . Для genre_id ограничение о 
-- недопустимости пустых значений не задавать. В качестве главной таблицы для описания поля  
-- genre_idиспользовать таблицу genre следующей структуры:

-- Поле	Тип, 	описание
-- genre_id	I	NT PRIMARY KEY AUTO_INCREMENT
-- name_genre	VARCHAR(30)



CREATE TABLE book (
      book_id INT PRIMARY KEY AUTO_INCREMENT, 
      title VARCHAR(50), 
      author_id INT, 
      genre_id INT,
      price DECIMAL(8,2), 
      amount INT, 
      FOREIGN KEY (author_id)  REFERENCES author (author_id),
      FOREIGN KEY (genre_id)  REFERENCES genre (genre_id)
);

SHOW COLUMNS FROM book;


-- Query result:
-- +-----------+--------------+------+-----+---------+----------------+
-- | Field     | Type         | Null | Key | Default | Extra          |
-- +-----------+--------------+------+-----+---------+----------------+
-- | book_id   | int          | NO   | PRI | NULL    | auto_increment |
-- | title     | varchar(50)  | YES  |     | NULL    |                |
-- | author_id | int          | NO   | MUL | NULL    |                |
-- | genre_id  | int          | YES  | MUL | NULL    |                |
-- | price     | decimal(8,2) | YES  |     | NULL    |                |
-- | amount    | int          | YES  |     | NULL    |                |
-- +-----------+--------------+------+-----+---------+----------------+
-- Affected rows: 6