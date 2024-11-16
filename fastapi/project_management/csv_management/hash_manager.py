import os
import hashlib
from fastapi import HTTPException, status

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

CSV_FILE = os.path.join("db", "db.csv")


class HashManager:
    @staticmethod
    def generate_hash256():
        if not os.path.exists(CSV_FILE):
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail="O arquivo CSV não foi encontrado."
            )

        sha256_hash = hashlib.sha3_256()
        with open(CSV_FILE, "rb") as file:
            for byte_block in iter(lambda: file.read(4096), b""):
                sha256_hash.update(byte_block)
        return sha256_hash.hexdigest()
