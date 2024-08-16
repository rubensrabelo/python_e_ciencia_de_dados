-- jogo Corrida de Kart

SET SCHEMA 'bd_jogos';

-----------------------------------------------------------------------------------
-- Sistema: cadastrar jogadodores e históricos 

-- 1. Criação de dois jogadores p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Lewis Hamilton', 'lewis.hamilton@example.com', NULL, '94523-8784', '1985-01-07', 'senhaHamilton44'), -- id 12
    ('Max Verstappen', 'max.verstappen@example.com', NULL, '92218-0673', '1997-09-30', 'senhaVerstappen33'), -- id 13
    ('Rubens Barriquelo', 'Rubens.barriquelo@example.com', NULL, '91111-2222', '1972-05-23', 'senhaRubens123'); -- id 14

   

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
     ('2024-08-12 14:00:00', 12),  -- Lewis Hamilton
     ('2024-08-12 14:15:00', 13),  -- Max Verstappen
     ('2024-08-12 14:15:00', 14);  -- Rubens Barriquelo
  
------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'

INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Corrida de Kart', 'Esporte', 'Corrida de kart entre pilotos competindo em um circuito.'); -- id 08


-- 4. não precisa da tabela 'eletronico', , mas é necessário inserir na tabela 'atividade_ar_livre'
INSERT INTO atividade_ar_livre (rua, bairro, cidade, estado, jogo_id) VALUES
('Rua Dr. Tomás Sepe', 'Jardim da Glória', 'Cotia', 'São Paulo', 8);

-- 5. Criação da Tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (8, 8);

------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Vencedor da Corrida', 'O piloto que venceu a corrida.'), -- id 09
    ('Melhor Volta', 'O piloto com o tempo de volta mais rápido.'); -- id 10

-- 7. Tabela 'recompensa'   	
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Troféu de Vencedor', 'O piloto recebe um troféu por vencer a corrida.'), -- id 09
    ('Medalha de Melhor Volta', 'O piloto recebe uma medalha pela melhor volta.'); -- id 10

-- 8. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
    (9, 9),  -- Vencedor da Corrida recebe Troféu de Vencedor
    (10, 10);  -- Melhor Volta recebe Medalha de Melhor Volta

     
-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (9, 8), --conquista para o primeiro lugar
	(10, 8); --conquista para o segundo lugar

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-19 15:00:00', '00:45:00', 8),  -- Corrida de Kart id 21
       ('2024-08-20 15:00:00', '00:45:00', 8);  -- Corrida de Kart id 22


-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (21, 12, 3),  -- Lewis Hamilton venceu a primeira corrida (1º lugar)(3)
       (21, 13, 2),  -- Max Verstappen ficou em segundo lugar na primeira corrida(2)
       (21, 14, 1),  -- Rubens Barriquelo ficou em terceiro lugar na primeira corrida(1)

       (22, 14, 3),  -- Rubens Barriquelo venceu a segunda corrida (1º lugar)(1 + 3)
       (22, 12, 2),  -- Lewis Hamilton ficou em segundo lugar na segunda corrida(3 + 2)
       (22, 13, 1);  -- Max Verstappen ficou em terceiro lugar na segunda corrida(2 + 1)
     

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (21, 12, 3),  -- Primeira partida com histórico de Lewis Hamilton(vitória)
       (21, 13, 2),  -- Primeira partida com histórico de Max Verstappen(2° lugar)
	   (21, 14, 1),  -- Primeira partida com histórico de Rubens Barriquelo(3° lugar)
	
       (22, 12, 2),  -- Segunda partida com histórico de Lewis Hamilton(2° lugar)
       (22, 13, 1),  -- Segunda partida com histórico de Max Verstappen(3° lugar)
       (22, 14, 3);  -- Segunda partida com histórico de Rubens Barriquelo(vitória)
------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
	(12, 7, 1), -- Lewis Hamilton finalizou em primeiro lugar com 1 vitória
    (14, 7, 2), -- Rubens Barriquelo finalizou em segundo lugar com 1 vitória
    (13, 7, 3); -- Max Verstappen finalizou em terceiro lugar

-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (12, 9),  -- Lewis Hamilton foi o vencedor da segunda corrida
    (14, 10); -- Rubens Barriquelo teve a melhor volta
