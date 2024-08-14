-- Definido o schema

SET SCHEMA recursos_humanos;

-- Inserindo dados na tabela 'tb_filial'

INSERT INTO tb_filial (rua, cidade, estado, pais) VALUES
('Avenida Paulista, 1000', 'São Paulo', 'São Paulo', 'Brasil');


-- Inserindo dados na tabela 'tb_depatamento'
INSERT INTO tb_departamento (nome) VALUES
('Recursos Humanos'),
('Financeiro'),
('Marketing'),
('Vendas'),
('TI'),
('Compras');


-- Inserindo dados na tabela 'tb_cargo'

INSERT INTO tb_cargo (nome, salario) VALUES
('Analista de Recursos Humanos', 1500.00),
('Contador', 2500.00),
('Analista de Marketing', 1900.00),
('Vendedor', 1500.00),
('Desenvolvedor', 2500.00),
('Analista de Compras', 2500.00);


-- Inserindo dados na tabela 'tb_funcionario'

-- Funcionários de Recursos Humanos
INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('Ana', 'Silva', '1985-05-10', '2021-03-15 09:00:00', NULL, 'F', 1, 1, 1);

-- Funcionários de Financeiro
INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('João', 'Oliveira', '1982-03-22', '2019-05-12 09:00:00', NULL, 'M', 2, 2, 1);

-- Funcionários de Marketing
INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('Laura', 'Martins', '1991-04-05', '2022-02-15 09:00:00', NULL, 'F', 3, 3, 1);

-- Funcionários de Vendas
INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('Marcos', 'Ribeiro', '1980-11-19', '2017-10-01 09:00:00', NULL, 'M', 4, 4, 1),
('Sofia', 'Gomes', '1994-02-11', '2020-08-17 09:00:00', NULL, 'F', 4, 4, 1),
('Pedro', 'Fernandes', '1986-01-29', '2021-05-23 09:00:00', NULL, 'M', 4, 4, 1);

-- Funcionários de TI
INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('Lucas', 'Silveira', '1989-10-02', '2019-07-10 09:00:00', NULL, 'M', 5, 5, 1),
('Carolina', 'Dias', '1984-03-06', '2022-11-22 09:00:00', NULL, 'F', 5, 5, 1);


-- Funcionários de Compras
INSERT INTO tb_funcionarios (nome, sobrenome, data_nascimento, data_admissao, data_desligamento, sexo, departamento_id, cargo_id, filial_id) VALUES
('Patrícia', 'Nascimento', '1988-06-22', '2023-02-18 09:00:00', NULL, 'F', 6, 6, 1);



-- Inserindo dados na tabela 'tb_ponto_eletronico'
-- Ponto Eletrônico para Ana Silva (Recursos Humanos)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 08:30:00', '2024-08-12 17:30:00', FALSE, FALSE, NULL, 1);

-- Ponto Eletrônico para João Oliveira (Financeiro)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 09:00:00', '2024-08-12 18:00:00', FALSE, FALSE, NULL, 2);

-- Ponto Eletrônico para Laura Martins (Marketing)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 08:45:00', '2024-08-12 17:45:00', FALSE, FALSE, NULL, 3);

-- Ponto Eletrônico para Marcos Ribeiro (Vendas)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 09:15:00', '2024-08-12 18:15:00', FALSE, FALSE, NULL, 4);

-- Ponto Eletrônico para Sofia Gomes (Vendas)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 09:10:00', '2024-08-12 18:10:00', FALSE, FALSE, NULL, 5);

-- Ponto Eletrônico para Pedro Fernandes (Vendas)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 09:05:00', '2024-08-12 18:05:00', FALSE, FALSE, NULL, 6);

-- Ponto Eletrônico para Lucas Silveira (TI)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 08:50:00', '2024-08-12 17:50:00', FALSE, FALSE, NULL, 7);

-- Ponto Eletrônico para Carolina Dias (TI)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 08:40:00', '2024-08-12 17:40:00', FALSE, FALSE, NULL, 8);

-- Ponto Eletrônico para Patrícia Nascimento (Compras)
INSERT INTO tb_ponto_eletronico (data_hora_entrada, data_hora_saida, falta, justificativa, descricao_justificativa, funcionario_id) VALUES
('2024-08-12 08:55:00', '2024-08-12 17:55:00', FALSE, FALSE, NULL, 9);
