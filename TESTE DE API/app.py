from flask import Flask, request, jsonify
import pandas as pd
import logging

app = Flask(__name__)
logging.basicConfig(level=logging.INFO)

try:
    df = pd.read_csv('TESTE DE BANCO DE DADOS/Relatorio_cadop.csv', sep=";")
    print(df)
    logging.info("CSV carregado com sucesso.")
except Exception as e:
    logging.error("Falha ao carregar o CSV: %s", e)
    df = pd.DataFrame()

@app.route('/search', methods=['GET'])
def search():
    query = request.args.get('q', '')
    if not query:
        return jsonify({"error": "O parâmetro 'q' é obrigatório."}), 400

    query_lower = query.lower()
    mask = df.apply(lambda row: row.astype(str).str.lower().str.contains(query_lower).any(), axis=1)
    results = df[mask].to_dict(orient='records')

    logging.info("Busca realizada: '%s' - %d resultado(s) encontrado(s).", query, len(results))
    return jsonify(results)

if __name__ == '__main__':
    app.run(debug=True)
