import os
import zipfile
from fastapi import HTTPException, status

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

CSV_FILE = os.path.join("db", "db.csv")
ZIP_FILE = os.path.join(BASE_DIR, "files", "db.zip")


class ZipManager:
    @staticmethod
    def csv_to_zip():
        if not os.path.exists(CSV_FILE):
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="O arquivo CSV não foi encontrado."
            )

        with zipfile.ZipFile(ZIP_FILE, "w") as file:
            file.write(CSV_FILE, arcname=os.path.basename(CSV_FILE))
