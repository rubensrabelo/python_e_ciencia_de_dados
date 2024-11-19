import os
import hashlib

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

CSV_FILE = os.path.join("db", "db.csv")


class HashManager:
    @staticmethod
    def generate_hash256():
        sha256_hash = hashlib.sha3_256()
        with open(CSV_FILE, "rb") as file:
            for byte_block in iter(lambda: file.read(4096), b""):
                sha256_hash.update(byte_block)
        return sha256_hash.hexdigest()
