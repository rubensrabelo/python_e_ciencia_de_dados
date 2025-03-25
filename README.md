# Sistema de Gestão de Projetos

Um sistema que organiza e gerencia projetos, tarefas e colaboradores, utilizando uma estrutura relacional de dados para rastrear progresso, atribuições e gerar relatórios de produtividade.

## Estrutura de Pastas e Arquivos

### Arquivos na Raiz
- **`main.py`**: Inicializa a aplicação e conecta as rotas.
- **`models.py`**: Define os modelos de dados do sistema.

### Pasta `db/`
- **`db.csv`**: Arquivo principal armazenando os dados em formato CSV.

### Pasta `csv_management/`
- **`converter_manager.py`**: Converte o arquivo CSV em um arquivo ZIP.
- **`csv_manager.py`**: Realiza manipulações no CSV, incluindo operações CRUD.
- **`hash_manager.py`**: Gera o hash SHA-256 do conteúdo do CSV.
- **`files/`**: Subpasta para armazenar os arquivos ZIP gerados.

### Pasta `api/`
- **`controller.py`**: Gerencia a integração e as rotas principais da API.
- **Subpasta `routes/`**:
  - **`converter_router.py`**: Rotas para conversão do CSV em ZIP.
  - **`hash_router.py`**: Rotas para exibir o hash SHA-256 do CSV.
  - **`project_router.py`**: CRUD para projetos e tarefas.
  - **`static_router.py`**: Contagem de projetos registrados.

### Pasta `docs/`
- Armazena documentos e planejamentos do sistema, como diagramas e relatórios.
