CREATE TABLE ATL_Classes (
	Class_id INT PRIMARY KEY,
	Class_name VARCHAR(50) NOT NULL,
	Class_description TEXT
	PRIMARY KEY (Class_id)
);

CREATE TABLE ATL_Turma (
	Turma_id INT PRIMARY KEY,
	Class_id INT,
	FOREIGN KEY (Class_id) REFERENCES ATL_Classes(Class_id),
	Turma_designacao VARCHAR(50) NOT NULL,
	FOREIGN KEY (Professor_id) REFERENCES ATL_Professore(Professor_id),
	Numero_alunos_max INT NOT NULL,
	PRIMARY KEY (turma_id)
);

CREATE TABLE ATL_Professore (
	Professor_id INT PRIMARY KEY,
	Professor_nome VARCHAR(50) NOT NULL,
	Professor_CC INT NOT NULL,
	Professor_endereco VARCHAR(100) NOT NULL,
	Professor_data_nascimento DATE NOT NULL,
	Professor_telefone INT NOT NULL,
	Professor_email VARCHAR(50) NOT NULL,
	PRIMARY KEY (Professor_id)
);

CREATE TABLE ATL_Aluno (
	Aluno_nome VARCHAR(50) NOT NULL,
	Aluno_CC INT PRIMARY KEY,
	Aluno_endereco VARCHAR(100) NOT NULL,
	Aluno_data_nascimento DATE NOT NULL,
	PRIMARY KEY (Aluno_CC)
);

CREATE TABLE ATL_Encarregado_Educacao (
	Encarregado_nome VARCHAR(50) NOT NULL,
	Encarregado_CC INT PRIMARY KEY,
	Encarregado_endereco VARCHAR(100) NOT NULL,
	Encarregado_data_nascimento DATE NOT NULL,
	Encarregado_telefone INT NOT NULL,
	Encarregado_email VARCHAR(50) NOT NULL,
	Encarregado_relacao VARCHAR(50) NOT NULL,
	PRIMARY KEY (Encarregado_CC)
);

CREATE TABLE ATL_Atividade (
	Atividade_id INT PRIMARY KEY,
	Atividade_designacao VARCHAR(50) NOT NULL,
	Atividade_preco INT NOT NULL,
	PRIMARY KEY (Atividade_id)
);

CREATE TABLE ATL_Lista_Autorizacoes(
	Pessoa_nome VARCHAR(50) NOT NULL,
	Pessoa_CC INT PRIMARY KEY,
	Pessoa_endereco VARCHAR(100) NOT NULL,
	Pessoa_data_nascimento DATE NOT NULL,
	Pessoa_telefone INT NOT NULL,
	Pessoa_email VARCHAR(50) NOT NULL,
	Pessoa_relacao VARCHAR(50) NOT NULL,
	FOREIGN KEY (Nome_Aluno) REFERENCES ATL_Aluno(Aluno_nome),
	PRIMARY KEY (Pessoa_CC)
);