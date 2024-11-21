import os  # Define o módulo para a interação com o so.
import hashlib  # Define o módulo para gerar e manipular hashes

# Obtém o diretório base do arquivo atual.
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Estabelece Caminho para o arquivo CSV para qual o hash será gerado.
CSV_FILE = os.path.join("db", "db.csv")


class HashManager:
    """
    Classe responsável para gerar o hash SHA-256 de um arquivo
    """

    @staticmethod
    def generate_hash256():
        """
        Gera o hash SHA-256 do arquivo CSV especificado.

        O arquivo CSV será lido em modo binário e seu conteúdo será passado
        para o algoritmo de hash SHA-256. O valor do hash gerado será
        retornado como uma string hexadecimal.
        """

        # Abre o arquivo CSV no modo binário ('rb') para leitura.
        with open(CSV_FILE, "rb") as file:
            # Lê todo o conteúdo do arquivo e gera o hash SHA-256. O resultado
            # é retornado como um valor hexadecimal.
            return hashlib.sha256(file.read()).hexdigest()
