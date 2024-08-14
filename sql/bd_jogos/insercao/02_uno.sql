-- jogo de cartas UNO

SET SCHEMA 'bd_jogos';

------------------------------------------------------------------------------------------------------------------------
-- Sistema: utilizar os jogadores do Xadrez Online e cadastrar três novos jogadores e histórico 

-- 1. Criação de um jogador p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Ana Costa', 'ana.costa@example.com', '2233-4455', '91222-3344', '1995-03-22', 'senhaAna123'); -- id 03

-- 2. Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-02-15 16:30:15', 3); -- id 03

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Cadastro do Jogo

-- 3. tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('UNO', 'Cartas', 'Um jogo de cartas UNO que os jogadores competição em 3 rodadas, sendo recompensado quem finalizar em primeiro e emsegundo lugar. Caso finalize as três rodadas em empate, ocorrerá mais uma rodada para desempatar.'); -- id 02

-- 4. Não precisa da tabela 'eletronico' e 'atividade_ar_livre'

-- 5. Não precisa da tabela 'ranking'
INSERT INTO ranking (id, jogo_id) VALUES
    (2, 2); -- id 02
------------------------------------------------------------------------------------------------------------------------

--Sistema: cadastro da conquista e da recompensa

-- 6. Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Gênio do UNO', 'O jogador obteve o maior número de vitórias ao finalizar as três partidas.'), -- id 02
    ('Aprendiz no UNO', 'O jogador finalizou com o segundo maior número de vitórias após a finalização das três rodadas.'); -- id 03

-- 7. Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Uma caixa de chocolate', 'O jogador ganhará uma caixa com diversos chocolates dentro.'), -- id 02
    ('Uma barra de chocolate', 'O jogador ganhará apenas um único chocolate como consolação pelo segundo lugar'); -- id 03

-- 8. Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
    (2, 2),  -- Campeão recompensa com de uma caixa de chocolate
    (3, 3);  -- Segundo lugar recompensa com uma barra de chocolate

-- 9. Tabela 'ranking_conquista'
INSERT INTO ranking_conquista (conquista_id, ranking_id) VALUES
    (2, 2),
    (3, 2);

------------------------------------------------------------------------------------------------------------------------

-- Sistema: Realização das partidas

-- 10. Tabela 'partida'
INSERT INTO partida (data_hora, duracao, jogo_id)
VALUES ('2024-08-15 16:45:00', '00:50:00', 2), -- id 04
       ('2024-08-15 17:00:00', '00:30:00', 2), -- id 05
       ('2024-08-15 17:45:00', '00:25:00', 2); -- id 06

-- 11. Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (4, 1, 0.0),  -- Carlos perdeu a partida 1 (0)
       (4, 2, 0.0),  -- Mariana perdeu a partida 1 (0)
       (4, 3, 1.0),  -- Ana ganhou a partida 1 (1)
       
       (5, 1, 0.0),  -- Carlos ganhou a partida 2 (1)
       (5, 2, 1.0),  -- Mariana perdeu a partida 2 (0)
       (5, 3, 0.0),  -- Ana perdeu a partida 2 (0)
       
       (6, 1, 1.0),  -- Carlos perdeu a partida 1 (2)
       (6, 2, 0.0),  -- Mariana ganhou a partida 1 (0)
       (6, 3, 0.0);  -- Ana ganhou a partida 1 (0)

-- 12. Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (4, 1, 0),  -- Partida 1 com histórico do Carlos (vitória)
       (4, 2, 0),  -- Partida 1 com histórico da Mariana (derrota)
       (4, 3, 1),  -- Partida 1 com histórico da Ana (derrota)
       
       (5, 1, 1),  -- Partida 2 com histórico do Carlos (vitória)
       (5, 2, 0),  -- Partida 2 com histórico da Mariana (derrota)
       (5, 3, 0),  -- Partida 2 com histórico da Ana (derrota)
       
       (6, 1, 1),  -- Partida 3 com histórico do Carlos (vitória)
       (6, 2, 0),  -- Partida 3 com histórico da Mariana (derrota)
       (6, 3, 0);  -- Partida 3 com histórico da Ana (derrota)

------------------------------------------------------------------------------------------------------------------------

-- Sistema: finalização do campeonato, sendo necessário atualizar o ranking e as o historico do jogadores

-- 13. Tabela 'jogador_ranking'
INSERT INTO jogador_ranking(jogador_id, ranking_id, posicao) VALUES
    (1, 2, 1), -- Carlos finalizou em primeiro com 2 pontos
    (3, 2, 2), -- Ana finalizou em segundo com 1 ponto
    (2, 2, 3); -- Marian finalizou em terceiro com 0


-- 14. Tabela 'historico_conquista'
INSERT INTO historico_conquista(historico_id, conquista_id) VALUES
    (1, 2),
    (3, 3);