use sucos_vendas;
 
-- VIEW -> É UMA TABELA LÓGICA, RESULTADO DE UMA CONSULTA E POSTERIORMENTE PODERÁ SER USADO EM OUTRAS CONSULTAS
-- VW_NOMEDAVIEW -> ESSE É UM PADRÃO DADO COMO NOME PARA AS NOSSAS VIEWS


SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM;

-- PODEMOS SELECIONAR DESSA MANEIRA
SELECT X.EMBALAGEM, X.MAIOR_PRECO FROM
(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM tabela_de_produtos
GROUP BY EMBALAGEM) AS X WHERE X.MAIOR_PRECO >= 10;

-- OU DEPOIS DE TER CRIADO UMA VIEW TEMOS
SELECT X.EMBALAGEM, X.MAIOR_PRECO FROM
vw_maiores_embalagens AS X WHERE X.MAIOR_PRECO >= 10;

-- PODEMOS FAZER UM INNER JOIN DE FORMA A COMPARAR O PREÇO DA LISTA E O MAIOR PREÇO (VW)
SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO	
FROM (tabela_de_produtos AS A) INNER JOIN (vw_maiores_embalagens AS X)
ON A.EMBALAGEM = X.EMBALAGEM;

-- PEQUENA VARIAÇÃO DO CÓDIGO ACIMA
SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO,
(1 - (A.PRECO_DE_LISTA / X.MAIOR_PRECO)) * 100 AS PERCENTUAL  	
FROM (tabela_de_produtos AS A) INNER JOIN (vw_maiores_embalagens AS X)
ON A.EMBALAGEM = X.EMBALAGEM;
