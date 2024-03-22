CREATE TABLE Med_Medico (
    Numero_SNS INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100) NOT NULL,
    PRIMARY KEY (Numero_SNS)
);

CREATE TABLE Med_Paciente (
    Numero_Utente INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR (100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    PRIMARY KEY (Numero_Utente)
);

CREATE TABLE Med_Farmaceutica (
    Numero_Registo INT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Telefone INT NOT NULL,
    PRIMARY KEY (Numero_Registo)
);

CREATE TABLE Med_Farmacia (
    Nome VARCHAR(100) NOT NULL,
    NIF INT NOT NULL,
    Morada VARCHAR(100) NOT NULL,
    Telefone INT NOT NULL,
    PRIMARY KEY (NIF)
);

CREATE TABLE Med_Prescricao(
    Numero_Unico_Prescricao INT NOT NULL,
    [Data] DATE NOT NULL,
    Numero_Utente INT NOT NULL,
    Numero_Medico INT NOT NULL,
    NIF_Farmacia INT NOT NULL,
    PRIMARY KEY (Numero_Unico_Prescricao),
    FOREIGN KEY (Numero_Utente) REFERENCES Med_Paciente(Numero_Utente),
    FOREIGN KEY (Numero_Medico) REFERENCES Med_Medico(Numero_SNS),
    FOREIGN KEY (NIF_Farm�cia) REFERENCES Med_Farmacia(NIF)
);

CREATE TABLE Med_Farmaco (
    Nome_Farmaceutica VARCHAR(100) NOT NULL,
    Nome_Comercial VARCHAR(100) NOT NULL,
    Formula VARCHAR (100) NOT NULL,
    Numero_Farmaceutica INT NOT NULL,
    FOREIGN KEY (Numero_Farmaceutica) REFERENCES Med_Farmaceutica(Numero_Registo),
    PRIMARY KEY (Numero_Farmaceutica,Nome_Farmaceutica)
);