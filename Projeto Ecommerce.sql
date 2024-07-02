-- Criação do banco de dados para o cenário de e-commerce --
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criar tabela cliente --
CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(10),
    NameioInicial VARCHAR(3),
    Sobrenome VARCHAR(20),
    CPF CHAR(11) NOT NULL,
    Address VARCHAR(30),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF)
);

-- Criar tabela produto --
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(10) NOT NULL,
    classification_kids BOOL DEFAULT FALSE,
    category ENUM('eletronico', 'vestimenta', 'briquedos', 'alimentos'),
    avaliação FLOAT DEFAULT 0,
    size VARCHAR(10)
);

-- Criar tabela pedido --
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    orderstatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(200),
    sendvalue FLOAT DEFAULT 10,
    paymentcash BOOL DEFAULT FALSE,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES cliente(idCliente)
);

-- Criar tabela estoque --
CREATE TABLE prodstorage (
    idprostorages INT AUTO_INCREMENT PRIMARY KEY,
    storagelocation VARCHAR(255),
    quantity INT DEFAULT 0
);

-- Criar tabela fornecedor --
CREATE TABLE supplier (
    idsupplier INT AUTO_INCREMENT PRIMARY KEY,
    socialname VARCHAR(255) NOT NULL,
    CNPJ CHAR(14) NOT NULL,
    Contact VARCHAR(20) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Criar tabela vendedor --
CREATE TABLE seller (
    idseller INT AUTO_INCREMENT PRIMARY KEY,
    socialname VARCHAR(255) NOT NULL,
    abstname VARCHAR(255),
    CNPJ CHAR(14) NOT NULL,
    CPF CHAR(11) NOT NULL,
    location VARCHAR(255),
    Contact VARCHAR(20) NOT NULL,
    CONSTRAINT unique_CPF_supplier UNIQUE (CPF),
    CONSTRAINT unique_CNPJ_supplier UNIQUE (CNPJ)
);
