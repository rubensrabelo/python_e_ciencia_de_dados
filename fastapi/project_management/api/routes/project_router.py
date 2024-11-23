# Importa APIRouter para criar rotas na API
# e HTTPException para lidar com erros HTTP.
from fastapi import APIRouter, HTTPException

# Importa o módulo de status para utilizar códigos HTTP pré-definidos.
from starlette import status

# Importa pandas para manipulação de dados.
import pandas as pd

# Importa a classe CSVManager para gerenciar operações no arquivo CSV.
from csv_management.csv_manager import CSVManager

# Importa o modelo ProjectRequest que define a estrutura
# esperada para projetos.
from models import ProjectRequest

# Cria o roteador para gerenciar rotas relacionadas aos projetos.
router = APIRouter()

# Cria o arquivo CSV na pasta db.
CSVManager.create_csv_file()


@router.get("/", status_code=status.HTTP_200_OK)
async def find_all_projects():
    """
    Endpoint para buscar todos os projetos.

    Este endpoint utiliza o método `read_csv` para carregar todos os registros
    do arquivo CSV, ajusta o valor de `end_date` para `None` quando não está
    definido, e retorna todos os registros como uma lista de dicionários.

    Returns:
        list[dict]: Lista contendo todos os projetos.
    """
    # Lê o arquivo CSV e ajusta valores de 'end_date' nulos para None.
    df = CSVManager.read_csv()
    df["end_date"] = df["end_date"].apply(lambda x: None if pd.isna(x) else x)

    # Retorna os registros no formato de lista de dicionários.
    return df.reset_index().to_dict(orient="records")


@router.get("/{project_id}", status_code=status.HTTP_200_OK)
async def find_project_by_id(project_id: int):
    """
    Endpoint para buscar um projeto pelo seu ID.

    Args:
        project_id (int): ID do projeto a ser buscado.

    Returns:
        dict: Dados do projeto correspondente.

    Raises:
        HTTPException: Caso o projeto não seja encontrado.
    """
    # Lê o arquivo CSV e ajusta valores de 'end_date' nulos para None.
    df = CSVManager.read_csv()
    df["end_date"] = df["end_date"].apply(lambda x: None if pd.isna(x) else x)

    # Verifica se o ID do projeto existe no índice do DataFrame.
    if project_id not in df.index:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="Project not found")

    # Retorna os dados do projeto como dicionário.
    project = df.loc[project_id]
    return project.to_dict()


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_project(project_request: ProjectRequest):
    """
    Endpoint para criar um novo projeto.

    Args:
        project_request (ProjectRequest): Dados do projeto a ser criado.

    Returns:
        dict: Dados do projeto criado, incluindo o ID.
    """
    # Converte o objeto ProjectRequest para um dicionário.
    project_data = project_request.model_dump()

    # Adiciona os dados do projeto ao CSV e retorna os dados atualizados.
    project_data = CSVManager.append_csv(project_data)

    # Garante que o ID seja retornado como inteiro.
    project_data["id"] = int(project_data["id"])
    return project_data


@router.put("/{project_id}", status_code=status.HTTP_200_OK)
async def update_project(project_id: int, project_request: ProjectRequest):
    """
    Endpoint para atualizar um projeto existente.

    Args:
        project_id (int): ID do projeto a ser atualizado.
        project_request (ProjectRequest): Dados atualizados do projeto.

    Returns:
        dict: Dados do projeto atualizado.

    Raises:
        HTTPException: Caso o projeto não seja encontrado.
    """
    try:
        # Atualiza os dados do projeto no CSV.
        CSVManager.update_csv(project_id, project_request.model_dump())

        # Retorna os dados atualizados do projeto.
        updated_data = project_request.model_dump()
        updated_data["id"] = project_id
        return updated_data
    except ValueError as e:
        # Lança uma exceção HTTP caso o ID não exista.
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=str(e))


@router.delete("/{project_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_project(project_id: int):
    """
    Endpoint para deletar um projeto pelo ID.

    Args:
        project_id (int): ID do projeto a ser deletado.

    Raises:
        HTTPException: Caso o projeto não seja encontrado.
    """
    try:
        # Deleta o projeto no arquivo CSV.
        CSVManager.delete_csv(project_id)
    except ValueError as e:
        # Lança uma exceção HTTP caso o ID não exista.
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,
                            detail=str(e))
