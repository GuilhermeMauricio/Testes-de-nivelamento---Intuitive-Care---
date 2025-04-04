Adendo sobre a Importação de Dados

Prezados(as) Técnicos(as),

1° - Importação dos Dados
Durante o desenvolvimento do código, constatou-se que não foi possível realizar a importação dos dados diretamente pela página de "teste de nivelamento" via repositório. A importação funcionou corretamente somente quando os arquivos foram movidos para a pasta:


C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/

Portanto, para que o código funcione como esperado, é necessário que os arquivos a serem importados estejam localizados nessa pasta. Essa limitação deve-se à configuração de segurança do MySQL, que, por padrão, restringe a importação de arquivos apenas ao diretório especificado na variável secure_file_priv.

2° - Retorno do Script – Item 3.5
Ao final do script, foram inseridas duas versões de retorno referentes ao item 3.5. Essa abordagem foi adotada porque as tabelas geradas podem variar conforme a coluna utilizada para o agrupamento. Em alguns arquivos CSV, a coluna "nome_fantasia" está vazia, o que afeta diretamente o resultado dos agrupamentos.

Agradeço a atenção e fico à disposição para quaisquer esclarecimentos.