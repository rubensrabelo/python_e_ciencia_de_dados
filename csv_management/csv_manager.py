import pandas as pd  # Define o módulo para a interação com o CSV.
import os  # Define o módulo para a interação com o so.

# Define o módulo que possui o DataFrame
from repositories.project_repository import df_project

# Estabelece o caminho para o arquivo CSV que armazenará os dados dos projetos.
CSV_FILE = os.path.join("db", "db.csv")

# Define do cabeçalho padrão para o arquivo CSV.
header_project = ["id", "name", "description", "start_date",
                  "end_date", "completion_prediction", "status"]


class CSVManager:
    """
    Classe para gerenciar operações em um arquivo CSV.
    Inclui métodos para criar, adicionar, atualizar e excluir dados.
    """

    @staticmethod
    def create_csv_file():
        """
        Cria um arquivo CSV vazio com os cabeçalhos definidos,
        se o arquivo não existir.
        """
        # Verifica se o arquivo CSV já existe.
        if not os.path.exists(CSV_FILE):
            # Cria um DataFrame vazio com as colunas do cabeçalho.
            df = pd.DataFrame(columns=header_project)
            # Salva o DataFrame como CSV.
            df.to_csv(CSV_FILE, index=False)

    @staticmethod
    def append_csv(data):
        """
        Adiciona uma nova linha ao arquivo CSV com os dados fornecidos.

        Parameters:
            data (dict): Dados do projeto a serem adicionados.
                        Deve conter as chaves do cabeçalho.

        Returns:
            dict: Dados adicionados com o campo "id" atualizado.
        """
        # Remove o índice para facilitar o cálculo do próximo ID.
        df_reset = df_project.reset_index()

        # Calcula o próximo ID com base no valor máximo da coluna "id".
        next_id = df_reset["id"].max() + 1 if not df_reset.empty else 1
        data["id"] = next_id

        # Garante que o campo "end_date" não seja None,
        # para não ser salvo no csv.
        if not data["end_date"]:
            data["end_date"] = ""

        # Adiciona os dados ao CSV diretamente como uma nova linha.
        with open(CSV_FILE, mode="a", encoding="utf-8") as file:
            line = ",".join([
                str(data["id"]),
                data["name"],
                data["description"],
                str(data["start_date"]),
                str(data["end_date"]),
                str(data["completion_prediction"]),
                data["status"],
            ])
            file.write(line + "\n")

        # Define o "end_date" de volta como None para manter o estado original.
        if not data["end_date"]:
            data["end_date"] = None
        return data

    @staticmethod
    def update_csv(data_id, updated_data):
        """
        Atualiza os dados de um projeto existente no arquivo CSV.

        Parameters:
            data_id (int): ID do projeto a ser atualizado.
            updated_data (dict): Dados atualizados.
                        Deve conter as chaves do cabeçalho.

        Raises:
            ValueError: Se o ID do projeto não for encontrado.
        """
        # Verifica se o ID existe no DataFrame.
        if data_id in df_project.index:
            # Atualiza as colunas com os novos dados.
            df_project.loc[data_id, header_project[1:]] = [
                updated_data["name"],
                updated_data["description"],
                updated_data["start_date"],
                updated_data["end_date"],
                updated_data["completion_prediction"],
                updated_data["status"]
            ]
            # Salva as mudanças no arquivo CSV.
            df_project.to_csv(CSV_FILE, index=True)
        else:
            # Lança um erro se o ID não existir.
            raise ValueError("Project not found")

    @staticmethod
    def delete_csv(data_id):
        """
        Exclui um projeto do arquivo CSV com base no ID fornecido.

        Parameters:
            data_id (int): ID do projeto a ser excluído.

        Raises:
            ValueError: Se o ID do projeto não for encontrado.
        """
        # Verifica se o ID existe no DataFrame.
        if data_id in df_project.index:
            # Remove o projeto com o ID fornecido
            df_project.drop(index=data_id, inplace=True)
            # Salva as alterações no arquivo CSV
            df_project.to_csv(CSV_FILE, index=True)
        else:
            # Lança um erro se o ID não existir
            raise ValueError("Project not found")
