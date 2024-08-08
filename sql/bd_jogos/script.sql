-- Banco de dados:

CREATE DATABASE gerenciamento_de_jogos;

-- Tabelas das entidades:

CREATE TABLE jogador(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone_res VARCHAR(20),
    telefone_cel VARCHAR(20),
    data_nascimento DATE,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE historico(
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL
);

CREATE TABLE partida(
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    duracao REAL,
);

CREATE TABLE ranking(
    id SERIAL PRIMARY KEY
);

CREATE TABLE jogo(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) UNIQUE NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE eletronico(
    dispositivo VARCHAR(50),
    jogo_id INTEGER
);

CREATE TABLE atividade_ar_livre(
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    jogo_id INTEGER
);

CREATE TABLE conquista(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT
);

CREATE TABLE recompensa(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabelas associativas:

CREATE TABLE partida_jogador(
    partida_id INTEGER,
    jogador_id INTEGER,
    pontuacao_alcancada REAL NOT NULL,
    PRIMARY KEY(partida_id, jogador_id)
);

CREATE TABLE jogador_ranking(
    jogador_id INTEGER,
    ranking_id INTEGER,
    posicao INTEGER NOT NULL,
    PRIMARY KEY(jogador_id, ranking_id)
);

CREATE TABLE partida_historico(
    partida_id INTEGER,
    historico_id INTEGER,
    pontuacao_alcancada REAL NOT NULL
);

CREATE TABLE historico_conquista();

CREATE TABLE ranking_conquista();

CREATE TABLE conquista_recompensa()