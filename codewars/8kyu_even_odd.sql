-- SQL Notes:
-- You will be given a table, numbers, with one column number.

-- Return a table with a column is_even containing "Even" or "Odd" depending on number column values.

-- numbers table schema
-- number INT
-- output table schema
-- is_even STRING


select Case when number %2 = 0 then 'Even' else 'Odd' end as is_even from numbers