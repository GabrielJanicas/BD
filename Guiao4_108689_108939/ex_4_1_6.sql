CREATE TABLE ATL_Classes (
    Class_id INT NOT NULL,
    Class_name VARCHAR(50) NOT NULL,
    Class_description TEXT
    PRIMARY KEY (Class_id)
);

CREATE TABLE ATL_Professor(
    Professor_id INT NOT NULL,
    Professor_nome VARCHAR(50) NOT NULL,
    Professor_CC INT NOT NULL,
    Professor_endereco VARCHAR(100) NOT NULL,
    Professor_data_nascimento DATE NOT NULL,
    Professor_telefone INT NOT NULL,
    Professor_email VARCHAR(50) NOT NULL,
    PRIMARY KEY (Professor_id)
);

CREATE TABLE ATL_Turma (
    Turma_id INT NOT NULL,
    Class_id INT,
    FOREIGN KEY (Class_id) REFERENCES ATL_Classes(Class_id),
    Turma_designacao VARCHAR(50) NOT NULL,
	Professor_id INT,
    FOREIGN KEY (Professor_id) REFERENCES ATL_Professor(Professor_id),
    Numero_alunos_max INT NOT NULL,
    PRIMARY KEY (turma_id)
);

CREATE TABLE ATL_Aluno (
    Aluno_nome VARCHAR(50) NOT NULL,
    Aluno_CC INT NOT NULL,
    Aluno_endereco VARCHAR(100) NOT NULL,
    Aluno_data_nascimento DATE NOT NULL,
    PRIMARY KEY (Aluno_CC)
);

CREATE TABLE ATL_Encarregado_Educacao (
    Encarregado_nome VARCHAR(50) NOT NULL,
    Encarregado_CC INT NOT NULL,
    Encarregado_endereco VARCHAR(100) NOT NULL,
    Encarregado_data_nascimento DATE NOT NULL,
    Encarregado_telefone INT NOT NULL,
    Encarregado_email VARCHAR(50) NOT NULL,
    Encarregado_relacao VARCHAR(50) NOT NULL,
	Aluno_CC INT NOT NULL,
    FOREIGN KEY (Aluno_CC) REFERENCES ATL_Aluno(Aluno_CC),
    PRIMARY KEY (Encarregado_CC)
);

CREATE TABLE ATL_Atividade (
    Atividade_id INT NOT NULL,
    Atividade_designacao VARCHAR(50) NOT NULL,
    Atividade_preco INT NOT NULL,
    PRIMARY KEY (Atividade_id)
);

CREATE TABLE ATL_Atividade_Turma (
    Atividade_id INT,
    FOREIGN KEY (Atividade_id) REFERENCES ATL_Atividade(Atividade_id),
    Turma_id INT,
    FOREIGN KEY (Turma_id) REFERENCES ATL_Turma(Turma_id),
    PRIMARY KEY (Atividade_id, Turma_id)
);

CREATE TABLE ATL_Lista_Autorizacoes(
    Pessoa_nome VARCHAR(50) NOT NULL,
    Pessoa_CC INT NOT NULL,
    Pessoa_endereco VARCHAR(100) NOT NULL,
    Pessoa_data_nascimento DATE NOT NULL,
    Pessoa_telefone INT NOT NULL,
    Pessoa_email VARCHAR(50) NOT NULL,
    Pessoa_relacao VARCHAR(50) NOT NULL,
	Aluno_CC INT NOT NULL,
    FOREIGN KEY (Aluno_CC) REFERENCES ATL_Aluno(Aluno_CC),
    PRIMARY KEY (Pessoa_CC)
);