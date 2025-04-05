-----------------------------------------------------
-- Tabela contendo dados das cidades dos clientes 

CREATE TABLE Ped_Cidades
(
    idCidade INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    UF VARCHAR(2) NOT NULL
	PRIMARY KEY(idCidade)
)

-----------------------------------------------------
-- Tabela contendo os dados dos clientes

CREATE TABLE Ped_Clientes
(
    idCliente INT IDENTITY(1, 1),
    Nome VARCHAR(50) NOT NULL,
    CPF_CNPJ VARCHAR(14) NOT NULL,
    Endereco VARCHAR(50) NULL,
    idCidade INT NOT NULL,
    Fone VARCHAR(12) NULL,
    LimiteCredito MONEY NULL
	PRIMARY KEY(idCliente)
)

-----------------------------------------------------
-- Tabela contendo dados dos vendedores

CREATE TABLE Ped_Vendedores
(
	idVendedor INT NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	SalarioFixo MONEY NOT NULL,
	FaixaComissao FLOAT NOT NULL
	PRIMARY KEY(idVendedor)
)


-----------------------------------------------------
-- Tabela dos pedidos realizados pelos clientes
-- Os registros com informação no campo DataCancelamentoPedido deverão ser desconsiderados como pedido realizado
-- Um pedido realizado poderá ser faturado ou cancelado

CREATE TABLE Ped_Pedidos
(
	idPedido INT IDENTITY(1, 1),
	idCliente INT NOT NULL,
	idVendedor INT NOT NULL,
	DataSolicitacaoPedido DATETIME NOT NULL,
	DataFaturamentoPedido DATETIME NULL,
	DataEnvioPedido DATETIME NULL,
	DataCancelamentoPedido DATETIME NULL
	PRIMARY KEY(idPedido)
)

-----------------------------------------------------
-- Tabela com os itens do pedido (detalhes dos pedidos)
-- OBS: o valor de um pedido deverá considerar o total dos itens daquele pedido

CREATE TABLE Ped_ItensPedido
(
	idItemPedido INT IDENTITY(1, 1),
	idPedido INT NOT NULL,
	idProduto INT NOT NULL,
	Quantidade MONEY NOT NULL,
	PrecoUnitario MONEY NOT NULL,
	ValorTotalItem MONEY NOT NULL
	PRIMARY KEY(idItemPedido)
)

-----------------------------------------------------
-- Tabela de Produtos comercializados pela empresa, arroz, feijão, leite em pó, etc.

CREATE TABLE Ped_Produtos
(
	idProduto INT IDENTITY(1, 1),
	Nome VARCHAR(50) NOT NULL,
	idUnidadeMedida INT NOT NULL,
	idGrupo INT NOT NULL,
	PrecoUnitario MONEY NOT NULL,
	EstoqueMinimo INT NULL
	PRIMARY KEY(idProduto)
)

-----------------------------------------------------
-- tabela das unidades de medidas dos itens exemplo: L-Litro; Kg-Kilograma

CREATE TABLE Ped_UnidadesMedida
(
    idUnidadeMedida INT IDENTITY(1, 1),
    Descricao VARCHAR(50) NOT NULL,
    DescricaoAbreviada VARCHAR(3) NOT NULL
	PRIMARY KEY(idUnidadeMedida)
)

-----------------------------------------------------
-- Tabela de agrupamento dos produtos, Bebidas, Detergenets, cereais, Higiene Pessoal
CREATE TABLE Ped_Grupos
(
    idGrupo INT IDENTITY(1, 1),
    Descricao VARCHAR(50) NOT NULL
	PRIMARY KEY(idGrupo)
)

DELETE FROM Ped_Cidades
DELETE FROM Ped_Clientes
DELETE FROM Ped_Grupos
DELETE FROM Ped_Pedidos
DELETE FROM Ped_ItensPedido
DELETE FROM Ped_Produtos
DELETE FROM Ped_UnidadesMedida
DELETE FROM Ped_Vendedores

DBCC CHECKIDENT ('Ped_Cidades', RESEED, 0);
DBCC CHECKIDENT ('Ped_Clientes', RESEED, 0);
DBCC CHECKIDENT ('Ped_Grupos', RESEED, 0);
DBCC CHECKIDENT ('Ped_Pedidos', RESEED, 0);
DBCC CHECKIDENT ('Ped_ItensPedido', RESEED, 0);
DBCC CHECKIDENT ('Ped_Produtos', RESEED, 0);
DBCC CHECKIDENT ('Ped_UnidadesMedida', RESEED, 0);
DBCC CHECKIDENT ('Ped_Vendedores', RESEED, 0);


-----------------------------------------------------
-- Inserção de dados nas tabelas

INSERT INTO Ped_Cidades (idCidade, Nome, UF)
VALUES
(1, 'São Paulo', 'SP'),
(2, 'Rio de Janeiro', 'RJ'),
(3, 'Belo Horizonte', 'MG')

INSERT INTO Ped_Clientes (Nome, CPF_CNPJ, Endereco, idCidade, Fone, LimiteCredito) 
VALUES
('Maria Silva', '12345678900', 'Rua A, 123', 1, '555-1234', 1000.00),
('João Oliveira', '98765432100', 'Rua B, 456', 2, '555-5678', 2000.00),
('Ana Pereira', '55566677700', 'Rua C, 789', 3, '555-1111', 3000.00),
('Pedro Carpio', '11122233300', 'Rua D, 1011', 1, '555-2222', 4000.00),
('Julia Souza', '44455566600', 'Rua E, 1213', 2, '555-3333', 5000.00),
('Thorpe Lima', '77788899900', 'Rua F, 1415', 3, '555-4444', 6000.00),
('Carolina Trindade', '22233344400', 'Rua G, 1617', 1, '555-5555', 7000.00),
('Ricardo Costa', '88899900000', 'Rua H, 1819', 2, '555-6666', 8000.00),
('Carla Santos', '44433322200', 'Rua I, 2021', 3, '555-7777', 9000.00),
('Patrícia Ramos', '99988877700', 'Rua J, 2223', 1, '555-8888', 10000.00)

INSERT INTO Ped_Vendedores (idVendedor, Nome, SalarioFixo, FaixaComissao)
VALUES
(1, 'João Silva', 2500.00, 0.05),
(2, 'Maria Santos', 2800.00, 0.06),
(3, 'Pedro Oliveira', 3000.00, 0.07),
(4, 'Ana Souza', 2700.00, 0.05),
(5, 'Carlos Pereira', 2600.00, 0.04)

INSERT INTO Ped_Grupos (Descricao)
VALUES ('Bebidas'), ('Detergentes'), ('Cereais'), ('Higiene Pessoal'), ('Eletrônicos'), ('Eletrodomésticos')

INSERT INTO Ped_UnidadesMedida (Descricao, DescricaoAbreviada)
VALUES ('quilograma', 'Kg'), ('litro', 'L'), ('Unidade', 'Und')

INSERT INTO Ped_Produtos (Nome, idUnidadeMedida, idGrupo, PrecoUnitario, EstoqueMinimo)
VALUES
('Arroz', 1, 3, 4.50, 50),
('Feijão', 1, 3, 5.50, 40),
('Leite', 2, 1, 4.00, 30),
('Café', 1, 1, 8.50, 20),
('Açúcar', 1, 3, 3.50, 35),
('Óleo', 2, 2, 10.00, 25),
('Sal', 1, 3, 2.50, 30),
('Macarrão', 1, 3, 3.50, 40),
('Sabão em Pó', 1, 2, 12.00, 15),
('Detergente', 2, 2, 6.50, 25),
('Shampoo', 2, 4, 15.00, 10),
('Condicionador', 2, 4, 15.00, 10),
('Sabonete', 1, 4, 3.00, 30),
('Creme Dental', 1, 5, 6.00, 20),
('Desodorante', 2, 4, 12.00, 15),
('Biscoito', 1, 3, 4.50, 50),
('Refrigerante', 2, 1, 5.50, 40),
('Suco', 2, 1, 4.00, 30),
('Cerveja', 2, 1, 8.50, 20),
('Vinho', 2, 1, 15.00, 10),
('Smartphone', 1, 5, 1500.00, 10),
('Tablet', 1, 5, 1200.00, 10),
('Geladeira', 2, 6, 1800.00, 10),
('Máquina de Lavar Roupa', 3, 6, 1600.00, 10),
('Notebook', 3, 5, 2500.00, 10),
('TV 4K', 3, 5, 3000.00, 10),
('Forno Elétrico', 3, 6, 2200.00, 10),
('Ar Condicionado', 3, 6, 2800.00, 10)

INSERT INTO Ped_Pedidos (idCliente, idVendedor, DataSolicitacaoPedido, DataFaturamentoPedido, DataEnvioPedido, DataCancelamentoPedido)
VALUES 
(1, 1, '2019-01-15 10:30:00.000', '2019-01-20 14:00:00.000', '2019-01-25 16:00:00.000', NULL),
(2, 1, '2019-02-02 09:15:00.000', '2019-02-05 11:00:00.000', '2019-02-10 14:30:00.000', NULL),
(3, 3, '2019-02-02 14:00:00.000', '2019-02-05 10:30:00.000', '2019-02-10 15:00:00.000', NULL),
(1, 5, '2019-03-05 16:20:00.000', '2019-03-10 09:45:00.000', '2019-03-15 11:00:00.000', '2019-04-20 12:00:00.000'),
(4, 2, '2019-05-07 08:00:00.000', '2019-05-10 09:00:00.000', '2019-05-14 14:00:00.000', NULL),
(4, 3, '2019-05-08 09:00:00.000', '2019-05-10 12:00:00.000', '2019-05-12 10:00:00.000', NULL),
(2, 5, '2019-05-10 11:30:00.000', '2019-05-10 14:00:00.000', '2019-05-16 12:00:00.000', '2019-06-16 13:00:00.000'),
(5, 3, '2020-01-10 08:30:00.000', '2020-01-14 13:00:00.000', '2020-01-18 11:30:00.000', NULL),
(6, 1, '2020-02-20 15:00:00.000', '2020-02-25 10:30:00.000', '2020-03-02 11:00:00.000', NULL),
(4, 1, '2020-03-05 13:00:00.000', '2020-03-10 09:00:00.000', '2020-03-15 15:00:00.000', '2019-03-25 12:00:00.000'),
(3, 2, '2020-04-01 14:15:00.000', '2020-04-05 10:00:00.000', '2020-04-10 14:00:00.000', NULL),
(1, 3, '2020-05-10 09:00:00.000', '2020-05-13 11:30:00.000', '2020-05-18 16:00:00.000', NULL)

INSERT INTO Ped_ItensPedido (idPedido, idProduto, Quantidade, PrecoUnitario, ValorTotalItem)
VALUES
(1, 1, 2, 15.00, 30.00),
(1, 3, 3, 8.00, 24.00),
(1, 27, 1, 2200.00, 2200),
(2, 2, 1, 20.00, 20.00),
(2, 5, 2, 6.00, 12.00),
(3, 1, 1, 15.00, 15.00),
(3, 4, 4, 4.00, 16.00),
(4, 2, 2, 20.00, 40.00),
(4, 3, 1, 8.00, 8.00),
(4, 21, 1, 1500.00, 1500.00),
(5, 1, 3, 15.00, 45.00),
(5, 4, 2, 4.00, 8.00),
(6, 3, 1, 8.00, 8.00),
(6, 5, 4, 6.00, 24.00),
(7, 1, 1, 15.00, 15.00),
(7, 2, 3, 20.00, 60.00),
(8, 3, 2, 8.00, 16.00),
(8, 4, 1, 4.00, 4.00),
(9, 1, 2, 15.00, 30.00),
(9, 2, 1, 20.00, 20.00),
(10, 4, 3, 4.00, 12.00),
(10, 4, 3, 4.00, 12.00),
(11, 2, 2, 20.00, 40.00)

DBCC useroptions
SET DATEFORMAT ymd;

-- Questão 1) Liste todos os produtos com preço unitário entre 1000 e 2000.
SELECT * FROM Ped_Produtos
WHERE PrecoUnitario BETWEEN 1000 AND 2000 -- BETWEEN INCLUI 1000 E 2000


-- Questão 2) Liste todos os grupos (ped_Grupos) ordenados pela quantidade de itens diferentes que o grupo possui. 
--Grupo       QT Itens
--Cereais     200
--Bebidas     150
--...
SELECT  g.Descricao AS Grupo, COUNT(DISTINCT p.idProduto) AS 'QT Itens' FROM Ped_Produtos p
INNER JOIN Ped_Grupos g ON g.idGrupo = p.idGrupo
GROUP BY g.Descricao
ORDER BY 'QT Itens' DESC

-- Questão 3) Liste as datas em que ocorreram faturamentos na empresa, não considerar os pedidos cancelados.
SELECT DISTINCT CONVERT(VARCHAR, DataFaturamentoPedido, 103) AS 'Datas de faturamento' FROM Ped_Pedidos -- CAST(DataFaturamentoPedido AS Date)
WHERE DataFaturamentoPedido IS NOT NULL AND DataCancelamentoPedido IS NULL
  
-- Questão 4) Liste os itens do grupo “Cereais” que possuem preços unitários inferiores a R$ 5,00.
SELECT p.* FROM Ped_Produtos p
INNER JOIN Ped_Grupos g ON g.idGrupo = p.idGrupo
WHERE g.Descricao = 'Cereais' AND p.PrecoUnitario < 5


-- Questão 5) Liste todos os Clientes que contenham “RP” ou “TR” em seus nomes e não fizeram nenhum pedido em 2019. 
SELECT c.* FROM Ped_Clientes c
LEFT JOIN Ped_Pedidos p
ON p.idCliente = c.idCliente AND Year(p.DataSolicitacaoPedido) = 2019
WHERE (c.Nome LIKE '%TR%' OR c.Nome LIKE '%RP%' ) AND p.idCliente IS NULL -- CHARINDEX TAMBÉM SERVE

--SELECT c.Nome FROM Ped_Clientes c
--WHERE (c.Nome LIKE '%TR%' OR c.Nome LIKE '%RP%' ) AND
--NOT EXISTS (
-- SELECT * FROM Ped_Pedidos
-- WHERE idCliente = c.idCliente AND YEAR(DataFaturamentoPedido) = 2019
--)

-- Questão 6) Liste as cidades dos clientes que faturaram pedidos com o custo total maior que R$ 1.000,00 (hum mil reais), no ano de 2019.
SELECT Nome_cidade FROM(
SELECT c.Nome, ci.Nome AS Nome_cidade, p.DataFaturamentoPedido, SUM(i.ValorTotalItem) AS Total FROM Ped_Clientes c
INNER JOIN Ped_Pedidos p ON p.idCliente = c.idCliente AND YEAR(p.DataFaturamentoPedido) = 2019
INNER JOIN Ped_ItensPedido i ON i.idPedido = p.idPedido 
INNER JOIN Ped_Cidades ci ON ci.idCidade = c.idCidade
WHERE p.DataCancelamentoPedido IS NULL
GROUP BY c.Nome, ci.Nome, p.DataFaturamentoPedido) dados
WHERE Total > 1000

SELECT ci.Nome, SUM(i.ValorTotalItem) AS Total
FROM Ped_Clientes c
INNER JOIN Ped_Pedidos p ON p.idCliente = c.idCliente AND YEAR(p.DataFaturamentoPedido) = 2019
INNER JOIN Ped_ItensPedido i ON i.idPedido = p.idPedido 
INNER JOIN Ped_Cidades ci ON ci.idCidade = c.idCidade
GROUP BY ci.Nome
HAVING SUM(i.ValorTotalItem) > 1000
-- Questão 7) Liste  a média dos limites de crédito dos clientes por estado o formato
--UF    Limite de Credito
--AC    20.000,00
--AM    15.000,00
--...

SELECT ci.UF, AVG(c.LimiteCredito) AS 'Limite de credito' FROM Ped_Clientes c
INNER JOIN Ped_Cidades ci 
ON c.idCidade = ci.idCidade
GROUP BY ci.UF

-- Questão 8) Liste o faturamento Mensal  em 2019   no formato: 
--Mes        Valor
--01/2019    xxxxxxxx,xx
--02/2019    xxxxxxxx,xx
--...

SELECT FORMAT(p.DataFaturamentoPedido, 'MM/yyyy') AS MES, SUM(i.ValorTotalItem) AS Valor FROM Ped_Pedidos p
INNER JOIN Ped_ItensPedido i ON i.idPedido = P.idPedido
WHERE YEAR(p.DataFaturamentoPedido) = 2019 AND p.DataCancelamentoPedido IS NULL
GROUP BY FORMAT(p.DataFaturamentoPedido, 'MM/yyyy')

SELECT RIGHT('00' + CAST(MONTH(p.DataFaturamentoPedido) AS VARCHAR), 2) + '/2019' AS Mes,
CAST(SUM(i.ValorTotalItem) AS MONEY) AS Valor FROM Ped_Pedidos p 
INNER JOIN Ped_ItensPedido i ON i.idPedido = p.idPedido
WHERE YEAR(p.DataFaturamentoPedido) = 2019 AND p.DataCancelamentoPedido IS NULL
GROUP BY MONTH(p.DataFaturamentoPedido)

-- Questão 9) Liste os nomes dos clientes que solicitaram exatamente dois pedidos no ano de 2019.
SELECT c.Nome FROM Ped_Clientes c
INNER JOIN Ped_Pedidos p ON
c.idCliente = p.idCliente AND YEAR(p.DataSolicitacaoPedido) = 2019
GROUP BY c.Nome
HAVING COUNT(p.idPedido) = 2

-- Questão 10) Relação dos 10 clientes com maiores volumes de devoluções no ano de 2019. Considere o valor dos pedidos. 
SELECT TOP 10 c.Nome,SUM(i.ValorTotalItem) AS 'Valor devoluções' 
FROM Ped_Clientes c -- SELECT TOP 10 WITH TIES - SE HOUVER EMPATE TRAZ TODOS
INNER JOIN Ped_Pedidos p ON p.idCliente = c.idCliente AND p.DataCancelamentoPedido IS NOT NULL
INNER JOIN Ped_ItensPedido i ON i.idPedido = p.idPedido
WHERE YEAR(p.DataCancelamentoPedido) = 2019
GROUP BY c.Nome
ORDER BY 'Valor devoluções' DESC



-- 1

SELECT p.* FROM Ped_Produtos p
WHERE p.PrecoUnitario BETWEEN 1000 AND 2000

-- 2

SELECT g.Descricao, COUNT(DISTINCT p.idProduto) AS QtdItens FROM Ped_Grupos g
INNER JOIN Ped_Produtos p ON g.idGrupo = p.idGrupo
GROUP BY g.Descricao

-- 3

SELECT p.DataFaturamentoPedido FROM Ped_Pedidos p
WHERE p.DataCancelamentoPedido IS NULL

-- 4

SELECT p.* FROM Ped_Grupos g
INNER JOIN Ped_Produtos p ON p.idGrupo = g.idGrupo
WHERE g.Descricao = 'Cereais' AND p.PrecoUnitario < 5

-- 5

SELECT c.* FROM Ped_Clientes c
LEFT JOIN Ped_Pedidos p ON p.idCliente = c.idCliente
WHERE c.Nome LIKE '%rt%' OR c.Nome LIKE '%rp%' AND p.idCliente IS NULL

SELECT c.* FROM Ped_Clientes c
WHERE c.Nome LIKE 'rt' OR c.Nome LIKE 'rp' AND
NOT EXISTS(
 SELECT * FROM Ped_Pedidos
 WHERE idCliente = c.idCliente
)

SELECT * FROM Ped_Clientes

-- 6

SELECT ci.Nome FROM Ped_Clientes c
INNER JOIN Ped_Cidades ci ON ci.idCidade = c.idCidade
INNER JOIN Ped_Pedidos p ON c.idCliente = p.idCliente
INNER JOIN Ped_ItensPedido i ON i.idPedido = p.idPedido
WHERE YEAR(p.DataFaturamentoPedido) = 2019 AND p.DataCancelamentoPedido IS NULL
GROUP BY ci.Nome
HAVING SUM(i.ValorTotalItem) > 1000

-- 7

SELECT ci.UF, CAST(AVG(c.LimiteCredito) AS MONEY) as 'Limite por estado' FROM Ped_Clientes c
INNER JOIN Ped_Cidades ci ON ci.idCidade = c.idCidade
GROUP BY ci.UF

-- 8

SELECT RIGHT('00' + CAST(MONTH(p.DataFaturamentoPedido) AS VARCHAR), 2) + '/2019' AS Mes,
CAST(SUM(i.ValorTotalItem) AS MONEY) AS Valor FROM Ped_Pedidos p 
INNER JOIN Ped_ItensPedido i ON i.idPedido = p.idPedido
WHERE YEAR(p.DataFaturamentoPedido) = 2019
GROUP BY MONTH(p.DataFaturamentoPedido)

-- 9

SELECT c.Nome FROM Ped_Clientes c
INNER JOIN Ped_Pedidos p ON p.idCliente = c.idCliente
WHERE YEAR(p.DataFaturamentoPedido) = 2019
GROUP BY c.Nome
HAVING COUNT(p.idPedido) = 2

-- 10

SELECT TOP 10 WITH TIES c.Nome FROM Ped_Clientes c
INNER JOIN Ped_Pedidos p ON p.idCliente = c.idCliente
INNER JOIN Ped_ItensPedido i ON i.idPedido = p.idPedido
WHERE p.DataCancelamentoPedido IS NOT NULL AND YEAR(p.DataCancelamentoPedido) = 2019
GROUP BY c.Nome
ORDER BY SUM(i.ValorTotalItem) DESC