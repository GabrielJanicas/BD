CREATE TABLE Rent_Cliente(
	Num_Carta int NOT NULL,
	Nome varchar(128) NOT NULL,
	NIF int NOT NULL,
	PRIMARY KEY (NIF)
)

CREATE TABLE Rent_Balcao(
	Nome varchar(128) NOT NULL,
	Endereco varchar (512) NOT NULL,
	Numero int NOT NULL,
	PRIMARY KEY (Numero)
)

CREATE TABLE Rent_Tipo_Veiculo(
	Arcondicionado bit NOT NULL,
	Designacao varchar(128) NOT NULL,
	Codigo int NOT NULL
	PRIMARY KEY (Codigo)
)

CREATE TABLE Rent_Veiculo(
	Matricula varchar(50) NOT NULL,
	Marca varchar(128) NOT NULL,
	Ano int NOT NULL,
	[TipoVeiculo_Codigo] int NOT NULL REFERENCES Rent_Tipo_Veiculo(Codigo)
	PRIMARY KEY (Matricula)
)

CREATE TABLE Rent_Aluguer(
	Numero int NOT NULL,
	Duracao int NOT NULL,
	[Data] int NOT NULL,
	[Cliente_NIF] int NOT NULL REFERENCES Rent_Cliente(NIF),
	[Balcao_Numero] int NOT NULL REFERENCES Rent_Balcao(Numero),
	[Veiculo_Matricula] varchar(50) NOT NULL REFERENCES Rent_Veiculo(Matricula),
)

CREATE TABLE Rent_Ligeiro(
	ID int NOT NULL,
	Num_Lugares int NOT NULL,
	Portas int NOT NULL,
	Combustivel varchar NOT NULL,
	[TipoVeiculo_Codigo] int NOT NULL REFERENCES Rent_Tipo_Veiculo(Codigo)
	PRIMARY KEY (ID)
)

CREATE TABLE Rent_Pesado(
	ID int NOT NULL,
	Peso int NOT NULL,
	Passageiros int NOT NULL,
	[TipoVeiculo_Codigo] int NOT NULL REFERENCES Rent_Tipo_Veiculo(Codigo)
	PRIMARY KEY (ID)
)

CREATE TABLE Rent_Similaridade(
	[Similaridade_Codigo1] int NOT NULL REFERENCES Rent_Tipo_Veiculo(Codigo),
	[Similaridade_Codigo2] int NOT NULL REFERENCES Rent_Tipo_Veiculo(Codigo),
	PRIMARY KEY (Similaridade_Codigo1,Similaridade_Codigo2)
)
