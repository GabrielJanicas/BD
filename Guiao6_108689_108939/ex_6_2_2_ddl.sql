CREATE SCHEMA GESTSTOCK;
GO
CREATE DATABASE GESTSTOCK;

CREATE TABLE GESTSTOCK.tipo_fornecedor(
    codigo INT NOT NULL,
    designacao VARCHAR(30) NOT NULL,

    PRIMARY KEY (codigo),
    UNIQUE(codigo),
)


CREATE TABLE GESTSTOCK.fornecedor(
    nif INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    fax INT NOT NULL,
    endereco VARCHAR(30),
    condpag INT NOT NULL,
    tipo INT NOT NULL,

    PRIMARY KEY (nif),
    UNIQUE(nif),
    FOREIGN KEY (tipo) REFERENCES GESTSTOCK.tipo_fornecedor(codigo),
)

CREATE TABLE GESTSTOCK.produto(
    codigo INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    preco INT NOT NULL,
    iva INT NOT NULL,
    unidades INT NOT NULL,

    PRIMARY KEY (codigo),
    UNIQUE(codigo),
)

CREATE TABLE GESTSTOCK.encomenda(
    numero INT NOT NULL,
    data DATE NOT NULL,
    fornecedor INT NOT NULL,

    PRIMARY KEY (numero),
    UNIQUE(numero),
    FOREIGN KEY (fornecedor) REFERENCES GESTSTOCK.fornecedor(nif),
)

CREATE TABLE GESTSTOCK.item(
    numEnc INT NOT NULL,
    codProd INT NOT NULL,
    unidades INT NOT NULL,

    FOREIGN KEY (numEnc) REFERENCES GESTSTOCK.encomenda(numero),
    FOREIGN KEY (codProd) REFERENCES GESTSTOCK.produto(codigo),
)