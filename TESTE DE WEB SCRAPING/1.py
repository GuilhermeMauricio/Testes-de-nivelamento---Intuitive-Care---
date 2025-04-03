import requests
from bs4 import BeautifulSoup
import zipfile

endpoint = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

anexos = {
    "Anexo I": "Anexo_I_Rol",
    "Anexo II": "Anexo_II_DUT"
}

requisicao = requests.get(endpoint)

if requisicao.status_code == 200:
    soup = BeautifulSoup(requisicao.text, "html.parser")
    anexos_links = {}

    for a in soup.find_all("a", href=True):
        href = a["href"]
        for nome, keyword in anexos.items():
            if keyword in href and href.endswith(".pdf"):
                anexos_links[nome] = href

    zip_name = "TESTE DE WEB SCRAPING/anexos_ans.zip"
    with zipfile.ZipFile(zip_name, "w") as zipf:
        for nome, link in anexos_links.items():
            if link.startswith("/"):
                link = "https://www.gov.br" + link

            print(f"Baixando: {nome} ({link})")
            res = requests.get(link)

            if res.status_code == 200:
                zipf.writestr(f"{nome}.pdf", res.content)
                print(f"Adicionado ao ZIP: {nome}.pdf")
            else:
                print(f"Erro ao baixar {nome}")

    print(f"\nCompactação concluída: {zip_name}")

else:
    print("Erro ao acessar a página.")
