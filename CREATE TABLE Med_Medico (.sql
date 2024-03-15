CREATE TABLE Med_Medico (
	Numero_SNS INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Especialidade VARCHAR(100) NOT NULL
	PRIMARY KEY (Numero_SNS)
)

CREATE TABLE Med_Paciente (
	Numero_	Utente INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Endereco VARCHAR(100) NOT NULL,
	PRIMARY KEY (Numero_Utente)
)

CREATE TABLE Med_Farmaceutico (
	Numero_Registo INT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Telefone INT NOT NULL,
	PRIMARY KEY (Numero_Registo)
)

CREATE TABLE Med_Farmacia (
	Nome VARCHAR(100) NOT NULL,
	NIF INT NOT NULL,
	Morada VARCHAR(100) NOT NULL,
	Telefone INT NOT NULL,
	PRIMARY KEY (NIF)
)
ggg;