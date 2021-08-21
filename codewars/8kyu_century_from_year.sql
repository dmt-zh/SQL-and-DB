-- Given a year, return the century it is in.
-- Input , Output Examples :
-- 1705 --> 18
-- 1900 --> 19
-- 1601 --> 17
-- 2000 --> 20
-- In SQL, you will be given a table years with a column yr for the year. Return a table with a column century.

SELECT 
    CASE
        WHEN yr % 100 = 0 THEN ROUND(yr / 100)
        ELSE ROUND(yr / 100) + 1
    END AS century
FROM
    years
    
    
-- Clever solutions:

SELECT 
    CEILING(yr / 100.00) AS Century
FROM
    years

