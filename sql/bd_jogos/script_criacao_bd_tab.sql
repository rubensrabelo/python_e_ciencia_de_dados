-- Banco de dados:

-- CREATE DATABASE gerenciamento_de_jogos;

-- Criando e definindo o esquema

CREATE SCHEMA bd_jogos;

SET SCHEMA 'bd_jogos';


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
    data_hora TIMESTAMP NOT NULL,
    jogador_id INTEGER NOT NULL
);

CREATE TABLE partida(
    id SERIAL PRIMARY KEY,
    data_hora TIMESTAMP NOT NULL,
    duracao INTERVAL,
    jogo_id INTEGER NOT NULL
);

CREATE TABLE ranking(
    id SERIAL PRIMARY KEY,
    jogo_id INTEGER NOT NULL
);

CREATE TABLE jogo(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE eletronico(
    dispositivo VARCHAR(50),
    jogo_id INTEGER NOT NULL
);

CREATE TABLE atividade_ar_livre(
    rua VARCHAR(100) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    jogo_id INTEGER NOT NULL
);

CREATE TABLE conquista(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE recompensa(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);


-- Criando o relacionamento 1..1

ALTER TABLE ranking
    ADD CONSTRAINT fk_ranking_jogo
    FOREIGN KEY(jogo_id) REFERENCES jogo(id);

-- Criando os relacionamento 1..n:
ALTER TABLE historico
    ADD CONSTRAINT fk_jogador_historico
    FOREIGN KEY(jogador_id) REFERENCES jogador(id);

ALTER TABLE eletronico
    ADD CONSTRAINT fk_eletronico_jogo 
    FOREIGN KEY(jogo_id) REFERENCES jogo(id);

ALTER TABLE atividade_ar_livre
    ADD CONSTRAINT fk_atividade_jogo
    FOREIGN KEY(jogo_id) REFERENCES jogo(id);

ALTER TABLE partida
    ADD CONSTRAINT fk_ranking_jogo
    FOREIGN KEY(jogo_id) REFERENCES jogo(id);

-- Tabelas associativas para relacionamentos n..n:

CREATE TABLE partida_jogador(
    partida_id INTEGER NOT NULL,
    jogador_id INTEGER NOT NULL,
    pontuacao_alcancada REAL NOT NULL,
    PRIMARY KEY(partida_id, jogador_id),
    FOREIGN KEY(partida_id) REFERENCES partida(id),
    FOREIGN KEY(jogador_id) REFERENCES jogador(id)
);

CREATE TABLE jogador_ranking(
    jogador_id INTEGER NOT NULL,
    ranking_id INTEGER NOT NULL,
    posicao INTEGER NOT NULL,
    PRIMARY KEY(jogador_id, ranking_id),
    FOREIGN KEY(ranking_id) REFERENCES ranking(id),
    FOREIGN KEY(jogador_id) REFERENCES jogador(id)
);

CREATE TABLE partida_historico(
    partida_id INTEGER NOT NULL,
    historico_id INTEGER NOT NULL,
    pontuacao_alcancada INTEGER NOT NULL,
    PRIMARY KEY(partida_id, historico_id),
    FOREIGN KEY(partida_id) REFERENCES partida(id),
    FOREIGN KEY(historico_id) REFERENCES historico(id)
);

CREATE TABLE historico_conquista(
    historico_id INTEGER NOT NULL,
    conquista_id INTEGER NOT NULL,
    PRIMARY KEY(historico_id, conquista_id),
    FOREIGN KEY(historico_id) REFERENCES historico(id),
    FOREIGN KEY(conquista_id) REFERENCES conquista(id)
);

CREATE TABLE ranking_conquista(
    conquista_id INTEGER NOT NULL,
    ranking_id INTEGER NOT NULL,
    PRIMARY KEY(conquista_id, ranking_id),
    FOREIGN KEY(conquista_id) REFERENCES conquista(id),
    FOREIGN KEY(ranking_id) REFERENCES ranking(id)
);

CREATE TABLE conquista_recompensa(
    conquista_id INTEGER NOT NULL,
    recompensa_id INTEGER NOT NULL,
    PRIMARY KEY(conquista_id, recompensa_id),
    FOREIGN KEY(conquista_id) REFERENCES conquista(id),
    FOREIGN KEY(recompensa_id) REFERENCES recompensa(id)
);