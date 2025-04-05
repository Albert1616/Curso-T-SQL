use [LogCurso]

--CREATE TABLE Estado(
--	idEstado INT IDENTITY(1,1) PRIMARY KEY,
--	Nome VARCHAR(50),
--	Sigla CHAR(2),
--	Populacao INT,
--	Regiao VARCHAR(50),
--	Capital VARCHAR(50),
--	Detrannet BIT
--)

INSERT INTO Estado (Nome, Sigla, Populacao, Regiao, Capital, Detrannet) 
VALUES
('Acre', 'AC', 894470, 'Norte', 'Rio Branco', 0),
('Alagoas', 'AL', 3351543, 'Nordeste', 'Macei�', 0),
('Amap�', 'AP', 861773, 'Norte', 'Macap�', 0),
('Amazonas', 'AM', 4207714, 'Norte', 'Manaus', 0),
('Bahia', 'BA', 14930634, 'Nordeste', 'Salvador', 0),
('Cear�', 'CE', 9132078, 'Nordeste', 'Fortaleza', 0),
('Distrito Federal', 'DF', 3055149, 'Centro-Oeste', 'Bras�lia', 0),
('Esp�rito Santo', 'ES', 4064052, 'Sudeste', 'Vit�ria', 1),
('Goi�s', 'GO', 7113540, 'Centro-Oeste', 'Goi�nia', 0),
('Maranh�o', 'MA', 7075181, 'Nordeste', 'S�o Lu�s', 1),
('Mato Grosso', 'MT', 3526220, 'Centro-Oeste', 'Cuiab�', 1),
('Mato Grosso do Sul', 'MS', 2809394, 'Centro-Oeste', 'Campo Grande', 0),
('Minas Gerais', 'MG', 21499339, 'Sudeste', 'Belo Horizonte', 0),
('Par�', 'PA', 8690745, 'Norte', 'Bel�m', 0),
('Para�ba', 'PB', 4039277, 'Nordeste', 'Jo�o Pessoa', 0),
('Paran�', 'PR', 11433957, 'Sul', 'Curitiba', 0),
('Pernambuco', 'PE', 9616621, 'Nordeste', 'Recife', 0),
('Piau�', 'PI', 3273227, 'Nordeste', 'Teresina', 0),
('Rio de Janeiro', 'RJ', 17264943, 'Sudeste', 'Rio de Janeiro', 0),
('Rio Grande do Norte', 'RN', 3534165, 'Nordeste', 'Natal', 1),
('Rio Grande do Sul', 'RS', 11422973, 'Sul', 'Porto Alegre', 0),
('Rond�nia', 'RO', 1796460, 'Norte', 'Porto Velho', 1),
('Roraima', 'RR', 631181, 'Norte', 'Boa Vista', 0),
('Santa Catarina', 'SC', 7279632, 'Sul', 'Florian�polis', 1),
('S�o Paulo', 'SP', 45919049, 'Sudeste', 'S�o Paulo', 0),
('Sergipe', 'SE', 2318822, 'Nordeste', 'Aracaju', 0),
('Tocantins', 'TO', 1590248, 'Norte', 'Palmas', 1)

-- 1

--SELECT * FROM Estado WHERE Regiao = 'Nordeste'
--ORDER BY Populacao ASC

-- 2

--SELECT TOP 3 * 
--FROM Estado 
--ORDER BY Populacao DESC

-- 3

--SELECT * FROM Estado WHERE Populacao < 1000000

-- 4

--SELECT * FROM Estado WHERE Nome = Capital

-- 5

--SELECT * FROM Estado WHERE (Regiao = 'Sul' OR Regiao = 'Sudeste') AND Populacao < 5000000

-- 6

--SELECT * FROM Estado WHERE Nome LIKE 'S%' AND Populacao < 20000000
--SELECT * FROM Estado WHERE LEFT(Nome, 1) = 'S' AND Populacao < 20000000

-- 7

--SELECT * FROM Estado WHERE Capital LIKE 'B%' AND Populacao < 5000000

-- 8

--SELECT * FROM Estado WHERE Sigla = 'SP' OR Sigla = 'RJ' OR Sigla = 'MG' | Sigla IN ('SP', 'RJ', 'MG')

-- 9

--SELECT * FROM Estado WHERE Detrannet = 1

-- 10

--SELECT DISTINCT Regiao FROM Estado WHERE Detrannet = 1

-- 11

--SELECT * FROM Estado WHERE Capital NOT LIKE '%[Aa�]%'
SELECT * FROM Estado WHERE Capital COLLATE Latin1_General_CI_AI NOT LIKE '%a%'

-- 12

--SELECT Capital, * FROM Estado WHERE Nome LIKE '%RIO%' OR Capital LIKE '%RIO%'

-- 13

--SELECT * FROM Estado WHERE Capital LIKE '__c%'

-- 14

--SELECT * FROM Estado WHERE Nome LIKE 'M%' AND Capital LIKE '%e'

-- 15

--SELECT * FROM Estado WHERE Populacao > 15000000

-- 16

--SELECT * FROM Estado WHERE Populacao BETWEEN 10000000 AND 20000000

-- 17

--SELECT * FROM Estado WHERE Nome LIKE '%�' COLLATE Latin1_General_CI_AS

-- 18

--SELECT * FROM Estado WHERE Nome LIKE '%e%' AND Nome LIKE '%o%' COLLATE Latin1_General_CI_AS

-- 19

--SELECT * FROM Estado WHERE Regiao = 'Norte' AND Capital NOT LIKE '%[Aa��]%'

-- 20

--SELECT Regiao, COUNT(*) FROM Estado -- o que estiver antes da fun��o agregadora tem que estar no group by
--GROUP BY Regiao


TRUNCATE TABLE Estado 
SELECT * FROM Estado

--1

SELECT * FROM Estado WHERE Regiao = 'Nordeste'
ORDER BY Populacao DESC

--2

SELECT * FROM(
SELECT *,
RANK() OVER(ORDER BY Populacao DESC) AS Rank FROM Estado) t
WHERE t.Rank <= 3

--3

SELECT * FROM Estado WHERE Populacao < 1000000

--4

SELECT * FROM Estado WHERE Nome = Capital

--5

SELECT * FROM Estado WHERE Regiao LIKE '%Su[ldeste]%'
AND Populacao > 5000000

--10

SELECT Regiao FROM Estado 
WHERE Detrannet = 1

--11

SELECT * FROM Estado
WHERE Capital NOT LIKE '%a%' COLLATE Latin1_General_CI_AI

--20

SELECT Regiao, COUNT(DISTINCT Nome) FROM Estado
GROUP BY Regiao