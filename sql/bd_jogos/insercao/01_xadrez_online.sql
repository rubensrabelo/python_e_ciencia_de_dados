-- Campeonato de Xadrez Online


-- 1. Inserção dos Jogadores
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha)
VALUES
('Alice Silva', 'alice.silva@example.com', '111222333', '999888777', '1990-05-15', 'senhaAlice'),
('Bob Santos', 'bob.santos@example.com', '111222334', '999888776', '1991-06-20', 'senhaBob'),
('Carol Lima', 'carol.lima@example.com', '111222335', '999888775', '1992-07-25', 'senhaCarol'),
('David Costa', 'david.costa@example.com', '111222336', '999888774', '1993-08-30', 'senhaDavid'),
('Eva Oliveira', 'eva.oliveira@example.com', '111222337', '999888773', '1994-09-10', 'senhaEva'),
('Frank Martins', 'frank.martins@example.com', '111222338', '999888772', '1995-10-05', 'senhaFrank'),
('Grace Almeida', 'grace.almeida@example.com', '111222339', '999888771', '1996-11-15', 'senhaGrace'),
('Hank Oliveira', 'hank.oliveira@example.com', '111222340', '999888770', '1997-12-20', 'senhaHank'),
('Ivy Mendes', 'ivy.mendes@example.com', '111222341', '999888769', '1998-01-25', 'senhaIvy'),
('Jack Torres', 'jack.torres@example.com', '111222342', '999888768', '1999-02-10', 'senhaJack');

-- 2. Inserção dos Jogos
INSERT INTO jogo (nome, tipo, descricao)
VALUES
('Torneio de Xadrez Online', 'Estratégia', 'Campeonato online de xadrez com partidas eliminatórias e finais.');

-- 3. Inserção dos Eletrônicos
INSERT INTO eletronico (dispositivo, jogo_id)
VALUES
('Computador Desktop', 1),
('Laptop', 1),;
('Celular', 1),;

-- 4. Inserção das Conquistas e Recompensas
INSERT INTO conquista (nome, descricao)
VALUES
('Campeão do Campeonato', 'Venceu o torneio de xadrez online'),
('Melhor Desempenho', 'Desempenho excepcional durante o campeonato');

INSERT INTO recompensa (nome, descricao)
VALUES
('Troféu de Ouro', 'Prêmio para o vencedor do torneio'),
('Certificado de Participação', 'Reconhecimento pela participação no torneio');

-- 5. Inserção do Histórico
INSERT INTO historico (data_hora, jogador_id)
VALUES
('2024-08-10 10:00:00', 1),
('2024-08-10 11:00:00', 2),
('2024-08-10 12:00:00', 3),
('2024-08-10 13:00:00', 4),
('2024-08-10 14:00:00', 5),
('2024-08-10 15:00:00', 6),
('2024-08-10 16:00:00', 7),
('2024-08-10 17:00:00', 8),
('2024-08-10 18:00:00', 9),
('2024-08-10 19:00:00', 10);

-- 6. Inserção das Partidas
INSERT INTO partida (data_hora, duracao)
VALUES
('2024-08-10 10:00:00', '00:45:00'),
('2024-08-10 11:00:00', '00:45:00'),
('2024-08-10 12:00:00', '00:45:00'),
('2024-08-10 13:00:00', '00:45:00'),
('2024-08-10 14:00:00', '00:45:00'),
('2024-08-10 15:00:00', '00:45:00'),
('2024-08-10 16:00:00', '00:45:00'),
('2024-08-10 17:00:00', '00:45:00'),
('2024-08-10 18:00:00', '00:45:00'),
('2024-08-10 19:00:00', '00:45:00'),
('2024-08-10 20:00:00', '00:45:00'),
('2024-08-10 21:00:00', '00:45:00');

-- 7. Inserção dos Resultados das Partidas
-- Partida 1: Alice vs Bob
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(1, 1, 0),  -- Alice perdeu
(1, 2, 4);  -- Bob ganhou

-- Partida 2: Carol vs David
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(2, 3, 2),  -- Empate
(2, 4, 2);  -- Empate

-- Partida 3: Eva vs Frank
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(3, 5, 0),  -- Eva perdeu
(3, 6, 4);  -- Frank ganhou

-- Partida 4: Grace vs Hank
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(4, 7, 2),  -- Empate
(4, 8, 2);  -- Empate

-- Partida 5: Ivy vs Jack
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(5, 9, 4),  -- Ivy ganhou
(5, 10, 0);  -- Jack perdeu

-- Partida 6: Alice vs Carol
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(6, 1, 0),  -- Alice perdeu
(6, 3, 4);  -- Carol ganhou

-- Partida 7: Bob vs Eva
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(7, 2, 4),  -- Bob ganhou
(7, 5, 0);  -- Eva perdeu

-- Partida 8: Frank vs Grace
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(8, 6, 2),  -- Empate
(8, 7, 2);  -- Empate

-- Partida 9: Hank vs Ivy
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(9, 8, 0),  -- Hank perdeu
(9, 9, 4);  -- Ivy ganhou

-- Partida 10: Jack vs David
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(10, 10, 2),  -- Empate
(10, 4, 2);  -- Empate

-- Partida 11: Alice vs Eva
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(11, 1, 0),  -- Alice perdeu
(11, 5, 4);  -- Eva ganhou

-- Partida 12: Bob vs Frank
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada)
VALUES
(12, 2, 4),  -- Bob ganhou
(12, 6, 0);  -- Frank perdeu

-- 8. Inserção das Tabelas Associativas
-- Partida-Histórico
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada)
VALUES
(1, 1, 0),
(2, 2, 2),
(3, 3, 4),
(4, 4, 2),
(5, 5, 4),
(6, 6, 4),
(7, 7, 4),
(8, 8, 2),
(9, 9, 4),
(10, 10, 2),
(11, 11, 4),
(12, 12, 4);

-- Histórico-Conquista
INSERT INTO historico_conquista (historico_id, conquista_id)
VALUES
(1, 1),  -- Alice
(2, 1),  -- Bob
(3, 1),  -- Carol
(4, 1),  -- David
(5, 1),  -- Eva
(6, 1),  -- Frank
(7, 1),  -- Grace
(8, 1),  -- Hank
(9, 1),  -- Ivy
(10, 1), -- Jack

-- Ranking-Conquista
INSERT INTO ranking_conquista (conquista_id, ranking_id)
VALUES
(1, 1),  -- Conquista 1 associada ao ranking 1
(2, 2);  -- Conquista 2 associada ao ranking 2

-- Conquista-Recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id)
VALUES
(1, 1),  -- Conquista 1 recebe a recompensa 1
(2, 2);  -- Conquista 2 recebe a recompensa 2

-- 9. Inserção do Ranking Final
-- Inserir Rankings
INSERT INTO ranking (id)
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Associar jogadores ao ranking
INSERT INTO jogador_ranking (jogador_id, ranking_id, posicao)
VALUES
(2, 1, 1),  -- Bob com a maior pontuação (12 pontos)
(3, 2, 2),  -- Carol com a segunda maior pontuação (10 pontos)
(5, 3, 3),  -- Eva com a terceira maior pontuação (10 pontos)
(9, 4, 4),  -- Ivy com a quarta maior pontuação (8 pontos)
(4, 5, 5),  -- David com a quinta maior pontuação (8 pontos)
(6, 6, 6),  -- Frank com a sexta maior pontuação (6 pontos)
(7, 7, 7),  -- Grace com a sétima maior pontuação (6 pontos)
(8, 8, 8),  -- Hank com a oitava maior pontuação (4 pontos)
(10, 9, 9), -- Jack com a nona maior pontuação (3 pontos)
(1, 10, 10);-- Alice com a décima maior pontuação (0 pontos)
