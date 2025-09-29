use semear;

-- INSERÇÕES

-- Usuários
INSERT INTO Usuario (nome, email, senha, telefone, data_criacao, tipo_usuario)
VALUES 
('Maria Silva', 'maria@email.com', '123456', '61988887777', '2025-01-10', 'cliente'),
('João Vendas', 'joao@email.com', 'abc123', '61977776666', '2025-01-15', 'vendedor'),
('Ana Admin', 'ana@email.com', 'admin123', '61966665555', '2025-01-20', 'administrador');

-- Cliente
INSERT INTO Cliente (id_usuario, cpf) VALUES (1, '12345678901');

-- Vendedor 
INSERT INTO Vendedor (id_usuario, cnpj, nome_loja) 
VALUES (2, '12345678000199', 'Loja Verde');

-- Administrador
INSERT INTO Administrador (id_usuario, nivel_permissao) VALUES (3, 5);

-- Plantas
INSERT INTO Planta (nome_cientifico, descricao, categoria, ciclo, origem, clima_principal, tipo_solo, nomePopular)
VALUES
('Euterpe oleracea', 'Palmeira nativa da Amazônia, popularmente conhecida como açaí.', 'Frutífera', 'Perene', 'Amazônia', 'Úmido', 'Argiloso', 'Açaí'),
('Hymenaea courbaril', 'Árvore conhecida como jatobá, de grande porte.', 'Medicinal', 'Perene', 'Cerrado', 'Tropical', 'Arenoso', 'Jatobá');

-- Imagem da planta
INSERT INTO ImagemPlanta (id_planta, url, legenda, ordem)
VALUES (1, 'http://exemplo.com/acai.jpg', 'Fruto do açaí', 1);

-- Ofertas
INSERT INTO Oferta (id_planta, id_vendedor, preco, estoque, data_publicacao, sku)
VALUES
(1, 2, 25.00, 50, '2025-02-01', 'ACAI001'),
(2, 2, 60.00, 20, '2025-02-05', 'JATOBA001');

-- Endereço
INSERT INTO Endereco (id_usuario, rua, numero, bairro, cidade, estado, cep)
VALUES (1, 'Rua das Flores', '123', 'Centro', 'Brasília', 'DF', '70000000');

-- Pedido
INSERT INTO Pedido (id_cliente, data_pedido, valor_total, status, id_endereco_entrega)
VALUES (1, '2025-03-01', 50.00, 'Em andamento', 1);

-- Itens do pedido
INSERT INTO ItemPedido (id_pedido, id_oferta, quantidade, preco_unitario_no_momento, subtotal)
VALUES (1, 1, 2, 25.00, 50.00);

-- Pagamento
INSERT INTO Pagamento (id_pedido, metodo_pagamento, status_pagamento, transacao_id, data_pagamento, valor_pago)
VALUES (1, 'Cartão de Crédito', 'Aprovado', 'TRX12345', '2025-03-01', 50.00);

-- Avaliação
INSERT INTO Avaliacao (id_usuario, id_oferta, nota, comentario, data_avaliacao)
VALUES (1, 1, 5, 'Planta chegou bem embalada, recomendo!', '2025-03-05');

-- Conteúdo educativo
INSERT INTO ConteudoEducativo (titulo, resumo, corpo, data_publicacao, tipo, tags, id_autor)
VALUES ('Importância das plantas nativas', 'Resumo sobre preservação', 'Texto completo...', '2025-02-10', 'Artigo', 'preservação, plantas', 3);