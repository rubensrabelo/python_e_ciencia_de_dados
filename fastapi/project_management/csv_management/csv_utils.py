import pandas as pd
import os
import zipfile
import hashlib

CSV_FILE = "db/db.csv"
ZIP_FILE = "converter/files/db.zip"
header_project = ["id", "name", "description", "start_date",
                  "end_date", "completion_prediction", "status"]


def create_csv_file():
    if not os.path.exists(CSV_FILE):
        df = pd.DataFrame(columns=header_project)
        df.to_csv(CSV_FILE, index=False)


def read_csv():
    return pd.read_csv(CSV_FILE, index_col="id", dtype={"id": int})


def append_csv(data):
    df = read_csv()
    df_reset = df.reset_index()
    next_id = df_reset["id"].max() + 1 if not df_reset.empty else 1
    data["id"] = next_id
    new_df = pd.DataFrame([data], columns=header_project)
    df_reset = pd.concat([df_reset, new_df], ignore_index=True)
    df_reset = df_reset.set_index("id")
    df_reset.to_csv(CSV_FILE, index=True)


def update_csv(data_id, updated_data):
    df = read_csv()
    if data_id in df.index:
        df.loc[data_id, header_project[1:]] = [
            updated_data["name"],
            updated_data["description"],
            updated_data["start_date"],
            updated_data["end_date"],
            updated_data["completion_prediction"],
            updated_data["status"]
        ]
        df.to_csv(CSV_FILE, index=True)
    else:
        raise ValueError("Project not found")


def delete_csv(data_id):
    df = read_csv()
    if data_id in df.index:
        df = df.drop(index=data_id)
        df.to_csv(CSV_FILE, index=True)
    else:
        raise ValueError("Project not found")


def csv_to_zip():
    with zipfile.ZipFile(ZIP_FILE, "w") as file:
        file.write(CSV_FILE, arcname=os.path.basename(CSV_FILE))


def generate_hash256():
    sha256_hash = hashlib.sha3_256()
    with open(CSV_FILE, "rb") as file:
        for byte_block in iter(lambda: file.read(4096), b""):
            sha256_hash.update(byte_block)
    return sha256_hash.hexdigest()
