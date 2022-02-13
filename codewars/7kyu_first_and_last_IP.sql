-- Task
-- Given a table where users' connections are logged, find the first and the last address of the networks they connected from.

-- Notes
-- Order the result by the id column
-- There's no need to validate anything - it's okay if the user connects from a private network
-- (You don't need the connection_time field for this task but without it the input data looks too dull)

-- Input table
-- ---------------------------------------------
-- |    Table    |     Column      |   Type    |
-- |-------------+-----------------+-----------|
-- | connections | id              | int       |
-- |             | connection_time | timestamp |
-- |             | ip_address      | inet      |
-- ---------------------------------------------
-- Output table
-- ------------------------
-- |    Column     | Type |
-- |---------------+------|
-- | id            | int  |
-- | first_address | text |
-- | last_address  | text |
-- ------------------------


SELECT 
    id,
    NETWORK(ip_address) AS first_address,
    BROADCAST(ip_address) AS last_address
FROM connections
ORDER BY id;
