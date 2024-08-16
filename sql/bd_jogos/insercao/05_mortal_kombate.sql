-- jogo Mortal Kombate

SET SCHEMA 'bd_jogos';

--------------------------- um ou-mais--------------------------------------------------------
-- Sistema: utilizar os jogadores do Dominó e UNO 

-- 1. Utilização dos jogadores anteriores(id: 03, 05 e 06) e criação de outro jogador p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Emanoel Silva', 'emanoel.silva@example.com', NULL, '92135-8633', '2008-09-27', 'senhaEma123'); -- id 07
   

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-08-10 17:00:00', 7);
    
  
------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Mortal Kombate', 'Eletrônico', 'Um jogo eletrônico de luta que permite jogar contra um jogador.'); -- id 05

-- 4. tabela 'eletronico'
INSERT INTO eletronico (dispositivo, jogo_id) VALUES
    ('Console', 5);

-- 5. Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (5, 5); -- id 05

------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Konquistador', 'O jogador ganhou do seu oponente ao ter o maior número de vitórias em três partidas.'); -- id 06

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Poster oficial MK', 'O jogador ganhará um poster oficial de Mortal Kombat'); -- id 06
	

-- 8. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
        (6, 6);  -- Campeão recompensado com um poster oficial 
     
-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (6, 5);
	

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-16 13:30:00', '00:10:50', 5), -- id 13
       ('2024-08-16 14:00:00', '00:15:00', 5), -- id 14
       ('2024-08-16 14:30:00', '00:08:00', 5); -- id 15

-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (13, 5, 1.0),  -- Yago ganhou a partida 1 (1)
       (13, 6, 0.0),  -- Cristiano perdeu a partida 1 (0)
	   (13, 7, 1.0),  -- Emanoel ganhou a partida 1 (1) 
	   (13, 3, 0.0),  -- Ana Costa perdeu a partida 1 (0)
	
       (14, 5, 1.0),  -- Yago ganhou a partida 2 (1 + 1)
       (14, 6, 0.0),  -- Cristiano perdeu a partida 2 (0 + 0)
	   (14, 7, 1.0),  -- Emanoel ganhou a partida 2 (1 + 1) 
	   (14, 3, 0.0),  -- Ana Costa perdeu a partida 2 (0 + 0)
	
       (15, 5, 0.0),  -- Yago perdeu a partida 3 (1 + 1 + 0)
       (15, 6, 1.0),  -- Cristiano ganhou a partida 3 (0 + 0 + 1)
       (15, 7, 1.0),  -- Emanoel ganhou a partida 3 (1 + 1 + 1) 
	   (15, 3, 0.0);  -- Ana Costa perdeu a partida 3 (0 + 0 + 0)

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (13, 5, 1),  -- Partida 1 com histórico do Yago (vitória)
       (13, 6, 0),  -- Partida 1 com histórico do Cristiano (derrota)
	   (13, 7, 1),  -- Partida 1 com histórico do Emanoel (vitória) 
	   (13, 3, 0),  -- Partida 1 com histórico da Ana Costa (derrota)	   4
	
	   (14, 5, 1),  -- Partida 2 com histórico do Yago (derrota)   
       (14, 6, 0),  -- Partida 2 com histórico do Cristiano (vitória)
	   (14, 7, 0),  -- Partida 2 com histórico do Emanoel (vitória)
	   (14, 3, 0),  -- Partida 2 com histórico do Ana Costa (derrota)
	
       (15, 5, 1),  -- Partida 3 com histórico do Yago (derrota)
       (15, 6, 1),  -- Partida 3 com histórico do Cristiano (vitória)
       (15, 7, 0),  -- Partida 3 com histórico do Emanoel (vitória)
	   (15, 3, 0);  -- Partida 3 com histórico da Ana Costa (derrota)
	

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
	 (7, 5, 1), -- Emanoel finalizou em primeiro lugar com 3 pontos
	 (5, 5, 2), -- Yago finalizou em segundo lugar com 2 pontos
	 (6, 5, 3), -- Cristiano finalizou em terceiro lugar com 1 pontos	 
     (3, 5, 4); -- Ana Costa finalizou em quarto lugar com 0 pontos
-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (7, 6);