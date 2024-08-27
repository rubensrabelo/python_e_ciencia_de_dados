# Sistema de Recursos Humanos

Este projeto implementa um sistema de gerenciamento de recursos humanos utilizando um banco de dados relacional. O sistema é composto por várias tabelas que armazenam informações sobre funcionários, filiais, departamentos, cargos e registros de ponto eletrônico. Além disso, há consultas SQL específicas que extraem informações relevantes do banco de dados.

## Estrutura do Projeto

### Arquivo: `create_db_and_tab.sql`

Este arquivo é responsável por criar o banco de dados e definir a estrutura das tabelas e relacionamentos. Abaixo está uma visão geral do que cada parte do arquivo faz:

- **Criação do Banco de Dados e Schema:**
  - Cria o banco de dados chamado `recursos_humanos`.
  - Define e ativa o schema `recursos_humanos`.

- **Criação das Tabelas:**
  - `tb_funcionarios`: Armazena informações pessoais dos funcionários, como nome, data de nascimento, data de admissão, e referências a departamentos, cargos e filiais.
  - `tb_filial`: Armazena informações sobre as filiais da empresa, como endereço.
  - `tb_departamento`: Armazena os nomes dos departamentos, assegurando que sejam únicos.
  - `tb_cargo`: Armazena os nomes dos cargos e os salários correspondentes.
  - `tb_ponto_eletronico`: Registra as entradas e saídas dos funcionários, incluindo informações sobre faltas e justificativas.

- **Estabelecimento dos Relacionamentos:**
  - Define chaves estrangeiras para conectar `tb_funcionarios` com `tb_departamento`, `tb_cargo`, e `tb_filial`.
  - Conecta `tb_ponto_eletronico` com `tb_funcionarios` utilizando uma chave estrangeira.

### Arquivo: `insert_the_data/01_workers.sql`

Este arquivo é utilizado para inserir dados nas tabelas criadas. Ele contém instruções SQL para popular o banco de dados com informações reais ou fictícias, permitindo a realização de consultas para análise e relatórios.

### Arquivo: `select/01_select.sql`

Este arquivo contém consultas SQL que extraem informações específicas do banco de dados. Abaixo estão as consultas incluídas:

1. **Consulta 1:** Retorna os nomes e cargos dos funcionários que trabalham na filial localizada na "Rua das Flores, 200".
2. **Consulta 2:** Retorna o nome completo e o salário do cargo ocupado pelo funcionário "Ana Costa".
3. **Consulta 3:** Lista os funcionários que tiveram registros de ponto eletrônico com falta e justificativa no mês de agosto de 2024.
4. **Consulta 4:** Lista os departamentos que possuem funcionários registrados e os nomes desses funcionários.
5. **Consulta 5:** Calcula o total de horas trabalhadas por cada funcionário no dia 12 de agosto de 2024, considerando apenas registros que incluem a hora de saída.

## Como Utilizar

1. **Criar o Banco de Dados:**
   - Execute o script `create_db_and_tab.sql` para criar o banco de dados, definir o schema e criar as tabelas e seus relacionamentos.

2. **Inserir Dados:**
   - Utilize o script `insert_the_data/01_workers.sql` para inserir os dados nas tabelas criadas.

3. **Executar Consultas:**
   - Execute as consultas no arquivo `select/01_select.sql` para obter informações específicas sobre os funcionários, suas filiais, cargos, e registros de ponto eletrônico.
