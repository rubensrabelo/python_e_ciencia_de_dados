-- jogo de Vôlei de duplas (Misto)

SET SCHEMA 'bd_jogos';

------------------------------------------------------------------------------------------------------------------------
-- Sistema: utilizar os jogadores do Xadrez Online e cadastrar três novos jogadores e histórico 

-- 1. Utilização dos jogadores anteriores(id: 1, 2, 3 e 4) e criação de outro jogador p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Eduardo Almeida', 'eduardo.almeida@example.com', '1122334455', '9988776655', '1990-07-15', 'senhaSegura123'); -- id 04

-- time 1 (id 1 e 2) e time 2 (3 e 4)

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-02-15 16:30:15', 4); -- id 04

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Vôlei de duplas (Misto)', 'Esporte', 'Será um jogo de vôlei de dupla e misto, tendo  três partidas e o time com maior número de vitórias ganhará um prêmio.'); -- id 03

-- 4. Não precisa da tabela 'eletronico', mas é necessário inserir na tabela 'atividade_ar_livre'

INSERT INTO atividade_ar_livre (rua, bairro, cidade, estado, jogo_id) VALUES
('Ginásio Rinaldo Róger de Lima', 'Planalto Universitário', 'Quixadá', 'Ceará', 3);


-- 5. Não precisa da tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (3, 3); -- id 03
------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Time com maior número de vitória', 'O time obteve o maior número de vitórias ao finalizar as três partidas.'); -- id 04

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Ganhar uma pizza', 'O time ganhador ganhará uma pizza do time perdedor.'); -- id 04

-- 8. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
    (4, 4);  -- Campeão recompensa com uma pizza
    
-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (4, 3);

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-15 16:45:00', '00:50:00', 3), -- id 07
       ('2024-08-15 17:00:00', '00:30:00', 3), -- id 08
       ('2024-08-15 17:45:00', '00:25:00', 3); -- id 09

-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (7, 1, 0.0),  -- Carlos perdeu a partida 1 (0)
       (7, 2, 0.0),  -- Mariana perdeu a partida 1 (0)
       (7, 3, 1.0),  -- Ana ganhou a partida 1 (1)
       (7, 4, 1.0),  -- Eduardo ganhou a partida 1 (1)
       
       (8, 1, 1.0),  -- Carlos ganhou a partida 2 (1)
       (8, 2, 1.0),  -- Mariana ganhou a partida 2 (1)
       (8, 3, 0.0),  -- Ana perdeu a partida 2 (0)
       (8, 4, 0.0),  -- Eduardo perdeu a partida 2 (0)
       
       (9, 1, 1.0),  -- Carlos ganhou a partida 1 (2)
       (9, 2, 1.0),  -- Mariana ganhou a partida 1 (2)
       (9, 3, 0.0),  -- Ana perdeu a partida 1 (0)
       (9, 4, 0.0);  -- Eduardo perdeu a partida 1 (0)

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (7, 1, 0),  -- Partida 1 com histórico do Carlos (derrota)
       (7, 2, 0),  -- Partida 1 com histórico da Mariana (derrota)
       (7, 3, 1),  -- Partida 1 com histórico da Ana (vitória)
       (7, 4, 1),  -- Partida 1 com histórico da Edurado (vitória)
       
       (8, 1, 1),  -- Partida 2 com histórico do Carlos (vitória)
       (8, 2, 1),  -- Partida 2 com histórico da Mariana (vitória)
       (8, 3, 0),  -- Partida 2 com histórico da Ana (derrota)
       (8, 4, 0),  -- Partida 2 com histórico da Ana (derrota)
       
       (9, 1, 1),  -- Partida 3 com histórico do Carlos (vitória)
       (9, 2, 1),  -- Partida 3 com histórico da Mariana (derrota)
       (9, 3, 0),  -- Partida 3 com histórico da Ana (derrota)
       (9, 4, 0);  -- Partida 3 com histórico da Eduardo (derrota)

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (1, 3, 1), -- Carlos finalizou em primeiro com 2 pontos
    (2, 3, 1), -- Mariana finalzou em primeiro com 2 ponto
    (3, 3, 2), -- Ana finalizou em segundo com 1
    (4, 3, 2); -- Eduardo finalizou em segundo com 1


-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (1, 4),
    (2, 4);