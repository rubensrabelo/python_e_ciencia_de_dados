-- Campeonato de Xadrez Online


------------------------------------------------------------------------------------------------------------------------

-- Criação de dois jogadores p/ a tabela 'jogador'
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES 
    ('Carlos Pereira', 'carlos.pereira@example.com', NULL, '91234-5678', '1990-05-12', 'senhaCarlos123'),
    ('Mariana Silva', 'mariana.silva@example.com', NULL, '98765-4321', '1992-08-25', 'senhaMariana123');

-- Criação da tabela 'historico' p/ os jogadores
INSERT INTO historico (data_hora, jogador_id) VALUES
    ('2024-08-10 14:30:00', 1),
    ('2024-08-11 15:00:00', 2);


------------------------------------------------------------------------------------------------------------------------

-- Criação das tabelas: 'jogo' e, como é do tipo online, 'eletronico'
-- tabela 'jogo'
INSERT INTO jogo (nome, tipo, descricao) VALUES
    ('Xadrez Online', 'Tabuleiro', 'Um jogo de xadrez online que permite jogar contra outros jogadores ou contra uma IA.');

-- tabela 'eletronico'
INSERT INTO eletronico (dispositivo, jogo_id) VALUES
    ('PC', 1);

------------------------------------------------------------------------------------------------------------------------

-- Criacao das tabelas: 'conquista' e 'recompensa'
-- Tabela 'conquista'
INSERT INTO conquista (nome, descricao) VALUES 
    ('Campeão', 'O jogador ganhou do seu oponente ao ter o maior número de vitórias em três partidas.');

-- Tabela 'recompensa'
INSERT INTO recompensa (nome, descricao) VALUES 
    ('Valor de 10 reais no pix', 'Envio de uma quantia em dinheiro do perdedor para o ganhador do jogo');

-- Tabela 'conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES 
        (1, 1);  -- Campeão recompensa com 10 reais no pix


------------------------------------------------------------------------------------------------------------------------

-- Realização das partidas
-- Tabela 'partida'
INSERT INTO partida (data_hora, duracao)
VALUES ('2024-08-10 14:30:00', '00:45:00'),
       ('2024-08-11 16:00:00', '00:55:00'),
       ('2024-08-12 18:20:00', '00:35:00');

-- Tabela 'partida_jogador'
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES (1, 1, 1.0),  -- Carlos ganhou a partida 1
       (1, 2, 0.0),  -- Mariana perdeu a partida 1 (empate)
       (2, 1, 0.0),  -- Carlos perdeu a partida 2 (derrota)
       (2, 2, 1.0),  -- Mariana ganhou a partida 2 (vitória)
       (3, 1, 0.0),  -- Carlos perdeu a partida 2 (derrota)
       (3, 2, 1.0);  -- Mariana ganhou a partida 2 (vitória)

-- Tabela 'partida_historico'
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES (1, 1, 1),  -- Partida 1 com histórico do Carlos
       (1, 2, 0),  -- Partida 1 com histórico da Mariana (derrota)
       (2, 1, 0),  -- Partida 2 com histórico do Carlos (derrota)
       (2, 2, 1);  -- Partida 2 com histórico da Mariana (vitória)
       (2, 1, 0),  -- Partida 3 com histórico do Carlos (derrota)
       (2, 2, 1);  -- Partida 3 com histórico da Mariana (vitória)

------------------------------------------------------------------------------------------------------------------------

-- Finalização do campeonato, sendo necessário criar (Sugestão: criar juntos com a conquista), atualizar o ranking e as conquistas
