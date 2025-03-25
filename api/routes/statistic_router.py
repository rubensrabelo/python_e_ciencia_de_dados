# Importa o módulo responsável por criar e gerenciar rotas
from fastapi import APIRouter

# Importa JSONResponse para retornar respostas no formato JSON
from fastapi.responses import JSONResponse

# Importa o módulo de status para utilizar códigos HTTP pré-definidos
from starlette import status

# Importa a classe CSVManager, responsável
# por gerenciar operações no arquivo CSV
from csv_management.csv_manager import CSVManager

# Cria uma roteador para gerenciar as rotas da aplicação
router = APIRouter()


@router.get("/count/", status_code=status.HTTP_200_OK)
async def count_quantity():
    """
    Endpoint para contar a quantidade de registros no arquivo CSV.

    Este endpoint utiliza o método `read_csv` da classe `CSVManager`
    para carregar o conteúdo do arquivo CSV como um DataFrame do pandas
    e calcula a quantidade total de registros.

    Returns:
        JSONResponse: Retorna um JSON contendo a contagem total
        de registros no CSV.
    """
    # Lê o arquivo CSV e carrega como um DataFrame
    df = CSVManager.read_csv()

    # Calcula a quantidade de registros no DataFrame
    quantity = len(df)

    # Retorna a quantidade total de registros no formato JSON
    return JSONResponse(content={"count": quantity})
