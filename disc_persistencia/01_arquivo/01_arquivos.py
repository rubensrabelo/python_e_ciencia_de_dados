import sys

with open("arq.txt", "w") as file:
    for linha in sys.stdin:
        file.write(linha)
