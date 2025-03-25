# Importa o módulo responsável por criar e gerenciar rotas
from fastapi import APIRouter

# Importa JSONResponse para retornar respostas no formato JSON
from fastapi.responses import JSONResponse

# Importa o módulo de status para utilizar códigos HTTP pré-definidos
from starlette import status

# Importa a classe HashManager, responsável
# por gerar o hash SHA-256 do arquivo CSV
from csv_management.hash_manager import HashManager

# Cria uma roteador para gerenciar as rotas da aplicação
router = APIRouter()


@router.get("/sha256/", status_code=status.HTTP_200_OK)
async def get_csv_sha256():
    """
    Endpoint para calcular o hash SHA-256 de um arquivo CSV.

    Este endpoint utiliza o método `generate_hash256` da classe `HashManager`
    para gerar o hash SHA-256 do conteúdo do arquivo CSV.

    Returns:
        JSONResponse: Retorna um JSON contendo o hash SHA-256 gerado.
    """
    # Gera o hash SHA-256 utilizando o método da classe HashManager
    hash_sha256 = HashManager.generate_hash256()

    # Retorna o hash gerado no formato JSON
    return JSONResponse(content={"sha256": hash_sha256})
