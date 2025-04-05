-- Tabela de Clientes
DROP TABLE IF EXISTS Clientes
CREATE TABLE Clientes (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    NomeCliente VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataCadastro DATE NOT NULL
);

-- Tabela de Produtos
DROP TABLE IF EXISTS Produtos
CREATE TABLE Produtos (
    idProduto INT IDENTITY(1,1) PRIMARY KEY,
    NomeProduto VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Preco MONEY NOT NULL,
    Estoque INT NOT NULL
);

-- Tabela de Pedidos]
DROP TABLE IF EXISTS Pedidos
CREATE TABLE Pedidos (
    idPedido INT IDENTITY(1,1) PRIMARY KEY,
    idCliente INT NOT NULL,
    DataPedido DATETIME NOT NULL,
    StatusPedido VARCHAR(20) NOT NULL, -- (Pendente, Processando, Enviado, Entregue, Cancelado)
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Tabela de Itens do Pedido
DROP TABLE IF EXISTS ItensPedido
CREATE TABLE ItensPedido (
    idItemPedido INT IDENTITY(1,1) PRIMARY KEY,
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario MONEY NOT NULL,
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

-- Tabela de Avaliações de Produtos
DROP TABLE IF EXISTS Avaliacoes
CREATE TABLE Avaliacoes (
    idAvaliacao INT IDENTITY(1,1) PRIMARY KEY,
    idProduto INT NOT NULL,
    idCliente INT NOT NULL,
    Nota INT NOT NULL, -- (1 a 5)
    Comentario TEXT NULL,
    DataAvaliacao DATE NOT NULL,
    FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto),
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Tabela de Cupons de Desconto
CREATE TABLE Cupons (
    idCupom INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCupom VARCHAR(20) NOT NULL,
    Desconto DECIMAL(5,2) NOT NULL, -- (Percentual de desconto, ex: 10.50)
    Validade DATE NOT NULL
);

-- Tabela de Pagamentos
DROP PROCEDURE Pagamentos
CREATE TABLE Pagamentos (
    idPagamento INT IDENTITY(1,1) PRIMARY KEY,
    idPedido INT NOT NULL,
    MetodoPagamento VARCHAR(50) NOT NULL, -- (Cartão, PIX, Boleto)
    ValorPago MONEY NOT NULL,
    StatusPagamento VARCHAR(20) NOT NULL, -- (Aprovado, Pendente, Recusado)
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido)
);
 /*
1.Listar os clientes que fizeram pelo menos um pedido em cada trimestre do último ano.*/
SELECT c.NomeCliente FROM Clientes c
INNER JOIN Pedidos p ON p.idCliente = c.idCliente
WHERE YEAR(p.DataPedido) = YEAR(GETDATE()) - 1
GROUP BY c.NomeCliente
HAVING COUNT(DISTINCT DATEPART(QUARTER, p.DataPedido)) = 4


SELECT DATEPART(QUARTER, GETDATE())


/*

2.Calcular a média de dias entre a data do pedido e a data de avaliação do produto, 
considerando apenas pedidos entregues.

Dica: Use DATEDIFF e agregações.*/

SELECT AVG(DATEDIFF(DAY, p.DataPedido, a.DataAvaliacao)) FROM Pedidos p
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
INNER JOIN Produtos prod ON prod.idProduto = i.idProduto
INNER JOIN Avaliacoes a ON a.idProduto = prod.idProduto
WHERE p.StatusPedido = 2
/*

2. Funções de Janela (Window Functions)
Listar os 5 produtos mais vendidos de cada categoria, com base no número de unidades vendidas no último ano.

Dica: Use ROW_NUMBER() ou RANK().*/
SELECT t.* FROM(
SELECT p.Categoria, p.NomeProduto,
RANK() OVER(
PARTITION BY p.Categoria
ORDER BY SUM(i.Quantidade) DESC) AS Rank FROM Produtos p
INNER JOIN ItensPedido i ON i.idProduto = p.idProduto
INNER JOIN Pedidos ped ON ped.idPedido = i.idPedido
WHERE YEAR(ped.DataPedido) = YEAR(GETDATE()) - 1
GROUP BY p.Categoria, p.NomeProduto) t
WHERE t.Rank <= 5

/*

3.Calcular a média móvel de vendas (em valor monetário) por mês nos últimos 12 meses.

Dica: Use AVG() com OVER().*/

SELECT MONTH(p.DataPedido),
FORMAT(SUM(i.Quantidade*i.PrecoUnitario), 'C', 'pt-br') FROM Pedidos p 
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
WHERE (YEAR(p.DataPedido) = YEAR(GETDATE()) AND MONTH(p.DataPedido) <= MONTH(GETDATE()))
OR (YEAR(p.DataPedido) < YEAR(GETDATE()) AND MONTH(p.DataPedido) >= MONTH(GETDATE()))
GROUP BY MONTH(p.DataPedido)


/*

3. Manipulação de Strings e JSON
Criar uma consulta que retorne os clientes em formato JSON, incluindo nome, e-mail e o total gasto em compras. 
Dica: Use FOR JSON PATH. */

SELECT c.NomeCliente, c.Email, FORMAT(SUM(i.Quantidade * i.PrecoUnitario), 'C', 'pt-br') AS Total FROM Clientes c
INNER JOIN Pedidos p ON p.idCliente = c.idCliente
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
GROUP BY c.NomeCliente, c.Email
FOR JSON PATH


/*

4. Atualizar a tabela de produtos para incluir uma coluna JSON com informações adicionais (ex: fabricante, garantia).

Dica: Use ALTER TABLE e JSON_VALUE. */

--ALTER TABLE Produtos
--ADD/DROP COLUMN/ALTER COLUMN/RENAME COLUMN coluna1 TO coluna2

ALTER TABLE Produtos
ADD Informacoes_adicionais NVARCHAR(MAX)

/*

4. Subconsultas e Agregações Complexas
Listar os produtos que nunca foram vendidos, mas têm pelo menos 3 avaliações com nota 5.

Dica: Use NOT EXISTS e COUNT. */

SELECT * INTO #T2 FROM Produtos
EXCEPT
SELECT p.* FROM Produtos p
INNER JOIN ItensPedido i ON i.idProduto = p.idProduto

SELECT t.idProduto, t.NomeProduto FROM #T2 t
INNER JOIN Avaliacoes a ON a.idProduto = t.idProduto
GROUP BY t.idProduto, t.NomeProduto
HAVING COUNT(
 CASE
  WHEN a.Nota = 5 THEN 1
  ELSE 0
 END
) >= 3

/*

6. Listar os clientes que gastaram mais que a média de gastos por cliente no último ano. */

SELECT c.NomeCliente, SUM(i.Quantidade * i.PrecoUnitario) AS TotalGasto 
INTO #T3 FROM Clientes c
INNER JOIN Pedidos p ON p.idCliente = c.idCliente
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
GROUP BY c.NomeCliente

SELECT c.NomeCliente FROM Clientes c
INNER JOIN Pedidos p ON p.idCliente = c.idCliente
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
GROUP BY c.NomeCliente
HAVING SUM(i.Quantidade * i.PrecoUnitario) > (SELECT AVG(TotalGasto) FROM #T3)

/*

Dica: Use subconsultas e funções de agregação.

5. Implementar uma transação que realize a compra de um produto, 
atualize o estoque e crie um pedido. Caso o estoque seja insuficiente, retorne uma mensagem de erro. */

BEGIN TRANSACTION

DECLARE @estoque INT = (SELECT Estoque FROM Produtos WHERE idProduto = 1);

IF @estoque = 0
 RAISERROR('O produto não possui estoque. PRODUTO INDISPONÍVEL', 16,-1)
ELSE
 INSERT INTO Pedidos (idCliente, DataPedido, StatusPedido)
 VALUES (1,GETDATE(), 'Pendente')

 UPDATE Produtos SET Estoque = Estoque - 1
 WHERE idProduto = 1
COMMIT TRANSACTION

/*

Criar uma consulta que detecte deadlocks em transações concorrentes.

Dica: Use sys.dm_tran_locks.

6. Gatilhos (Triggers) Avançados
Implementar um gatilho que calcule automaticamente o valor total de um pedido sempre que um item for adicionado 
ou removido.

Dica: Use AFTER INSERT, UPDATE, DELETE. */

CREATE TRIGGER CalcTotal ON ItensPedido
FOR INSERT, UPDATE, DELETE AS
BEGIN

 IF (SELECT COUNT(*) FROM inserted) > 0
 BEGIN
  SELECT p.idPedido, SUM(item.Quantidade * item.PrecoUnitario) FROM Pedidos p
  INNER JOIN inserted i ON i.idPedido = p.idPedido
  INNER JOIN ItensPedido item ON item.idPedido = p.idPedido
  GROUP BY p.idPedido
 END
 ELSE
 BEGIN
  SELECT p.idPedido, SUM(item.Quantidade * item.PrecoUnitario) FROM Pedidos p
  INNER JOIN deleted d ON d.idPedido = p.idPedido
  INNER JOIN ItensPedido item ON item.idPedido = p.idPedido
  GROUP BY p.idPedido
 END
END


/*

7. Criar um gatilho que impeça a exclusão de um cliente se ele tiver pedidos pendentes ou pagamentos pendentes.

Dica: Use RAISERROR ou THROW.*/

CREATE TRIGGER DeleteCliente ON Clientes
FOR DELETE AS
BEGIN
 DECLARE @pedidos INT;
 DECLARE @pagamentos INT;

 SELECT @pedidos = COUNT(DISTINCT  p.idPedido),
 @pagamentos = COUNT(DISTINCT pag.idPagamento) FROM Clientes c
 INNER JOIN Pedidos p ON p.idCliente = c.idCliente
 INNER JOIN Pagamentos pag ON pag.idPedido = p.idPedido
 WHERE c.idCliente = (SELECT idCliente FROM deleted) AND
 p.StatusPedido = 'Pendente' AND pag.StatusPagamento = 'Pendente'

 IF @pedidos > 0 OR @pagamentos > 0
  RAISERROR('O cliente não pode ser excluido, pois possui pagamentos ou pedidos pendentes', 16, 1)
END

/*

7. Análise de Dados
7. Criar uma consulta que retorne o tempo médio entre a data do pedido e a 
data de avaliação do produto, considerando apenas pedidos com status "Entregue"*/

SELECT prod.Categoria, AVG(DATEDIFF(MINUTE, p.DataPedido,a.DataAvaliacao)) FROM Pedidos p
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
INNER JOIN Produtos prod ON prod.idProduto = i.idProduto
INNER JOIN Avaliacoes a ON a.idProduto = prod.idProduto
WHERE p.StatusPedido = 'Entregue'
GROUP BY prod.Categoria


/*

Dica: Use DATEDIFF e agregações.

8. Listar os clientes que têm mais de 5 pedidos ativos e uma média de gastos superior a R$ 500,00.

Dica: Use subconsultas e funções de agregação.*/

SELECT c.NomeCliente FROM Clientes c
INNER JOIN Pedidos p ON p.idCliente = c.idCliente
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
GROUP BY c.NomeCliente
HAVING COUNT(
 CASE
  WHEN p.StatusPedido = 'Ativo' THEN 1
  ELSE 0
 END
) > 5 AND
SUM(i.Quantidade*i.PrecoUnitario) > 500

/*

8. Stored Procedures Complexas
Criar uma Stored Procedure que receba um intervalo de datas e retorne o faturamento total 
por categoria de produto, mas apenas para categorias que tiveram um aumento de pelo menos 
30% no número de pedidos em comparação com o período anterior de mesmo tamanho.

Dica: Use subconsultas e cálculos percentuais. */
DROP TABLE #T3
CREATE PROCEDURE RelatorioFaturamento(
 @dataInicio DATETIME,
 @dataFim DATETIME
) AS BEGIN
 SELECT prod.idProduto, prod.Categoria, SUM(i.Quantidade*i.PrecoUnitario) AS Total INTO #Perido1 FROM Pedidos p
 INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
 INNER JOIN Produtos prod ON prod.idProduto = i.idProduto
 WHERE p.DataPedido BETWEEN @dataInicio AND @dataFim
 GROUP BY prod.idProduto, prod.Categoria

 SELECT prod.idProduto, prod.Categoria, SUM(i.Quantidade*i.PrecoUnitario) AS Total INTO #Perido2 FROM Pedidos p
 INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
 INNER JOIN Produtos prod ON prod.idProduto = i.idProduto
 WHERE p.DataPedido BETWEEN DATEADD(YEAR, -1, @dataInicio) AND DATEADD(YEAR, -1 ,@dataFim)
 GROUP BY prod.idProduto, prod.Categoria

 SELECT p1.idProduto, p1.Categoria FROM #Perido1 p1
 INNER JOIN #Perido2 p2 ON p2.idProduto = p1.idProduto
 WHERE (p2.Total*100)/p1.Total <= 70
END

/*
9. Implementar uma Stored Procedure que atualize o status de todos os pedidos para "Atrasado" 
se a data do pedido for anterior a 7 dias da data atual e o status ainda for "Processando"*/

CREATE PROCEDURE StatusPedidos AS
BEGIN
 UPDATE Pedidos SET StatusPedido = 'Atrasado'
 WHERE DataPedido < DATEDIFF(DAY, -7, GETDATE()) AND
 StatusPedido = 'Processando'
END