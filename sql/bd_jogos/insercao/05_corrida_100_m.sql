-- Campeonato de Corrida de 100 metros

-- Utilizando os jogadores já definidos na partidade de xadrez online

-- Inserindo jogo (Corrida de 100 metros)
INSERT INTO jogo (nome, tipo, descricao) VALUES
('Campeonato de Corrida de 100 metros', 'Esportivo', 'Campeonato de corrida de 100 metros com 3 partidas.');

-- Inserindo atividades ao ar livre (localização da corrida)
INSERT INTO atividade_ar_livre (rua, bairro, cidade, estado, jogo_id) VALUES
('Rua das Corridas 1', 'Centro', 'São Paulo', 'SP', 1),
('Rua das Corridas 2', 'Centro', 'Rio de Janeiro', 'RJ', 1),
('Rua das Corridas 3', 'Centro', 'Belo Horizonte', 'MG', 1);

-- Inserindo histórico
INSERT INTO historico (data_hora) VALUES
('2024-09-05 08:00:00'),
('2024-09-05 10:00:00'),
('2024-09-05 12:00:00');

-- Inserindo partidas
INSERT INTO partida (data_hora, duracao) VALUES
('2024-09-05 08:00:00', 0.2),
('2024-09-05 10:00:00', 0.22),
('2024-09-05 12:00:00', 0.21);

-- Inserindo jogadores nas partidas e suas pontuações
INSERT INTO partida_jogador (partida_id, jogador_id, pontuacao_alcancada) VALUES
(1, 4, 9.58),  -- David Silva vence com o melhor tempo na partida 1
(1, 2, 9.75),  -- Bob Martins chega em segundo na partida 1
(1, 5, 9.85),  -- Eva Costa chega em terceiro na partida 1

(2, 4, 9.68),  -- David Silva vence com o melhor tempo na partida 2
(2, 2, 9.72),  -- Bob Martins chega em segundo na partida 2
(2, 5, 9.80),  -- Eva Costa chega em terceiro na partida 2

(3, 4, 9.60),  -- David Silva vence com o melhor tempo na partida 3
(3, 2, 9.70),  -- Bob Martins chega em segundo na partida 3
(3, 5, 9.82);  -- Eva Costa chega em terceiro na partida 3

-- Inserindo jogador_ranking finalizando com a posição desejada
INSERT INTO jogador_ranking (jogador_id, ranking_id, posicao) VALUES
(4, 1, 1),  -- David Silva em 1º lugar
(2, 2, 2),  -- Bob Martins em 2º lugar
(5, 3, 3),  -- Eva Costa em 3º lugar
(1, 4, 4),  -- Alice Pereira em 4º lugar
(3, 5, 5);  -- Carol Santos em 5º lugar

-- Inserindo conquista
INSERT INTO conquista (nome, descricao) VALUES
('Campeão do Torneio', 'Vencedor do campeonato de Corrida de 100 metros.'),
('Vice-Campeão', 'Segundo colocado no campeonato de Corrida de 100 metros.'),
('Terceiro Lugar', 'Terceiro colocado no campeonato de Corrida de 100 metros.');

-- Inserindo recompensa
INSERT INTO recompensa (nome, descricao) VALUES
('Troféu de Ouro', 'Para o campeão do campeonato.'),
('Medalha de Prata', 'Para o vice-campeão do campeonato.'),
('Medalha de Bronze', 'Para o terceiro colocado no campeonato.');

-- Inserindo conquista_recompensa
INSERT INTO conquista_recompensa (conquista_id, recompensa_id) VALUES
(1, 1),  -- David Silva recebe Troféu de Ouro
(2, 2),  -- Bob Martins recebe Medalha de Prata
(3, 3);  -- Eva Costa recebe Medalha de Bronze

-- Inserindo partida_historico
INSERT INTO partida_historico (partida_id, historico_id, pontuacao_alcancada) VALUES
(1, 1, 9.58),
(2, 2, 9.68),
(3, 3, 9.60);

-- Inserindo historico_conquista
INSERT INTO historico_conquista (historico_id, conquista_id) VALUES
(1, 1),  -- David Silva conquista "Campeão do Torneio"
(2, 2),  -- Bob Martins conquista "Vice-Campeão"
(3, 3);  -- Eva Costa conquista "Terceiro Lugar"
