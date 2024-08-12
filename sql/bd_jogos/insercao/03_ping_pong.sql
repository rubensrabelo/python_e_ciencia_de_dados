-- Campeonato de Ping-Pong

-- Utilizando os jogadores já definidos na partidade de xadrez online

-- Inserindo jogo (ping-pong)
INSERT INTO jogo (nome, tipo, descricao) VALUES
('Campeonato de Ping-Pong', 'Esportivo', 'Campeonato de ping-pong com 5 partidas.');


-- Inserindo atividades ao ar livre para as partidas
INSERT INTO atividade_ar_livre (rua, bairro, cidade, estado, jogo_id) VALUES
('Rua do Ping-Pong 1', 'Centro', 'São Paulo', 'SP', 1),
('Rua do Ping-Pong 2', 'Centro', 'Rio de Janeiro', 'RJ', 1),
('Rua do Ping-Pong 3', 'Centro', 'Belo Horizonte', 'MG', 1),
('Rua do Ping-Pong 4', 'Centro', 'Curitiba', 'PR', 1),
('Rua do Ping-Pong 5', 'Centro', 'Porto Alegre', 'RS', 1);

-- Inserindo histórico
INSERT INTO historico (data_hora) VALUES
('2024-08-25 10:00:00'),
('2024-08-25 14:00:00'),
('2024-08-26 10:00:00'),
('2024-08-26 14:00:00'),
('2024-08-27 10:00:00');

-- Inserindo partidas
INSERT INTO partida (data_hora, duracao) VALUES
('2024-08-25 10:00:00', 1.5),
('2024-08-25 14:00:00', 1.2),
('2024-08-26 10:00:00', 1.8),
('2024-08-26 14:00:00', 1.6),
('2024-08-27 10:00:00', 1.4);

-- Inserindo jogadores nas partidas e suas pontuações
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada) VALUES
(1, 4, 6),  -- David Silva vence Carol Santos na partida 1
(1, 3, 3),  -- Carol Santos perde para David Silva na partida 1

(2, 2, 6),  -- Bob Martins vence Eva Costa na partida 2
(2, 5, 4),  -- Eva Costa perde para Bob Martins na partida 2

(3, 1, 6),  -- Alice Pereira vence Carol Santos na partida 3
(3, 3, 5),  -- Carol Santos perde para Alice Pereira na partida 3

(4, 4, 6),  -- David Silva vence Eva Costa na partida 4
(4, 5, 4),  -- Eva Costa perde para David Silva na partida 4

(5, 4, 6),  -- David Silva vence Bob Martins na partida 5
(5, 2, 5);  -- Bob Martins perde para David Silva na partida 5

-- Inserindo jogador_ranking finalizando com a posição desejada
INSERT INTO jogador_ranking (jogador_id, ranking_id, posicao) VALUES
(4, 1, 1),  -- David Silva em 1º lugar
(2, 2, 2),  -- Bob Martins em 2º lugar
(1, 3, 3),  -- Alice Pereira em 3º lugar
(5, 4, 4),  -- Eva Costa em 4º lugar
(3, 5, 5);  -- Carol Santos em 5º lugar

-- Inserindo conquista
INSERT INTO conquista (nome, descricao) VALUES
('Campeão do Torneio', 'Vencedor do campeonato de ping-pong.'),
('Vice-Campeão', 'Segundo colocado no campeonato de ping-pong.'),
('Terceiro Lugar', 'Terceiro colocado no campeonato de ping-pong.');

-- Inserindo recompensa
INSERT INTO recompensa (nome, descricao) VALUES
('Troféu de Ouro', 'Para o campeão do campeonato.'),
('Medalha de Prata', 'Para o vice-campeão do campeonato.'),
('Medalha de Bronze', 'Para o terceiro colocado no campeonato.');

-- Inserindo conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES
(1, 1),  -- David Silva recebe Troféu de Ouro
(2, 2),  -- Bob Martins recebe Medalha de Prata
(3, 3);  -- Alice Pereira recebe Medalha de Bronze

-- Inserindo partida_historico
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada) VALUES
(1, 1, 6),
(2, 2, 6),
(3, 3, 6),
(4, 4, 6),
(5, 5, 6);

-- Inserindo historico_conquista
INSERT INTO historico_conquista (historico_id, conquista_id) VALUES
(1, 1),  -- David Silva conquista "Campeão do Torneio"
(2, 2),  -- Bob Martins conquista "Vice-Campeão"
(3, 3),  -- Alice Pereira conquista "Terceiro Lugar"
(4, 1),  -- David Silva conquista "Campeão do Torneio"
(5, 2);  -- Bob Martins conquista "Vice-Campeão"
