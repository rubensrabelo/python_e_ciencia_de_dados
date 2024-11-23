import pandas as pd
import os

BASE_DIR = os.path.dirname(os.path.abspath(__file__))

CSV_FILE = os.path.join("db", "db.csv")
ZIP_FILE = os.path.join(BASE_DIR, "files", "db.zip")
header_project = ["id", "name", "description", "start_date",
                  "end_date", "completion_prediction", "status"]


class CSVManager:
    @staticmethod
    def create_csv_file():
        if not os.path.exists(CSV_FILE):
            df = pd.DataFrame(columns=header_project)
            df.to_csv(CSV_FILE, index=False)

    @staticmethod
    def read_csv():
        df = pd.read_csv(CSV_FILE, index_col="id", dtype={"id": int})
        return df

    @staticmethod
    def append_csv(data):
        df = CSVManager.read_csv()
        df_reset = df.reset_index()
        next_id = df_reset["id"].max() + 1 if not df_reset.empty else 1
        data["id"] = next_id
        if not data["end_date"]:
            data["end_date"] = ""
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
        data["end_date"] = None
        return data

    @staticmethod
    def update_csv(data_id, updated_data):
        df = CSVManager.read_csv()
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

    @staticmethod
    def delete_csv(data_id):
        df = CSVManager.read_csv()
        if data_id in df.index:
            df = df.drop(index=data_id)
            df.to_csv(CSV_FILE, index=True)
        else:
            raise ValueError("Project not found")
