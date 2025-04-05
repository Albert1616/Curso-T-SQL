-- INSTRUÇÕES:

--  1.  Preencha os dados do candidato, nos itens a seguir; 
--  2.  Em seu banco de dados execute completamente este script. o Script criará as tabelas e incluirá os resgistros em cada tabela;
--  3.  Atenção, não apague ou inclua novos registro nas tabelas a menos que as questões determinem explicitamente;
--      pois a prova será corrigida de acordo com o conteúdo retornado para cadas script desenvolvido;
--  4.  Adicione a esse arquivo a solução para cada questão após o enunciado.

-- Boa sorte


--DADOS DO CANDIDATO
--  Nome: 
--  Telefone:
 






-- Script de criação das tabelas e inclusão dos registros em cada tabela

DROP  TABLE IF EXISTS Emp_Colaboradores;
GO 

CREATE TABLE Emp_Colaboradores (
   idColaborador INT IDENTITY (1,1),
   idDepartamento  INT NOT NULL, 
   Matricula  VARCHAR(9) NOT NULL,
   Nome  VARCHAR(50) NOT NULL,
   DataNascimento  DATETIME NULL,
   Endereco  VARCHAR(50) NULL,
   Cidade  VARCHAR(50) NULL,
   Estado  VARCHAR(2) NULL,
   Sexo  CHAR(1) NULL,
   Salario  MONEY NULL)


INSERT INTO Emp_Colaboradores
           (idDepartamento
           ,Matricula
           ,Nome
           ,DataNascimento
           ,Endereco
           ,Cidade
           ,Estado
           ,Sexo
           ,Salario)
     VALUES
           (6, '0001', 'Antônio Xavier', '16/01/1985' ,'Rua Potengi, 20 Petropolis', 'Natal', 'RN', 'M', 2000.00),
		   (1, '0008', 'Sergio Henrique', '29/07/1985' ,'Av Ayton Senna, 15 Bloco-F, Apto 101  Neopolis', 'Natal', 'RN', 'M', 3000.00),
           (2, '0012', 'Biatriz Luzia', '29/03/1985' ,'Av Amintas Barros, 15 Lagoa Nova', 'Natal', 'RN', 'F', 3000.00),
		   (3, '0012', 'Carla Costa', '29/05/1987' ,'Av Amintas Barros, 15 Lagoa Nova', 'Natal', 'RN', 'F', 2500.00),
		   (4, '0013', 'Ricardo Silva', '29/05/1977' ,'Av Engo Roberto Freire, 105 Ponta Negra', 'Natal', 'RN', 'M', 3000.00),
		   (5, '0014', 'José Carlos Silva', '19/04/1967' ,'Rua Potengi, 20 Petropolis', 'Natal', 'RN', 'M', 3300.00),
		   (6, '0015', 'Fred Junior', '16/01/1985' ,'Rua Potengi, 22 Petropolis', 'Natal', 'RN', 'M', 2000.00),
           (2, '0040', 'Carla Dias', '29/03/1985' ,'Av Amintas Barros, 125 Lagoa Nova', 'Natal', 'RN', 'F', 3000.00),
		   (3, '0043', 'Ana Carla Costa', '29/05/1987' ,'Av Amintas Barros, 125 Lagoa Nova', 'Natal', 'RN', 'F', 2500.00),
		   (4, '0044', 'Thiago Silva', '29/05/1977' ,'Av Engo Roberto Freire, 115 Ponta Negra', 'Natal', 'RN', 'M', 3000.00),
		   (5, '0045', 'Ayrton Carlos Silva', '19/04/1967' ,'Rua Potengi, 21 Petropolis', 'Natal', 'RN', 'M', 3300.00),
		   (1, '0046', 'Carlos Henrique', '29/07/1985' ,'Av Ayton Senna, 14 Bloco-A, Apto 301  Neopolis', 'Natal', 'RN', 'M', 3000.00)


SELECT * FROM Emp_Colaboradores

---------------------------------------------------------------




-- Tabela contendo os Departamentos da instituição
DROP  TABLE IF EXISTS Emp_Departamentos  
GO

CREATE TABLE  Emp_Departamentos  (
   idDepartamento  INT IDENTITY (1,1),
   Descricao  VARCHAR(50) NULL,
   idColaboradorDiretor  INT NULL,  -- VINCULO COM idColaborador na tabela Emp_Colaboradores
   InicioGestaoDiretor DATE NULL) 


INSERT INTO Emp_Departamentos
           (Descricao, idColaboradorDiretor, InicioGestaoDiretor)
     VALUES
           ('InfraEstrutura', 4,'01/01/2018'),
		   ('Desenvolvimento', 2,'01/01/2018'), 
		   ('Administrativo', 3,'01/01/2000'),
		   ('Comercial', 1,'01/01/2000'),
		   ('Marketing', 3,'01/01/2000'),
		   ('Direção', 1,'01/01/2000')

SELECT * FROM Emp_Departamentos

---------------------------------------------------------------


-- Tabela contendo os projetos 
DROP  TABLE IF EXISTS  Emp_Projetos  
GO

CREATE TABLE Emp_Projetos  (
   idProjeto INT IDENTITY (1,1),
   AnoProjeto  INT NOT NULL, 
   Nome  VARCHAR(50) NOT NULL,
   CidadeLocalizacao   VARCHAR(50) NULL,
   UfLocalizacao   VARCHAR(50) NULL,
   Finalizado   BIT NULL)   --    1-Finalizado;  Null-Em funcionamento


INSERT INTO Emp_Projetos
           (Nome
		   ,AnoProjeto
           ,CidadeLocalizacao
           ,UfLocalizacao
		   ,Finalizado)
     VALUES
           ('Alpha', 2020,'São Paulo' ,'SP',NULL),
		   ('Office A',2020, 'Belo Horizonte' ,'MG',1),
		   ('Discovery',2020, 'Porto Alegre' ,'RS',1),
		   ('Commece', 2021,'Rio de Janeiro' ,'RJ',1),
		   ('Car', 2021,'Fortaleza' ,'CE',NULL),
		   ('Mobile 2', 2021,'Natal' ,'RN',NULL),
		   ('Coffee', 2021,'João Pessoa' ,'PB',NULL),
		   ('Administrativo', 2021,'Natal' ,'RN',NULL)

SELECT * FROM Emp_Projetos

---------------------------------------------------------------



-- Tabela contendo as atividades dos colaboradores em cada projeto

DROP TABLE IF EXISTS Emp_Atividades;  

CREATE TABLE Emp_Atividades  (
   idAtividadeRealizada  INT  IDENTITY (1,1),
   idColaborador INT  NOT NULL,
   idProjeto  INT NOT NULL,
   Descricao VARCHAR(50) NULL,
   HorasUtilizadas  INT   NULL,
   DataInicio DATETIME  NULL,
   DataTermino DATETIME NULL, 
   Finalizada   BIT NULL)   --    1-Finalizada;  Null-Em Desenvolvimento) 


INSERT INTO Emp_Atividades
           (idColaborador
           ,idProjeto
           ,Descricao
           ,HorasUtilizadas
		   ,DataInicio
		   ,Datatermino
		   ,Finalizada)
     VALUES
           (1,1, 'Desenvolvimento Procedures, Triggers T-Sql ', 30,'20/01/2020','30/01/2020',1) ,
		   (1,2, 'Desenvolvimento Procedures, Triggers T-Sql ', 20,'20/02/2020','28/02/2020',1) ,
		   (1,3, 'Desenvolvimento Procedures, Triggers T-Sql ', 40,'15/04/2020','27/04/2020',1) ,
		   (2,1, 'Instalação de servidor de comunicação', 20, '25/02/2020',NULL, NULL) ,
		   (2,2, 'Instalação de servidor de comunicação', 20,'05/03/2020','10/03/2020', 1) ,
		   (2,3, 'Instalação de servidor de comunicação', 20, '05/04/2020','10/04/2020', 1) ,
		   (2,4, 'Instalação de servidor de comunicação', 20, '20/02/2020','27/02/2020',1) ,
		   (3,1, 'Desenvovimeto rotina carga', 0,NULL,NULL, NULL) ,
		   (8,2, 'Desenvovimeto rotina carga', 0,NULL,NULL, NULL) ,
		   (3,3, 'Codificação modulo login', 0,NULL,NULL, NULL) ,
		   (8,4, 'Codificação modulo login', 0, NULL,NULL, NULL) ,
		   (3,5, 'Codificação modulo tabelas', 50,'05/03/2020','10/03/2020', 1) ,
		   (8,6, 'Codificação modulo tabelas', 80,'05/04/2020','10/04/2020', 1) ,
		   (3,5, 'Codificação modulo suporte', 0, NULL,NULL, NULL) ,
		   (8,7, 'Codificação modulo comunicação', 0, NULL,NULL, NULL) ,
		   (4,6, 'Codificação modulo tabelas', 0, NULL,NULL, NULL) ,
		   (3,2, 'Codificação modulo suporte', 0, NULL,NULL, NULL) ,
		   (4,8, 'Codificação modulo comunicação', 80, '04/04/2020','10/04/2020', 1) ,
		   (2,4, 'Instalação de servidor de comunicação homologação', 0, NULL,NULL, NULL) ,
		   (2,4, 'Testes servidor de comunicação', 0, NULL,NULL, NULL) ,
		   (5,8, 'Codificação modulo Habilitação', 0, NULL,NULL, NULL) 

SELECT * FROM Emp_Atividades

------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS Emp_TipoCustos;  

CREATE TABLE Emp_TipoCustos  (
   idTipoCusto  INT  IDENTITY (1,1),
   Descricao varchar(50)) 


INSERT INTO Emp_TipoCustos
           (Descricao)
         
     VALUES
           ('Mão de obra'),
		   ('Deslocamento'),
		   ('Hospedagem'),
		   ('Equipamentos')
---------------------------------------------------------------
DROP TABLE IF EXISTS Emp_Custos;   

CREATE TABLE Emp_Custos  (
   idCusto  INT  IDENTITY (1,1),
   idColaboradorResponsavel INT  NOT NULL, -- vinculo com idColaborador na tabela Emp_Colaboradores
   idAtividadeRealizada INT NULL,
   IdTipoCusto INT NOT NULL,
   Valor  MONEY NOT  NULL)   


INSERT INTO Emp_Custos
           (idColaboradorResponsavel
           ,idAtividadeRealizada
           ,IdTipoCusto
           ,Valor)
     VALUES
           (2,1, 1, 200) ,
		   (2,2, 1, 200) ,
		   (2,3, 1, 200) ,
		   (2,4, 1, 200) ,
		   (2,5, 1, 200) ,
		   (2,6, 1, 200) ,
		   (2,7, 1, 500) ,
		   (2,8, 1, 800) ,
		   (2,9, 1, 500) ,
		   (2,10, 1, 800) ,
		   (2,11, 1, 500) ,
		   (2,12, 1, 800) ,
		   (2,13, 1, 500) ,
		   (2,14, 1, 800) ,
		   (2,1, 1, 800) ,
		   (2,2, 2, 500) ,
		   (2,3, 2, 800), 
		   (2,4, 2, 800),
		   (2,5, 2, 200) ,
		   (2,6, 2, 800) ,
		   (2,2, 3, 500) ,
		   (2,3, 3, 800), 
		   (2,4, 3, 800),
		   (2,5, 3, 200) ,
		   (2,6, 3, 800) 

SELECT * FROM Emp_Custos

        
--------------------------------------------------------------



-- Tabela de dependentes dos colaboradores
DROP TABLE IF EXISTS Emp_Dependentes  
CREATE TABLE Emp_Dependentes  (
		idDependete INT IDENTITY (1,1),
		idColaborador INT NOT NULL,
		Nome  VARCHAR(50) NOT NULL,
		Sexo  CHAR(1) NOT  NULL,
		DataNascimento  DATETIME NOT  NULL,
		RelacaoDependencia  VARCHAR(50) NOT  NULL) 


INSERT INTO Emp_Dependentes
           (idColaborador
           ,Nome
           ,Sexo
           ,DataNascimento
           ,RelacaoDependencia)
     VALUES
           (1,  'Antônio Xavier Junior', 'M', '01/05/2005', 'filho'),
		   (2,  'Maria Xavier', 'F', '01/05/1950', 'Mãe'),
		   (2,  'Caique Henrique', 'M', '21/05/1995', 'filho'),
		   (3,  'André Gustavo', 'M', '21/03/1995', 'filho'),
		   (5,  'Felipe  Silva', 'M', '21/05/2015', 'filho'),
		   (5,  'Thiago  Silva', 'M', '21/05/2015', 'filho'),
		   (5,  'Miguel  Silva', 'M', '21/05/1965', 'Pai'),
		   (9,  'Carla Costa Silva', 'F', '21/08/2015', 'filha'),
		   (11, 'Carlos Silva', 'M', '21/03/2016', 'filho')

SELECT * FROM Emp_Dependentes


DELETE FROM Emp_Atividades
DELETE FROM Emp_Colaboradores
DELETE FROM Emp_Custos
DELETE FROM Emp_Departamentos
DELETE FROM Emp_Dependentes
DELETE FROM Emp_Projetos
DELETE FROM Emp_TipoCustos

DBCC CHECKIDENT(Emp_TipoCustos, RESEED, 0)


---------------------------------------------------------------

-- 1

CREATE FUNCTION dbo.Salario(
 @data DATE,
 @qtdFilhosMenores18 INT
) RETURNS INT AS
BEGIN
 DECLARE @anos INT = DATEDIFF(YEAR, @data, GETDATE());

 RETURN 2000 + (100 * @anos) + (200 * @qtdFilhosMenores18)
END

SELECT * FROM Emp_Colaboradores
INSERT INTO Emp_Colaboradores (idDepartamento, Matricula, 
Nome, DataNascimento, Endereco,Cidade, Estado, Sexo, Salario)
VALUES
(
(SELECT idDepartamento FROM Emp_Departamentos WHERE Descricao = 'Desenvolvimento'),
'9999',
'Matheus Albert',
'2002-11-16T11:54:05',
'Rua dos endereços, 14',
'Natal',
'RN',
'M',
(SELECT dbo.Salario('2002-11-16', 3))
)

SELECT * FROM Emp_Colaboradores ORDER BY idColaborador DESC

INSERT INTO Emp_Atividades (idColaborador, idProjeto, 
Descricao, HorasUtilizadas, DataInicio, DataTermino)
VALUES
(
 (SELECT TOP 1 idColaborador FROM Emp_Colaboradores
 ORDER BY idColaborador DESC),
 (SELECT idProjeto FROM Emp_Projetos WHERE Nome = 'Car'),
 'Codificação modulo comunicação',
 80,
 GETDATE(),
 DATEADD(MONTH, 3, GETDATE())
)
SELECT * FROM Emp_Atividades ORDER BY idAtividadeRealizada DESC
SELECT * FROM Emp_Projetos

-- 2
CREATE FUNCTION Nome(
 @nome NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 RETURN UPPER(LEFT(@nome,1)) + LOWER(SUBSTRING(@nome,2,LEN(@nome)-1))
END

SELECT dbo.Nome('Mathues Albert')

SELECT dbo.Nome(c.Nome) FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON c.idDepartamento = d.idDepartamento
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
WHERE d.Descricao = 'InfraEstrutura' AND
a.idProjeto = (SELECT idProjeto FROM Emp_Projetos WHERE Nome = 'Commece')
GROUP BY c.Nome
HAVING COUNT(a.idProjeto) > 2

SELECT * FROM Emp_Departamentos

-- 3

SELECT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON c.idDepartamento = d.idDepartamento
EXCEPT
SELECT c2.Nome FROM Emp_Colaboradores c2
INNER JOIN Emp_Departamentos d2 ON c2.idDepartamento = d2.idDepartamento
WHERE d2.idColaboradorDiretor =
(SELECT idColaborador FROM Emp_Colaboradores 
WHERE Nome = 'Antônio Xavier')

-- 4

SELECT DISTINCT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.Finalizado = 1
GROUP BY c.Nome
HAVING COUNT(DISTINCT p.idProjeto) = (SELECT COUNT(*) FROM Emp_Projetos WHERE Finalizado = 1)

-- FALTOU DISTINCT NO IDPROJETO

SELECT * FROM Emp_Projetos

-- 5
DROP TABLE #T2

-- COLABORADORES QUE NAO ESTAO EM PROJETOS ATIVOS
DROP TABLE #T2
SELECT c.* INTO #T2 FROM Emp_Colaboradores c
EXCEPT 
SELECT c2.* FROM Emp_Colaboradores c2
LEFT JOIN Emp_Atividades a2 ON c2.idColaborador = a2.idColaborador
INNER JOIN Emp_Projetos p2 ON p2.idProjeto = a2.idProjeto
WHERE p2.Finalizado IS NULL

SELECT * FROM #T2

SELECT t.Nome AS Nome,
t.salario,
t.salario * 1.2 as Encargos,
(t.salario + (t.salario * 1.2)) as Total
FROM #T2 t
LEFT JOIN Emp_Atividades a ON a.idColaborador = t.idColaborador
GROUP BY t.Nome, t.salario
HAVING DATEDIFF(DAY, MAX(ISNULL(a.DataTermino, '2024-01-01')), GETDATE()) > 60

select * from Emp_Atividades ORDER BY idColaborador

SELECT t.*, a.* FROM #T1 t
INNER JOIN Emp_Atividades a ON a.idColaborador = t.idColaborador

-- 6

SELECT c.Nome, c.Endereco, c.Cidade FROM Emp_Colaboradores c
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.CidadeLocalizacao = 'São Paulo' AND c.Cidade <> 'São Paulo'

-- 7
 
SELECT DISTINCT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON d.idColaboradorDiretor = c.idColaborador
WHERE NOT EXISTS (
 SELECT 1 FROM Emp_Dependentes WHERE idColaborador = c.idColaborador
)

SELECT c.* FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON d.idColaboradorDiretor = c.idColaborador
LEFT JOIN Emp_Dependentes de ON de.idColaborador = c.idColaborador
WHERE de.idColaborador IS NULL


-- 8

ALTER PROCEDURE dbo.Abono(
 @mes INT
) AS
BEGIN
 SELECT *, CAST((200 * t.[Quantidade dependentes
beneficiados com abono
aniversário]) AS MONEY) AS 'Valor abono aniversário' FROM (
SELECT c.Nome AS Colaborador,
@mes Mês,
CAST(COUNT(
  CASE 
   WHEN MONTH(d.DataNascimento) = @mes THEN 1
  END
 ) AS INT) AS 'Quantidade dependentes
beneficiados com abono
aniversário' FROM Emp_Colaboradores c
 INNER JOIN Emp_Dependentes d ON c.idColaborador = d.idColaborador
 WHERE d.RelacaoDependencia LIKE '%filh[oa]%' AND DATEDIFF(YEAR, d.DataNascimento, GETDATE()) < 18
 GROUP BY c.Nome) t 
 WHERE t.[Quantidade dependentes
beneficiados com abono
aniversário] > 0 
END

EXEC dbo.Abono @mes= 8
 -- 9

 SELECT c.Nome, d.Nome FROM Emp_Colaboradores c
 INNER JOIN Emp_Dependentes d ON d.idColaborador = c.idColaborador
 WHERE d.RelacaoDependencia LIKE '%filh[oa]%' AND
 LEFT(c.Nome, CHARINDEX(' ', c.Nome)) = LEFT(d.Nome, CHARINDEX(' ', d.Nome))

 SELECT * FROM Emp_Dependentes



 -- REFAZENDO

 --2 

 DBCC FREEPROCCACHE

 SELECT dbo.Maiscula_Nome(c.Nome )FROM Emp_Colaboradores c
 INNER JOIN Emp_Departamentos d ON d.idDepartamento = c.idDepartamento
 INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
 INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
 WHERE d.Descricao = 'InfraEstrutura' AND p.Nome = 'Commece'
 GROUP BY c.Nome
 HAVING COUNT(DISTINCT a.idAtividadeRealizada) > 2

 SELECT * FROM Emp_Departamentos

ALTER FUNCTION Maiscula_Nome(
 @Nome NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 DECLARE @aux NVARCHAR(MAX) = ''
 DECLARE @i INT = 1
 DECLARE @nome_form NVARCHAR(MAX) = ''
 DECLARE @word CHAR(1) = ''

 WHILE @i <= LEN(@Nome)
 BEGIN
   SET @word = SUBSTRING(@Nome, @i, 1)

   IF @word = ' ' OR @i = LEN(@Nome)
   BEGIN
    IF @i = LEN(@Nome)
	 SET @aux = @aux + @word
    IF @aux <> 'de' AND @aux <> 'do' AND @aux <> 'da'
	 SET @aux = UPPER(LEFT(@aux, 1)) + LOWER(SUBSTRING(@aux, 2, LEN(@aux)-1))
	 SET @nome_form = @nome_form + @aux + ' '
	 SET  @aux = ''
   END
   ELSE
    SET @aux = @aux + @word;

   SET @i = @i + 1;
 END
 RETURN @nome_form
END	

SELECT dbo.Maiscula_NomeV2('matheus albert da silva araujo')

ALTER FUNCTION Maiscula_NomeV2(
 @Nome NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 DECLARE @nome_form NVARCHAR(MAX) = ''
 DECLARE @words NVARCHAR(MAX) = ''

 SET @Nome = @Nome + ' '

 WHILE LEN(@Nome) > 0
 BEGIN
  SET @words = SUBSTRING(@Nome, 1, CHARINDEX(' ', @Nome)-1);
  IF @words IN ('de', 'da', 'do')
	SET @words = LOWER(@words)
  ELSE
	SET @words = UPPER(LEFT(@words, 1)) + LOWER(SUBSTRING(@words, 2, LEN(@words)-1))
   
  SET @nome_form = @nome_form + @words + ' '

  SET @Nome = SUBSTRING(@Nome, CHARINDEX(' ', @Nome) + 1, LEN(@Nome)-1)
 END

 RETURN @nome_form
END	

SELECT dbo.Maiscula_NomeV2('matheus albert da silva araujo')

--4 
SELECT DISTINCT c1.Nome FROM Emp_Colaboradores c1
WHERE (
SELECT COUNT(*) FROM(
SELECT DISTINCT p2.idProjeto FROM Emp_Projetos p2
WHERE p2.Finalizado = 1
EXCEPT
SELECT DISTINCT p.idProjeto FROM Emp_Colaboradores c
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.Finalizado = 1 AND c.idColaborador = c1.idColaborador
) AS Resultado
) = 0

-- 5

SELECT c.* INTO #T3 FROM Emp_Colaboradores c
EXCEPT
SELECT c1.* FROM Emp_Colaboradores c1
INNER JOIN Emp_Atividades a ON a.idColaborador = c1.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.Finalizado IS NULL

SELECT t.Nome, t.Salario, CAST(t.Salario * 1.2 AS MONEY), 
CAST((t.Salario + t.Salario*1.2) AS MONEY) FROM #T3 t
LEFT JOIN Emp_Atividades a ON a.idColaborador = t.idColaborador
GROUP BY t.Nome, t.Salario
HAVING DATEDIFF(DAY,ISNULL(MAX(a.DataTermino), '2024-01-01'),GETDATE()) >= 60

SELECT c.*, a.* FROM Emp_Colaboradores c
INNER JOIN Emp_Atividades a ON c.idColaborador = a.idColaborador
WHERE c.Nome = 'Antônio Xavier'

SELECT * FROM Emp_Colaboradores

-- 8 ALTERNATIVA

ALTER PROCEDURE Horas(
 @ano INT
) AS
BEGIN
 SELECT TOP 3 WITH TIES c.Nome, 
 @ano AS Ano,
 SUM(a.HorasUtilizadas) as 'Horas',
 CAST(200 AS MONEY)
 FROM Emp_Colaboradores c
 INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
 INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
 WHERE YEAR(a.DataInicio) = @ano AND a.Finalizada = 1
 GROUP BY c.Nome
 ORDER BY SUM(a.HorasUtilizadas) DESC
END

EXEC dbo.Horas @ano = 2020

SELECT * FROM Emp_Projetos

-- 8

ALTER PROCEDURE Abono_presente(
 @mes INT
) AS
BEGIN
 SELECT c.Nome,
 @mes AS 'Mes',
 COUNT(DISTINCT d.idDependete) AS 'Quantidade de dependentes',
 CAST(COUNT(DISTINCT d.idDependete) * 200 AS MONEY) AS 'Valor do abono aniversário'
 FROM Emp_Colaboradores c
 INNER JOIN Emp_Dependentes d ON d.idColaborador = c.idColaborador
 WHERE d.RelacaoDependencia LIKE '%filh[oa]%' AND
 DATEDIFF(YEAR, d.DataNascimento, GETDATE()) < 18 AND
 MONTH(d.DataNascimento) = @mes
 GROUP BY c.Nome
END

EXEC dbo.Abono_presente @mes = 8

SELECT * FROM Emp_Dependentes WHERE RelacaoDependencia LIKE '%filh[oa]%'




















-- 1

CREATE TRIGGER add_colaborador ON Emp_Colaboradores
FOR INSERT AS
BEGIN
 SELECT * FROM Emp_Colaboradores
END

ALTER FUNCTION dbo.Salario_Fun(
 @date DATETIME,
 @qtdFilhos18 INT
) RETURNS MONEY AS
BEGIN
 DECLARE @anos INT = DATEDIFF(YEAR, @date, GETDATE());
 
 RETURN CAST(2000 + (@anos*100) + (200 * @qtdFilhos18) AS MONEY)
END

SELECT dbo.Salario_Fun('2002-11-16T12:00:00', 4)

INSERT INTO Emp_Colaboradores (idDepartamento, Matricula, Nome, 
DataNascimento, Endereco, Cidade, Estado, Sexo, Salario) VALUES
(
 (SELECT idDepartamento FROM Emp_Departamentos WHERE Descricao = 'Desenvolvimento'),
 '9999',
 'Albert',
 '2002-11-16T12:00:00',
 'Rua A',
 'Natal',
 'RN',
 'M',
 (SELECT dbo.Salario_Fun('2002-11-16T12:00:00', 4))
)

CREATE TRIGGER add_atv ON Emp_Atividades 
FOR INSERT AS
BEGIN
 SELECT * FROM inserted
END

INSERT INTO Emp_Atividades (idColaborador,
   idProjeto,
   Descricao,
   HorasUtilizadas,
   DataInicio,
   DataTermino, 
   Finalizada) VALUES 
   (
    (SELECT idColaborador FROM Emp_Colaboradores WHERE Matricula = '9999'),
	(SELECT idProjeto FROM Emp_Projetos WHERE Nome = 'Car'),
	'Codificação modulo comunicação',
	80,
	GETDATE(),
	DATEADD(MONTH, 3, GETDATE()),
	0
   )

-- 2

SELECT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON c.idDepartamento = d.idDepartamento
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE d.Descricao = 'Infraestrutura' AND p.Nome = 'Commece'
GROUP BY c.Nome
HAVING COUNT(DISTINCT a.idAtividadeRealizada) > 2

-- 3

SELECT Nome FROM Emp_Colaboradores
EXCEPT
SELECT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON c.idDepartamento = d.idDepartamento
WHERE d.idColaboradorDiretor = (SELECT idColaborador FROM Emp_Colaboradores 
WHERE Nome LIKE '%Antônio Xavier%')
ORDER BY Nome

-- 4

SELECT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.Finalizado = 1
GROUP BY c.Nome
HAVING COUNT(DISTINCT p.idProjeto) = 
(SELECT COUNT(*) FROM Emp_Projetos p WHERE Finalizado = 1)

-- 5
DROP TABLE #T1
SELECT c.* INTO #T1 FROM Emp_Colaboradores c
EXCEPT
SELECT c.* FROM Emp_Colaboradores c
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.Finalizado IS NULL;

SELECT t.Nome,
t.Salario,
t.Salario * 1.2,
t.Salario + (t.Salario * 1.2) FROM #T1 t
LEFT JOIN Emp_Atividades a ON a.idColaborador = t.idColaborador
GROUP BY t.Nome, t.Salario
HAVING DATEDIFF(DAY, ISNULL(MAX(a.DataTermino), '2024-01-01'), GETDATE()) > 60

SELECT c.* INTO #T3 FROM Emp_Colaboradores c
EXCEPT
SELECT c1.* FROM Emp_Colaboradores c1
INNER JOIN Emp_Atividades a ON a.idColaborador = c1.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.Finalizado IS NULL

SELECT * FROM #T1
SELECT * FROM #T3

SELECT t.Nome, t.Salario, CAST(t.Salario * 1.2 AS MONEY), 
CAST((t.Salario + t.Salario*1.2) AS MONEY) FROM #T3 t
LEFT JOIN Emp_Atividades a ON a.idColaborador = t.idColaborador
GROUP BY t.Nome, t.Salario
HAVING DATEDIFF(DAY,ISNULL(MAX(a.DataTermino), '2024-01-01'),GETDATE()) >= 60

-- 6

SELECT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Atividades a ON a.idColaborador = c.idColaborador
INNER JOIN Emp_Projetos p ON p.idProjeto = a.idProjeto
WHERE p.CidadeLocalizacao = 'São Paulo' AND c.Cidade <> 'São Paulo'

-- 7

SELECT DISTINCT c.* FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON d.idColaboradorDiretor = c.idColaborador
WHERE NOT EXISTS(
 SELECT de.idDependete FROM Emp_Dependentes de WHERE de.idColaborador = c.idColaborador
)

SELECT DISTINCT c.Nome FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON d.idColaboradorDiretor = c.idColaborador
WHERE NOT EXISTS (
 SELECT 1 FROM Emp_Dependentes WHERE idColaborador = c.idColaborador
)

-- 8

CREATE PROCEDURE dbo.Abono_pres(
 @mes INT
) AS BEGIN

 SELECT c.Nome AS Colaborador,
 @mes AS Mes,
 COUNT(DISTINCT d.idDependete) AS 'Quantidade dependentes beneficiados com abono
 aniversário',
 COUNT(DISTINCT d.idDependete) * 200 AS 'Valor Abono aniversário'
 FROM Emp_Colaboradores c
 INNER JOIN Emp_Dependentes d ON d.idColaborador = c.idColaborador
 WHERE d.RelacaoDependencia LIKE '%filh[oa]%' AND 
 DATEDIFF(YEAR, d.DataNascimento, GETDATE()) < 18 AND
 MONTH(d.DataNascimento) = @mes
 GROUP BY c.Nome
END

EXEC dbo.Abono_pres @mes = 8

-- 9

SELECT c.Nome, d.Nome, d.RelacaoDependencia FROM Emp_Colaboradores c
 INNER JOIN Emp_Dependentes d ON d.idColaborador = c.idColaborador
 WHERE d.RelacaoDependencia LIKE '%filh[oa]%' AND
 LEFT(c.Nome, CHARINDEX(' ', c.Nome)) = LEFT(d.Nome, CHARINDEX(' ', d.Nome))