CREATE TABLE Artigo(
	Titulo VARCHAR(15) NOT NULL,
	ID INT NOT NULL,
	PRIMARY KEY(ID),
)

CREATE TABLE Pessoa(
	Nome VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	PRIMARY KEY(Email, Nome),
)

CREATE TABLE Instituicao(
	Nome VARCHAR(30) NOT NULL,
	Endereco VARCHAR(30) NOT NULL,
	PRIMARY KEY (Endereco),
)

CREATE TABLE Autor(
	Nome VARCHAR(30) NOT NULL,
	Instituicao VARCHAR(30) NOT NULL,
	Artigo_ID INT NOT NULL,
	Email VARCHAR(30) NOT NULL,
	PRIMARY KEY(Email),
	FOREIGN KEY(Email) REFERENCES Instituicao(Endereco), 
	FOREIGN KEY(Artigo_ID) REFERENCES Artigo(ID),

)

CREATE TABLE Participantes (
	Data DATE NOT NULL,
	Morada VARCHAR(30) NOT NULL,
	Nome VARCHAR(30) NOT NULL,
	Instituicao VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	PRIMARY KEY (Email, Nome),
	FOREIGN KEY (Email, Nome) REFERENCES Pessoa(Email, Nome),
)

CREATE TABLE Estudante(
	Nome VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Comprovativo VARCHAR(30) NOT NULL,
	PRIMARY KEY (Comprovativo),
	FOREIGN KEY (Email, Nome) REFERENCES Participantes(Email, Nome),
	FOREIGN KEY(Comprovativo) REFERENCES Instituicao(Endereco),
)

CREATE TABLE N_Estudante(
	Nome VARCHAR(30) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	Transcricao VARCHAR(30) NOT NULL,
	PRIMARY KEY (Transcricao),
	FOREIGN KEY (Email, Nome) REFERENCES Participantes(Email, Nome),
)