# Importa o módulo FastAPI para criar a aplicação web
from fastapi import FastAPI

# Importa o roteador principal da API que agrega os módulos de rotas
from api.controller import api_router

# Cria uma instância do FastAPI para a aplicação
app = FastAPI()

# Inclui o roteador principal na aplicação FastAPI
app.include_router(api_router)
