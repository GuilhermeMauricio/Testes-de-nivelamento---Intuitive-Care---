Adendo sobre a Importação de Dados

Caros técnicos,

Durante o desenvolvimento do código, não foi possível realizar a importação dos dados diretamente pela página de "teste de nivelamento" via repositório. A importação funcionou corretamente apenas quando os arquivos foram movidos para a pasta:

C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/

Portanto, para que o código funcione como esperado, é necessário que os arquivos a serem importados estejam localizados nessa pasta.

Essa limitação se deve à configuração de segurança do MySQL, que, por padrão, restringe a importação de arquivos apenas para o diretório especificado na variável secure_file_priv.

Obrigado e boa revisão!