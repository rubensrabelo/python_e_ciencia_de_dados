-- jogo Basquete

SET SCHEMA 'bd_jogos';

--------------------------- um ou-mais--------------------------------------------------------
-- Sistema: utilizar os jogadores do Dominó e UNO 

-- 1. Criação de dois jogadores p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Michael Jordan', 'michael.jordan@example.com', NULL, '92321-6789', '1963-02-17', 'senhaJordan23'), -- id 10
    ('LeBron James', 'lebron.james@example.com', NULL, '93210-9876', '1984-12-30', 'senhaLeBron6'); -- id 11
   

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-08-11 14:00:00', 10),  -- Michael Jordan
    ('2024-08-11 14:15:00', 11);  -- LeBron James
    
  
------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'



-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Jogo de Basquete', 'Esporte', 'Partida de basquete entre times formados pelos jogadores.'); -- id 07

-- 4. Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (7, 7);

------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 5. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('MVP do Jogo', 'O jogador com maior pontuação durante a partida.'); -- id 08

-- 6. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Troféu de MVP', 'O jogador recebe um troféu de MVP do jogo.'); -- id 08    	

-- 7. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
    (8, 8);  -- MVP do Jogo recebe Troféu de MVP 
     
-- 8. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (8, 7);--conquista para o primeiro lugar
	

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 9. Tabela 'partida'

INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-17 18:00:00', '01:30:00', 7),  -- Partida de basquete id 19
       ('2024-08-18 18:00:00', '01:30:00', 7);  -- Partida de basquete id 20

-- 10. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (19, 10, 30),  -- Michael Jordan marcou 30 pontos na primeira partida
       (19, 11, 28),  -- LeBron James marcou 28 pontos na primeira partida

       (20, 10, 35),  -- Michael Jordan marcou 35 pontos na segunda partida
       (20, 11, 32);  -- LeBron James marcou 32 pontos na segunda partida
     

-- 11. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (19, 1, 30),  -- Primeira partida com histórico de Michael Jordan
       (19, 2, 28),  -- Primeira partida com histórico de LeBron James
	
       (20, 1, 35),  -- Segunda partida com histórico de Michael Jordan
       (20, 2, 32);  -- Segunda partida com histórico de LeBron James

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 12. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (10, 7, 1), -- Michael Jordan finalizou em primeiro lugar com 65 pontos no total
    (11, 7, 2); -- LeBron James finalizou em segundo lugar com 60 pontos no total

-- 13. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (10, 7);  -- Michael Jordan foi MVP do Jogo