-- 1. Quais são os nomes e cargos dos funcionários que trabalham na filial localizada na Rua das Flores, 200?

SELECT f.nome AS nome_funcionario, c.nome AS nome_cargo FROM tb_funcionarios f
    INNER JOIN tb_cargo c ON c.id = f.cargo_id
    INNER JOIN tb_filial fl ON fl.id = f.filial_id
    WHERE fl.rua = 'Rua das Flores, 200';

-- 2. Qual é o nome e o salário do cargo ocupado pelo funcionário chamado "Ana Costa"?

SELECT CONCAT(f.nome, ' ', f.sobrenome) AS nome_completo, c.nome AS cargo, c.salario FROM tb_funcionarios f
    INNER JOIN tb_cargo c ON c.id = f.cargo_id 
    WHERE f.nome = 'Ana' AND f.sobrenome = 'Costa';

-- 3. Quais funcionários têm registros de ponto eletrônico com falta e justificativa no mês de agosto de 2024?

SELECT CONCAT(f.nome, ' ', f.sobrenome) AS nome_completo, pe.descricao_justificativa FROM tb_funcionarios f
    INNER JOIN tb_ponto_eletronico pe ON pe.funcionario_id = f.id
    WHERE pe.falta=true and pe.justificativa=true
    and pe.data_hora_entrada BETWEEN '2024-08-01' AND '2024-08-31';

-- 4. Quais são os departamentos que possuem funcionários registrados, e quais são os nomes desses funcionários?

SELECT CONCAT(f.nome, ' ', f.sobrenome) AS nome_completo,  dp.nome AS departamento
FROM tb_funcionarios f
    INNER JOIN tb_departamento dp ON dp.id = f.departamento_id; 

-- 5. Qual é o número total de horas trabalhadas por cada funcionário no dia 2024-08-12, considerando apenas os registros de ponto eletrônico que incluem a hora de saída?

SELECT 
    CONCAT(f.nome, ' ', f.sobrenome) AS nome_completo,
    SUM(EXTRACT(EPOCH FROM (pe.data_hora_saida - pe.data_hora_entrada))/3600) AS total_horas_trabalhadas
FROM tb_funcionarios f
    INNER JOIN tb_ponto_eletronico pe ON pe.funcionario_id = f.id
    WHERE pe.data_hora_entrada::date = '2024-08-12'
        AND pe.data_hora_saida IS NOT NULL
    GROUP BY f.nome, f.sobrenome;