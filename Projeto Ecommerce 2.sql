-- criação do banco de dados para o cenario de ecommerce--
create database ecommerce2;
use ecommerce;
-- criar tabela cliente
create table clients(
			idclient int auto_increment primary key,
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
            orderstatus enum ('Cancelado','Confirmardo','Em processamento') default 'em processamento',
            orderDescription varchar (200),
            sendvalue float default 10,
            paymentcash bool default false,
            constraint fk_orders_client foreign key (idOrderClient) references clients (idclient)  
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
-- produtos por vendedor

create table productseller (
			idPseller int,
            idProduct int,
            Quantity int default 1,
            primary key (idPseller, idProduct),
            constraint fk_product_seller foreign key (idPseller) references seller (idseller),
            constraint fk_product_product foreign key (idProduct) references product (idProduct)
);
-- Produto por pedido

create table productorder (
			idpoproduct int,
            idporder int,
            poquantity int default 1,
            postatus enum ('disponivel' , 'sem estoque') default 'disponivel',
            primary key (idpoproduct, idporder),
            constraint fk_productorder_seller foreign key (idpoproduct) references product (idProduct),
            constraint fk_productorder_product foreign key (idporder) references orders (idOrder)
);

-- Produto localização

create table storelocation (
			idlproduct int,
            idlstorage int,
			location varchar (255) not null,
            primary key (idlproduct, idlstorage),
            constraint fk_productlocation_seller foreign key (idlproduct) references product (idProduct),
            constraint fk_productlocation_product foreign key (idlstorage) references prodstorage (idprostorages)
);