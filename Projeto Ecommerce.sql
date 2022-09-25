-- criação do banco de dados para o cenario de ecommerce--
create database ecommerce;
use ecommerce;
-- criar tabela cliente
create table cliente (
			idCliente int auto_increment primary key,
            Pname varchar (10),
            NameioInicial varchar (3),
            Sobrenome varchar (20),
            CPF char (11) not null,
            Address varchar (30),
			constraint unique_cpf_cliente unique (CPF)
);

-- criar tabela produto
create table product (
			idProduct int auto_increment primary key,
            Pname varchar (10) not null,
            classification_kids bool default false,
            category enum ('eletronico', 'vestimenta', 'briquedos', 'alimentos'),
            avaliação float default 0,
            size varchar (10)
			
);

-- criar tabela pedido
create table orders (
			idOrder int auto_increment primary key,
            idOrderClient int,
            orderstatus enum ('Cancelado', 'Confirmardo' , 'Em processamento') default 'em processamento',
            orderDescription varchar (200),
            sendvalue float default 10,
            paymentcash bool default false,
            constraint fk_orders_client foreign key (idOrderClient) references clients (idCliente)  
);

-- criar tabela estoque
create table prodstorage (
			idprostorages int auto_increment primary key,
			storagelocation varchar (255),
			quantity int default 0
            
);

-- criar tabela fornecedor
create table supplier (
			idsupplier int auto_increment primary key,
            socialname varchar (255) not null,
            CNPJ char (11) not null,
            Contact varchar (10) not null,
            constraint unique_supplier unique  (CNPJ)  
);

-- criar tabela vendedor
create table seller (
			idseller int auto_increment primary key,
            socialname varchar (255) not null,
            abstname varchar (255),
            CNPJ char (11) not null,
			CPF char (11) not null,
            location varchar (255),
            Contact varchar (10) not null,
            constraint unique_CPF_supplier unique  (CPF),
			constraint unique_CNPJ_supplier unique  (CNPJ)  
);