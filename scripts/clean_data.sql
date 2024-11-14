-- Create a temp view that join the prodcut with its latest price and price per unit
CREATE VIEW product_price
AS 
WITH LatestPrice AS (
    SELECT product_id, current_price, price_per_unit,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY nowtime DESC) AS rn
    FROM raw
)
SELECT p.id, p.vendor, p.product_name, p.units, p.brand, lp.current_price, lp.price_per_unit
FROM product p
LEFT JOIN LatestPrice lp ON p.id = lp.product_id
WHERE lp.rn = 1;

-- Select all products that contain "bread", and make the price per unit in form of 100g, result is in data directory
SELECT *,
  CASE 
    WHEN INSTR(price_per_unit, '¢') > 0 
      THEN CAST(SUBSTR(price_per_unit, 1, INSTR(price_per_unit, '¢') - 1) AS REAL) / 100
    ELSE CAST(SUBSTR( TRIM(REPLACE(price_per_unit, ' /', '/')), 
      INSTR(price_per_unit, '/') - 4, 4) AS REAL)
  END AS price_in_dollars
FROM product_price
WHERE product_name LIKE '%bread%' 
AND price_per_unit LIKE '%g';

-- select all products that contain "milk", result is in data directory
SELECT *,
  CASE 
    WHEN INSTR(price_per_unit, '¢') > 0 
      THEN CAST(SUBSTR(price_per_unit, 1, INSTR(price_per_unit, '¢') - 1) AS REAL) / 100
    ELSE 
      CAST(SUBSTR( TRIM(REPLACE(price_per_unit, ' /', '/')),
      INSTR(price_per_unit, '/') - 4, 4) AS REAL)
  END AS price_in_dollars
FROM product_price
WHERE product_name LIKE '%milk%' 
AND (price_per_unit LIKE '%g' or price_per_unit LIKE '%ml');