-- Criando o banco de dados
CREATE DATABASE recursos_humanos;

-- Definindo o schema

CREATE SCHEMA recursos_humanos;

SET SCHEMA 'recursos_humanos';

-- Criando as tabelas
CREATE TABLE tb_funcionarios(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sobrenome VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_admissao TIMESTAMP NOT NULL,
    data_desligamento TIMESTAMP,
    sexo CHAR(1),
    departamento_id INTEGER NOT NULL,
    cargo_id INTEGER NOT NULL,
    filial_id INTEGER NOT NULL
);

CREATE TABLE tb_filial(
    id SERIAL PRIMARY KEY,
    rua VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

CREATE TABLE tb_departamento(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE tb_cargo(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    salario NUMERIC(10, 2)
);

CREATE TABLE tb_ponto_eletronico(
    id SERIAL PRIMARY KEY,
    data_hora_entrada TIMESTAMP NOT NULL,
    data_hora_saida TIMESTAMP,
    falta BOOLEAN,
    justificativa BOOLEAN,
    descricao_justificativa TEXT,
    funcionario_id INTEGER NOT NULL
);


-- Criação dos relacionamentos 1..n

ALTER TABLE tb_funcionarios
    ADD CONSTRAINT fk_departamento_id
    FOREIGN KEY(departamento_id) REFERENCES tb_departamento(id);

ALTER TABLE tb_funcionarios 
    ADD CONSTRAINT fk_cargo_id
    FOREIGN KEY(cargo_id) REFERENCES tb_cargo(id);

ALTER TABLE tb_filial
    ADD CONSTRAINT fk_filial_id
    FOREIGN KEY(filial_id) REFERENCES tb_filial(id);

ALTER TABEL tb_ponto_eletronico 
    ADD CONSTRAINT fk_funcionario_id REFERENCES tb_funcionarios(id); 