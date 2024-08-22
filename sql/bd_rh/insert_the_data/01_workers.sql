-- Definindo o schema

SET SCHEMA 'recursos_humanos';

-- 01. Dados Fictícios para tb_filial
INSERT INTO tb_filial (rua, cidade, estado, pais) VALUES
('Av. Paulista, 1000', 'São Paulo', 'São Paulo', 'Brasil'),
('Rua das Flores, 200', 'Rio de Janeiro', 'Rio de Janeiro', 'Brasil'),
('Praça da Liberdade, 150', 'Belo Horizonte', 'Minas Gerais', 'Brasil');

-- 02. Dados Fictícios para tb_departamento
INSERT INTO tb_departamento (nome) VALUES
('Recursos Humanos'),
('Tecnologia da Informação'),
('Marketing'),
('Finanças');

-- 03. Dados Fictícios para tb_cargo
INSERT INTO tb_cargo (nome, salario) VALUES
('Analista de RH', 4500.00),
('Desenvolvedor Backend', 6500.00),
('Designer Gráfico', 4000.00),
('Analista Financeiro', 5000.00);

-- 04. Dados Fictícios para tb_funcionarios
INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('João', 'Silva', '1985-05-15', '2020-01-01', NULL, 'M', 1, 1, 1),
('Maria', 'Oliveira', '1990-03-22', '2019-07-15', NULL, 'F', 2, 2, 2),
('Carlos', 'Santos', '1978-11-30', '2021-03-01', '2023-06-30', 'M', 3, 3, 3),
('Ana', 'Costa', '1995-07-08', '2022-05-12', NULL, 'F', 4, 4, 1);

INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('Pedro', 'Lima', '1988-12-20', '2021-06-01', NULL, 'M', 2, 2, 1),
('Carla', 'Pereira', '1992-04-10', '2020-09-15', NULL, 'F', 1, 1, 3),
('Roberto', 'Mendes', '1980-01-05', '2018-11-22', NULL, 'M', 4, 4, 2),
('Luciana', 'Fernandes', '1996-08-18', '2022-03-30', NULL, 'F', 3, 3, 1),
('Ricardo', 'Almeida', '1985-06-17', '2020-07-05', NULL, 'M', 2, 2, 3),;

-- 05. Dados Fictícios para tb_ponto_eletronico
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-01 08:15:00', '2024-08-01 17:05:00', FALSE, FALSE, NULL, 5),
('2024-08-02 08:20:00', '2024-08-02 17:10:00', FALSE, FALSE, NULL, 5),
('2024-08-03 09:00:00', '2024-08-03 16:45:00', FALSE, FALSE, NULL, 6),
('2024-08-01 08:10:00', '2024-08-01 17:00:00', FALSE, FALSE, NULL, 7),
('2024-08-02 08:05:00', '2024-08-02 16:55:00', FALSE, FALSE, NULL, 8),
('2024-08-03 09:30:00', NULL, TRUE, TRUE, 'Consulta médica', 9);

INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-01 08:00:00', '2024-08-01 17:00:00', FALSE, FALSE, NULL, 1),
('2024-08-02 08:05:00', '2024-08-02 17:15:00', FALSE, FALSE, NULL, 1),
('2024-08-01 08:10:00', '2024-08-01 16:50:00', FALSE, FALSE, NULL, 2),
('2024-08-03 09:00:00', NULL, TRUE, TRUE, 'Motivos pessoais', 3),
('2024-08-01 08:00:00', '2024-08-01 17:00:00', FALSE, FALSE, NULL, 4);

INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-06 08:00:00', '2024-08-06 16:55:00', FALSE, FALSE, NULL, 1),
('2024-08-07 08:05:00', '2024-08-07 17:10:00', FALSE, FALSE, NULL, 1),
('2024-08-06 08:15:00', '2024-08-06 17:05:00', FALSE, FALSE, NULL, 2),
('2024-08-07 08:20:00', '2024-08-07 16:50:00', FALSE, FALSE, NULL, 2),
('2024-08-06 09:00:00', '2024-08-06 17:00:00', FALSE, FALSE, NULL, 3),
('2024-08-07 09:05:00', '2024-08-07 17:15:00', FALSE, FALSE, NULL, 3),
('2024-08-06 08:30:00', '2024-08-06 17:10:00', FALSE, FALSE, NULL, 4),
('2024-08-07 08:35:00', '2024-08-07 17:05:00', FALSE, FALSE, NULL, 4),
('2024-08-08 08:00:00', '2024-08-08 16:45:00', FALSE, FALSE, NULL, 5),
('2024-08-08 09:15:00', '2024-08-08 18:00:00', FALSE, FALSE, NULL, 6),
('2024-08-08 10:00:00', NULL, TRUE, TRUE, 'Problemas pessoais', 7),
('2024-08-08 08:00:00', '2024-08-08 17:00:00', FALSE, FALSE, NULL, 8),
('2024-08-09 08:15:00', '2024-08-09 17:05:00', FALSE, FALSE, NULL, 9),
('2024-08-09 09:00:00', '2024-08-09 16:55:00', FALSE, FALSE, NULL, 5),
('2024-08-10 08:00:00', '2024-08-10 17:00:00', FALSE, FALSE, NULL, 6),
('2024-08-10 09:30:00', '2024-08-10 18:00:00', FALSE, FALSE, NULL, 7),
('2024-08-10 08:00:00', NULL, TRUE, TRUE, 'Atestado médico', 8),
('2024-08-11 08:10:00', '2024-08-11 17:05:00', FALSE, FALSE, NULL, 9);

INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 08:00:00', '2024-08-12 17:00:00', FALSE, FALSE, NULL, 1),
('2024-08-12 08:10:00', '2024-08-12 17:15:00', FALSE, FALSE, NULL, 2),
('2024-08-12 09:00:00', '2024-08-12 17:30:00', FALSE, FALSE, NULL, 3),
('2024-08-12 08:05:00', '2024-08-12 17:00:00', FALSE, FALSE, NULL, 4),
('2024-08-13 08:15:00', '2024-08-13 16:45:00', FALSE, FALSE, NULL, 5),
('2024-08-13 09:30:00', '2024-08-13 18:00:00', FALSE, FALSE, NULL, 6),
('2024-08-13 10:00:00', NULL, TRUE, TRUE, 'Consulta médica', 7),
('2024-08-13 08:00:00', '2024-08-13 17:00:00', FALSE, FALSE, NULL, 8),
('2024-08-14 08:00:00', '2024-08-14 16:50:00', FALSE, FALSE, NULL, 9),
('2024-08-14 08:20:00', '2024-08-14 17:10:00', FALSE, FALSE, NULL, 1),
('2024-08-14 08:30:00', '2024-08-14 17:05:00', FALSE, FALSE, NULL, 2),
('2024-08-14 09:00:00', '2024-08-14 16:55:00', FALSE, FALSE, NULL, 3),
('2024-08-15 08:00:00', '2024-08-15 17:00:00', FALSE, FALSE, NULL, 4),
('2024-08-15 08:35:00', '2024-08-15 17:05:00', FALSE, FALSE, NULL, 5),
('2024-08-15 08:45:00', '2024-08-15 17:10:00', FALSE, FALSE, NULL, 6),
('2024-08-15 10:00:00', NULL, TRUE, TRUE, 'Problemas pessoais', 7),
('2024-08-15 08:00:00', '2024-08-15 16:50:00', FALSE, FALSE, NULL, 8),
('2024-08-16 08:10:00', '2024-08-16 17:05:00', FALSE, FALSE, NULL, 9);

INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-16 08:00:00', '2024-08-16 17:00:00', FALSE, FALSE, NULL, 1),
('2024-08-16 08:15:00', '2024-08-16 17:10:00', FALSE, FALSE, NULL, 2),
('2024-08-16 09:00:00', '2024-08-16 16:45:00', FALSE, FALSE, NULL, 3),
('2024-08-17 08:05:00', '2024-08-17 16:55:00', FALSE, FALSE, NULL, 4),
('2024-08-17 08:20:00', '2024-08-17 17:05:00', FALSE, FALSE, NULL, 5),
('2024-08-17 09:30:00', '2024-08-17 17:30:00', FALSE, FALSE, NULL, 6),
('2024-08-17 10:00:00', NULL, TRUE, TRUE, 'Falta de energia', 7),
('2024-08-18 08:00:00', '2024-08-18 17:00:00', FALSE, FALSE, NULL, 8),
('2024-08-18 08:05:00', '2024-08-18 16:50:00', FALSE, FALSE, NULL, 9),
('2024-08-18 08:10:00', '2024-08-18 17:15:00', FALSE, FALSE, NULL, 1),
('2024-08-19 09:00:00', '2024-08-19 17:10:00', FALSE, FALSE, NULL, 2),
('2024-08-19 08:30:00', '2024-08-19 17:00:00', FALSE, FALSE, NULL, 3),
('2024-08-19 08:35:00', '2024-08-19 16:55:00', FALSE, FALSE, NULL, 4);
