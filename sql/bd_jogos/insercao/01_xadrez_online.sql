-- jogo de Xadrez Online

SET SCHEMA 'bd_jogos';

------------------------------------------------------------------------------------------------------------------------
-- Sistema: cadastrar jogadodores e históricos 

-- 1. Criação de dois jogadores p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Carlos Pereira', 'carlos.pereira@example.com', NULL, '91234-5678', '1990-05-12', 'senhaCarlos123'), -- id 01
    ('Mariana Silva', 'mariana.silva@example.com', NULL, '98765-4321', '1992-08-25', 'senhaMariana123'); -- id 02

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-02-05 14:30:00', 1), -- id 01
    ('2024-02-06 15:00:00', 2); -- id 02

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Xadrez Online', 'Tabuleiro', 'Um jogo de xadrez online que permite jogar contra outros jogadores ou contra uma IA.'); -- id 01

-- 4. tabela 'eletronico'
INSERT INTO eletronico (dispositivo, jogo_id) VALUES
    ('PC', 1); -- id 01

-- 5. Criação da Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (1, 1); -- id 01

------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Campeão', 'O jogador ganhou do seu oponente ao ter o maior número de vitórias em três partidas.');

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Valor de 10 reais no pix', 'Envio de uma quantia em dinheiro do perdedor para o ganhador do jogo');

-- 8. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
        (1, 1);  -- Campeão recompensa com 10 reais no pix

-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (1, 1);

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-02-10 16:00:00', '00:45:00', 1), -- id 01
       ('2024-02-10 17:00:00', '00:55:00', 1), -- id 02
       ('2024-02-10 18:05:00', '00:35:00', 1); -- id 03

-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (1, 1, 1.0),  -- Carlos ganhou a partida 1 (1)
       (1, 2, 0.0),  -- Mariana perdeu a partida 1 (0)
       (2, 1, 0.0),  -- Carlos perdeu a partida 2 (1 + 0)
       (2, 2, 1.0),  -- Mariana ganhou a partida 2 (0 + 1)
       (3, 1, 0.0),  -- Carlos perdeu a partida 2 (0 + 0 + 1)
       (3, 2, 1.0);  -- Mariana ganhou a partida 2 (0 + 1 + 1)

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (1, 1, 1),  -- Partida 1 com histórico do Carlos
       (1, 2, 0),  -- Partida 1 com histórico da Mariana (derrota)
       (2, 1, 0),  -- Partida 2 com histórico do Carlos (derrota)
       (2, 2, 1),  -- Partida 2 com histórico da Mariana (vitória)
       (3, 1, 0),  -- Partida 3 com histórico do Carlos (derrota)
       (3, 2, 1);  -- Partida 3 com histórico da Mariana (vitória)

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (2, 1, 1), -- Mariana finalizou em primeiro com 2 pontos
    (1, 1, 2); -- Carlos finalizou em segundo com 1 ponto


-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (2, 1);