-------------------------------------------------------
-- Tabela de alunos 
CREATE TABLE Alunos (
	idAluno INT IDENTITY(1,1), 
	Nome VARCHAR(50)  NOT NULL,
	Turma VARCHAR(10) NULL,
	Matricula VARCHAR(50) NULL,
	DataNascimento DATETIME NULL,
	PRIMARY KEY(idAluno)
)
-------------------------------------------------------
-- Tabela de cursos vinculados aos Departamentos
CREATE TABLE Cursos (
	idCurso INT IDENTITY(1,1), 
	Nome VARCHAR(50) NOT NULL,
	idDepartamento INT NULL,
	PRIMARY KEY(idCurso)
)
-------------------------------------------------------
-- Tabela de departamentos (agrega vários cursos)
CREATE TABLE Departamentos  (
	IdDepartamentos INT IDENTITY(1,1), 
	Nome VARCHAR(50) NOT NULL,
	PRIMARY KEY(IdDepartamentos)
)

-------------------------------------------------------
--  Tabela de livros
CREATE TABLE livros (
	idLivro INT IDENTITY(1,1),
	ISBN CHAR(8) NOT NULL,
	Titulo VARCHAR(50) NOT NULL,
	Autor VARCHAR(100) NOT NULL,
	Editora VARCHAR(50) NULL,
	PRIMARY KEY(idLivro)
)
-----------------------------------------------------
CREATE TABLE Exemplares (
	idExemplar INT IDENTITY(1,1),
	idLivro INT NOT NULL,
	DataAquisicao DATETIME NOT  NULL,
	PRIMARY KEY(idExemplar),
)
--Obs: Um livro pode possuir vários exemplares 
------------------------------------------------------------- 
-- Tabela de matriculas de alunos nos cursos em cada período
CREATE TABLE  Matriculas (
	idMatricula INT IDENTITY(1,1),
	idAluno INT ,
	idCurso INT ,
	Periodo VARCHAR(20),
	PRIMARY KEY(idMatricula),
)
--Obs: período refere-se ao semestre de ingresso do aluno na instituição

------------------------------------------------------
-- Tabela de utilização dos exemplares
CREATE TABLE Ultilizacao (
	IdUtilizacao INT IDENTITY(1,1),
	idExemplar INT NOT NULL,
	idMatricula INT NOT NULL,
	DataInicioUtilizacao DATETIME NOT  NULL,
	DataPrevistaEntrega DATETIME NOT  NULL,
	DataFimUtilizacao DATETIME  NULL,
	PRIMARY KEY(IdUtilizacao)
)
--Obs: um exemplar pode ter várias utilizações 

---------------------------------------------------------
--  Tabela de livros recomendados em cada curso
CREATE TABLE LivrosCurso (
	idLivroCurso INT IDENTITY(1,1),
	idCurso INT NOT NULL,
	idLivro INT NOT NULL,
	Periodo VARCHAR(20),
	PRIMARY KEY(idLivroCurso),
)
--Obs: período refere-se ao semestre no qual o  livro foi utilizado

DBCC CHECKIDENT(Alunos,RESEED,0)
DBCC CHECKIDENT(Cursos,RESEED,0)
DBCC CHECKIDENT(Departamentos,RESEED,0)
DBCC CHECKIDENT(Exemplares,RESEED,0)
DBCC CHECKIDENT(livros,RESEED,0)
DBCC CHECKIDENT(LivrosCurso,RESEED,0)
DBCC CHECKIDENT(Matriculas,RESEED,0)
DBCC CHECKIDENT(Ultilizacao,RESEED,0)

DELETE FROM Alunos
DELETE FROM Cursos
DELETE FROM Departamentos
DELETE FROM Exemplares
DELETE FROM livros
DELETE FROM LivrosCurso
DELETE FROM Matriculas
DELETE FROM Ultilizacao



INSERT Alunos (Nome, Turma, Matricula, DataNascimento) 
VALUES
	('Joao Vitor', '1', '0001', '1997-09-09 12:10:05.123'),
    ('Joao Paulo', '1', '0002','1993-03-08 12:10:05.12'),
    ('Joana', '1', '0003','1987-07-12 12:10:05.12'),
    ('Paula', '1', '0004','1999-02-11 12:10:05.12'),
    ('Arthur', '1', '0005','2000-03-02 12:10:05.12'),
    ('Joao ', '2', '0006','1997-09-09 12:10:05.12'),
    ('Paulo', '2', '0007','1993-03-05 12:10:05.12'),
    ('Nina', '2', '0008','1987-07-12 12:10:05.12'),
    ('Solange', '2', '0009','1999-02-02 12:10:05.12'),
    ('Atena', '2', '0010','2000-03-02 12:10:05.12')

INSERT Cursos(Nome, IdDepartamento)
VALUES
	('Banco de Dados', 1),
	('Matemática Básica', 1),
	('Programação', 1),
	('Filosofia', 2),
	('Cálculo II', 1),
	('Sociologia I',2),
	('Libras', 2),
	('Português', 2)

INSERT Departamentos(Nome)
VALUES
	('CIÊNCIAS EXATAS'),
	('CIÊNCIAS HUMANAS')

INSERT livros (ISBN, Titulo, Autor, Editora)
VALUES
	('99898981','CALCULO','NAVATHE','OBJETIVA'),
	('99898982','FILOSOFIA ORIENTAL','NAVATHE','PEARSON'),
	('99898983','BD RELACIONAL','NAVATHE','OBJETIVA'),
	('99898984','LIBRAS','NAVATHE','PEARSON'),
	('99898985','C++','NAVATHE','OBJETIVA'),
	('99898989','1+1=1','NAVATHE','PEARSON')

INSERT Exemplares (idLivro, DataAquisicao)
VALUES
	(1,GETDATE()),
	(2,GETDATE()),
	(3,GETDATE()),
	(4,GETDATE()),
	(5,GETDATE()),
	(6,GETDATE())

INSERT Ultilizacao(idExemplar, idMatricula, DataInicioUtilizacao, DataPrevistaEntrega, DataFimUtilizacao)
VALUES
	(1,001,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(2,002,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(3,003,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(4,004,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(5,005,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(6,006,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(7,007,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(8,008,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(9,009,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(10,010,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(11,001,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(12,002,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(13,003,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(14,004,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(15,005,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE())),
	(16,006,GETDATE(),DATEADD(MM,2,GETDATE()),DATEADD(MM,3,GETDATE()))
INSERT LivrosCurso (idCurso, idLivro, Periodo)
VALUES	
	(1, 3, '2020.1'),
	(2, 1, '2020.1'),
	(2, 6, '2020.1'),
	(3, 5, '2020.1'),
	(4, 2, '2020.1'),
	(5, 1, '2020.1'),
	(5, 6, '2020.1'),
	(6, 2, '2020.1'),
	(7, 4, '2020.1'),
	(8, 4, '2020.1')

INSERT Matriculas (idAluno, idCurso, Periodo)
VALUES
	(1, 1, '2020.1'),
	(1, 2, '2020.1'),
	(1, 3, '2020.1'),
	(2, 4, '2020.1'),
	(2, 5, '2020.1'),
	(2, 6, '2020.1'),
	(3, 7, '2020.1'),
	(3, 8, '2020.1'),
	(3, 1, '2020.1'),
	(4, 2, '2020.1'),
	(4, 3, '2020.1'),
	(4, 4, '2020.1'),
	(5, 5, '2020.1'),
	(5, 6, '2020.1'),
	(5, 7, '2020.1'),
	(6, 8, '2020.1'),
	(6, 1, '2020.1'),
	(6, 2, '2020.1'),
	(7, 3, '2020.1'),
	(7, 4, '2020.1'),
	(7, 5, '2020.1'),
	(8, 6, '2020.1'),
	(8, 7, '2020.1'),
	(8, 8, '2020.1'),
	(9, 1, '2020.1'),
	(9, 2, '2020.1'),
	(9, 3, '2020.1'),
	(10, 4, '2020.1'),
	(10, 5, '2020.1'),
	(10, 6, '2020.1')
--1
SELECT DISTINCT a.Matricula, a.Nome FROM Alunos a
INNER JOIN Matriculas m ON m.idAluno = a.idAluno
INNER JOIN Cursos c ON c.idCurso = m.idCurso
INNER JOIN LivrosCurso l ON l.idCurso = c.idCurso
INNER JOIN livros li ON li.idLivro = l.idLivro
WHERE li.Editora = 'OBJETIVA' AND m.Periodo = l.Periodo
ORDER BY a.Nome

SELECT * FROM LivrosCurso


-- 2
SELECT DISTINCT d.* FROM Cursos c
INNER JOIN Departamentos d ON c.idDepartamento = d.IdDepartamentos
INNER JOIN LivrosCurso l ON c.idCurso = l.idCurso
INNER JOIN livros li ON li.idLivro = l.idLivro
WHERE li.Editora NOT IN (
 SELECT Editora FROM livros WHERE Editora = 'OBJETIVA'
)

SELECT * FROM Departamentos
EXCEPT
SELECT d.* FROM Departamentos d
INNER JOIN Cursos c ON c.idDepartamento = d.IdDepartamentos
INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
INNER JOIN livros l ON l.idLivro = lc.idLivro
WHERE l.Editora <> 'Pearson'

SELECT DISTINCT d.* FROM Departamentos d
INNER JOIN Cursos c ON c.idDepartamento = d.IdDepartamentos
INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
INNER JOIN livros l ON l.idLivro = lc.idLivro
WHERE NOT EXISTS (
SELECT d2.* FROM Departamentos d2
INNER JOIN Cursos c2 ON c2.idDepartamento = d2.IdDepartamentos
INNER JOIN LivrosCurso lc2 ON lc2.idCurso = c2.idCurso
INNER JOIN livros l2 ON l2.idLivro = lc2.idLivro
WHERE d2.IdDepartamentos = d.IdDepartamentos AND l2.Editora <> 'Pearson'
)
-- 3

SELECT d.Nome FROM Cursos c
INNER JOIN Departamentos d ON c.idDepartamento = d.IdDepartamentos
INNER JOIN LivrosCurso l ON c.idCurso = l.idCurso
INNER JOIN livros li ON li.idLivro = l.idLivro
WHERE li.Editora = 'OBJETIVA' AND Autor = 'NAVATHE'
GROUP BY d.Nome
HAVING COUNT(*) >= (SELECT COUNT(*) FROM livros WHERE Autor = 'NAVATHE' AND Editora = 'OBJETIVA')



SELECT d2.* FROM Departamentos d2
WHERE (
 SELECT COUNT(*) FROM (
  SELECT idLivro FROM livros
  WHERE Editora = 'OBJETIVA' AND Autor = 'NAVATHE'
  EXCEPT
  SELECT DISTINCT li.idLivro FROM Cursos c
  INNER JOIN Departamentos d ON c.idDepartamento = d.IdDepartamentos
  INNER JOIN LivrosCurso l ON c.idCurso = l.idCurso
  INNER JOIN livros li ON li.idLivro = l.idLivro
  WHERE d.IdDepartamentos = d2.IdDepartamentos AND li.Editora = 'OBJETIVA' AND li.Autor = 'NAVATHE'
 ) AS Resultado
) = 0

SELECT * FROM #T1 t1
GROUP BY Titulo
HAVING COUNT(*) = (SELECT COUNT(*) FROM livros WHERE Autor = 'NAVATHE' AND Editora = 'OBJETIVA')


-- 4

--SELECT a.Nome, l.* FROM Alunos a
--INNER JOIN Matriculas m ON m.idAluno = a.idAluno
--INNER JOIN Utilizacao u ON u.idMatricula = m.idMatricula
--INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
--INNER JOIN livros l ON l.idLivro = e.idLivro
--WHERE l.Autor <> 'NAVATHE' AND l.Editora <> 'OBJETIVA'

SELECT DISTINCT a.* FROM Alunos a
WHERE NOT EXISTS (
 SELECT * FROM Matriculas m
 INNER JOIN Utilizacao u ON u.idMatricula = m.idMatricula
 INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
 INNER JOIN livros l ON l.idLivro = e.idLivro
 WHERE m.idAluno = a.idAluno AND l.Editora = 'OBJETIVA' AND l.Autor = 'NAVATHE'
)

SELECT DISTINCT a.Nome FROM Alunos a
EXCEPT
SELECT DISTINCT a2.Nome FROM Alunos a2
INNER JOIN Matriculas m ON a2.idAluno = m.idAluno
INNER JOIN Utilizacao u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.Editora = 'OBJETIVA' AND l.Autor = 'NAVATHE'
ORDER BY a.Nome
-- 5

SELECT TOP 5 WITH TIES l.Titulo FROM Alunos a
INNER JOIN Matriculas m ON a.idAluno = m.idAluno
INNER JOIN Utilizacao u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE m.Periodo = '2020.1'
GROUP BY l.Titulo
ORDER BY COUNT(l.idLivro) DESC

-- 6

SELECT u.* FROM Utilizacao u
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.ISBN = '998989898'

SELECT * FROM livros

SELECT * FROM Utilizacao

-- 7

CREATE PROCEDURE Relacao_Pagamento (
 @matricula INT
) AS
BEGIN
 SELECT l.*, 'ENTREGUE COM ATRASO' AS Situacao, 'AGUARDANDO PAGAMENTOS' AS Status FROM Alunos a
 INNER JOIN Matriculas m ON a.idAluno = m.idAluno AND m.idMatricula = @matricula
 INNER JOIN Utilizacao u ON u.idMatricula = m.idMatricula
 INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
 INNER JOIN livros l ON l.idLivro = e.idLivro
 WHERE DATEDIFF(DAY, u.DataFimUtilizacao,u.DataPrevistaEntrega) < 0
END

EXEC Relacao_Pagamento @matricula = 2

SELECT l.*, u.* FROM Alunos a
 INNER JOIN Matriculas m ON a.idAluno = m.idAluno AND m.idMatricula = 2
 INNER JOIN Utilizacao u ON u.idMatricula = m.idMatricula
 INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
 INNER JOIN livros l ON l.idLivro = e.idLivro
 WHERE DATEDIFF(DAY, u.DataFimUtilizacao,u.DataPrevistaEntrega) < 0








 -- 1

 SELECT DISTINCT a.* FROM Alunos a
 INNER JOIN Matriculas m ON a.idAluno = m.idAluno
 INNER JOIN LivrosCurso lc ON lc.idCurso = m.idCurso
 INNER JOIN livros l ON lc.idLivro = l.idLivro
 WHERE l.Editora = 'OBJETIVA'

 -- 2
 SELECT d.Nome FROM Departamentos d
 INNER JOIN Cursos c ON c.idDepartamento = d.IdDepartamentos
 INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
 INNER JOIN livros l ON l.idLivro = lc.idLivro
 WHERE l.Editora = 'Pearson'
 EXCEPT
SELECT d.Nome FROM Departamentos d
 INNER JOIN Cursos c ON c.idDepartamento = d.IdDepartamentos
 INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
 INNER JOIN livros l ON l.idLivro = lc.idLivro
 WHERE l.Editora <> 'Pearson'


 SELECT d.Nome FROM Departamentos d
 INNER JOIN Cursos c ON c.idDepartamento = d.IdDepartamentos
 INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
 INNER JOIN livros l ON l.idLivro = lc.idLivro
 WHERE NOT EXISTS (
  SELECT d.Nome FROM Departamentos d2
 INNER JOIN Cursos c ON c.idDepartamento = d.IdDepartamentos
 INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
 INNER JOIN livros l ON l.idLivro = lc.idLivro
 WHERE l.Editora = 'OBJETIVA' AND d2.IdDepartamentos = d.IdDepartamentos
 )

 -- 3

SELECT d.Nome FROM Departamentos d
INNER JOIN Cursos c ON c.idDepartamento = d.IdDepartamentos
INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
INNER JOIN livros l ON l.idLivro = lc.idLivro
WHERE l.Autor = 'NAVATHE' AND l.Editora = 'OBJETIVA'
GROUP BY d.Nome
HAVING COUNT(*) >= 
(SELECT COUNT(*) FROM livros WHERE Autor = 'NAVATHE' AND Editora = 'OBJETIVA')

-- 4
SELECT DISTINCT a.Nome FROM Alunos a
EXCEPT
SELECT DISTINCT a2.Nome FROM Alunos a2
INNER JOIN Matriculas m ON m.idAluno = a2.idAluno
INNER JOIN Ultilizacao u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.Editora = 'OBJETIVA' AND l.Autor = 'NAVATHE'

SELECT * FROM Alunos

SELECT a.* FROM Alunos a
WHERE NOT EXISTS(
 SELECT a2.* FROM Alunos a2
 INNER JOIN Matriculas m ON m.idAluno = a2.idAluno
 INNER JOIN Ult u ON u.idMatricula = m.idMatricula
 INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
 INNER JOIN livros l ON l.idLivro = e.idLivro
 WHERE l.Editora = 'OBJETIVA' AND l.Autor = 'Navathe' AND a2.idAluno = a.idAluno
) ORDER BY a.Nome

SELECT DISTINCT a.Nome FROM Alunos a
WHERE NOT EXISTS (
SELECT DISTINCT a2.Nome FROM Alunos a2
INNER JOIN Matriculas m ON m.idAluno = a2.idAluno
INNER JOIN Ult u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.Editora = 'OBJETIVA' AND l.Autor = 'NAVATHE' AND a2.idAluno = a.idAluno
)

-- 5

SELECT TOP 5  WITH TIES l.Titulo FROM Ultilizacao u 
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
GROUP BY l.Titulo
ORDER BY COUNT(*)

SELECT * FROM Ultilizacao

-- 6
SELECT 
e.idExemplar as Exemplar,
l.Titulo as 'Nome do livro',
a.Nome as 'Aluno',
c.Nome as Curso,
CONVERT(VARCHAR,u.DataInicioUtilizacao,103) as 'Data início Utilização',
CONVERT(VARCHAR,u.DataFimUtilizacao,103) as 'Data Término Utilização'
FROM Alunos a
INNER JOIN Matriculas m ON m.idAluno = a.idAluno
INNER JOIN Cursos c ON c.idCurso = m.idCurso
INNER JOIN Ultilizacao u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON e.idLivro = l.idLivro
WHERE l.ISBN = '9989898'

-- 7

ALTER PROCEDURE Atrasos(@mat INT) AS
BEGIN
 SELECT l.Titulo as 'Nome do livro',
 a.Nome as 'Aluno',
 u.DataInicioUtilizacao,
 u.DataPrevistaEntrega as 'Previsão de entrega',
 u.DataFimUtilizacao as 'Data de término',
 ABS(DATEDIFF(DAY, u.DataFimUtilizacao, u.DataPrevistaEntrega)) AS 'Dias de atraso',
 '2,00' as 'Multa por atraso'
 FROM Matriculas m
 INNER JOIN Alunos a ON a.idAluno = m.idAluno
 INNER JOIN Ultilizacao u ON m.idMatricula = u.idMatricula
 INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
 INNER JOIN livros l ON l.idLivro = e.idLivro
 WHERE DATEDIFF(DAY, u.DataFimUtilizacao, u.DataPrevistaEntrega) < 0 AND
 m.idMatricula = @mat
END

EXEC dbo.Atrasos @mat = 6




-- 1

SELECT DISTINCT a.* FROM Alunos a
INNER JOIN Matriculas m ON a.idAluno = m.idAluno
INNER JOIN LivrosCurso lc ON lc.idCurso = m.idCurso
INNER JOIN livros l ON lc.idLivro = l.idLivro
WHERE l.Editora = 'OBJETIVA'
ORDER BY a.Nome

select * from livros


-- 2

SELECT d.* FROM Departamentos d
EXCEPT
SELECT d2.* FROM Departamentos d2
INNER JOIN Cursos c ON d2.IdDepartamentos = c.idDepartamento
INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
INNER JOIN livros l ON l.idLivro = lc.idLivro
WHERE l.Editora <> 'PEARSON'

-- 3

SELECT d2.Nome FROM Departamentos d2
INNER JOIN Cursos c ON d2.IdDepartamentos = c.idDepartamento
INNER JOIN LivrosCurso lc ON lc.idCurso = c.idCurso
INNER JOIN livros l ON l.idLivro = lc.idLivro
WHERE l.Editora = 'OBJETIVA' AND l.Autor = 'NAVATHE'
GROUP BY d2.Nome
HAVING COUNT(DISTINCT l.idLivro) = 
(SELECT COUNT(*) FROM livros l WHERE l.Editora = 'OBJETIVA' AND l.Autor = 'NAVATHE' )

-- 4

SELECT a2.Nome FROM Alunos a2
EXCEPT
SELECT a.Nome FROM Alunos a
INNER JOIN Matriculas m ON m.idAluno = a.idAluno
INNER JOIN Ult u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.Autor = 'NAVATHE' AND l.Editora = 'OBJETIVA'

-- 5

SELECT TOP 5 WITH TIES l.Titulo FROM Ultilizacao u
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
GROUP BY l.Titulo
ORDER BY COUNT(DISTINCT l.idLivro) DESC

SELECT TOP 3 l.Titulo,
RANK() OVER(ORDER BY COUNT(u.IdUtilizacao) DESC) AS Rank FROM Ultilizacao u
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
GROUP BY l.Titulo


-- 6

SELECT a.Nome FROM Alunos a
INNER JOIN Matriculas m ON m.idAluno = a.idAluno
INNER JOIN Cursos c ON c.idCurso = m.idCurso
INNER JOIN Ult u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.ISBN = '99898989'

-- 7

ALTER PROCEDURE Folha_Pagamento (
 @mat INT 
) AS
BEGIN
 SELECT
 l.Titulo AS 'Nome do livro',
 a.Nome AS Aluno,
 u.DataInicioUtilizacao AS 'Data Início utilizacação',
 u.DataPrevistaEntrega AS 'Data prevista de entrega',
 u.DataFimUtilizacao AS 'Data de termino da utilização',
 DATEDIFF(DAY, u.DataPrevistaEntrega, u.DataFimUtilizacao) AS 'Dias de atraso',
 CAST(DATEDIFF(DAY, u.DataPrevistaEntrega, u.DataFimUtilizacao) AS MONEY) AS 'Valor'
 FROM Alunos a
 INNER JOIN Matriculas m ON m.idAluno = a.idAluno
 INNER JOIN Ult u ON u.idMatricula = m.idMatricula
 INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
 INNER JOIN livros l ON l.idLivro = e.idLivro
 WHERE DATEDIFF(DAY, u.DataPrevistaEntrega, u.DataFimUtilizacao) > 0 
 AND m.idMatricula = @mat
END

EXEC dbo.Folha_Pagamento @mat = 1







SELECT * FROM Alunos



SELECT * FROM Bib

-- REVISAO



-- 1

SELECT DISTINCT a.* FROM Alunos a
INNER JOIN Matriculas m ON a.idAluno = m.idAluno
INNER JOIN LivrosCurso c ON c.idCurso = m.idCurso
INNER JOIN livros l ON l.idLivro = c.idLivro
WHERE l.Editora = 'OBJETIVA'
ORDER BY a.Nome

-- 2

SELECT DISTINCT d.* FROM Departamentos d
INNER JOIN Cursos c ON c.IdDepartamento = d.IdDepartamentos
INNER JOIN LivrosCurso l ON l.idCurso = c.idCurso
INNER JOIN livros li ON li.idLivro = l.idLivro
WHERE li.Editora = 'Pearson' AND
NOT EXISTS(
 SELECT d1.IdDepartamentos FROM Departamentos d1
 INNER JOIN Cursos c ON c.IdDepartamento = d.IdDepartamentos
 INNER JOIN LivrosCurso l ON l.idCurso = c.idCurso
 INNER JOIN livros li1 ON li1.idLivro = l.idLivro
 WHERE li1.Editora <> 'Pearson' AND d1.IdDepartamentos = d.IdDepartamentos
)


-- 3

SELECT d.Nome, COUNT(DISTINCT li.idLivro) AS 'QtdLivros' FROM Departamentos d
INNER JOIN Cursos c ON c.IdDepartamento = d.IdDepartamentos
INNER JOIN LivrosCurso l ON l.idCurso = c.idCurso
INNER JOIN livros li ON li.idLivro = l.idLivro
WHERE li.Autor = 'NAVATHE' AND li.Editora = 'OBJETIVA'
GROUP BY d.Nome
HAVING COUNT(DISTINCT li.idLivro) = (SELECT COUNT(*) FROM livros WHERE
Autor = 'NAVATHE' AND Editora = 'OBJETIVA')

-- FALTA DE DISTINCT E ATENÇÃO A DETALHES
-- 4

SELECT a.* FROM Alunos a
EXCEPT
SELECT a.* FROM Alunos a
INNER JOIN Matriculas m ON m.idAluno = a.idAluno
INNER JOIN Ultilizacao u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.Autor = 'NAVATHE' AND l.Editora = 'OBJETIVA'

-- 5

SELECT TOP 5 WITH TIES l.Titulo FROM Matriculas m
INNER JOIN Ultilizacao u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE m.Periodo = '2020.1'
GROUP BY l.Titulo
ORDER BY COUNT(
 CASE
  WHEN e.idLivro = l.idLivro THEN 1
  ELSE 0
 END
) DESC



-- 6

SELECT e.idExemplar as Exemplar,
l.Titulo AS 'Nome do livro',
a.Nome AS Aluno,
c.Nome AS Curso,
u.DataInicioUtilizacao,
u.DataFimUtilizacao
FROM Alunos a
INNER JOIN Matriculas m ON m.idAluno = a.idAluno
INNER JOIN Cursos c ON c.idCurso = m.idCurso
INNER JOIN Ultilizacao u ON u.idMatricula = m.idMatricula
INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
INNER JOIN livros l ON l.idLivro = e.idLivro
WHERE l.ISBN = '998989898'

-- 7

CREATE PROCEDURE Pagamentos(
 @mat INT
) AS
BEGIN
 SELECT 
 l.Titulo as 'Nome do livro',
 a.Nome AS 'Aluno',
 CONVERT(VARCHAR, u.DataInicioUtilizacao, 103) AS 'Data início utilização',
 CONVERT(VARCHAR, u.DataPrevistaEntrega, 103) AS 'Data prevista de entrega',
 CONVERT(VARCHAR, u.DataInicioUtilizacao, 103) AS 'Data termino de utilização',
 DATEDIFF(DAY, u.DataPrevistaEntrega, u.DataFimUtilizacao) AS 'Dias de atraso',
 CAST(DATEDIFF(DAY, u.DataPrevistaEntrega, u.DataFimUtilizacao) AS MONEY) AS Valor
 FROM Alunos a
 INNER JOIN Matriculas m ON m.idAluno = a.idAluno
 INNER JOIN Ultilizacao u ON u.idMatricula = m.idMatricula
 INNER JOIN Exemplares e ON e.idExemplar = u.idExemplar
 INNER JOIN livros l ON l.idLivro = e.idLivro
 WHERE m.idMatricula = @mat AND 
 DATEDIFF(DAY, u.DataPrevistaEntrega, u.DataFimUtilizacao) > 0
END

EXEC Pagamentos @mat = 6