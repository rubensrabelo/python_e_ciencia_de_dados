-- Campeonato de Tênis ao Ar Livre

-- Utilizando os jogadores já definidos na partidade de xadrez online

-- Inserindo jogo (tênis)
INSERT INTO jogo (nome, tipo, descricao) VALUES
('Campeonato de Tênis', 'Esportivo', 'Campeonato de tênis ao ar livre com 5 partidas entre jogadores de alto nível.');

-- Inserindo atividades ao ar livre para as partidas
INSERT INTO atividade_ar_livre (rua, bairro, cidade, estado, jogo_id) VALUES
('Rua do Tênis 1', 'Centro', 'São Paulo', 'SP', 1),
('Rua do Tênis 2', 'Centro', 'Rio de Janeiro', 'RJ', 1),
('Rua do Tênis 3', 'Centro', 'Belo Horizonte', 'MG', 1),
('Rua do Tênis 4', 'Centro', 'Curitiba', 'PR', 1),
('Rua do Tênis 5', 'Centro', 'Porto Alegre', 'RS', 1);

-- Inserindo histórico
INSERT INTO historico (data_hora) VALUES
('2024-08-20 10:00:00'),
('2024-08-20 14:00:00'),
('2024-08-21 10:00:00'),
('2024-08-21 14:00:00'),
('2024-08-22 10:00:00');

-- Inserindo partidas
INSERT INTO partida (data_hora, duracao) VALUES
('2024-08-20 10:00:00', 2.0),
('2024-08-20 14:00:00', 1.5),
('2024-08-21 10:00:00', 1.8),
('2024-08-21 14:00:00', 2.2),
('2024-08-22 10:00:00', 2.0);

-- Inserindo jogadores nas partidas e suas pontuações
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada) VALUES
(1, 3, 6),  -- Carol Santos vence Eva Costa na partida 1
(1, 5, 4),  -- Eva Costa perde para Carol Santos na partida 1

(2, 2, 6),  -- Bob Martins vence David Silva na partida 2
(2, 4, 4),  -- David Silva perde para Bob Martins na partida 2

(3, 3, 6),  -- Carol Santos vence Bob Martins na partida 3
(3, 2, 2),  -- Bob Martins perde para Carol Santos na partida 3

(4, 5, 6),  -- Eva Costa vence Alice Pereira na partida 4
(4, 1, 3),  -- Alice Pereira perde para Eva Costa na partida 4

(5, 3, 6),  -- Carol Santos vence Eva Costa na partida 5
(5, 5, 5);  -- Eva Costa perde para Carol Santos na partida 5

-- Inserindo jogador_ranking finalizando com a posição desejada
INSERT INTO jogador_ranking (jogador_id, ranking_id, posicao) VALUES
(3, 1, 1),  -- Carol Santos em 1º lugar
(5, 2, 2),  -- Eva Costa em 2º lugar
(2, 3, 3),  -- Bob Martins em 3º lugar
(4, 4, 4),  -- David Silva em 4º lugar
(1, 5, 5);  -- Alice Pereira em 5º lugar

-- Inserindo conquista
INSERT INTO conquista (nome, descricao) VALUES
('Campeã do Torneio', 'Vencedora do campeonato de tênis.'),
('Vice-Campeã', 'Segunda colocada no campeonato de tênis.'),
('Terceiro Lugar', 'Terceira colocada no campeonato de tênis.');

-- Inserindo recompensa
INSERT INTO recompensa (nome, descricao) VALUES
('Troféu de Ouro', 'Para a campeã do campeonato.'),
('Medalha de Prata', 'Para a vice-campeã do campeonato.'),
('Medalha de Bronze', 'Para a terceira colocada no campeonato.');

-- Inserindo conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES
(1, 1),  -- Carol Santos recebe Troféu de Ouro
(2, 2),  -- Eva Costa recebe Medalha de Prata
(3, 3);  -- Bob Martins recebe Medalha de Bronze

-- Inserindo partida_historico
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada) VALUES
(1, 1, 6),
(2, 2, 6),
(3, 3, 6),
(4, 4, 6),
(5, 5, 6);

-- Inserindo historico_conquista
INSERT INTO historico_conquista (historico_id, conquista_id) VALUES
(1, 1),  -- Carol Santos conquista "Campeã do Torneio"
(2, 2),  -- Eva Costa conquista "Vice-Campeã"
(3, 3),  -- Bob Martins conquista "Terceiro Lugar"
(4, 2),  -- Eva Costa conquista "Vice-Campeã"
(5, 1);  -- Carol Santos conquista "Campeã do Torneio"
