SELECT -- Questão 1
  product_id,
  SUM(quantity) AS total_quantity
FROM ordered_items
GROUP BY product_id
;

SELECT -- Questão 2
  product_id
FROM ordered_items
GROUP BY product_id
HAVING SUM(quantity) > 100
;

SELECT -- Questão 3
  shipper_id,
  AVG(quantity) AS media_quantity,
  COUNT(shipper_id) AS total_shippers
FROM ordered_items
GROUP BY shipper_id WITH ROLLUP
HAVING COUNT(shipper_id) > 2
;

SELECT -- Questão 4
  shipper_id, 
  SUM(quantity * unit_price) AS total_faturamento, 
  COUNT(shipper_id) AS total_shippers_deliveries
FROM ordered_items
GROUP BY shipper_id
HAVING COUNT(shipper_id) > 2
ORDER BY SUM(quantity * unit_price) DESC
LIMIT 3
;
