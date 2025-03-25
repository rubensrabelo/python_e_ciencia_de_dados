# Importa o módulo responsável por criar e gerenciar rotas
from fastapi import APIRouter

# Importa JSONResponse para retornar respostas no formato JSON
from fastapi.responses import StreamingResponse

# Importa o módulo de status para utilizar códigos HTTP pré-definidos
from starlette import status

from csv_management.converter_manager import ZipManager

# Cria uma roteador para gerenciar as rotas da aplicação
router = APIRouter()


@router.get("/zip/", status_code=status.HTTP_200_OK)
async def convert_csv_to_zip():
    """
    Endpoint para converter o arquivo CSV em um arquivo ZIP.

    Utiliza o método `csv_to_zip` da classe `ZipManager` para realizar
    a compressão do arquivo CSV.

    Returns:
        JSONResponse: Mensagem de sucesso indicando que o arquivo CSV
        foi comprimido com sucesso.
    """
    # Chama o método que realiza a compressão do arquivo CSV
    zip = ZipManager.csv_to_zip()

    # Retorna uma resposta JSON indicando sucesso na operação
    return StreamingResponse(
        zip,
        media_type="application/x-zip-compressed",
        headers={
            "Content-Disposition": "attachment; filename=estoque_remedios.zip"
        }
    )
