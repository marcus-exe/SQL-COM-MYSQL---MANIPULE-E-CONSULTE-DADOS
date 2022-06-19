USE sucos_vendas;

/* HAVING É MUITO SEMELHANTE AO WHERE
TODAVIA SOMENTE PODE SER APLICADO SOBRE UM GRUPAMENTO */

-- NÃO É POSSÍVEL USAR O WHERE EM UM ALIAS DE GRUPAMENTO
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes WHERE SOMA_LIMITE > 820000
GROUP BY ESTADO;

-- USANDO O HAVING
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
GROUP BY ESTADO HAVING SUM(LIMITE_DE_CREDITO)>900000;

-- POSSO TAMBÉS MISTURAR OS CRITÉRIOS SEM MUITAS PERCAS
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_VALOR, MIN(PRECO_DE_LISTA) AS MENOR_VALOR FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_VALOR, MIN(PRECO_DE_LISTA) AS MENOR_VALOR FROM tabela_de_produtos
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA)<=80;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_VALOR, MIN(PRECO_DE_LISTA) AS MENOR_VALOR FROM tabela_de_produtos
GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA)<=80 AND MAX(PRECO_DE_LISTA) >= 5;





SELECT * FROM notas_fiscais;
SELECT CPF, COUNT(*) AS CONTAGEM FROM notas_fiscais WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING CONTAGEM > 2000;

SELECT * FROM tabela_de_clientes;
SELECT NOME, CPF FROM tabela_de_clientes WHERE CPF IN ('3623344710','492472718','50534475787');


