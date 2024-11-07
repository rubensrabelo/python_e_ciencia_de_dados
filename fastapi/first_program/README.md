# Projeto CRUD de Livros com SQLite, SQLAlchemy e FastAPI

## Descrição

Este projeto implementa um sistema CRUD (Create, Read, Update, Delete) para gerenciar livros utilizando as tecnologias SQLite, SQLAlchemy e FastAPI. O objetivo é permitir a criação, leitura, atualização e exclusão de registros de livros em um banco de dados SQLite. Cada livro possui informações como título, autor, descrição, avaliação e data de publicação.

## Tecnologias Utilizadas

- **SQLite**: Banco de dados relacional leve e fácil de usar.
- **SQLAlchemy**: ORM (Object Relational Mapper) para interagir com o banco de dados SQLite.
- **FastAPI**: Framework para construção de APIs RESTful de alto desempenho.
- **Uvicorn**: Servidor ASGI para rodar a aplicação FastAPI.

## Estrutura do Projeto

A estrutura de pastas e arquivos do projeto é organizada da seguinte forma:

### Descrição dos Arquivos e Pastas

#### `main.py`

Este é o arquivo principal da aplicação. Ele é responsável por:
- Criar a conexão entre o FastAPI e o banco de dados SQLite.
- Iniciar a aplicação FastAPI.
- Incluir os routers para os endpoints da API.
- Criar a tabela `books` no banco de dados, se ela ainda não existir.

#### `database.py`

O arquivo `database.py` configura a conexão com o banco de dados SQLite utilizando o SQLAlchemy. Ele contém:
- A URL de conexão com o banco de dados (`SQLALCHEMY_DATABASE_URL`).
- A criação da instância do `engine` do SQLAlchemy.
- A configuração da `SessionLocal` para interagir com o banco de dados.
- A instância `Base`, que serve como classe base para todos os modelos.

#### `models/book.py`

Este arquivo define o modelo `Book` usando SQLAlchemy. O modelo é uma representação da tabela `books` no banco de dados e inclui os seguintes campos:
- `id`: Identificador único do livro (chave primária).
- `title`: Título do livro (único e obrigatório).
- `author`: Autor do livro.
- `description`: Descrição do livro.
- `rating`: Avaliação do livro (obrigatória).
- `published_date`: Data de publicação do livro.

#### `routers/book_router.py`

Este arquivo contém os endpoints da API para realizar as operações CRUD nos livros. As operações disponíveis são:
- **POST**: Criar um novo livro.
- **GET**: Listar todos os livros.
- **PUT**: Atualizar as informações de um livro existente.
- **DELETE**: Excluir um livro.
