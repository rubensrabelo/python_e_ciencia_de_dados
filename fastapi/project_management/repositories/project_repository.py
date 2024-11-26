import pandas as pd  # Define o módulo para a interação com o CSV.
import os  # Define o módulo para a interação com o so.

# Estabelece o caminho para o arquivo CSV que armazenará os dados dos projetos.
CSV_FILE = os.path.join("db", "db.csv")

# Define uma variável para guardar o DataFrame
df_project = pd.read_csv(CSV_FILE, index_col="id")
