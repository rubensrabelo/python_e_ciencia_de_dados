import os
import zipfile

# Obtém o diretório base do arquivo atual.
BASE_DIR = os.path.dirname(os.path.abspath(__file__))

# Caminho para o arquivo CSV que será compactado.
CSV_FILE = os.path.join("db", "db.csv")

# Caminho para o arquivo ZIP onde o CSV será armazenado.
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

        # Cria o arquivo ZIP e adiciona o CSV a ele.
        with zipfile.ZipFile(ZIP_FILE, "w") as file:
            file.write(CSV_FILE, arcname=os.path.basename(CSV_FILE))
