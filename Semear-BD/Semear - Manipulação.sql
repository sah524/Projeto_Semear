use semear;

-- CONSULTAS SELECT
-- Listando todos os usuários
SELECT * FROM Usuario;

-- Mostrando todas as plantas disponíveis no marketplace
SELECT P.nome_cientifico, P.nomePopular, O.preco, O.estoque, V.nome_loja
FROM Planta P
JOIN Oferta O ON P.id_planta = O.id_planta
JOIN Vendedor V ON O.id_vendedor = V.id_usuario;

-- Consultando pedidos de um cliente específico
SELECT U.nome AS cliente, P.id_pedido, P.valor_total, P.status
FROM Pedido P
JOIN Cliente C ON P.id_cliente = C.id_usuario
JOIN Usuario U ON C.id_usuario = U.id_usuario
WHERE U.id_usuario = 1;

-- Mostrar avaliações feitas em ofertas
SELECT U.nome AS cliente, O.sku, A.nota, A.comentario
FROM Avaliacao A
JOIN Usuario U ON A.id_usuario = U.id_usuario
JOIN Oferta O ON A.id_oferta = O.id_oferta;

-- UPDATES
-- Atualizando estoque após venda
UPDATE Oferta SET estoque = estoque - 2 WHERE id_oferta = 1;

-- registro da oferta depois do UPDATE
SELECT id_oferta, preco, estoque
FROM Oferta
WHERE id_oferta = 1;

-- Atualizando status de um pedido
UPDATE Pedido SET status = 'Concluído' WHERE id_pedido = 1;

-- Corrigindo telefone de um usuário
UPDATE Usuario SET telefone = '61999998888' WHERE id_usuario = 1;