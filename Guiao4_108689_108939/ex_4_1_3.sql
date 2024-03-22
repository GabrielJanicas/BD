CREATE TABLE Stocks_Taxa_Iva(
	Codigo int NOT NULL,
	Nome varchar(100) NOT NULL,
	PRIMARY KEY (Codigo)
)

CREATE TABLE Stocks_Produtos(
	Codigo int NOT NULL,
	Preco decimal(10,2) NOT NULL,
	Nome varchar(100) NOT NULL,
	Unidades int NOT NULL,
	[Taxa_Iva] int NOT NULL REFERENCES Stocks_Taxa_Iva(Codigo),
	PRIMARY KEY (Codigo)
)

CREATE TABLE Stocks_Condicoes_Pagamento(
	Codigo int NOT NULL,
	Designacao varchar(100) NOT NULL,
	PRIMARY KEY (Codigo)
)

CREATE TABLE Stocks_Tipo_Fornecedor(
	Codigo int NOT NULL,
	Designacao varchar(100) NOT NULL,
	PRIMARY KEY (Codigo)
)

CREATE TABLE Stocks_Fornecedor(
	NIF int NOT NULL,
	Nome varchar(100) NOT NULL,
	Morada varchar(100) NOT NULL,
	Email varchar(100) NOT NULL,
	Codigo_Interno_Fornecedor int NOT NULL REFERENCES Stocks_Tipo_Fornecedor(codigo),
	Codigo_Interno_Condicoes int NOT NULL REFERENCES Stocks_Condicoes_Pagamento(codigo)
	PRIMARY KEY (NIF)
)

CREATE TABLE Stocks_Encomendas(
	Numero int NOT NULL,
	Data date NOT NULL,
	[Fornecedor_Codigo] int NOT NULL REFERENCES Stocks_Fornecedor(NIF),
	PRIMARY KEY (Numero)
)

CREATE TABLE Stocks_Items(
	[Encomenda_Numero] int NOT NULL REFERENCES Stocks_Encomendas(Numero),
	[Produto_Codigo] int NOT NULL REFERENCES Stocks_Produtos(Codigo),
	Quantidade int NOT NULL,
	PRIMARY KEY (Quantidade)
)

