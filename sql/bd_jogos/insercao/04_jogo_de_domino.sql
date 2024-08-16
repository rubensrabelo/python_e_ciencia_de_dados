-- jogo de Dominó

SET SCHEMA 'bd_jogos';

--------------------------- um ou-mais--------------------------------------------------------
-- Sistema: cadastro do jogador, do histórico e criação do ranking 

-- 1. Criação de dois jogadores p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Yago Lemos', 'yago.lemos@example.com', NULL, '92837-8703', '1998-03-12', 'senhaYago123'), -- id 05
    ('Cristiano Felix', 'Cristiano.felix@example.com', NULL, '92510-5712', '1995-10-15', 'senhaFelix456'); -- id 06
    

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
<<<<<<< HEAD:sql/bd_jogos/insercao/04_jogo_de_domino_analisar.sql
    ('2024-08-10 14:30:00', 4), -- id 05
    ('2024-08-11 15:00:00', 5); -- id 06
=======
    ('2024-08-10 14:30:00', 5),
    ('2024-08-11 15:00:00', 6);
>>>>>>> working:sql/bd_jogos/insercao/04_jogo_de_domino.sql
  
------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Domino', 'Tabuleiro', 'Um jogo de tabuleiro que permite jogar contra um ou mais jogadores.'); -- id 04

-- 4. Não precisa da tabela 'eletronico', mas é necessário inserir na tabela 'atividade_ar_livre'

-- 5. Criação da Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
<<<<<<< HEAD:sql/bd_jogos/insercao/04_jogo_de_domino_analisar.sql
    (1, 1); -- id 04
=======
    (4, 4); -- id 04
>>>>>>> working:sql/bd_jogos/insercao/04_jogo_de_domino.sql

------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
<<<<<<< HEAD:sql/bd_jogos/insercao/04_jogo_de_domino_analisar.sql
    ('Mestre do Domino', 'O jogador ganhou do(s) seu(s) oponente(s) ao ter o maior número de vitórias em duas partidas.'), -- id 05
    ('Padawan do Domino', 'O jogador com o segundo maior numero de vitorias, após finalizar as três partidas'); -- apagar
-- 6. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Jogo de dominó', 'O jogador ganhará do jogo leva um jogo de dominó'), -- id 05
	('Livro de dominó', 'O jogador ganhará um livro de estrategias de dominó'); -- apagar
=======
    ('Mestre do Domino', 'O jogador ganhou do(s) seu(s) oponente(s) ao ter o maior número de vitórias em duas partidas.'); -- id 05
>>>>>>> working:sql/bd_jogos/insercao/04_jogo_de_domino.sql

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Jogo de dominó', 'O jogador ganhará do jogo leva um jogo de dominó'); -- id 05

-- 8. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
        (5, 5);  -- Campeão recompensado com um jogo de dominó 

-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (5, 4);

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-10 14:30:00', '00:30:00', 4), -- id 10
       ('2024-08-11 16:00:00', '01:00:00', 4), -- id 11
       ('2024-08-12 18:20:00', '00:20:00', 4); -- id 12

-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (10, 5, 0.0),  -- Yago perdeu a partida 1 (0)
       (10, 6, 1.0),  -- Cristiano ganhou a partida 1 (1)
	
       (11, 5, 1.0),  -- Yago ganhou a partida 2 (0 + 1)
       (11, 6, 0.0),  -- Cristiano perdeu a partida 2 (1 + 0)
	
       (12, 5, 0.0),  -- Yago perdeu a partida 2 (0 + 1 + 0)
       (12, 6, 1.0);  -- Cristiano ganhou a partida 2 (1 + 0 + 1)

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (10, 5, 0),  -- Partida 1 com histórico do Yago (derrota)
       (10, 6, 1),  -- Partida 1 com histórico do Cristiano (vitória)
	
	   (11, 5, 1),  -- Partida 2 com histórico do Yago (vitória)   
       (11, 6, 0),  -- Partida 2 com histórico do Cristiano (derrota)
	
       (12, 5, 1),  -- Partida 3 com histórico do Yago (derrota)
       (12, 6, 1);  -- Partida 3 com histórico do Cristiano (vitória)
	

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 12. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (6, 4, 1), -- Cristiano finalizou em primeiro com 2 pontos
    (5, 4, 2); -- Yago finalizou em segundo com 1 ponto


-- 13. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (6, 5);