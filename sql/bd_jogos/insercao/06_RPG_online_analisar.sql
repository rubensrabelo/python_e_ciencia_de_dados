-- jogo Fantasia Online RPG

SET SCHEMA 'bd_jogos';

--------------------------- um ou-mais--------------------------------------------------------
-- Sistema: cadastrar jogadodores e históricos 

-- 1. Criação de dois jogadores p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Lionel Ronaldo', 'Lionel.ronaldo@example.com', NULL, '92432-4456', '2001-02-17', 'senhalionel123'); -- id 08
    ('Geralt de Rivia', 'Geralt.rivia@example.com', NULL, '94612-2258', '1999-10-21', 'senhaRivia123'); -- id 09
   

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-08-11 13:00:00', 8);--Lionel
    ('2024-08-11 13:15:00', 9);--Geralt
    
  
------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Fantasia Online RPG', 'Eletrônico', 'Um RPG online de fantasia onde os jogadores completam missões e batalham monstros em um vasto mundo virtual.'); -- id 06


-- 4. tabela 'eletronico'
INSERT INTO eletronico (dispositivo, jogo_id) VALUES
    ('PC', 6),  -- Fantasia Online RPG jogado em PC 
    ('Console', 6);  -- Também disponível em consoles

-- 5. Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (6, 6);

------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Herói da Cidade', 'O jogador com maior pontuação após concluir três missões com sucesso.'); -- id 07

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Espada Épica', 'O jogador receberá uma espada épica com alto poder de ataque.'); -- id 07
    	

-- 8. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
    (7, 7),  -- Herói da Cidade recebe a Espada Épica 
     
-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (7, 6);
	

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'

INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-16 15:30:00', '01:45:00', 6),  -- id 14 
       ('2024-08-16 18:00:00', '02:00:00', 6),  -- id 15
       ('2024-08-16 20:30:00', '02:30:00', 6);  -- id 16


-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (14, 8, 200),  -- Lionel completou a primeira missão com 200 pontos (200)
       (14, 9, 500),  -- Geralt completou a primeira missão com 500 pontos (500)

       (15, 8, 300),  -- Lionel completou a segunda missão com 300 pontos (200 + 300)
       (15, 9, 550);  -- Geralt completou a segunda missão com 550 pontos (500 + 550)

       (16, 8, 250);  -- Lionel completou a terceira missão com 250 pontos (200 + 300 + 250)
       (16, 9, 400);  -- Geralt completou a terceira missão com 400 pontos (500 + 550 + 400)
     

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (14, 8, 200),  -- Primeira missão com histórico do Lionel(segunda posição)
       (14, 9, 500),  -- Primeira missão com histórico do Geralt (primeira posição )
	
       (15, 8, 300),  -- Segunda missão com histórico do Lionel(segunda posição)
       (15, 9, 550);  -- Segunda missão com histórico do Geralt(primeira posição)

       (16, 8, 250);  -- Segunda missão com histórico do Lionel(segunda posição)
       (16, 9, 400);  -- Segunda missão com histórico do Geralt(primeira posição)

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
	(9, 6, 1), --Geralt finalizou em primeiro lugar com 1400 pontos
	(8, 6, 2), --Lionel finalizou em segundo lugar com 750 pontos
-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (9, 6);