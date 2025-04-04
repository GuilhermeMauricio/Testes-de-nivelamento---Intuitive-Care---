
-- criação da database
CREATE DATABASE IF NOT EXISTS ans_dados
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;
  
USE ans_dados;

-- criação das tabelas
CREATE TABLE IF NOT EXISTS operadoras (
    registro_ans VARCHAR(20) PRIMARY KEY,
    cnpj VARCHAR(20),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    modalidade VARCHAR(100),
    logradouro VARCHAR(255),
    numero VARCHAR(20),
    complemento VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    uf CHAR(2),
    cep VARCHAR(20),
    ddd VARCHAR(5),
    telefone VARCHAR(20),
    fax VARCHAR(20),
    endereco_eletronico VARCHAR(255),
    representante VARCHAR(255),
    cargo_representante VARCHAR(100),
    regiao_comercializacao VARCHAR(50),
    data_registro DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS demonstracoes_contabeis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE,
    registro_ans VARCHAR(20),
    codigo_contabil VARCHAR(20),
    descricao TEXT,
    valor_saldo_inicial DECIMAL(18,2),
    valor_saldo_final DECIMAL(18,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- importação dos dados coletados no site 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
REPLACE
INTO TABLE operadoras
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  registro_ans,
  cnpj,
  razao_social,
  nome_fantasia,
  modalidade,
  logradouro,
  numero,
  complemento,
  bairro,
  cidade,
  uf,
  cep,
  ddd,
  telefone,
  fax,
  endereco_eletronico,
  representante,
  cargo_representante,
  regiao_comercializacao,
  @data_registro
)
SET data_registro = STR_TO_DATE(NULLIF(@data_registro, ''), '%Y-%m-%d');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%Y-%m-%d'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%Y-%m-%d'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%Y-%m-%d'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2023.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%d/%m/%Y'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%Y-%m-%d'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%Y-%m-%d'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%Y-%m-%d'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2024.csv'
INTO TABLE demonstracoes_contabeis
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES (
  @data,
  registro_ans,
  codigo_contabil,
  descricao,
  @valor_saldo_inicial,
  @valor_saldo_final
)
SET
  data = STR_TO_DATE(NULLIF(@data, ''), '%Y-%m-%d'),
  valor_saldo_inicial = CAST(REPLACE(NULLIF(@valor_saldo_inicial, ''), ',', '.') AS DECIMAL(18,2)),
  valor_saldo_final = CAST(REPLACE(NULLIF(@valor_saldo_final, ''), ',', '.') AS DECIMAL(18,2));
  
  
  
-- Resultado Trimestral, agrupando por razão social 
SELECT 
    o.razao_social, 
    SUM(d.valor_saldo_final) AS total_despesas
FROM operadoras o
JOIN demonstracoes_contabeis d ON o.registro_ans = d.registro_ans
WHERE d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
  AND d.data BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;

  
  -- Resultado Trimestral, agrupando por nome_fantasia
SELECT 
    o.nome_fantasia, 
    SUM(d.valor_saldo_final) AS total_despesas
FROM operadoras o
JOIN demonstracoes_contabeis d ON o.registro_ans = d.registro_ans
WHERE d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
  AND d.data BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY o.nome_fantasia
ORDER BY total_despesas DESC
LIMIT 10;


-- Resultado Anual, agrupando por razão social 
SELECT 
    o.razao_social, 
    SUM(d.valor_saldo_final) AS total_despesas
FROM operadoras o
JOIN demonstracoes_contabeis d ON o.registro_ans = d.registro_ans
WHERE d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
  AND d.data BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY o.razao_social
ORDER BY total_despesas DESC
LIMIT 10;

-- Resultado Anual, agrupando por nome_fantasia
SELECT 
    o.nome_fantasia, 
    SUM(d.valor_saldo_final) AS total_despesas
FROM operadoras o
JOIN demonstracoes_contabeis d ON o.registro_ans = d.registro_ans
WHERE d.descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
  AND d.data BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY o.nome_fantasia
ORDER BY total_despesas DESC
LIMIT 10;



-- selecionando tudo, com intuito de visualizar todos os dados
--SELECT * FROM operadoras LIMIT 100000;

-- apagando tabelas, ajuste durante desenvolvimento 
-- DROP TABLE demonstracoes_contabeis;

