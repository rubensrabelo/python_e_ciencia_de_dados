-- Competição Artística

SET SCHEMA 'bd_jogos';

-----------------------------------------------------------------------------------
-- Sistema: cadastrar jogadores e históricos 

-- 1. Criação de dois novos jogadores para a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Clara Menezes', 'clara.menezes@example.com', NULL, '91334-5678', '1990-02-15', 'senhaClara123'), -- id 18
    ('Felipe Souza', 'felipe.souza@example.com', NULL, '92345-6779', '1988-07-12', 'senhaFelipe123'); -- id 19

-- 2. Criação da tabela 'historico' para os novos jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
     ('2024-08-15 10:00:00', 18),  -- Clara Menezes
     ('2024-08-15 10:15:00', 19);  -- Felipe Souza

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. Tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Competição de Pintura', 'Arte', 'Competição artística onde os pintores apresentam suas obras.'); -- id 10

-- 4. Não precisa da tabela 'eletronico', , mas é necessário inserir na tabela 'atividade_ar_livre'
INSERT INTO atividade_ar_livre (rua, bairro, cidade, estado, jogo_id) VALUES
('Rua das Artes', 'Centro', 'Porto Alegre', 'Rio Grande do Sul', 10);

-- 5. Criação da Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (10, 10);

------------------------------------------------------------------------------------------------------------------------

-- Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Melhor Obra', 'O pintor que criou a melhor obra.'); -- id 13;

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Troféu de Melhor Obra', 'O pintor recebe um kit artistico por criar a melhor obra.'); -- id 13
   
-- 8. Tabela 'conquista_recompensa'
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
    (13, 13);  -- Melhor Obra recebe Troféu de Melhor Obra


-- 9. Não é necessário uma tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (13, 10);  -- Conquista para o vencedor
   

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-23 16:00:00', '01:00:00', 10),  -- Competição de Pintura id 25
       ('2024-08-24 16:00:00', '01:00:00', 10);  -- Competição de Pintura id 26

-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (25, 18, 3),  -- Clara Menezes venceu a primeira competição (3)
       (25, 19, 2),  -- Felipe Souza ficou em segundo lugar na primeira competição(2)

       (26, 19, 3),  -- Felipe Souza venceu a segunda competição (6)
       (26, 18, 2);  -- Clara Menezes ficou em segundo lugar na segunda competição(4)

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (25, 18, 3),  -- Primeira competição com histórico de Clara Menezes (vitória)
       (25, 19, 2),  -- Primeira competição com histórico de Felipe Souza (2º lugar)
       
       (26, 19, 3),  -- Segunda competição com histórico de Felipe Souza (vitória)
       (26, 18, 2);  -- Segunda competição com histórico de Clara Menezes (2º lugar)

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização da competição, sendo necessário atualizar o ranking e o histórico dos jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (18, 10, 1),  -- Clara Menezes finalizou em primeiro lugar
    (19, 10, 2);  -- Felipe Souza finalizou em segundo lugar

-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (18, 13);  -- Clara Menezes foi o vencedor da competição
