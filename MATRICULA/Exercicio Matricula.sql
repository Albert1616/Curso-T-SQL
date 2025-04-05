/*
LOG TECNOLOGIA E SISTEMAS 
CURSO T-SQL 

OBJETIVOS:  Além da interação com o Management Studio o aluno deverá 
			criar banco,criar tabelas, incluir registros em tabelas, ler registros de tabelas e
            compreender o comandos select com baixa complexidade
*/

-- CRIAR TABELAS 
---------------------------------------------------------------------------------------------------

USE [LogCurso]

DROP TABLE Nota

-- Criar Tabela de Alunos
CREATE TABLE Aluno (
	idAluno INT IDENTITY(1,1),
	Nome VARCHAR(40) NOT NULL,
	Endereco VARCHAR(50) NULL,
	Complemento VARCHAR(40) NULL,
	Bairro VARCHAR(40) NULL,
	Nacionalidade VARCHAR(20) NULL,
	PRIMARY KEY (idAluno))

-- Criar Tabela de Cursos
CREATE TABLE Curso (
	idCurso INT IDENTITY(1,1),
	Descricao VARCHAR(50),
	PRIMARY KEY(idCurso))
-- Tabela de Matriculas
CREATE TABLE Matricula (
	idMatricula INT IDENTITY(1, 1), 
	idAluno INT NOT NULL, 
	idCurso INT NOT NULL, 
	DataMatricula DATETIME NOT NULL,
	PRIMARY KEY(idMatricula))
 
-- Criar Tabela de Notas
CREATE TABLE Nota (
	idNota INT IDENTITY(1, 1), 
	idAluno INT NOT NULL, 
	idCurso INT NOT NULL, 
	Nota MONEY NOT NULL,
	PRIMARY KEY(idNota))

DELETE Matricula
 
 
-- COMANDOS DE MANIPULAÇÃO DE DADOS (INCLUIR)
-- INCLUIR REGISTROS NAS TABELAS
---------------------------------------------------------------------------------------------

INSERT Aluno  
( nome, endereco, complemento, bairro, Nacionalidade ) 
VALUES 
('João' , 'Rua A', 'Nº10 ', 'Bairro Alecrim', 'Brasil')

INSERT Aluno  
(nome, endereco, complemento, bairro, Nacionalidade ) 
VALUES 
('José' , 'Rua B', 'Nº20 ', 'Bairro Centro', 'Brasil')

INSERT Aluno  
(nome, endereco, complemento, bairro, Nacionalidade ) 
VALUES 
('Maria', 'Rua c', 'Nº30 ', 'Bairro Ribeira', 'Brasil') 

INSERT Aluno  
(nome, endereco, complemento, bairro, Nacionalidade ) 
VALUES 
('João Maria' , 'Rua X', 'Nº11 ', 'Bairro Ponta Negra', 'Brasil')

INSERT Aluno  
(nome, endereco, complemento, bairro, Nacionalidade ) 
VALUES 
('José Silva' , 'Rua Y', 'Nº22 ', 'Bairro Neopolis', 'Brasil')

INSERT Aluno  
(nome, endereco, complemento, bairro, Nacionalidade ) VALUES ('Ruan ', 'Rua P', 'Nº30 ', 'Bairro Cidade Jardim', 'Mexico') 

INSERT INTO Aluno
( 
 nome, 
 endereco, 
 complemento, 
 bairro, 
 Nacionalidade
)
VALUES
(
 'Stevan ', 
 'Rua z', 
 'Nº30 ', 
 'Bairro Cidade Jardim', 
 'Bolivia'
);

-- Inserir Cursos
---------------------------------------------------------------------------------------------------
INSERT Curso (Descricao) VALUES ('LITERATURA')
INSERT Curso (Descricao) VALUES ('MATEMÁTICA')
INSERT Curso (Descricao) VALUES ('BIOLOGIA')
INSERT Curso (Descricao) VALUES ('FÍSICA')
INSERT Curso (Descricao) VALUES ('FILOSOFIA')

-- Incluir Matrículas
---------------------------------------------------------------------------------------------------
INSERT Matricula (idAluno, idCurso, DataMatricula) VALUES (1,1,'02/04/2020')
INSERT Matricula (idAluno, idCurso, DataMatricula) VALUES (2,1,'02/04/2020')
INSERT Matricula (idAluno, idCurso, DataMatricula) VALUES (3,1,'02/04/2020')
INSERT Matricula (idAluno, idCurso, DataMatricula) 
VALUES (1,2,'02/04/2020'),
	   (2,2,'02/04/2020'),
	   (3,2,'02/04/2020'),
	   (1,3,'02/04/2020'),
	   (2,3,'02/04/2020'),
	   (3,3,'02/04/2020'),
	   (3,4,'02/04/2020')

-- Inserir Notas
---------------------------------------------------------------------------------------------------
INSERT Nota (idAluno, idCurso, Nota) VALUES (1,1,8.5)
INSERT Nota (idAluno, idCurso, Nota) VALUES (2,1,5.3)
INSERT Nota (idAluno, idCurso, Nota) VALUES (3,1,5.2)
INSERT Nota (idAluno, idCurso, Nota) VALUES (1,2,7.0)
INSERT Nota (idAluno, idCurso, Nota) VALUES (2,2,7.0)
INSERT Nota (idAluno, idCurso, Nota) VALUES (3,2,7.0)
INSERT Nota (idAluno, idCurso, Nota) VALUES (1,3,10)
INSERT Nota (idAluno, idCurso, Nota) VALUES (2,3,4)
INSERT Nota (idAluno, idCurso, Nota) VALUES (3,3,5)
INSERT Nota (idAluno, idCurso, Nota) VALUES (3,4,8)

DELETE Nota

-- SELECT
-------------------------------------------

-- mostra todas as colunas
SELECT * FROM Aluno

-- mostra somente a coluna nome
SELECT Nome FROM Aluno

-- mostra somente a coluna Endereco
SELECT Endereco FROM Aluno

-- mostra as colunas nome e endereco
SELECT Nome, Endereco FROM Aluno
 
SELECT * FROM Aluno 
SELECT * FROM Curso
SELECT * FROM Matricula
SELECT * FROM Nota

-- CLAUSULA WHERE 
--------------------------------------------------------------------------------

-- Listar os alunos brasileiros
SELECT *
FROM Aluno
WHERE Nacionalidade = 'BRASIL'

-- Listar os alunos estrangeiros
SELECT *
FROM Aluno
WHERE Nacionalidade <> 'brasil' -- Observar o maisculas e minisculas

-- Listar os alunos mexicanos ou bolivianos
SELECT *
FROM Aluno
WHERE Nacionalidade = 'Mexico'
      OR Nacionalidade = 'Bolivia'

SELECT *
FROM Aluno
WHERE Nacionalidade IN ('Mexico', 'Bolivia')


--- CLAUSULA TOP / ORDER BY 
--------------------------------------------------------------------------------

SELECT TOP 3 *
FROM Aluno
ORDER BY nome DESC

SELECT TOP 1 *
FROM Aluno;

SELECT TOP 50 PERCENT *
FROM Aluno
ORDER BY 1

SELECT TOP 1000 *
FROM Aluno

SELECT TOP 0 *
FROM Aluno


-- FROM / JOIN 
-- USANDO JUNÇÕES, É POSSÍVEL RECUPERAR DADOS DE DUAS OU MAIS TABELAS COM BASE EM RELAÇÕES LÓGICAS ENTRE AS TABELAS. 
-- JUNÇÕES INDICAM COMO SQL SERVER DEVERIA USAR DADOS DE UMA TABELA PARA SELECIONAR AS LINHAS EM OUTRA TABELA.
--------------------------------------------------------------------------------

-- Listar os alunos e os cursos que estão matriculados ordenados por ordem alfabética dos cursos e depois alunos
SELECT a.Nome, c.Descricao
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
ORDER BY c.Descricao, a.Nome

-- Listas quais os alunos tiveram as melhores notas no curso de matemática
SELECT a.Nome, c.Descricao, n.Nota
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
INNER JOIN Nota n ON n.idAluno = m.idAluno AND n.idCurso = m.idCurso
WHERE c.Descricao = 'MATEMÁTICA'
ORDER BY n.Nota DESC

-- Alunos que NÃO FORAM matriculados em algum curso
SELECT a.idAluno, a.Nome
FROM Aluno a
LEFT JOIN Matricula m ON m.idAluno = a.idAluno
WHERE m.idMatricula IS NULL


--- A EXPRESSÃO CASE 
-- Avalia expressões booleanas para determinar resultados.
--------------------------------------------------------------------------------

-- Listar os alunos e suas nacionalidades informando se é brasileiro ou estrangeiro
SELECT
	Nome,
	Nacionalidade,
	CASE Nacionalidade
		WHEN 'Brasil' THEN 'Brasileiro'
		ELSE 'Estrangeiro'
	END AS origem
FROM Aluno

-- Listar os alunos, os cursos que estão matriculados, as notas e a situação como aprovado, reprovado ou recuperação
SELECT
	a.Nome, 
    c.Descricao,
	n.Nota,
    CASE
        WHEN n.Nota < 5 THEN 'Reprovado'
        WHEN n.Nota >= 7 THEN 'Aprovado'
        WHEN n.Nota < 7 AND n.Nota >= 5 THEN 'Recuperação'
    END AS Situacao
FROM Nota n
INNER JOIN Matricula m ON m.idAluno = n.idAluno AND m.idCurso = n.idCurso
INNER JOIN Aluno a ON n.idAluno = a.idAluno
INNER JOIN Curso c ON n.idCurso = c.idCurso
ORDER BY a.nome, c.descricao

-- Listar os alunos, os cursos que estão matriculados, as notas e a situação como aprovado, reprovado ou recuperação
SELECT
	a.Nome, 
    c.Descricao,
	n.Nota,
    CASE
        WHEN n.Nota < 5 THEN 'Reprovado'
        WHEN n.Nota >= 7 THEN 'Aprovado'
        WHEN n.Nota < 7 AND n.Nota >= 5 THEN 'Recuperação'
    END AS Situacao
FROM Nota n
INNER JOIN Matricula m ON m.idAluno = n.idAluno AND m.idCurso = n.idCurso
INNER JOIN Aluno a ON n.idAluno = a.idAluno
INNER JOIN Curso c ON n.idCurso = c.idCurso
WHERE CASE
        WHEN n.Nota < 5 THEN 'Reprovado'
        WHEN n.Nota >= 7 THEN 'Aprovado'
        WHEN n.Nota < 7 AND n.Nota >= 5 THEN 'Recuperação'
    END = 'Aprovado'
ORDER BY a.nome, c.descricao


-- FUNÇÃO COUNT(*)
--------------------------------------------------------------------------------

-- Quantidade de registros na tabela Aluno
SELECT COUNT(*)
FROM Aluno

-- Quantidade dos alunos brasileiros
SELECT COUNT(*)
FROM Aluno
WHERE Nacionalidade = 'brasil'

-- Quantidade dos alunos brasileiros
SELECT Nacionalidade, COUNT(*)
FROM Aluno
GROUP BY Nacionalidade

-- VARIAVEIS
---------------------------------------------------------------------------------------

-- declarar
DECLARE @curso1 VARCHAR(30)

-- atribuir usando SET
SET @curso1 = 'Matemática'

-- declarar e atribuir
DECLARE @curso2 VARCHAR(30) = 'Literatura'

-- declarar
DECLARE @idCurso1 INT
DECLARE @idCurso2 INT

-- atribuir usando SELECT
SET @idCurso1 = (SELECT idCurso FROM Curso WHERE Descricao = @curso1)

-- atribuir usando SELECT
SELECT @idCurso2 = idCurso
FROM Curso
WHERE Descricao = @curso2

-- Listar os alunos matriculados nos cursos de matemática e literatura
SELECT Nome
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
WHERE m.idCurso IN (@idCurso1, @idCurso2)


--  TIPOS DE SUBCONSULTAS
---------------------------------------------------------------------------------------

-- 1. Subconsulta única linha (escalar): Retorna 1 linha e 1 coluna. - RETORNA UM ÚNICO VALOR
-- 2. Subconsulta que retorna 1 coluna e várias linhas. 
-- 3. Subconsulta que retorna várias colunas e várias linhas.
-- 4. Subconsulta correlacionada: Depende da consulta externa para seus valores.
-- 5. Subconsulta não correlacionada: pode ser executada independentemente da consulta externa.
-- 6. Subconsulta aninhada: Dentro de outra subconsulta.

-- Subconsulta única linha (escalar)não correlacionada
SELECT *
FROM Nota
WHERE Nota > (SELECT AVG(Nota) FROM Nota)

-- Subconsulta várias linhas (1 coluna e várias linhas) não correlacionada
SELECT a.Nome
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
WHERE m.idCurso IN (
   SELECT idCurso FROM Curso
   WHERE Descricao IN ('Matemática', 'Biologia'))


-- Subconsulta escalar correlacionada
-- Subconsulta escalar aninhada
SELECT
   a.Nome,
   (SELECT DataMatricula
    FROM Matricula m  
    WHERE m.idAluno = a.idAluno
          AND m.idCurso = (
             SELECT idCurso FROM Curso
             WHERE Descricao = 'Matemática'))
FROM Aluno a


-- Subconsulta várias colunas e várias linhas não correlacionada
-- Subconsulta aninhada várias linhas (1 coluna e várias linhas) não correlacionada
SELECT a.Nome, m.DataMatricula
FROM (
   SELECT DISTINCT idAluno, DataMatricula
   FROM Matricula
   WHERE DataMatricula > '2020-01-01'
         AND idCurso IN (
            SELECT idCurso
			FROM Curso
            WHERE Descricao IN ('Matemática', 'Biologia'))
) m
INNER JOIN Aluno a ON a.idAluno = m.idAluno



--  CLÁUSULAS - EXISTS, SUBQUERY, NOT EXISTS
---------------------------------------------------------------------------------------

-- ALUNOS QUE FORAM MATRICULADOS EM ALGUM CURSO
SELECT *
FROM Aluno a
WHERE EXISTS (
	SELECT *
	FROM Matricula m
	WHERE m.idAluno = a.idAluno
)

-- Alunos que NÃO FORAM matriculados em algum curso
SELECT *
FROM Aluno a
WHERE NOT EXISTS (
	SELECT *
	FROM Matricula m
	WHERE m.idAluno = a.idAluno
)

-- (SUBQUERY)
-- Listar alunos e a data de matricula no curso de matemática 
SELECT
	idAluno,
	Nome,
	(
		SELECT DataMatricula
		FROM Matricula m  
		WHERE m.idAluno = a.idAluno AND m.idCurso = (SELECT idCurso FROM Curso e WHERE descricao = 'MATEMÁTICA')
	)
FROM Aluno a

-- (SUBQUERY) Matriculas de cada aluno e se foram matriculados em matematica e fisica 
SELECT
	a.nome,
	(
		SELECT COUNT(*)
		FROM Matricula m
		WHERE m.idAluno = a.idAluno
	) AS QuantidadeMatricula,
	CASE
		WHEN EXISTS (
			SELECT idMatricula
			FROM Matricula m
			WHERE m.idAluno = a.idAluno AND m.idCurso = 1
		) THEN 'Sim'
		ELSE 'Não'
	END AS MatriculadoEmMatematica,
	CASE
		WHEN (
			SELECT idMatricula
			FROM Matricula m
			WHERE m.idAluno = a.idAluno AND m.idCurso = 1
		) IS NOT NULL THEN 'Sim'
		ELSE 'Não'
	END AS MatriculadoEmMatematica2
FROM Aluno a
WHERE (
	SELECT COUNT(*)
	FROM Matricula m
	WHERE m.idAluno = a.idAluno
) > 0


-- FUNÇÃO ISNULL 
-- PARA SUBSTITUIR  OS NULOS
-----------------------------------------------------------------------

SELECT
	a.nome,
	(
		SELECT COUNT(*)
		FROM Matricula m  
		WHERE m.idAluno = a.idAluno
	) AS QtMatriculas,
	ISNULL ((
		SELECT 'Sim'
		FROM Matricula m  
		WHERE m.idAluno = a.idAluno AND m.idCurso = 1
	), 'Não') as MatriculadoEmMatematica,
	ISNULL((
		SELECT 'Sim'
		FROM Matricula m  
		WHERE m.idAluno = a.idAluno AND m.idCurso = 4
	), 'Não')  as MatriculadoEmFisica
FROM Aluno a
WHERE (
	SELECT COUNT(*)
	FROM Matricula m  
	WHERE m.idAluno = a.idAluno
) > 1


-- A CLÁUSULA GROUP BY
-- DIVIDE O RESULTADO DA CONSULTA EM GRUPOS
---------------------------------------------------------------------

-- Listar a quantidade de alunos de cada país
SELECT
	Nacionalidade, 
	COUNT(*) AS Total
FROM Aluno
GROUP BY Nacionalidade

-- listar quantidade de Alunos por paises, ordenado pela quantidade
SELECT Nacionalidade, COUNT(*) as Total
FROM Aluno
GROUP BY nacionalidade
ORDER BY 2 DESC, 1

-- Quantidade de alunos aprovados, reprovados em recuperação
SELECT
	CASE
        WHEN Nota < 5 THEN 'Reprovado'
        WHEN Nota >= 7 THEN 'Aprovado'
        WHEN Nota < 7 AND n.Nota >= 5 THEN 'Recuperação'
    END AS Situacao,
	COUNT(*) as Total
FROM Nota n
INNER JOIN Aluno a ON a.idAluno = n.idAluno
GROUP BY 
	CASE
        WHEN n.Nota < 5 THEN 'Reprovado'
        WHEN n.Nota >= 7 THEN 'Aprovado'
        WHEN n.Nota < 7 AND n.Nota >= 5 THEN 'Recuperação'
    END

--- CLAUSULA HAVING ASSOCIADA AO GROUP BY
-- FILTRA OS GRUPOS
---------------------------------------------------------------------

-- Listar o países que tem mais de um aluno
SELECT
	Nacionalidade, 
	COUNT(*) AS Total
FROM Aluno
GROUP BY Nacionalidade
HAVING COUNT(*) > 1

-- Listar o países que tem mais de um aluno que comecem com a letra 'J'
SELECT
	Nacionalidade, 
	COUNT(*) AS Total
FROM Aluno
WHERE LEFT(nome, 1) = 'j'
GROUP BY Nacionalidade
HAVING COUNT(*) > 1

-- Listar os alunos matriculados em mais de 3 cursos
SELECT a.Nome
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
GROUP BY a.nome
HAVING COUNT(*) > 3

/**********************************************************************
              EXERCÍCIO (Uso de tabela temporária)
**********************************************************************/
-- a) Listar os alunos matriculados nos cursos de matemática e física
-- b) Em seguida, matriculá-los no curso de filosofia.

SELECT a.idAluno
INTO #T1
FROM Aluno a
INNER JOIN Matricula m   ON  m.idAluno = a.idAluno
WHERE m.idCurso = (SELECT idCurso FROM Curso e WHERE descricao = 'MATEMÁTICA')

SELECT a.idAluno
INTO #T2
FROM Aluno a
INNER JOIN Matricula m   ON  m.idAluno = a.idAluno
WHERE m.idCurso = (SELECT idCurso FROM Curso e WHERE descricao = 'FÍSICA')
 
SELECT * FROM #T1
SELECT * FROM #T2

SELECT t1.*
INTO #T3
FROM #T1 t1
INNER JOIN #t2 t2 ON  t1.idAluno = t2.idAluno

SELECT t3.idAluno, a.Nome
FROM #T3 t3
INNER JOIN Aluno a ON a.idAluno = t3.idAluno

-- b) Matricular alunos no curso de filosofia

-- Retornar a hora atual
SELECT GETDATE()

-- INSERT SELECT
INSERT Matricula (idAluno, idCurso, DataMatricula)
(
	SELECT
		t3.idaluno, 
		(SELECT idCurso FROM Curso e WHERE descricao = 'FILOSOFIA') AS CURSO,
		GETDATE()
	FROM #T3 t3
)

SELECT *
FROM #T1

SELECT m.*
FROM #T3 t3
INNER JOIN Matricula m ON m.idAluno = t3.idAluno

DROP TABLE #T1
DROP TABLE #T2
DROP TABLE #T3

/**********************************************************************
              EXERCÍCIO (Uso de tabela temporária)
***********************************************************************/
-- Listar os alunos que estão matriculados em mais de 3 cursos e trazer o nome do curso


SELECT a.idAluno,a.Nome, c.Descricao
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
WHERE a.idAluno IN (
 SELECT a.idAluno FROM Aluno a
 INNER JOIN Matricula m ON m.idAluno = a.idAluno
 GROUP BY a.idAluno
 HAVING COUNT(*) > 3
)

SELECT * FROM #T4

SELECT DISTINCT t4.idAluno, t4.Nome, c.Descricao FROM Curso c
INNER JOIN Matricula m ON m.idAluno = c.idCurso
INNER JOIN #T4 t4 ON t4.idAluno = m.idAluno



















SELECT a.Nome, c.Descricao
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
WHERE a.idAluno IN (
	SELECT idAluno
	FROM Matricula
	GROUP BY idAluno
	HAVING COUNT(*) > 3
)

SELECT a.Nome, c.Descricao
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
WHERE EXISTS (
	SELECT m1.idAluno
	FROM Matricula m1
	WHERE m1.idAluno = a.idAluno
	GROUP BY m1.idAluno
	HAVING COUNT(*) > 3
)

SELECT a.Nome, c.Descricao
FROM Aluno a
INNER JOIN (
	SELECT idAluno
	FROM Matricula
	GROUP BY idAluno
	HAVING COUNT(*) > 3
) t ON t.idAluno = a.idAluno
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso

--DEFINIÇÃO DE DADOS (APAGAR TABELAS)

--DROP TABLE Aluno
--DROP TABLE Matricula
--DROP TABLE Curso

-- RESUMO
--------------------------------------------------------------------------------------

--DDL - Linguagem de Definição de Dados 
--  CREATE TABLE
--  DROP TABLE

--DML - Linguagem de Manipulação de Dados
--  INSERT

--DQL - Linguagem de Consulta de Dados 
--  SELECT
--  INNER JOIN 
--  SUBQUERY
--  EXITS
--  GROUP BY 
--  ORDER BY 
--  HAVING
--  TABELA TEMPORÁRIA
--  CASE

--FUNÇÕES 
--  ISNULL
--  COUNT(*)
--  LEFT
--  IN 

-- DÚVIDAS ???



