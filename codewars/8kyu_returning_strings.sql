-- Write a select statement that takes name from person table and return
-- "Hello, <name> how are you doing today?" results in a column named greeting
-- [Make sure you type the exact thing I wrote or the program may not execute properly]

select
concat('Hello, ', name, ' how are you doing today?') as greeting
from person


-- Clever solutions:

select
'Hello, ' || name || ' how are you doing today?' as greeting
from person


select
format('Hello, %s how are you doing today?', name) as greeting
from person

Select
( 'Hello, ' || person.name || ' how are you doing today?')  as greeting
from person