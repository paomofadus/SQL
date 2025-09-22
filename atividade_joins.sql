SELECT v.id_venda, v.data, c.nome_cliente, c.cidade, p.nome_produto, v.qtd_produto, p.preco_unit, v.qtd_produto * p.preco_unit AS valor_total
FROM produtos AS p
INNER JOIN vendas AS v
ON p.id_produto = v.id_produto
INNER JOIN clientes AS c
ON v.id_cliente = c.id_cliente
ORDER BY v.qtd_produto * p.preco_unit DESC, id_venda DESC
;

SELECT p.categoria, SUM(p.preco_unit * v.qtd_produto) AS faturamento
FROM produtos AS p
INNER JOIN vendas AS v
ON p.id_produto = v.id_produto
GROUP BY p.categoria
ORDER BY SUM(p.preco_unit * v.qtd_produto) DESC
LIMIT 2
;

SELECT c.nome_cliente, SUM(p.preco_unit * v.qtd_produto) AS gasto_total
FROM clientes AS c
INNER JOIN vendas AS v
ON c.id_cliente = v.id_cliente
INNER JOIN produtos AS p
ON v.id_produto = p.id_produto
WHERE categoria = "Computador"
GROUP BY c.nome_cliente
HAVING SUM(p.preco_unit * v.qtd_produto) >= 3000
;

SELECT c.id_cliente, c.nome_cliente, c.cidade, SUM(p.preco_unit * v.qtd_produto) AS gasto_total, COUNT(v.id_cliente) AS num_pedidos
FROM clientes AS c
LEFT JOIN vendas AS v
ON c.id_cliente = v.id_cliente
LEFT JOIN produtos AS p
ON v.id_produto = p.id_produto
GROUP BY c.id_cliente
;
