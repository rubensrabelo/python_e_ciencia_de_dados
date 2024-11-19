import os
import zipfile

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

CSV_FILE = os.path.join("db", "db.csv")
ZIP_FILE = os.path.join(BASE_DIR, "files", "db.zip")


class ZipManager:
    @staticmethod
    def csv_to_zip():
        with zipfile.ZipFile(ZIP_FILE, "w") as file:
            file.write(CSV_FILE, arcname=os.path.basename(CSV_FILE))
