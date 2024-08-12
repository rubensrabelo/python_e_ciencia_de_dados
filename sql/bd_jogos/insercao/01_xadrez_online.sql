-- Dados para o campeonato de xadrez online

-- Inserindo jogadores
INSERT INTO jogador (nome, email, telefone_res, telefone_cel, data_nascimento, senha) VALUES
('Alice Pereira', 'alice.pereira@gmail.com', '1122334455', '1199887766', '1987-05-12', 'chessQueenAlice'),
('Bob Martins', 'bob.martins@yahoo.com', '1133445566', '1199776655', '1990-08-22', 'strategistBob'),
('Carol Santos', 'carol.santos@hotmail.com', '1144556677', '1199665544', '1992-02-15', 'tacticCarol'),
('David Silva', 'david.silva@gmail.com', '1155667788', '1199554433', '1989-11-30', 'kingDavid'),
('Eva Costa', 'eva.costa@yahoo.com', '1166778899', '1199443322', '1993-06-18', 'queenEva');

-- Inserindo históricos
INSERT INTO historico (data_hora) VALUES
('2024-08-15 14:00:00'),
('2024-08-15 16:00:00'),
('2024-08-16 14:00:00'),
('2024-08-16 16:00:00'),
('2024-08-17 14:00:00');

-- Inserindo partidas
INSERT INTO partida (data_hora, duracao) VALUES
('2024-08-15 14:00:00', 1.5),
('2024-08-15 16:00:00', 2.0),
('2024-08-16 14:00:00', 1.8),
('2024-08-16 16:00:00', 2.2),
('2024-08-17 14:00:00', 2.0);

-- Inserindo ranking
INSERT INTO ranking VALUES
(DEFAULT), (DEFAULT), (DEFAULT), (DEFAULT), (DEFAULT);

-- Inserindo jogo (xadrez)
INSERT INTO jogo (nome, tipo, descricao) VALUES
('Campeonato de Xadrez Online', 'Estratégico', 'Campeonato de xadrez realizado online com 5 partidas.');

-- Inserindo dispositivos eletrônicos
INSERT INTO eletronico (dispositivo, jogo_id) VALUES
('PC', 1),
('Celular', 1);

-- Inserindo partidas e jogadores
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada) VALUES
(1, 1, 1),  -- Alice Pereira ganhou de Bob Martins na partida 1
(1, 2, 0),  -- Bob Martins perdeu para Alice Pereira na partida 1
(2, 3, 1),  -- Carol Santos ganhou de David Silva na partida 2
(2, 4, 0),  -- David Silva perdeu para Carol Santos na partida 2
(3, 5, 1),  -- Eva Costa ganhou de Alice Pereira na partida 3
(3, 1, 0),  -- Alice Pereira perdeu para Eva Costa na partida 3
(4, 2, 1),  -- Bob Martins ganhou de Carol Santos na partida 4
(4, 3, 0),  -- Carol Santos perdeu para Bob Martins na partida 4
(5, 4, 1),  -- David Silva ganhou de Eva Costa na partida 5
(5, 5, 0);  -- Eva Costa perdeu para David Silva na partida 5

-- Inserindo jogador_ranking
INSERT INTO jogador_ranking (jogador_id, ranking_id, posicao) VALUES
(1, 1, 1),  -- Alice Pereira em 1º lugar
(2, 2, 2),  -- Bob Martins em 2º lugar
(3, 3, 3),  -- Carol Santos em 3º lugar
(4, 4, 4),  -- David Silva em 4º lugar
(5, 5, 5);  -- Eva Costa em 5º lugar

-- Inserindo conquista
INSERT INTO conquista (nome, descricao) VALUES
('Melhor Jogador', 'Melhor jogador do campeonato.'),
('Artilheiro', 'Jogador com mais vitórias.'),
('Estratégia do Ano', 'Jogador com a melhor estratégia.');

-- Inserindo recompensa
INSERT INTO recompensa (nome, descricao) VALUES
('Troféu de Ouro', 'Para o melhor jogador do campeonato.'),
('Medalha de Prata', 'Para o segundo melhor jogador do campeonato.'),
('Medalha de Bronze', 'Para o terceiro melhor jogador do campeonato.');

-- Inserindo conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES
(1, 1),  -- Melhor Jogador recebe Troféu de Ouro
(2, 2),  -- Artilheiro recebe Medalha de Prata
(3, 3);  -- Estratégia do Ano recebe Medalha de Bronze

-- Inserindo partida_historico
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);

-- Inserindo historico_conquista
INSERT INTO historico_conquista (historico_id, conquista_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 2);