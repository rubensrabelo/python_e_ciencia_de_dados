-- Campeonato de League of Legends

-- Utilizando os jogadores já definidos na partidade de xadrez online

-- Inserindo jogo (League of Legends)
INSERT INTO jogo (nome, tipo, descricao) VALUES
('Campeonato de League of Legends', 'Eletrônico', 'Campeonato de League of Legends com 5 partidas.');

-- Inserindo dispositivos eletrônicos (plataformas)
INSERT INTO eletronico (dispositivo, jogo_id) VALUES
('LoLStats', 1),         -- Plataforma de estatísticas de LoL
('LoLLive', 1),          -- Plataforma de transmissão ao vivo
('LoLScoreTracker', 1);  -- Plataforma de acompanhamento de pontuações

-- Inserindo histórico
INSERT INTO historico (data_hora) VALUES
('2024-08-30 19:00:00'),
('2024-08-30 21:00:00'),
('2024-08-31 19:00:00'),
('2024-08-31 21:00:00'),
('2024-09-01 19:00:00');

-- Inserindo partidas
INSERT INTO partida (data_hora, duracao) VALUES
('2024-08-30 19:00:00', 1.5),
('2024-08-30 21:00:00', 1.8),
('2024-08-31 19:00:00', 2.0),
('2024-08-31 21:00:00', 1.6),
('2024-09-01 19:00:00', 1.9);

-- Inserindo jogadores nas partidas e suas pontuações
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada) VALUES
(1, 1, 20),  -- Alice Pereira vence Carol Santos na partida 1
(1, 3, 15),  -- Carol Santos perde para Alice Pereira na partida 1

(2, 4, 22),  -- David Silva vence Bob Martins na partida 2
(2, 2, 18),  -- Bob Martins perde para David Silva na partida 2

(3, 5, 24),  -- Eva Costa vence Carol Santos na partida 3
(3, 3, 16),  -- Carol Santos perde para Eva Costa na partida 3

(4, 1, 26),  -- Alice Pereira vence Eva Costa na partida 4
(4, 5, 20),  -- Eva Costa perde para Alice Pereira na partida 4

(5, 1, 28),  -- Alice Pereira vence David Silva na partida 5
(5, 4, 25);  -- David Silva perde para Alice Pereira na partida 5

-- Inserindo jogador_ranking finalizando com a posição desejada
INSERT INTO jogador_ranking (jogador_id, ranking_id, posicao) VALUES
(1, 1, 1),  -- Alice Pereira em 1º lugar
(4, 2, 2),  -- David Silva em 2º lugar
(5, 3, 3),  -- Eva Costa em 3º lugar
(2, 4, 4),  -- Bob Martins em 4º lugar
(3, 5, 5);  -- Carol Santos em 5º lugar

-- Inserindo conquista
INSERT INTO conquista (nome, descricao) VALUES
('Campeã do Torneio', 'Vencedora do campeonato de League of Legends.'),
('Vice-Campeão', 'Segundo colocado no campeonato de League of Legends.'),
('Terceiro Lugar', 'Terceira colocada no campeonato de League of Legends.');

-- Inserindo recompensa
INSERT INTO recompensa (nome, descricao) VALUES
('Troféu de Ouro', 'Para a campeã do campeonato.'),
('Medalha de Prata', 'Para o vice-campeão do campeonato.'),
('Medalha de Bronze', 'Para a terceira colocada no campeonato.');

-- Inserindo conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES
(1, 1),  -- Alice Pereira recebe Troféu de Ouro
(2, 2),  -- David Silva recebe Medalha de Prata
(3, 3);  -- Eva Costa recebe Medalha de Bronze

-- Inserindo partida_historico
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada) VALUES
(1, 1, 20),
(2, 2, 22),
(3, 3, 24),
(4, 4, 26),
(5, 5, 28);

-- Inserindo historico_conquista
INSERT INTO historico_conquista (historico_id, conquista_id) VALUES
(1, 1),  -- Alice Pereira conquista "Campeã do Torneio"
(2, 2),  -- David Silva conquista "Vice-Campeão"
(3, 3),  -- Eva Costa conquista "Terceiro Lugar"
(4, 1),  -- Alice Pereira conquista "Campeã do Torneio"
(5, 2);  -- David Silva conquista "Vice-Campeão"
