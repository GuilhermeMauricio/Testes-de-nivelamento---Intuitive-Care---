import requests
from bs4 import BeautifulSoup

# URL da página onde estão os anexos
url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

# Lista de anexos com os respectivos nomes e palavras-chave para encontrar os links
anexos = {
    "Anexo I": "Anexo_I_Rol",
    "Anexo II": "Anexo_II_DUT"
}

# Faz a requisição HTTP para obter o conteúdo da página
response = requests.get(url)

# Verifica se a requisição foi bem-sucedida
if response.status_code == 200:
    # Cria um objeto BeautifulSoup para processar o HTML
    soup = BeautifulSoup(response.text, "html.parser")

    # Dicionário para armazenar os links encontrados
    anexos_links = {}

    # Encontra os links dos anexos (I e II)
    for a in soup.find_all("a", href=True):
        for nome, keyword in anexos.items():
            if keyword in a["href"]:
                anexos_links[nome] = a["href"]

    # Função para baixar um arquivo
    def baixar_anexo(nome, link):
        if link:
            # Ajusta o link caso seja relativo
            if link.startswith("/"):
                link = "https://www.gov.br" + link

            print(f"Baixando: {nome} ({link})")
            
            # Faz o download do arquivo
            response = requests.get(link)
            
            # Define a extensão do arquivo com base na URL
            extensao = link.split(".")[-1]
            
            # Salva o arquivo localmente
            with open(f"{nome}.{extensao}", "wb") as file:
                file.write(response.content)
            
            print(f"Download concluído: {nome}.{extensao}")
        else:
            print(f"Não foi possível encontrar o link do {nome}.")

    # Baixa os anexos encontrados
    for nome, link in anexos_links.items():
        baixar_anexo(nome, link)

else:
    print("Erro ao acessar a página.")
