-- jogo de Dominó

SET SCHEMA 'bd_jogos';

--------------------------- um ou-mais--------------------------------------------------------
-- Sistema: cadastro do jogador, do histórico e criação do ranking 

-- 1. Criação de dois jogadores p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Yago Lemos', 'yago.lemos@example.com', NULL, '92837-8703', '1998-03-12', 'senhaYago123'),
    ('Cristiano Felix', 'Cristiano.felix@example.com', NULL, '92510-5712', '1995-10-15', 'senhaFelix456');
    

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-08-10 14:30:00', 4),
    ('2024-08-11 15:00:00', 5);
  
------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Domino', 'Tabuleiro', 'Um jogo de tabuleiro que permite jogar contra um ou mais jogadores.');


-- 4. Criação da Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (1, 1);

------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 5. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Mestre do Domino', 'O jogador ganhou do(s) seu(s) oponente(s) ao ter o maior número de vitórias em duas partidas.'),
    ('Padawan do Domino', 'O jogador com o segundo maior numero de vitorias, após finalizar as três partidas');
-- 6. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Jogo de dominó', 'O jogador ganhará do jogo leva um jogo de dominó'),
	('Livro de dominó', 'O jogador ganhará um livro de estrategias de dominó');

-- 7. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
        (3, 3),  -- Campeão recompensado com um jogo de dominó 
        (4, 4);  -- Segundo lugar leva um livro de dominó
-- 8. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (3, 3),
	(4, 3);

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 9. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-10 14:30:00', '00:30:00', 1),
       ('2024-08-11 16:00:00', '01:00:00', 1),
       ('2024-08-12 18:20:00', '00:20:00', 1);

-- 10. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (7, 4, 0.0),  -- Yago perdeu a partida 1 (0)
       (7, 5, 1.0),  -- Cristiano ganhou a partida 1 (1)
	
       (8, 4, 1.0),  -- Yago ganhou a partida 2 (0 + 1)
       (8, 5, 0.0),  -- Cristiano perdeu a partida 2 (1 + 0)
	
       (9, 4, 0.0),  -- Yago perdeu a partida 2 (0 + 1 + 0)
       (9, 5, 1.0);  -- Cristiano ganhou a partida 2 (1 + 0 + 1)

-- 11. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (7, 1, 0),  -- Partida 1 com histórico do Yago (derrota)
       (7, 2, 1),  -- Partida 1 com histórico do Cristiano (vitória)
	
	   (8, 1, 1),  -- Partida 2 com histórico do Yago (vitória)   
       (8, 2, 0),  -- Partida 2 com histórico do Cristiano (derrota)
	
       (9, 1, 1),  -- Partida 3 com histórico do Yago (derrota)
       (9, 2, 1);  -- Partida 3 com histórico do Cristiano (vitória)
	

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 12. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (5, 1, 1), -- Cristiano finalizou em primeiro com 2 pontos
    (4, 1, 2); -- Yago finalizou em segundo com 1 ponto


-- 13. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (2, 1);