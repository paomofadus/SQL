SELECT * FROM customer_orders;

-- SELECT customer_id, SUM(tip) as total_tips
-- FROM customer_orders
-- WHERE total_tips > 5 (erro)
-- GRUPO BY customer_id;

SELECT customer_id, SUM(tip) as total_tips
FROM customer_orders
GROUP BY customer_id
HAVING SUM(tip) > 5 -- WHERE do GROUP BY, também pode ser usado o ALIAS (em alguns casos pode dar erro)
;

SELECT customer_id, SUM(order_total) as total_orders
FROM customer_orders
GROUP BY customer_id
HAVING SUM(order_total) > 40
ORDER BY SUM(order_total)
;

-- ROLLUP

SELECT customer_id, SUM(order_total) as total_orders
FROM customer_orders
GROUP BY customer_id WITH ROLLUP -- soma das funções de agregação
ORDER BY customer_id DESC
;
