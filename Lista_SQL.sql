Lista de exercícios SQL
---
Parte 1
---
Crie, no seu banco de dados, a tabela abaixo, insira os valores apresentados e em
seguida escreva as consultas solicitadas abaixo.
OBS: Os valores em branco devem ser nulos no banco de dados.

CREATE TABLE vendas (
    ID_NF INT,
    ID_ITEM INT,
    COD_PROD INT,
    VALOR_UNIT DECIMAL(10,2),
    QUANTIDADE INT,
    DESCONTO INT
);

Inserção dos dados:
INSERT INTO vendas VALUES
(11, 1, 125, 25.00, 10, NULL),
(11, 2, 135, 13.50, 3, NULL),
(11, 3, 145, 15.00, 2, NULL),
(11, 4, 155, 10.00, 1, NULL),
(12, 1, 125, 30.00, 1, NULL),
(12, 2, 135, 13.50, 4, NULL),
(12, 3, 145, 15.00, 2, NULL),
(12, 4, 155, 10.00, 5, NULL),
(13, 1, 125, 30.00, 7, NULL),
(13, 2, 135, 13.50, 5, NULL),
(13, 3, 145, 15.00, 4, NULL),
(13, 4, 155, 10.00, 3, NULL),
(14, 1, 125, 30.00, 10, NULL),
(14, 2, 135, 13.50, 1, NULL),
(15, 1, 125, 25.00, 4, NULL),
(15, 2, 135, 13.50, 2, NULL),
(16, 1, 125, 25.00, 2, NULL),
(16, 2, 135, 13.50, 2, NULL),
(16, 3, 145, 15.00, 2, NULL),
(16, 4, 155, 10.00, 2, NULL),
(17, 1, 125, 25.00, 3, NULL),
(17, 2, 135, 13.50, 2, NULL),
(17, 3, 145, 15.00, 1, NULL),
(17, 4, 155, 10.00, 1, NULL),
(18, 1, 125, 25.00, 3, NULL),
(18, 2, 135, 13.50, 2, NULL),
(18, 3, 145, 15.00, 2, NULL),
(18, 4, 155, 10.00, 2, NULL);

a) Pesquise os itens que foram vendidos sem desconto. As colunas presentes no
resultado da consulta são: ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT
Resposta:
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT
FROM vendas
WHERE DESCONTO IS NULL;

b) Pesquise os itens que foram vendidos com desconto. As colunas presentes no
resultado da consulta são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT E O VALOR
VENDIDO. OBS: O valor vendido é igual ao VALOR_UNIT -
(VALOR_UNIT*(DESCONTO/100)).
Resposta:
SELECT
    ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT,
    VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100)) AS VALOR_VENDIDO
FROM vendas
WHERE DESCONTO IS NOT NULL;

c) Altere o valor do desconto (para zero) de todos os registros onde este campo é nulo.
Resposta:
UPDATE vendas
SET DESCONTO = 0
WHERE DESCONTO IS NULL;

d) Pesquise os itens que foram vendidos. As colunas presentes no resultado da consulta
são: ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_TOTAL, DESCONTO,
VALOR_VENDIDO. OBS: O VALOR_TOTAL é obtido pela fórmula: QUANTIDADE *
VALOR_UNIT. O VALOR_VENDIDO é igual a VALOR_UNIT -
(VALOR_UNIT*(DESCONTO/100)).
Resposta:
SELECT
    ID_NF,
    ID_ITEM,
    COD_PROD,
    VALOR_UNIT,
    QUANTIDADE * VALOR_UNIT AS VALOR_TOTAL,
    DESCONTO,
    VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100)) AS VALOR_VENDIDO
FROM vendas;

e) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O
VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o
resultado da consulta por ID_NF.
Resposta:
SELECT
    ID_NF,
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL
FROM vendas
GROUP BY ID_NF
ORDER BY VALOR_TOTAL DESC;

f) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O
VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O
VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)). Agrupe
o resultado da consulta por ID_NF.
Resposta:
SELECT
    ID_NF,
    SUM(QUANTIDADE * (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100)))) AS VALOR_VENDIDO
FROM vendas
GROUP BY ID_NF
ORDER BY VALOR_VENDIDO DESC;

g) Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da
consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por
COD_PROD.
Resposta:
SELECT
    COD_PROD,
    SUM(QUANTIDADE) AS QUANTIDADE
FROM vendas
GROUP BY COD_PROD
ORDER BY QUANTIDADE DESC
LIMIT 1;

h) Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.
Agrupe o resultado da consulta por ID_NF, COD_PROD.
Resposta:
SELECT
    ID_NF,
    COD_PROD,
    QUANTIDADE
FROM vendas
WHERE QUANTIDADE > 10
GROUP BY ID_NF, COD_PROD, QUANTIDADE;

i) Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o
resultado do maior valor para o menor. As colunas presentes no resultado da consulta
são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE
* VALOR_UNIT. Agrupe o resultado da consulta por ID_NF.
Resposta:
SELECT
    ID_NF,
    SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT
FROM vendas
GROUP BY ID_NF
HAVING VALOR_TOT > 500
ORDER BY VALOR_TOT DESC;

j) Qual o valor médio dos descontos dados por produto. As colunas presentes no
resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por
COD_PROD.
Resposta:
SELECT
    COD_PROD,
    AVG(DESCONTO) AS MEDIA
FROM vendas
GROUP BY COD_PROD;

k) Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas
presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe
o resultado da consulta por COD_PROD.
Resposta:
SELECT
    COD_PROD,
    MIN(DESCONTO) AS MENOR,
    MAX(DESCONTO) AS MAIOR,
    AVG(DESCONTO) AS MEDIA
FROM vendas
GROUP BY COD_PROD;

l) Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado
da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE
VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o
resultado da consulta por ID_NF.
Resposta:
SELECT
    ID_NF,
    COUNT(ID_ITEM) AS QTD_ITENS
FROM vendas
GROUP BY ID_NF
HAVING COUNT(ID_ITEM) > 3;

---
Parte 2
---
Crie uma base de dados Universidade com as tabelas a seguir:
Alunos (MAT, nome, endereço, cidade)
Disciplinas (COD_DISC, nome_disc, carga_hor)
Professores (COD_PROF, nome, endereço, cidade)
Turma (COD_DISC, COD_TURMA, COD_PROF, ANO, horário)
COD_DISC referencia Disciplinas
COD_PROF referencia Professores
Histórico (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO, frequência, nota)
MAT referencia Alunos
COD_DISC, COD_TURMA, COD_PROF, ANO referencia Turma
INSIRA OS SEGUINTES REGISTROS:
ALUNOS:
(2015010101, JOSE DE ALENCAR, RUA DAS ALMAS, NATAL)
(2015010102, JOÃO JOSÉ, AVENIDA RUY CARNEIRO, JOÃO PESSOA)
(2015010103, MARIA JOAQUINA, RUA CARROSSEL, RECIFE)
(2015010104, MARIA DAS DORES, RUA DAS LADEIRAS, FORTALEZA)
(2015010105, JOSUÉ CLAUDINO DOS SANTOS, CENTRO, NATAL)
(2015010106, JOSUÉLISSON CLAUDINO DOS SANTOS, CENTRO, NATAL)
DISCIPLINAS:
(BD, BANCO DE DADOS, 100)
(POO, PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS, 100)
(WEB, AUTORIA WEB, 50)
(ENG, ENGENHARIA DE SOFTWARE, 80)
PROFESSORES:
(212131, NICKERSON FERREIRA, RUA MANAÍRA, JOÃO PESSOA)
(122135, ADORILSON BEZERRA, AVENIDA SALGADO FILHO, NATAL)
(192011, DIEGO OLIVEIRA, AVENIDA ROBERTO FREIRE, NATAL)
TURMA:
(BD, 1, 212131, 2015, 11H-12H)
(BD, 2, 212131, 2015, 13H-14H)
(POO, 1, 192011, 2015, 08H-09H)
(WEB, 1, 192011, 2015, 07H-08H)
(ENG, 1, 122135, 2015, 10H-11H)
HISTÓRICO:
INSIRA VALORES PARA TODOS OS ALUNOS EM TODAS AS DISCIPLINAS

CREATE DATABASE Universidade;
USE Universidade;

CREATE TABLE Alunos (
    MAT INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    cidade VARCHAR(100)
);

CREATE TABLE Disciplinas (
    COD_DISC VARCHAR(10) PRIMARY KEY,
    nome_disc VARCHAR(100),
    carga_hor INT
);

CREATE TABLE Professores (
    COD_PROF INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    cidade VARCHAR(100)
);

CREATE TABLE Turma (
    COD_DISC VARCHAR(10),
    COD_TURMA INT,
    COD_PROF INT,
    ANO INT,
    horario VARCHAR(20),
    PRIMARY KEY (COD_DISC, COD_TURMA, COD_PROF, ANO),
    FOREIGN KEY (COD_DISC) REFERENCES Disciplinas(COD_DISC),
    FOREIGN KEY (COD_PROF) REFERENCES Professores(COD_PROF)
);

CREATE TABLE Historico (
    MAT INT,
    COD_DISC VARCHAR(10),
    COD_TURMA INT,
    COD_PROF INT,
    ANO INT,
    frequencia INT,
    nota DECIMAL(4,2),
    PRIMARY KEY (MAT, COD_DISC, COD_TURMA, COD_PROF, ANO),
    FOREIGN KEY (MAT) REFERENCES Alunos(MAT),
    FOREIGN KEY (COD_DISC, COD_TURMA, COD_PROF, ANO) REFERENCES Turma(COD_DISC, COD_TURMA, COD_PROF, ANO)
);

INSERT INTO Alunos VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'),
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');

INSERT INTO Disciplinas VALUES
('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

INSERT INTO Professores VALUES
(212131, 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'),
(122135, 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

INSERT INTO Turma VALUES
('BD', 1, 212131, 2015, '11H-12H'),
('BD', 2, 212131, 2015, '13H-14H'),
('POO', 1, 192011, 2015, '08H-09H'),
('WEB', 1, 192011, 2015, '07H-08H'),
('ENG', 1, 122135, 2015, '10H-11H');

a) Encontre a MAT dos alunos com nota em BD em 2015 menor que 5 (obs: BD =
código da disciplinas).
Resposta:
SELECT DISTINCT MAT
FROM Historico
WHERE COD_DISC = 'BD' AND ANO = 2015 AND nota < 5;

b) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO
em 2015.
Resposta:
SELECT
    MAT,
    AVG(nota) AS MEDIA
FROM Historico
WHERE COD_DISC = 'POO' AND ANO = 2015
GROUP BY MAT;

c) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO
em 2015 e que esta média seja superior a 6.
Resposta:
SELECT
    MAT,
    AVG(nota) AS MEDIA
FROM Historico
WHERE COD_DISC = 'POO' AND ANO = 2015
GROUP BY MAT
HAVING AVG(nota) > 6;

d) Encontre quantos alunos não são de Natal.
Resposta:
SELECT COUNT(*) AS ALUNOS_FORA_NATAL
FROM Alunos
WHERE cidade != 'NATAL';