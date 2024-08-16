-- jogo Ping Pong

SET SCHEMA 'bd_jogos';

-----------------------------------------------------------------------------------
-- Sistema: cadastrar jogadores e históricos 

-- 1. Criação de três novos jogadores para a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Ma Long', 'ma.long@example.com', NULL, '93333-1234', '1988-10-20', 'senhaMaLong1'), -- id 15
    ('Timo Boll', 'timo.boll@example.com', NULL, '94444-5678', '1981-03-08', 'senhaTimoBoll'), -- id 16
    ('Ding Ning', 'ding.ning@example.com', NULL, '95555-3456', '1990-06-20', 'senhaDingNing'); -- id 17

-- 2. Criação da tabela 'historico' p/ os novos jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
     ('2024-08-12 15:00:00', 15),  -- Ma Long
     ('2024-08-12 15:15:00', 16),  -- Timo Boll
     ('2024-08-12 15:30:00', 17);  -- Ding Ning

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. Tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Ping Pong', 'Esporte', 'Jogo de Ping Pong entre jogadores competindo em uma mesa.'); -- id 09

-- 4. Não precisa da tabela 'eletronico', , mas é necessário inserir na tabela 'atividade_ar_livre'
INSERT INTO atividade_ar_livre (rua, bairro, cidade, estado, jogo_id) VALUES
('Avenida Ping Pong', 'Centro', 'São Paulo', 'São Paulo', 9);

-- 5. Criação da Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (9, 9);

------------------------------------------------------------------------------------------------------------------------

-- Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Campeão do Jogo', 'O jogador que venceu a partida.'), -- id 11 
    ('Melhor Saque', 'O jogador com o melhor saque da partida.'); -- id 12

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Troféu de Campeão', 'O jogador recebe um troféu por vencer a partida.'), -- id 11
    ('Medalha de Melhor Saque', 'O jogador recebe uma medalha pelo melhor saque.'); -- id 12
    
-- 8. Tabela 'conquista_recompensa'
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
    (11, 11),  -- Campeão do Jogo recebe Troféu de Campeão
    (12, 12);  -- Melhor Saque recebe Medalha de Melhor Saque
    
-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (11, 9),  -- Conquista para o primeiro lugar
    (12, 9);  -- Conquista para o segundo lugar
    
------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-21 16:00:00', '00:30:00', 9),  -- id 23
       ('2024-08-22 16:00:00', '00:30:00', 9);  -- id 24

-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (23, 15, 3),  -- Ma Long venceu a primeira partida (1º lugar)(3)
       (23, 16, 2),  -- Timo Boll ficou em segundo lugar na primeira partida(2)
       (23, 17, 1),  -- Ding Ning ficou em terceiro lugar na primeira partida(1)

       (24, 17, 3),  -- Ding Ning venceu a segunda partida (1º lugar)(4)
       (24, 15, 2),  -- Ma Long ficou em segundo lugar na segunda partida(5)
       (24, 16, 1);  -- Timo Boll ficou em terceiro lugar na segunda partida(3)

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (23, 15, 3),  -- Primeira partida com histórico de Ma Long (vitória)
       (23, 16, 2),  -- Primeira partida com histórico de Timo Boll (2º lugar)
       (23, 17, 1),  -- Primeira partida com histórico de Ding Ning (3º lugar)
       
       (24, 15, 2),  -- Segunda partida com histórico de Ma Long (2º lugar)
       (24, 16, 1),  -- Segunda partida com histórico de Timo Boll (3º lugar)
       (24, 17, 3);  -- Segunda partida com histórico de Ding Ning (vitória)

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e o histórico dos jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (15, 9, 1),  -- Ma Long finalizou em primeiro lugar
    (17, 9, 2),  -- Ding Ning finalizou em segundo lugar
    (16, 9, 3);  -- Timo Boll finalizou em terceiro lugar

-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (15, 11),  -- Ma Long foi o campeão da primeira partida
    (17, 12);  -- Ding Ning teve o melhor saque
