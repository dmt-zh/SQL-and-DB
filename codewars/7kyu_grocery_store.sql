-- Make a SELECT query which will tell the price per kg of the product.
-- Weight is in grams! Round the price_per_kg to 2 decimal places.
-- Order results by price_per_kg ascending, then by name ascending.

-- Products table schema:
-- id (int)
-- name (string)
-- price (float)
-- stock (int)
-- weight (float)
-- producer (string)
-- country (string)

-- Results table schema:
-- name (string)
-- weight (float)
-- price (float)
-- price_per_kg (float)

SELECT
  name, 
  weight,
  price,
  round((price * 1000 / weight)::numeric, 2)::float as price_per_kg
FROM products
ORDER BY price_per_kg, name;
