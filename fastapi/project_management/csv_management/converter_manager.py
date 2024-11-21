import os  # Define o módulo para a interação com o so.
import zipfile  # Define módulo para a manipulação de arquivos zip.

# Obtém o diretório base do arquivo atual.
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Estabelece o Caminho para o arquivo CSV que será compactado.
CSV_FILE = os.path.join("db", "db.csv")

# Estabelece o caminho para o arquivo ZIP onde o CSV será armazenado.
# O arquivo será armazenado na subpasta `files` de `csv_management`
ZIP_FILE = os.path.join(BASE_DIR, "files", "db.zip")


class ZipManager:
    """
    Classe responsável por gerenciar operações relacionadas aos arquivos ZIP.
    """

    @staticmethod
    def csv_to_zip():
        """
        Compacta o arquivo CSV especificado em um arquivo ZIP.

        O arquivo ZIP será gerado no caminho especificado pela
        variável `ZIP_FILE` e terá o mesmo nome do arquivo original.
        """

        # Cria ou subscreve o arquivo ZIP em modo de escrita ('w').
        with zipfile.ZipFile(ZIP_FILE, "w") as file:
            # Adiciona o CSV específicado e converte-o em ZIP
            # para o caminho definido
            file.write(CSV_FILE, arcname=os.path.basename(CSV_FILE))
