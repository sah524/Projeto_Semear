create database semear;

use semear;

-- Tabela principal de usuários
CREATE TABLE Usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    data_criacao DATE NOT NULL,
    tipo_usuario ENUM('cliente', 'vendedor', 'administrador') NOT NULL
);

-- Especializações
CREATE TABLE Cliente (
    id_usuario INT PRIMARY KEY,
    cpf CHAR(11) UNIQUE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Vendedor (
    id_usuario INT PRIMARY KEY,
    cnpj CHAR(14) UNIQUE NOT NULL,
    nome_loja VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

CREATE TABLE Administrador (
    id_usuario INT PRIMARY KEY,
    nivel_permissao INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Planta
CREATE TABLE Planta (
    id_planta INT AUTO_INCREMENT PRIMARY KEY,
    nome_cientifico VARCHAR(150) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(50),
    ciclo VARCHAR(50),
    origem VARCHAR(100),
    clima_principal VARCHAR(100),
    tipo_solo VARCHAR(100),
    nomePopular VARCHAR(100)
);

-- Imagens das plantas
CREATE TABLE ImagemPlanta (
    id_imagem INT AUTO_INCREMENT PRIMARY KEY,
    id_planta INT NOT NULL,
    url VARCHAR(255) NOT NULL,
    legenda VARCHAR(255),
    ordem INT,
    FOREIGN KEY (id_planta) REFERENCES Planta(id_planta)
);

-- Ofertas
CREATE TABLE Oferta (
    id_oferta INT AUTO_INCREMENT PRIMARY KEY,
    id_planta INT NOT NULL,
    id_vendedor INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    data_publicacao DATE NOT NULL,
    sku VARCHAR(50),
    FOREIGN KEY (id_planta) REFERENCES Planta(id_planta),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_usuario)
);

-- Pedidos
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    id_endereco_entrega INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_usuario)
);

-- Pagamento
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    metodo_pagamento VARCHAR(50) NOT NULL,
    status_pagamento VARCHAR(50) NOT NULL,
    transacao_id VARCHAR(100),
    data_pagamento DATE,
    valor_pago DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- Endereco
CREATE TABLE Endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(50),
    cep CHAR(8),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Conteúdo Educativo
CREATE TABLE ConteudoEducativo (
    id_conteudo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    resumo VARCHAR(255),
    corpo TEXT NOT NULL,
    data_publicacao DATE NOT NULL,
    tipo VARCHAR(50),
    tags VARCHAR(100),
    id_autor INT NOT NULL,
    FOREIGN KEY (id_autor) REFERENCES Usuario(id_usuario)
);

-- Avaliações
CREATE TABLE Avaliacao (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_oferta INT NOT NULL,
    nota INT CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_oferta) REFERENCES Oferta(id_oferta)
);

-- Itens do Pedido
CREATE TABLE ItemPedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_oferta INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario_no_momento DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(255),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_oferta) REFERENCES Oferta(id_oferta),
    UNIQUE (id_pedido, id_oferta) -- evita duplicidade do mesmo produto no pedido
);

show tables;