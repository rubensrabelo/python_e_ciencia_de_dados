import os  # Define o módulo para a interação com o so.
from io import BytesIO
import zipfile  # Define módulo para a manipulação de arquivos zip.

# Estabelece o Caminho para o arquivo CSV que será compactado.
CSV_FILE = os.path.join("db", "db.csv")


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

        zip_buffer = BytesIO()

        # Cria ou subscreve o arquivo ZIP em modo de escrita ('w').
        with zipfile.ZipFile(zip_buffer, "w", zipfile.ZIP_DEFLATED) as file:
            # Adiciona o CSV específicado e converte-o em ZIP
            # para o caminho definido
            file.write(CSV_FILE, arcname=os.path.basename(CSV_FILE))
        zip_buffer.seek(0)

        return zip_buffer
