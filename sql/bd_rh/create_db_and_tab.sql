-- Criando o banco de dados chamado "recursos_humanos"
CREATE DATABASE recursos_humanos;

-- Definindo o schema chamado "recursos_humanos"
CREATE SCHEMA recursos_humanos;

-- Alterando o schema ativo para "recursos_humanos"
SET SCHEMA 'recursos_humanos';

-- Criando a tabela "tb_funcionarios" que armazenará as informações dos funcionários
CREATE TABLE tb_funcionarios(
    id SERIAL PRIMARY KEY,             -- Identificador único e chave primária da tabela
    nome VARCHAR(20) NOT NULL,         -- Nome do funcionário, campo obrigatório
    sobrenome VARCHAR(20) NOT NULL,    -- Sobrenome do funcionário, campo obrigatório
    data_nascimento DATE NOT NULL,     -- Data de nascimento do funcionário, campo obrigatório
    data_admissao TIMESTAMP NOT NULL,  -- Data de admissão do funcionário, campo obrigatório
    data_desligamento TIMESTAMP,       -- Data de desligamento do funcionário, pode ser nulo
    sexo CHAR(1),                      -- Sexo do funcionário, opcional, definido por um caractere
    departamento_id INTEGER NOT NULL,  -- Chave estrangeira que referencia o departamento, campo obrigatório
    cargo_id INTEGER NOT NULL,         -- Chave estrangeira que referencia o cargo, campo obrigatório
    filial_id INTEGER NOT NULL         -- Chave estrangeira que referencia a filial, campo obrigatório
);

-- Criando a tabela "tb_filial" que armazenará as informações das filiais
CREATE TABLE tb_filial(
    id SERIAL PRIMARY KEY,            -- Identificador único e chave primária da tabela
    rua VARCHAR(100) NOT NULL,        -- Rua da filial, campo obrigatório
    cidade VARCHAR(100) NOT NULL,     -- Cidade da filial, campo obrigatório
    estado VARCHAR(100) NOT NULL,     -- Estado da filial, campo obrigatório
    pais VARCHAR(100) NOT NULL        -- País da filial, campo obrigatório
);

-- Criando a tabela "tb_departamento" que armazenará as informações dos departamentos
CREATE TABLE tb_departamento(
    id SERIAL PRIMARY KEY,            -- Identificador único e chave primária da tabela
    nome VARCHAR(100) UNIQUE NOT NULL -- Nome do departamento, campo obrigatório e único
);

-- Criando a tabela "tb_cargo" que armazenará as informações dos cargos
CREATE TABLE tb_cargo(
    id SERIAL PRIMARY KEY,            -- Identificador único e chave primária da tabela
    nome VARCHAR(100) UNIQUE NOT NULL,-- Nome do cargo, campo obrigatório e único
    salario NUMERIC(10, 2)            -- Salário associado ao cargo, valor numérico com 2 casas decimais
);

-- Criando a tabela "tb_ponto_eletronico" que armazenará os registros de ponto dos funcionários
CREATE TABLE tb_ponto_eletronico(
    id SERIAL PRIMARY KEY,                    -- Identificador único e chave primária da tabela
    data_hora_entrada TIMESTAMP NOT NULL,     -- Data e hora de entrada do funcionário, campo obrigatório
    data_hora_saida TIMESTAMP,                -- Data e hora de saída do funcionário, pode ser nulo
    falta BOOLEAN,                            -- Indicador se houve falta, valor booleano
    justificativa BOOLEAN,                    -- Indicador se a falta foi justificada, valor booleano
    descricao_justificativa TEXT,             -- Descrição da justificativa da falta, texto opcional
    funcionario_id INTEGER NOT NULL           -- Chave estrangeira que referencia o funcionário, campo obrigatório
);

-- Criando os relacionamentos entre as tabelas

-- Relaciona "departamento_id" na tabela "tb_funcionarios" com "id" na tabela "tb_departamento"
ALTER TABLE tb_funcionarios
    ADD CONSTRAINT fk_departamento_id
    FOREIGN KEY(departamento_id) REFERENCES tb_departamento(id);

-- Relaciona "cargo_id" na tabela "tb_funcionarios" com "id" na tabela "tb_cargo"
ALTER TABLE tb_funcionarios 
    ADD CONSTRAINT fk_cargo_id
    FOREIGN KEY(cargo_id) REFERENCES tb_cargo(id);

-- Relaciona "filial_id" na tabela "tb_funcionarios" com "id" na tabela "tb_filial"
ALTER TABLE tb_funcionarios
    ADD CONSTRAINT fk_filial_id
    FOREIGN KEY(filial_id) REFERENCES tb_filial(id);

-- Relaciona "funcionario_id" na tabela "tb_ponto_eletronico" com "id" na tabela "tb_funcionarios"
ALTER TABLE tb_ponto_eletronico 
    ADD CONSTRAINT fk_funcionario_id 
    FOREIGN KEY(funcionario_id) REFERENCES tb_funcionarios(id);
