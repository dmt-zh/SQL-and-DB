-- The objective of this Kata is to show that you are proficient at string manipulation (and perhaps that you can use extensively subqueries).

-- You will use people table but will focus solely on the name column

-- name
-- Greyson Tate Lebsack Jr.
-- Elmore Clementina O'Conner
-- you will be provided with a full name and you have to return the name in columns as follows.

-- name	first_lastname	second_lastname
-- Greyson Tate	Lebsack	Jr.
-- Elmore	Clementina	O'Conner


SELECT

CASE
   WHEN name LIKE '% % % %' THEN 
     CONCAT(SPLIT_PART(name, ' ', 1),' ', SPLIT_PART(name, ' ', 2)) ELSE
     SPLIT_PART(name, ' ', 1) END
     AS name, 
CASE
   WHEN name LIKE '% % % %' THEN 
     SPLIT_PART(name, ' ', 3) ELSE
     SPLIT_PART(name, ' ', 2) END
     AS first_lastname,
 CASE
   WHEN name LIKE '% % % %' THEN
     SPLIT_PART(name, ' ', 4) ELSE
     SPLIT_PART(name, ' ', 3) END
     AS second_lastname
FROM people
