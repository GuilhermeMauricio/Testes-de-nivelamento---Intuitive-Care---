import zipfile
import pdfplumber
import pandas as pd
from io import BytesIO
import zipfile
import pdfplumber
import pandas as pd
from io import BytesIO, StringIO

zip_path = "TESTE DE WEB SCRAPING/anexos_ans.zip"
zip_saida = "TESTE DE TRANSFORMAÇÃO DE DADOS/Teste_Guilherme.zip"

substituicoes = {
    "OD": "Consulta Odontológica",
    "AMB": "Consulta Médica Ambulatorial"
}

tabelas = []

with zipfile.ZipFile(zip_path, "r") as z:
    with z.open("Anexo I.pdf") as pdf_file:
        with pdfplumber.open(BytesIO(pdf_file.read())) as pdf:
            for i, page in enumerate(pdf.pages):
                tabela = page.extract_table()
                if tabela:
                    df = pd.DataFrame(tabela[1:], columns=tabela[0])
                    tabelas.append(df)
                    print(f"Página {i+1}: tabela extraída")

# tratando os dados
df_final = pd.concat(tabelas, ignore_index=True)
for col in df_final.columns:
    df_final[col] = df_final[col].replace(substituicoes)

csv_buffer = StringIO()
df_final.to_csv(csv_buffer, index=False, encoding="utf-8-sig")
csv_buffer.seek(0)  # Voltar ao início do buffer

# compactando
with zipfile.ZipFile(zip_saida, "w") as z:
    z.writestr("rol_procedimentos.csv", csv_buffer.getvalue())

print(f"\nTransformação concluída. Arquivo final: {zip_saida}")
