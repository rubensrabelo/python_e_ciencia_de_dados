# Importa os tipos opcionais para permitir campos que podem não ser preenchidos
from typing import Optional

# Importa a classe BaseModel e Field do Pydantic para validação de dados
from pydantic import BaseModel, Field

# Importa o tipo 'date' para trabalhar com datas
from datetime import date


# Definição do modelo de dados para solicitação
# de criação/atualização de um projeto
class ProjectRequest(BaseModel):
    id: Optional[int] = Field(default=None)
    name: str = Field(..., min_length=3, max_length=100)
    description: str = Field(..., max_length=250)
    start_date: date = Field(...)
    end_date: Optional[date] = Field(default=None)
    completion_prediction: date = Field(...)
    status: str = Field(default="Em espera")
