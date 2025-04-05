use [LogCurso]

--DROP TABLE Pessoa

CREATE TABLE [dbo].[Pessoa](
	[idPessoa] [int] PRIMARY KEY IDENTITY(1,1),
	[Nome] [varchar](80) NULL,
	[DataNascimento] [date] NULL,
	[Telefone] [varchar](11) NULL,
	[CPF] [varchar](11) NULL,
	[Renda] [money] NULL)
--GO --Proximo comando

DROP TABLE Pessoa

DELETE TRIGGER 

INSERT INTO Pessoa (Nome, DataNascimento, Telefone, CPF, Renda)
VALUES
('Aberlândio Felix Nascimento', '1986-12-22', '75382510228', '36548314220', 3154)
,('Adelmo de Jesus Santos', '1976-05-26', '43367308591', '53304786662', 1260)
,('Aderaldo Oliveira de Santana', '2022-11-21', '74640604773', '53813827265', 9189)
,('Aldo Rudney Junio Sales Santos', '2013-12-09', '51656420627', '84401081584', 1601)
,('Alexsandro de Jesus Santos', '1976-11-21', '73868113998', '78826521138', 9335)
,('Anderson Bruno Araújo Santos', '2008-09-20', '86176201394', '34236560546', 4896)
,('Antonio Carlos Moraes Andrade', '1981-02-09', '18357764891', '20341762250', 4552)
,('Antonio Gonçalves de Santana Neto', '1989-05-12', '35674835111', '54263527579', 2046)
,('Antonio Marcos Ribeiro da Silva', '1997-07-13', '54074704989', '81512750236', 292)
,('Daniel da Silva Santos', '1980-08-29', '15780464145', '57100151630', 4906)
,('Danilo de Jesus Santos', '1987-05-05', '66106707580', '71531804041', 6021)
,('Danilo Gabriel Bomfim Santos', '1976-05-06', '22353053567', '78255677420', 9277)
,('Demas Freitas Santos', '1983-08-28', '34372544304', '67337881465', 6841)
,('Edson Cunha da Conceição', '1987-04-14', '84768375074', '45430187446', 9952)
,('Emisson de Jesus dos Santos', '2019-11-11', '48805022058', '56018115387', 5016)
,('Fabio Seixas Santos', '2015-10-02', '89802235694', '82860633150', 4977)
,('Genilson do Carmo S. Macedo', '1999-10-27', '51763040727', '41820361287', 4255)
,('George dos Santos Souza', '2000-01-03', '73378347310', '10220773342', 824)
,('George Washington Carvalho dos Santos da Silva', '1998-03-06', '82824467380', '44738242412', 2652)
,('Geovane Resende de Santana', '2003-04-09', '74266045424', '73736007672', 6214)
,('Gustavo Freitas Santos', '2010-01-31', '62363830561', '85775105018', 7248)
,('Jailson Souza dos Santos', '1988-01-27', '65805731238', '51468336243', 609)
,('Jilvan Angelo dos Santos', '1987-05-25', '42431683234', '85672385759', 3575)
,('Joao Cleber Santana Leal de Abreu', '2007-02-15', '87171267690', '12371134259', 791)
,('Joao Pedro de Jesus Doria', '2002-10-04', '65370568026', '47667055748', 386)
,('Joelmir Santos Gonzaga', '1986-04-19', '73864205640', '38176217484', NULL)
,('José Adenio Ribeiro do Nascimento', '2015-11-21', '37515482044', '38316681143', NULL)
,('Jose Alves de Oliveira Neto', '1984-12-11', '65813373888', '78708351300', 6177)
,('Jose Amilton dos Santos Matos', '1987-01-23', '46342477605', '75887315560', 4984)
,('Jose Andre Correia dos Santos', '1995-06-01', '38414658811', '68262413359', 4823)
,('José Arnaldo dos Santos', '2000-07-26', '41376885556', '28043710302', 5715)
,('José Cleidisson das Virgens Santos', '1977-10-18', '28536053373', '73013133500', NULL)
,('José Doglas Santna Leal', '2024-03-11', '74188135780', '11534470138', 6602)
,('Jose Edenilson de Jesus Santos', '1991-08-11', '55841647538', '24200178369', NULL)
,('Jose Jeovan de Jesus Santana', '2019-11-21', '35527475607', '81016082235', 1419)
,('Jose Leandro dos Santos', '2009-04-19', '28066280325', '57505028000', 4267)
,('Jose Micael Cruz Matos', '1980-05-04', '15407834079', '16401668034', 7658)
,('José Miraldo da Silva Santos', '1977-01-23', '71628457059', '58601367307', 8898)
,('Jose Romario Cruz Andrade', '2000-06-17', '31046720851', '14553120503', 2023)
,('Jose Santos de Santana', '1975-09-19', '85206605128', '12761862612', 5616)
,('Juliano Santos Santana', '1988-01-11', '99168435506', '68532006329', 4578)
,('leandro Alves de Souza', '1975-02-21', '28024516753', '57360028126', 4366)
,('Leonardo Paulo dos Santos', '2017-11-18', '28332272389', '84218677714', 3692)
,('Leonardo Souza de Andrade', '2023-01-04', '65122523381', '10284165031', 1448)
,('Luizinho Reis Leal', '2001-10-05', '84048115325', '54087720050', 8573)
,('Maciel de Jesus Ferreira', '1975-03-02', '63426602455', '63878484676', 8913)
,('Marcos Vinicius de Melo', '2008-07-08', '11324261878', '76607748582', 562)
,('Marcos Vinicius Santana Fontes', '1990-10-21', '61164513198', '84063713105', NULL)
,('Marcos Vinicius Santos Rocha', '2003-09-04', '91155278009', '67611254362', 7874)
,('Matheus Silva Santana', '2016-11-11', '82181020280', '43425575680', 8175)
,('Nadson Santos Santana', '1978-01-12', '71771580847', '20376384008', 9462)
,('Normilson Conceição dos Santos', '2003-05-02', '45683801990', '71816143740', 4295)
,('Paulo César de C. Reis', '1995-01-02', '48231113307', '50222466713', 4369)
,('Paulo Henrique dos Santos', '1979-01-05', '44054184379', '76257116744', 4503)
,('Pedro Henrique Silva', '1999-08-17', '98188117914', '45081411456', 21)
,('Rafael Barbosa Ramos', '2010-03-06', '67447712421', '24142533482', 146)
,('Railton de Santana Santos', '1997-11-17', '37154315467', '75231767024', 8908)
,('Rerinaldo dos Santos Lima', '1997-06-12', '53276570869', '83410248418', 1006)
,('Rodrigo Santana Alves', '2015-08-23', '37811802360', '75520867105', 200)
,('Uilson Santos de Jesus', '1985-03-01', '73810479254', '77714233567', 7649)
,('Vinicius Andrade dos Reis', '1988-11-13', '86746303373', '83235308346', 3997)
,('Wemerson Oliveira de Carvalho', '2009-04-27', '86522867830', '80873547620', 6465)
,('Willans da Conceicão', '2024-01-19', '45328774710', '23245168089', 4946)
,('Willian Carvalho Morais', '2019-10-04', '51128785621', '52745836041', 1738)
,('Ygor Frances Santos da Conceicão', '2013-04-03', '68266055358', '16483204419', 6427)
--GO

-- SELECT * FROM Pessoa

-----------------------------
-- DESAFIOS
-----------------------------

-- 1. Selecione todas as pessoas que não tem renda
SELECT * FROM Pessoa WHERE Renda IS NULL
-- 2. Valor da folha de pagamento do mês?
SELECT CONVERT(VARCHAR, SUM(Renda), 1) AS Folha_pagamento FROM Pessoa
-- 3. Quantos aniversariantes tem em cada mês?
SELECT DATENAME(MONTH, DataNascimento), COUNT(*) FROM Pessoa
GROUP BY DATENAME(MONTH, DataNascimento)

-- 4. Quais os meses tem mais de 5 aniversariantes?
SELECT DATENAME(MONTH, DataNascimento) FROM Pessoa
GROUP BY DATENAME(MONTH, DataNascimento)
HAVING COUNT(*) > 5
-- 5. Quantos meses tem mais de 5 aniversariantes?
SELECT COUNT(*) FROM (
SELECT DATENAME(MONTH, DataNascimento) AS Mes FROM Pessoa
GROUP BY DATENAME(MONTH, DataNascimento)
HAVING COUNT(*) > 5
) meses
-- 6. Selecione as pessoas que ganham acima da média, listando os seus nomes e a porcentagem que a renda da pessoa representa da renda média
SELECT Nome, (Renda)/(SELECT AVG(Renda) FROM Pessoa) FROM Pessoa
WHERE Renda > (SELECT AVG(Renda) FROM Pessoa)

-- 7. Selecione o nome e a data de nascimento das pessoas, substituindo a data de nascimento por 'Data Confidencial' para pessoas menores que 18 anos:
SELECT Nome, 
CASE
 WHEN YEAR(GETDATE()) - YEAR(DataNascimento) < 18 THEN 'Data Confidencial'
 ELSE CAST(DataNascimento AS VARCHAR)
END
FROM Pessoa
-- 8. Quantas pessoas ganham acima de 3500?
-- 9. Qual o nome da pessoa com telefone 20276570?
SELECT Nome FROM Pessoa WHERE '20276570' IN (Telefone)
-- 10. Qual o nome e a renda da pessoa que nasceu em 2013, e a primeira letra do seu nome é ‘A’?
SELECT Nome, Renda FROM Pessoa WHERE YEAR(DataNascimento) = 2013 AND Nome LIKE 'A%'
-- 11. Quantas pessoas começam ou terminam com a letra ‘E’?
SELECT COUNT(*) FROM Pessoa WHERE Nome LIKE 'E%' OR Nome LIKE '%e'
-- 12. Quais os primeiros nomes das pessoas que começam ou terminam com a letra ‘E’?
SELECT LEFT(Nome, CHARINDEX(' ', Nome)) AS NOME FROM Pessoa WHERE Nome LIKE 'E%' OR Nome LIKE '%e'

-- 13. Quais os 4 últimos dígitos do telefone de Normilson?
SELECT RIGHT(Telefone, 4) FROM Pessoa WHERE LEFT(Nome,CHARINDEX(' ', Nome)) = 'Normilson'
-- 14. Quantos José temos na tabela de pessoa?
SELECT COUNT(*) FROM Pessoa WHERE CHARINDEX('Jose', Nome) > 0
-- 15. Qual dos José tem o nome com o maior número de caracteres, qual o id dele?
SELECT Nome FROM Pessoa
WHERE LEN(Nome) = (SELECT MAX(LEN(Nome)) FROM Pessoa WHERE LEFT(Nome, CHARINDEX(' ', Nome)) = 'José')
-- 16. Qual o telefone de Antonio?
SELECT Telefone FROM Pessoa WHERE LEFT(Nome, CHARINDEX(' ', Nome)) = 'Antonio'
-- 17. Qual a média de idade das pessoas?
SELECT AVG(DATEDIFF(YEAR, DataNascimento, GETDATE())) FROM Pessoa
-- 18. Qual a Renda média das pessoas que nasceram na primeira década dos anos 2000?
SELECT AVG(Renda) FROM Pessoa
WHERE YEAR(DataNascimento) BETWEEN 2000 AND 2010
-- 19. Qual a soma da renda das pessoas que nasceram em Setembro?
SELECT SUM(Renda) FROM Pessoa WHERE MONTH(DataNascimento) = 9
-- 20. Selecione o nome e a renda das pessoas, mostrando apenas aquelas que têm renda maior que a média:
SELECT Nome, Renda FROM Pessoa WHERE Renda > (SELECT AVG(Renda) FROM Pessoa)
-- 21. Qual pessoa do sobrenome Santos, ganha mais?
SELECT Nome FROM Pessoa 
WHERE Renda = (SELECT MAX(Renda) AS Renda_media FROM Pessoa WHERE Nome LIKE '%santos%')
-- 22. Em que dia da semana nasceu Railton?
SELECT DATENAME(WEEKDAY, DataNascimento) AS 'Dia da semana' FROM Pessoa
WHERE LEFT(Nome, CHARINDEX(' ',Nome)) = 'Railton'
-- 23. Qual o telefone da pessoa de CPF _ _ _ 624 _ _ _ _ _?
SELECT Telefone, CPF FROM Pessoa WHERE CPF LIKE '___624%'
-- 24. Qual o nome da pessoa mais jovem e quantos dias de vida ela tem?
SELECT Nome,DATEDIFF(DAY, DataNascimento, GETDATE()) AS Dias FROM Pessoa WHERE DATEDIFF(DAY, DataNascimento, GETDATE()) = 
(SELECT MIN(DATEDIFF(DAY, DataNascimento, GETDATE())) FROM Pessoa)
-- 25. Adicionar máscara no campo CPF no formato cpf 123.456.789-09
SELECT FORMAT(CAST(CPF AS BIGINT), '### ### ###-##') FROM Pessoa
-- 26. Adicionar máscara no campo telefone no formato (xx) x xxxx-xxxx
SELECT FORMAT(CAST(Telefone AS BIGINT), '(##) # ####-####') FROM Pessoa
-- 27. Remover máscara CPF '123.456.789-09'
SELECT STUFF(STUFF(STUFF('123.456.789-09',4,)))
-- 28. Mascarar um CPF no formato 123******09 (Contexto: Proteção de dados LGPD)
-- 29. Transformar a primeira letra maiúscula do nome
-- 30. Selecione o primeiro e último nome (Contexto: Check-in)
-- 31. Data de nascimento e renda formatada no padrão brasileiro (Contexto: Relatório, exportação de arquivo)
-- 32. Selecionar os primeiros nomes de todas as pessoas numa só cadeia de caracteres, desconsiderando as repetições, agrupada e concatenada com separador ','. Resultado esperado: Aberlândio,Adelmo,[...],Willian,Ygor


-- DESAFIOS - RESOLUÇÃO

-- 1

--SELECT * FROM Pessoa WHERE Renda IS NULL

-- 2

SELECT SUM(Renda) AS TOTAL FROM Pessoa

-- 3

SELECT MONTH(DataNascimento) AS MES, COUNT(*) FROM Pessoa
GROUP BY MONTH(DataNascimento)

-- 4

SELECT MONTH(DataNascimento) AS MES,COUNT(*) AS Total FROM Pessoa
GROUP BY MONTH(DataNascimento)
HAVING COUNT(*) > 5 -- FILTRA COLUNAS GERADAS A PARTIR DE FUNCÕES DE AGREGAÇÃO - APÓS AGRUPAMENTO

-- 5

SELECT COUNT(*) FROM (
 SELECT MONTH(DataNascimento) AS Mes FROM Pessoa
 GROUP BY MONTH(DataNascimento)
 HAVING COUNT(*) > 5
) AS NumMeses -- em subconsultas é preciso nomear com alias as colunas consultadas


-- 6

SELECT  Nome, (Renda * 100)/(SELECT AVG(Renda) FROM Pessoa) AS Porcentagem FROM Pessoa
WHERE Renda > (SELECT AVG(Renda) FROM Pessoa)
ORDER BY Renda ASC
FOR JSON PATH

-- 7 

SELECT Nome, 
CASE
	WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) < 18 THEN STUFF(DataNascimento,1,LEN(DataNascimento),'Data confidencial')
	ELSE CONVERT(VARCHAR,DataNascimento,103)
END AS Idade FROM Pessoa

-- 8

SELECT COUNT(*) AS '> 3500' FROM Pessoa
WHERE Renda > 3500

-- 9 - RETORNO VAZIO

SELECT Nome FROM Pessoa
WHERE CHARINDEX('20276570', Telefone) > 0 -- CHARINDEX - PROCURAR STRINGS

-- 10

SELECT Nome FROM Pessoa
WHERE YEAR(DataNascimento) = '2013' AND Nome LIKE 'A%'

-- 11

SELECT COUNT(*) 'Número de pessoas' FROM Pessoa
WHERE Nome LIKE 'E%' OR Nome LIKE '%e' COLLATE Latin1_General_CI_AI


-- 12

SELECT SUBSTRING(Nome, 1, CHARINDEX(' ', Nome)-1) AS Nome FROM Pessoa -- FIRTS NAME
WHERE Nome LIKE 'E%' OR Nome LIKE '%e' COLLATE Latin1_General_CI_AI

-- 13

SELECT RIGHT(Telefone, 4) AS 'Ultimos Digitos' FROM Pessoa
WHERE SUBSTRING(Nome,1, CHARINDEX(' ', Nome)-1) = 'Normilson'

-- 14

SELECT COUNT(*) AS 'Número de José' FROM Pessoa
WHERE CHARINDEX('José', Nome COLLATE Latin1_General_CI_AI) > 0

-- 15

SELECT TOP 1 idPessoa, Nome FROM Pessoa
WHERE CHARINDEX('Jose', Nome COLLATE Latin1_General_CI_AI) > 0
ORDER BY LEN(Nome) DESC

SELECT TOP 3 idPessoa, Nome, LEN(Nome),
RANK() OVER(ORDER BY LEN(Nome) DESC) AS Rank FROM Pessoa
WHERE CHARINDEX('Jose', Nome COLLATE Latin1_General_CI_AI) > 0


-- SEGUNDA VERSÃO
--SELECT Nome, LEN(Nome) FROM Pessoa
--WHERE LEN(Nome) = (SELECT MAX(LEN(Nome)) FROM Pessoa WHERE Nome LIKE '%[José, josé, jose]') -- outro modo

-- 16

SELECT Nome, Telefone FROM Pessoa 
WHERE SUBSTRING(Nome, 1, CHARINDEX(' ', Nome)) = 'Antonio' -- QUAL ANTONIO?

-- 17

SELECT AVG(DATEDIFF(YEAR, DataNascimento, GETDATE())) AS 'Média de idade' FROM Pessoa

-- 18

SELECT AVG(Renda) AS 'Renda média' FROM Pessoa
WHERE YEAR(DataNascimento) BETWEEN 2000 AND 2009

-- 19

SELECT SUM(Renda) as 'SOMA TOTAL' FROM Pessoa
WHERE MONTH(DataNascimento) = 9

-- 20

SELECT Nome, Renda FROM Pessoa
WHERE Renda > (SELECT AVG(Renda) AS 'Renda média' FROM Pessoa) -- SUBQUERY

--SELECT COUNT(*) FROM Pessoa
--WHERE Renda > (SELECT AVG(Renda) as 'Renda média' FROM Pessoa) -- NUMERO DE PESSOAS COM RENDA ACIMA DA MEDIA

-- 21

SELECT Nome, Renda FROM Pessoa
WHERE Renda = (SELECT MAX(Renda) FROM Pessoa WHERE Nome LIKE '%Santos%')

-- SEGUNDA VERSÃO
--SELECT TOP 1 Nome, Renda FROM Pessoa
--WHERE CHARINDEX('Santos', Nome COLLATE Latin1_General_CI_AI) > 0
--ORDER BY Renda DESC

-- 22

SELECT DATENAME(dw,DataNascimento) AS 'Dia de nascimento' FROM Pessoa
WHERE SUBSTRING(Nome, 1, CHARINDEX(' ', Nome)-1) = 'Railton'

-- 23

SELECT Nome, Telefone, CPF FROM Pessoa
WHERE CPF LIKE '___624%'

-- 24

SELECT Nome, DATEDIFF(DAY, DataNascimento, GETDATE()) AS 'Dias de vida' FROM Pessoa
WHERE DATEDIFF(DAY, DataNascimento, GETDATE()) = (SELECT MIN(DATEDIFF(DAY, DataNascimento, GETDATE())) AS Dias FROM Pessoa)

-- SEDUNDA VERSAO
--SELECT TOP 1 Nome, DATEDIFF(DAY, DataNascimento, GETDATE()) FROM Pessoa
--ORDER BY DATEDIFF(DAY, DataNascimento, GETDATE()) ASC

-- 25
 
--SELECT Nome, 
--SUBSTRING(CPF,1,3) + '.' + SUBSTRING(CPF,4,3) + '.' + SUBSTRING(CPF,7,3) + 
--'-' + SUBSTRING(CPF,10,2) FROM Pessoa

SELECT Nome,
STUFF(STUFF(STUFF(CPF, 4,0, '.'),8,0,'.'),12,0,'-')
FROM Pessoa

-- 26

SELECT FORMAT(CAST(Telefone AS bigint), '(##) #####-####') AS Telefone FROM Pessoa

-- 27

SELECT REPLACE(REPLACE('124.456.789-09','.',''), '-', '') AS 'CPF sem formatação|'

-- 28

SELECT STUFF(CPF,4,6,'******') AS CPF FROM Pessoa -- replace partes especificas do CPF -- REPLICATE PARA OS *

-- 29

SELECT CONCAT(UPPER(LEFT(Nome,1)), LOWER(RIGHT(Nome,LEN(Nome)-1))) FROM Pessoa

-- 30

SELECT LEFT(Nome, CHARINDEX(' ', Nome)-1) AS 'Primeiro nome',
REVERSE(LEFT(REVERSE(Nome),CHARINDEX(' ', REVERSE(Nome))-1)) AS 'Último nome' FROM Pessoa

---- 31

SELECT FORMAT(DataNascimento, 'dd/MM/yyyy', 'pt-br') AS 'Data padrão brasileiro', FORMAT(Renda,'N', 'pt-br') AS 'Renda pt-br' FROM Pessoa

-- 32


SELECT STRING_AGG(Nome, ',') FROM
(
 SELECT DISTINCT LEFT(Nome, CHARINDEX(' ', Nome)) as Nome FROM Pessoa
) AS t

--Selecione o nome e a data de nascimento das pessoas, substituindo a data de nascimento 
-- por 'Data Confidencial' para pessoas menores que 18 anos:
SELECT Nome, (
 CASE WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) < 18 THEN 'Data confidencial'
 ELSE CONVERT(VARCHAR, DataNascimento, 103)
 END
) FROM Pessoa
--Quantas pessoas ganham acima de 3500?
SELECT COUNT(*) FROM Pessoa WHERE Renda > 3500
--Qual o nome da pessoa com telefone 20276570?
--Qual o nome e a renda da pessoa que nasceu em 2013, e a primeira letra do seu nome é ‘A’?
SELECT Nome, Renda FROM Pessoa WHERE YEAR(DataNascimento) = 2013 
AND Nome LIKE 'A%' 
--Quantas pessoas começam ou terminam com a letra ‘E’?
SELECT COUNT(*) FROM Pessoa WHERE Nome LIKE 'E%' OR Nome LIKE '%e'
--Quais os primeiros nomes das pessoas que começam ou terminam com a letra ‘E’?
SELECT LEFT(Nome, CHARINDEX(' ', Nome)) FROM Pessoa WHERE Nome LIKE 'E%' OR Nome LIKE '%e'
--Quais os 4 últimos dígitos do telefone de Normilson?
SELECT RIGHT(Telefone, 4) FROM Pessoa WHERE CHARINDEX('Normilson', Nome) > 0
--Quantos José temos na tabela de pessoa?
SELECT COUNT(*) FROM Pessoa WHERE CHARINDEX('José',Nome) > 0
--Qual dos José tem o nome com o maior número de caracteres, qual o id dele?
SELECT TOP 1 Nome, idPessoa FROM Pessoa
WHERE CHARINDEX('José',Nome) > 0
ORDER BY LEN(Nome) DESC
--Qual o telefone de Antonio?
SELECT Telefone FROM Pessoa WHERE CHARINDEX('Antonio', Nome) > 0
--Qual a média de idade das pessoas?
SELECT AVG(DATEDIFF(YEAR, DataNascimento, GETDATE())) FROM Pessoa
--Qual a Renda média das pessoas que nasceram na primeira década dos anos 2000?
SELECT AVG(Renda) FROM Pessoa WHERE YEAR(DataNascimento) BETWEEN 2000 AND 2009
--Qual a soma da renda das pessoas que nasceram em Setembro?
SELECT SUM(Renda) FROM Pessoa WHERE MONTH(DataNascimento) = 9
--Selecione o nome e a renda das pessoas, mostrando apenas aquelas que têm renda maior que a média:
SELECT Nome, Renda FROM Pessoa WHERE
Renda > (SELECT AVG(Renda) FROM Pessoa)
--Qual pessoa do sobrenome Santos, ganha mais?
SELECT TOP 1 * FROM Pessoa
WHERE CHARINDEX('Santos', Nome) > 0
ORDER BY Renda DESC
--Em que dia da semana nasceu Railton?
SELECT DATENAME(WEEKDAY, DataNascimento) FROM Pessoa
WHERE CHARINDEX('Railton', Nome) > 0
--Qual o telefone da pessoa de CPF _ _ _ 624 _ _ _ _ _?
SELECT Telefone FROM Pessoa WHERE CPF LIKE '___624%'
--Qual o nome da pessoa mais jovem e quantos dias de vida ela tem?
SELECT TOP 1 Nome, DATEDIFF(DAY, DataNascimento, GETDATE()) FROM Pessoa
ORDER BY DATEDIFF(DAY, DataNascimento, GETDATE()) ASC
--Adicionar máscara no campo CPF no formato cpf 123.456.789-09
SELECT STUFF(STUFF(STUFF(CPF, 4, 0, '.'), 8, 0, '.'),12,0,'-') FROM Pessoa
--Adicionar máscara no campo telefone no formato (xx) x xxxx-xxxx
SELECT FORMAT(CAST(Telefone AS BIGINT), '(##) # ####-####') FROM Pessoa
--Remover máscara CPF '123.456.789-09'
SELECT STUFF(STUFF(STUFF('123.456.789-09', 4, 1, ''), 7, 1, ''),10,1,'') FROM Pessoa
--Mascarar um CPF no formato 123******09 (Contexto: Proteção de dados LGPD)
--Transformar a primeira letra maiúscula do nome
SELECT UPPER(LEFT(Nome,1)) + LOWER(SUBSTRING(Nome, 2, LEN(Nome)-1)) FROM Pessoa
--Selecione o primeiro e último nome (Contexto: Check-in)
SELECT LEFT(Nome, CHARINDEX(' ', Nome)), REVERSE(LEFT(REVERSE(Nome), CHARINDEX(' ', REVERSE(Nome)))) FROM Pessoa
--Data de nascimento e renda formatada no padrão brasileiro 
--(Contexto: Relatório, exportação de arquivo)
SELECT CONVERT(VARCHAR, DataNascimento, 103),FORMAT(Renda,'N', 'pt-br') FROM Pessoa
--Selecionar os primeiros nomes de todas as pessoas numa 
--só cadeia de caracteres, desconsiderando as repetições, 
--agrupada e concatenada com separador ','. 
--Resultado esperado: Aberlândio,Adelmo,[...],Willian,Ygor

SELECT STRING_AGG(Nome, ',') FROM(
 SELECT DISTINCT LEFT(Nome, CHARINDEX(' ', Nome)) AS Nome FROM Pessoa
) t


SELECT * FROM Pessoa

SELECT COUNT(*) FROM(
SELECT MONTH(p.dataNascimento) as mes, COUNT(p.idPessoa) as num FROM Pessoa p
GROUP BY MONTH(p.dataNascimento)
HAVING COUNT(p.idPessoa) > 5) t


--3 
SELECT MONTH(DataNascimento), COUNT(DataNascimento) FROM Pessoa
GROUP BY MONTH(DataNascimento)

--4 
SELECT COUNT(*) FROM(
SELECT MONTH(DataNascimento) AS Mes FROM Pessoa
GROUP BY MONTH(DataNascimento)
HAVING COUNT(*) > 5)t

--15
SELECT * FROM(
SELECT Nome, 
RANK() OVER(ORDER BY LEN(Nome) DESC) AS Rank FROM Pessoa
WHERE Nome LIKE '%jose%' COLLATE Latin1_General_CI_AI) t
WHERE t.Rank = 1

--30

SELECT Nome, LEFT(Nome, CHARINDEX(' ', Nome)) + 
TRIM(REVERSE(LEFT(REVERSE(Nome), CHARINDEX(' ', REVERSE(Nome))))) FROM Pessoa