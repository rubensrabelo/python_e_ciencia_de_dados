# Importa o módulo APIRouter do FastAPI para criar um roteador principal
from fastapi import APIRouter

# Importa os roteadores individuais de cada funcionalidade
from .routes.project_router import router as project_router
from .routes.statistic_router import router as static_router
from .routes.converter_router import router as converter_router
from .routes.hash_router import router as hash_router

# Cria uma roteador para gerenciar as rotas da aplicação
api_router = APIRouter()

# Inclui o roteador de gerenciamento de projetos com o prefixo "/projects"
api_router.include_router(project_router, prefix="/projects",
                          tags=["Projects"])

# Inclui o roteador de estatísticas com o prefixo "/statistic"
api_router.include_router(static_router, prefix="/statistic",
                          tags=["Quantity"])

# Inclui o roteador de conversão com o prefixo "/converter"
api_router.include_router(converter_router, prefix="/converter", tags=["Zip"])

# Inclui o roteador de geração de hash com o prefixo "/hash"
api_router.include_router(hash_router, prefix="/hash", tags=["Hash"])
