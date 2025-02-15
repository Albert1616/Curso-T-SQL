use [LogCurso]

--DROP TABLE Pessoa

--CREATE TABLE [dbo].[Pessoa](
--	[idPessoa] [int] PRIMARY KEY IDENTITY(1,1),
--	[Nome] [varchar](80) NULL,
--	[DataNascimento] [date] NULL,
--	[Telefone] [varchar](11) NULL,
--	[CPF] [varchar](11) NULL,
--	[Renda] [money] NULL)
--GO --Proximo comando

--INSERT INTO Pessoa (Nome, DataNascimento, Telefone, CPF, Renda)
--VALUES
--('Aberl�ndio Felix Nascimento', '1986-12-22', '75382510228', '36548314220', 3154)
--,('Adelmo de Jesus Santos', '1976-05-26', '43367308591', '53304786662', 1260)
--,('Aderaldo Oliveira de Santana', '2022-11-21', '74640604773', '53813827265', 9189)
--,('Aldo Rudney Junio Sales Santos', '2013-12-09', '51656420627', '84401081584', 1601)
--,('Alexsandro de Jesus Santos', '1976-11-21', '73868113998', '78826521138', 9335)
--,('Anderson Bruno Ara�jo Santos', '2008-09-20', '86176201394', '34236560546', 4896)
--,('Antonio Carlos Moraes Andrade', '1981-02-09', '18357764891', '20341762250', 4552)
--,('Antonio Gon�alves de Santana Neto', '1989-05-12', '35674835111', '54263527579', 2046)
--,('Antonio Marcos Ribeiro da Silva', '1997-07-13', '54074704989', '81512750236', 292)
--,('Daniel da Silva Santos', '1980-08-29', '15780464145', '57100151630', 4906)
--,('Danilo de Jesus Santos', '1987-05-05', '66106707580', '71531804041', 6021)
--,('Danilo Gabriel Bomfim Santos', '1976-05-06', '22353053567', '78255677420', 9277)
--,('Demas Freitas Santos', '1983-08-28', '34372544304', '67337881465', 6841)
--,('Edson Cunha da Concei��o', '1987-04-14', '84768375074', '45430187446', 9952)
--,('Emisson de Jesus dos Santos', '2019-11-11', '48805022058', '56018115387', 5016)
--,('Fabio Seixas Santos', '2015-10-02', '89802235694', '82860633150', 4977)
--,('Genilson do Carmo S. Macedo', '1999-10-27', '51763040727', '41820361287', 4255)
--,('George dos Santos Souza', '2000-01-03', '73378347310', '10220773342', 824)
--,('George Washington Carvalho dos Santos da Silva', '1998-03-06', '82824467380', '44738242412', 2652)
--,('Geovane Resende de Santana', '2003-04-09', '74266045424', '73736007672', 6214)
--,('Gustavo Freitas Santos', '2010-01-31', '62363830561', '85775105018', 7248)
--,('Jailson Souza dos Santos', '1988-01-27', '65805731238', '51468336243', 609)
--,('Jilvan Angelo dos Santos', '1987-05-25', '42431683234', '85672385759', 3575)
--,('Joao Cleber Santana Leal de Abreu', '2007-02-15', '87171267690', '12371134259', 791)
--,('Joao Pedro de Jesus Doria', '2002-10-04', '65370568026', '47667055748', 386)
--,('Joelmir Santos Gonzaga', '1986-04-19', '73864205640', '38176217484', NULL)
--,('Jos� Adenio Ribeiro do Nascimento', '2015-11-21', '37515482044', '38316681143', NULL)
--,('Jose Alves de Oliveira Neto', '1984-12-11', '65813373888', '78708351300', 6177)
--,('Jose Amilton dos Santos Matos', '1987-01-23', '46342477605', '75887315560', 4984)
--,('Jose Andre Correia dos Santos', '1995-06-01', '38414658811', '68262413359', 4823)
--,('Jos� Arnaldo dos Santos', '2000-07-26', '41376885556', '28043710302', 5715)
--,('Jos� Cleidisson das Virgens Santos', '1977-10-18', '28536053373', '73013133500', NULL)
--,('Jos� Doglas Santna Leal', '2024-03-11', '74188135780', '11534470138', 6602)
--,('Jose Edenilson de Jesus Santos', '1991-08-11', '55841647538', '24200178369', NULL)
--,('Jose Jeovan de Jesus Santana', '2019-11-21', '35527475607', '81016082235', 1419)
--,('Jose Leandro dos Santos', '2009-04-19', '28066280325', '57505028000', 4267)
--,('Jose Micael Cruz Matos', '1980-05-04', '15407834079', '16401668034', 7658)
--,('Jos� Miraldo da Silva Santos', '1977-01-23', '71628457059', '58601367307', 8898)
--,('Jose Romario Cruz Andrade', '2000-06-17', '31046720851', '14553120503', 2023)
--,('Jose Santos de Santana', '1975-09-19', '85206605128', '12761862612', 5616)
--,('Juliano Santos Santana', '1988-01-11', '99168435506', '68532006329', 4578)
--,('leandro Alves de Souza', '1975-02-21', '28024516753', '57360028126', 4366)
--,('Leonardo Paulo dos Santos', '2017-11-18', '28332272389', '84218677714', 3692)
--,('Leonardo Souza de Andrade', '2023-01-04', '65122523381', '10284165031', 1448)
--,('Luizinho Reis Leal', '2001-10-05', '84048115325', '54087720050', 8573)
--,('Maciel de Jesus Ferreira', '1975-03-02', '63426602455', '63878484676', 8913)
--,('Marcos Vinicius de Melo', '2008-07-08', '11324261878', '76607748582', 562)
--,('Marcos Vinicius Santana Fontes', '1990-10-21', '61164513198', '84063713105', NULL)
--,('Marcos Vinicius Santos Rocha', '2003-09-04', '91155278009', '67611254362', 7874)
--,('Matheus Silva Santana', '2016-11-11', '82181020280', '43425575680', 8175)
--,('Nadson Santos Santana', '1978-01-12', '71771580847', '20376384008', 9462)
--,('Normilson Concei��o dos Santos', '2003-05-02', '45683801990', '71816143740', 4295)
--,('Paulo C�sar de C. Reis', '1995-01-02', '48231113307', '50222466713', 4369)
--,('Paulo Henrique dos Santos', '1979-01-05', '44054184379', '76257116744', 4503)
--,('Pedro Henrique Silva', '1999-08-17', '98188117914', '45081411456', 21)
--,('Rafael Barbosa Ramos', '2010-03-06', '67447712421', '24142533482', 146)
--,('Railton de Santana Santos', '1997-11-17', '37154315467', '75231767024', 8908)
--,('Rerinaldo dos Santos Lima', '1997-06-12', '53276570869', '83410248418', 1006)
--,('Rodrigo Santana Alves', '2015-08-23', '37811802360', '75520867105', 200)
--,('Uilson Santos de Jesus', '1985-03-01', '73810479254', '77714233567', 7649)
--,('Vinicius Andrade dos Reis', '1988-11-13', '86746303373', '83235308346', 3997)
--,('Wemerson Oliveira de Carvalho', '2009-04-27', '86522867830', '80873547620', 6465)
--,('Willans da Conceic�o', '2024-01-19', '45328774710', '23245168089', 4946)
--,('Willian Carvalho Morais', '2019-10-04', '51128785621', '52745836041', 1738)
--,('Ygor Frances Santos da Conceic�o', '2013-04-03', '68266055358', '16483204419', 6427)
--GO

-- SELECT * FROM Pessoa

-----------------------------
-- DESAFIOS
-----------------------------

-- 1. Selecione todas as pessoas que n�o tem renda
-- 2. Valor da folha de pagamento do m�s?
-- 3. Quantos aniversariantes tem em cada m�s?
-- 4. Quais os meses tem mais de 5 aniversariantes?
-- 5. Quantos meses tem mais de 5 aniversariantes?
-- 6. Selecione as pessoas que ganham acima da m�dia, listando os seus nomes e a porcentagem que a renda da pessoa representa da renda m�dia
-- 7. Selecione o nome e a data de nascimento das pessoas, substituindo a data de nascimento por 'Data Confidencial' para pessoas menores que 18 anos:
-- 8. Quantas pessoas ganham acima de 3500?
-- 9. Qual o nome da pessoa com telefone 20276570?
-- 10. Qual o nome e a renda da pessoa que nasceu em 2013, e a primeira letra do seu nome � �A�?
-- 11. Quantas pessoas come�am ou terminam com a letra �E�?
-- 12. Quais os primeiros nomes das pessoas que come�am ou terminam com a letra �E�?
-- 13. Quais os 4 �ltimos d�gitos do telefone de Normilson?
-- 14. Quantos Jos� temos na tabela de pessoa?
-- 15. Qual dos Jos� tem o nome com o maior n�mero de caracteres, qual o id dele?
-- 16. Qual o telefone de Antonio?
-- 17. Qual a m�dia de idade das pessoas?
-- 18. Qual a Renda m�dia das pessoas que nasceram na primeira d�cada dos anos 2000?
-- 19. Qual a soma da renda das pessoas que nasceram em Setembro?
-- 20. Selecione o nome e a renda das pessoas, mostrando apenas aquelas que t�m renda maior que a m�dia:
-- 21. Qual pessoa do sobrenome Santos, ganha mais?
-- 22. Em que dia da semana nasceu Railton?
-- 23. Qual o telefone da pessoa de CPF _ _ _ 624 _ _ _ _ _?
-- 24. Qual o nome da pessoa mais jovem e quantos dias de vida ela tem?
-- 25. Adicionar m�scara no campo CPF no formato cpf 123.456.789-09
-- 26. Adicionar m�scara no campo telefone no formato (xx) x xxxx-xxxx
-- 27. Remover m�scara CPF '123.456.789-09'
-- 28. Mascarar um CPF no formato 123******09 (Contexto: Prote��o de dados LGPD)
-- 29. Transformar a primeira letra mai�scula do nome
-- 30. Selecione o primeiro e �ltimo nome (Contexto: Check-in)
-- 31. Data de nascimento e renda formatada no padr�o brasileiro (Contexto: Relat�rio, exporta��o de arquivo)
-- 32. Selecionar os primeiros nomes de todas as pessoas numa s� cadeia de caracteres, desconsiderando as repeti��es, agrupada e concatenada com separador ','. Resultado esperado: Aberl�ndio,Adelmo,[...],Willian,Ygor


-- DESAFIOS - RESOLU��O

-- 1

--SELECT * FROM Pessoa WHERE Renda IS NULL

-- 2

-- SELECT SUM(Renda) AS TOTAL FROM Pessoa

-- 3

--SELECT MONTH(DataNascimento) AS MES, COUNT(*) FROM Pessoa
--GROUP BY MONTH(DataNascimento)

-- 4

--SELECT MONTH(DataNascimento) AS MES,COUNT(*) AS Total FROM Pessoa
--GROUP BY MONTH(DataNascimento)
--HAVING COUNT(*) > 5 -- FILTRA COLUNAS GERADAS A PARTIR DE FUNC�ES DE AGREGA��O - AP�S AGRUPAMENTO

-- 5

--SELECT COUNT(*) FROM (
-- SELECT MONTH(DataNascimento) AS Mes FROM Pessoa
-- GROUP BY MONTH(DataNascimento)
-- HAVING COUNT(*) > 5
--) AS NumMeses -- em subconsultas � preciso nomear com alias as colunas consultadas


-- 6

--SELECT  Nome, (Renda * 100)/(SELECT AVG(Renda) FROM Pessoa) AS Porcentagem FROM Pessoa
--WHERE Renda > (SELECT AVG(Renda) FROM Pessoa)

-- 7 

--SELECT Nome, 
--CASE
--	WHEN DATEDIFF(YEAR, DataNascimento, GETDATE()) < 18 THEN STUFF(DataNascimento,1,LEN(DataNascimento),'Data confidencial')
--	ELSE CONVERT(VARCHAR,DataNascimento,103)
--END AS Idade FROM Pessoa

-- 8

--SELECT COUNT(*) AS '> 3500' FROM Pessoa
--WHERE Renda > 3500

-- 9 - RETORNO VAZIO

--SELECT Nome FROM Pessoa
--WHERE CHARINDEX('20276570', Telefone) > 0 -- CHARINDEX - PROCURAR STRINGS

-- 10

--SELECT Nome FROM Pessoa
--WHERE YEAR(DataNascimento) = '2013' AND Nome LIKE 'A%'

-- 11

--SELECT COUNT(*) 'N�mero de pessoas' FROM Pessoa
--WHERE Nome LIKE 'E%' OR Nome LIKE '%[e��]'

-- 12

--SELECT SUBSTRING(Nome, 1, CHARINDEX(' ', Nome)-1) AS Nome FROM Pessoa -- FIRTS NAME
--WHERE Nome LIKE 'E%' OR Nome LIKE '%[e��]'

-- 13

--SELECT Nome,Telefone, RIGHT(Telefone, 4) AS 'Ultimos Digitos' FROM Pessoa
--WHERE SUBSTRING(Nome,1, CHARINDEX(' ', Nome)-1) = 'Normilson'

-- 14

--SELECT COUNT(*) FROM Pessoa
--WHERE CHARINDEX('Jos�', Nome) > 0 OR CHARINDEX('Jose', Nome) > 0 -- MELHOR COM LIKE

-- 15

--SELECT MAX(LEN(Nome)) AS Maior FROM Pessoa - MAX, LEN
--WHERE Nome LIKE '%[Jos�, jos�, jose]'

--SELECT Nome, LEN(Nome) FROM Pessoa
--WHERE LEN(Nome) = (SELECT MAX(LEN(Nome)) FROM Pessoa WHERE Nome LIKE '%[Jos�, jos�, jose]') -- outro modo

-- 16

--SELECT Nome, Telefone FROM Pessoa 
--WHERE SUBSTRING(Nome, 1, CHARINDEX(' ', Nome)) = 'Antonio' -- QUAL ANTONIO?

-- 17

--SELECT AVG(DATEDIFF(YEAR, DataNascimento, GETDATE())) AS 'M�dia de idade' FROM Pessoa

-- 18


--SELECT AVG(Renda) AS 'Renda m�dia' FROM Pessoa
--WHERE YEAR(DataNascimento) BETWEEN 2000 AND 2009 -- BETWEEN PARA COMPARAR INTERVALOS -- DECADA VAI DE 2000 A 2009

-- 19

--SELECT SUM(Renda) as 'SOMA TOTAL' FROM Pessoa
--WHERE MONTH(DataNascimento) = 9

-- 20

--SELECT Nome, Renda FROM Pessoa
--WHERE Renda > (SELECT AVG(Renda) AS 'Renda m�dia' FROM Pessoa) -- SUBQUERY

--SELECT COUNT(*) FROM Pessoa
--WHERE Renda > (SELECT AVG(Renda) as 'Renda m�dia' FROM Pessoa) -- NUMERO DE PESSOAS COM RENDA ACIMA DA MEDIA

-- 21

--SELECT Nome, Renda FROM Pessoa
--WHERE Renda = (SELECT MAX(Renda) FROM Pessoa WHERE Nome LIKE '%Santos%')

-- 22

--SELECT DATEPART(dw,DataNascimento) AS 'Dia de nascimento' FROM Pessoa
--WHERE SUBSTRING(Nome, 1, CHARINDEX(' ', Nome)-1) = 'Railton'

-- 23

--SELECT Nome, Telefone, CPF FROM Pessoa
--WHERE CPF LIKE '___624%'

-- 24

--SELECT Nome, DATEDIFF(DAY, DataNascimento, GETDATE()) AS 'Dias de vida' FROM Pessoa
--WHERE DATEDIFF(DAY, DataNascimento, GETDATE()) = (SELECT MIN(DATEDIFF(DAY, DataNascimento, GETDATE())) AS Dias FROM Pessoa)

-- 25 - FALTAM OS PONTOS
 
--SELECT Nome, FORMAT(CAST(CPF AS BIGINT), '### ### ###-##') AS CPF FROM Pessoa

-- 26

--SELECT *,FORMAT(CAST(Telefone AS bigint), '(##) #####-####') AS Telefone FROM Pessoa

-- 27

--SELECT REPLACE(REPLACE('124.456.789-09','.',''), '-', '') AS 'CPF sem formata��o|'

-- 28

--SELECT STUFF(CPF,4,6,'******') AS CPF FROM Pessoa -- replace partes especificas do CPF

-- 29

-- ??

-- 30 -- FALTA PEGAR LAST NAME

--SELECT SUBSTRING(Nome, 1, CHARINDEX(' ', Nome)-1) AS 'Primeiro nome',
--RIGHT(Nome,4) AS '�ltimo nome' FROM Pessoa

---- 31

--SELECT FORMAT(DataNascimento, 'dd/MM/yyyy', 'pt-br') AS 'Data padr�o brasileiro', FORMAT(Renda,'N', 'pt-br') AS 'Renda pt-br' FROM Pessoa

-- 32

--SELECT STUFF((SELECT DISTINCT ',' + LEFT(Nome,CHARINDEX(' ',Nome)) FROM Pessoa FOR XML PATH('')),1,1,'')