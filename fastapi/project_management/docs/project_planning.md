# Sistema de Gestão de Projetos

## Estrutura de Dados (Modelo Relacional)

### Projeto
- **id**: Identificador único do projeto (chave primária).
- **nome**: Nome do projeto.
- **descricao**: Descrição detalhada do projeto.
- **data_inicio**: Data de início do projeto.
- **data_termino**: Data de término do projeto.
- **previsao_finalizacao**: Previsão de finalização do projeto.
- **status**: Status do projeto (Ex: "Planejado", "Em andamento", "Concluído").

### Tarefa
- **id**: Identificador único da tarefa (chave primária).
- **descricao**: Descrição da tarefa.
- **previsao_entrega**: Previsão de entrega da tarefa.
- **data_inicio**: Data de início da tarefa.
- **data_finalizacao**: Data de finalização da tarefa.
- **status**: Status da tarefa (Ex: "Pendente", "Em andamento", "Concluída").
- **projeto_id**: Referência para o projeto (chave estrangeira ligada ao Projeto).

### Colaborador
- **id**: Identificador único do colaborador (chave primária).
- **nome**: Nome do colaborador.
- **email**: E-mail de contato do colaborador.
- **funcao**: Função desempenhada pelo colaborador no projeto.

### Atribuicao (Entidade de Ligação)
- **id**: Identificador único da atribuição (chave primária).
- **tarefa_id**: Referência para a tarefa (chave estrangeira ligada à Tarefa).
- **colaborador_id**: Referência para o colaborador (chave estrangeira ligada ao Colaborador).
- **data_atribuicao**: Data em que a tarefa foi atribuída ao colaborador.

## Relacionamentos
- Um **Projeto** pode ter várias **Tarefas**.
- Uma **Tarefa** pode ser atribuída a um ou mais **Colaboradores** (relação muitos-para-muitos entre Tarefa e Colaborador, com a tabela de ligação Atribuicao).
- Um **Colaborador** pode estar associado a várias **Tarefas** em diferentes **Projetos**.

## Funcionalidades Básicas do Sistema
- **CRUD de Projetos**: Criar, ler, atualizar e deletar projetos.
- **CRUD de Tarefas**: Criar, ler, atualizar e deletar tarefas vinculadas a projetos.
- **CRUD de Colaboradores**: Criar, ler, atualizar e deletar colaboradores.
- **Atribuir Tarefas a Colaboradores**: Vincular uma tarefa a um ou mais colaboradores.
- **Visualização de Progresso**: Visualizar o status das tarefas para cada projeto e gerar relatórios de produtividade.
- **Relatórios de Produtividade**: Relatórios que mostram o progresso das tarefas de cada colaborador e de cada projeto.
