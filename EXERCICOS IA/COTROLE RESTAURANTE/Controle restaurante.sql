-- Tabela de Restaurantes
CREATE TABLE Restaurantes (
    idRestaurante INT IDENTITY(1,1) PRIMARY KEY,
    NomeRestaurante VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    NotaMedia FLOAT NULL
);

-- Tabela de Clientes
CREATE TABLE Res_Clientes (
    idCliente INT IDENTITY(1,1) PRIMARY KEY,
    NomeCliente VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL,
    CEP VARCHAR(10) NOT NULL,
    Telefone VARCHAR(15) NOT NULL
);

-- Tabela de Entregadores
CREATE TABLE Res_Entregadores (
    idEntregador INT IDENTITY(1,1) PRIMARY KEY,
    NomeEntregador VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Veiculo VARCHAR(50) NOT NULL,
    PlacaVeiculo VARCHAR(7) NOT NULL,
    NotaMedia FLOAT NULL
);

-- Tabela de Pedidos
CREATE TABLE Res_Pedidos (
    idPedido INT IDENTITY(1,1) PRIMARY KEY,
    idCliente INT NOT NULL,
    idRestaurante INT NOT NULL,
    idEntregador INT NULL,
    DataHoraPedido DATETIME NOT NULL,
    DataHoraEntrega DATETIME NULL,
    StatusPedido INT NOT NULL, -- (0-em preparo; 1-saiu para entrega; 2-entregue; 9-cancelado)
    ValorTotal MONEY NOT NULL,
    NotaPedido INT NULL,
);

-- Tabela de Itens do Pedido
CREATE TABLE Res_ItensPedido (
    idItemPedido INT IDENTITY(1,1) PRIMARY KEY,
    idPedido INT NOT NULL,
    NomeItem VARCHAR(100) NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario MONEY NOT NULL,
);

-- Tabela de Pagamentos
CREATE TABLE Res_Pagamentos (
    idPagamento INT IDENTITY(1,1) PRIMARY KEY,
    idPedido INT NOT NULL,
    FormaPagamento VARCHAR(50) NOT NULL, -- (Cartão, PIX, Dinheiro)
    ValorPago MONEY NOT NULL,
);

/*
1. Consultas Básicas

1.1 Listar todos os pedidos entregues (StatusPedido = 2) com o nome do cliente, 
nome do restaurante e nome do entregador.

*/

SELECT p.*, c.NomeCliente, r.NomeRestaurante, e.NomeEntregador FROM Res_Pedidos p
INNER JOIN Res_Clientes c ON c.idCliente = p.idCliente
INNER JOIN Res_Entregadores e ON e.idEntregador = p.idEntregador
INNER JOIN Restaurantes r ON r.idRestaurante = p.idRestaurante
WHERE p.StatusPedido = 2

/*

1.2 Listar os 5 restaurantes com a maior nota média recebida dos clientes.

*/

SELECT TOP 5 r.idRestaurante, r.NomeRestaurante FROM Restaurantes r
GROUP BY r.idRestaurante, r.NomeRestaurante
ORDER BY AVG(r.NotaMedia) DESC

SELECT r.idRestaurante, r.NomeRestaurante,
ROW_NUMBER() OVER(ORDER BY AVG(r.NotaMedia)) FROM Restaurantes r
GROUP BY r.idRestaurante, r.NomeRestaurante

/*

2. Consultas com Agregações

2.1 Calcular o total de pedidos realizados por cada cliente, ordenando pelo cliente com mais pedidos.

*/

SELECT c.NomeCliente, COUNT(DISTINCT p.idPedido) AS TotalPedidos FROM Res_Clientes c
INNER JOIN Res_Pedidos p ON p.idCliente = c.idCliente
GROUP BY c.NomeCliente
ORDER BY TotalPedidos DESC

/*

2.2 Calcular a média de valor gasto por pedido, agrupada por cidade do cliente.
*/

SELECT c.Cidade, AVG(p.ValorTotal) AS MediaGasto FROM Res_Clientes c
INNER JOIN Res_Pedidos p ON p.idCliente = c.idCliente
GROUP BY c.Cidade
/*

3. Consultas com Subconsultas

3.1 Listar os clientes que nunca cancelaram um pedido.

*/

SELECT * FROM Res_Clientes
EXCEPT
SELECT c.* FROM Res_Clientes c
INNER JOIN Res_Pedidos p ON p.idCliente = c.idCliente
WHERE p.StatusPedido = 9

/*

3.2 Listar os entregadores que realizaram entregas para restaurantes de uma cidade específica 
(por exemplo, São Paulo) e têm uma nota média superior a 4.5.

*/

SELECT e.idEntregador, e.NomeEntregador FROM Res_Entregadores e
INNER JOIN Res_Pedidos p ON p.idEntregador = e.idEntregador
INNER JOIN Restaurantes r ON r.idRestaurante = p.idRestaurante
WHERE e.NotaMedia > 4.5
GROUP BY e.idEntregador, e.NomeEntregador
HAVING COUNT(DISTINCT r.Cidade) = 1

/*

4. Consultas com Junções Complexas

4.1 Listar todos os pedidos que incluíram um item específico (por exemplo, "Pizza Margherita"), 
mostrando o nome do cliente, o restaurante e o valor total do pedido.
*/

CREATE PROCEDURE Item(
 @item VARCHAR(50)
) AS BEGIN
 SELECT p.*, c.NomeCliente, r.NomeRestaurante FROM Res_Pedidos p
 INNER JOIN Res_ItensPedido i ON i.idPedido = p.idPedido
 INNER JOIN Res_Clientes c ON c.idCliente = p.idCliente
 INNER JOIN Restaurantes r ON r.idRestaurante = p.idRestaurante
 WHERE CHARINDEX(@item, i.NomeItem) > 0
END

/*

4.2 Listar os restaurantes que tiveram pedidos em um determinado período 
(por exemplo, entre 2023-01-01 e 2023-12-31), mostrando o nome do restaurante, 
a cidade e o total de pedidos realizados.

*/

CREATE PROCEDURE PeriodoPedidos(
 @dataInicio DATETIME,
 @dataFim DATETIME
) AS BEGIN

 SELECT r.NomeRestaurante,r.Cidade,COUNT(p.idPedido) FROM Restaurantes r 
 INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
 WHERE p.DataHoraEntrega BETWEEN @dataInicio AND @dataFim 
 GROUP BY r.NomeRestaurante, r.Cidade

END


/*

5. Manipulação de Dados

5.1 Atualizar a nota do restaurante para 5 em todos os pedidos onde o cliente 
deu uma nota superior a 4.5.

*/

SELECT * INTO #T1 FROM Restaurantes
EXCEPT 
SELECT r.* FROM Restaurantes r
INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
WHERE p.NotaPedido < 4.5

UPDATE Restaurantes SET NotaMedia = 5
WHERE idRestaurante IN (
 SELECT idRestaurante FROM #T1
)


/*

5.2 Excluir todos os pedidos cancelados há mais de 1 ano.

*/

DELETE FROM Res_Pedidos
WHERE idPedido IN (
 SELECT p.idPedido FROM Res_Pedidos p
 WHERE p.StatusPedido = 9 AND DATEDIFF(DAY, p.DataHoraPedido, GETDATE()) > 366
)

DELETE FROM Res_Pedidos 
WHERE DataHoraPedido < DATEADD(YEAR, -1, GETDATE())



/*

6. Desafio Final

6.1 Criar uma consulta que retorne o faturamento total por forma de pagamento, 
considerando apenas pedidos entregues.

*/

SELECT pag.FormaPagamento, 
FORMAT(SUM(p.ValorTotal), 'C', 'pt-br') AS Total FROM Res_Pedidos p
INNER JOIN Res_Pagamentos pag ON pag.idPedido = p.idPedido
WHERE p.StatusPedido = 2
GROUP BY pag.FormaPagamento
ORDER BY Total DESC


/*

Criar uma consulta que retorne o ranking dos 10 restaurantes mais populares, 
mostrando o nome do restaurante, a cidade e o número de pedidos.

*/

SELECT TOP 10 WITH TIES r.NomeRestaurante, r.Cidade, 
COUNT(DISTINCT p.idPedido) AS TotalPedidos FROM Restaurantes r
INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
GROUP BY r.NomeRestaurante, r.Cidade
ORDER BY TotalPedidos DESC


/*

7. Gatilho (Trigger)

7.1 Implemente um gatilho que atualize automaticamente o campo "NotaMedia" na tabela "Restaurantes" 
sempre que uma nova classificação for enviada para um pedido.

*/

CREATE TRIGGER UpdateNotaMedia ON Res_Pedidos
FOR INSERT,UPDATE AS
BEGIN
 UPDATE r SET r.NotaMedia = (
  SELECT AVG(ValorTotal) FROM Res_Pedidos WHERE idRestaurante = r.idRestaurante
 )FROM Restaurantes r
 WHERE r.idRestaurante IN (SELECT idRestaurante FROM inserted)
END


/*

8. Stored Procedure

8.1 Criar uma Stored Procedure que receba um ano como parâmetro e liste para cada restaurante o 
aumento percentual no número de pedidos realizados em comparação com o mesmo período do ano anterior.
Ordene pelos restaurantes com maior aumento percentual.

*/

CREATE PROCEDURE RelatorioRestaurante(
 @ano INT
) AS
BEGIN

 SELECT r.NomeRestaurante,
 COUNT(
  CASE
   WHEN YEAR(p.DataHoraPedido) = @ano - 1 THEN 1
   ELSE 0
  END
 ) AS AnoAnterior,
 COUNT(
  CASE
   WHEN YEAR(p.DataHoraPedido) = @ano THEN 1
   ELSE 0
  END
 ) AS AnoAtual,
 (COUNT(
  CASE
   WHEN YEAR(p.DataHoraPedido) = @ano - 1 THEN 1
   ELSE 0
  END
 ) * 100/
 COUNT(
  CASE
   WHEN YEAR(p.DataHoraPedido) = @ano THEN 1
   ELSE 0
  END
 ))-100 AS TaxaAumento
 FROM Restaurantes r
 INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
 GROUP BY r.NomeRestaurante
END
/*



*/



-- 1.


SELECT c.NomeCliente FROM Res_Clientes c
INNER JOIN Res_Pedidos p ON p.idCliente = c.idCliente
INNER JOIN Restaurantes r ON r.idRestaurante = p.idRestaurante
WHERE r.Cidade = 'São Paulo'
GROUP BY c.NomeCliente
HAVING COUNT(DISTINCT r.idRestaurante) = (SELECT COUNT(*) FROM Restaurantes WHERE Cidade = 'São Paulo')


/*
2. Listar os restaurantes que tiveram um aumento de mais de 50% no número de pedidos 
no último trimestre em comparação com o trimestre anterior. */
DROP TABLE IF EXISTS #T1
SELECT r.idRestaurante, r.NomeRestaurante, COUNT(DISTINCT p.idPedido) AS TotalPedidos
INTO #T1 FROM Restaurantes r
INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
WHERE MONTH(p.DataHoraEntrega) IN (10,11,12)
GROUP BY r.idRestaurante,r.NomeRestaurante
DROP TABLE IF EXISTS #T2
SELECT r.idRestaurante, r.NomeRestaurante, COUNT(DISTINCT p.idPedido) AS TotalPedidos
INTO #T2 FROM Restaurantes r
INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
WHERE MONTH(p.DataHoraEntrega) IN (7,8,9)
GROUP BY r.idRestaurante,r.NomeRestaurante

SELECT t.NomeRestaurante FROM #T1 t
INNER JOIN #T2 t2 ON t2.idRestaurante = t.idRestaurante
WHERE (t.TotalPedidos * 100)/IIF(t2.TotalPedidos = 0, 1, t2.TotalPedidos) - 100 > 50



/*
3. Calcular a média de tempo de entrega (em minutos) por restaurante, considerando apenas pedidos entregues.
*/


SELECT r.NomeRestaurante, AVG(DATEDIFF(MINUTE, p.DataHoraPedido, p.DataHoraEntrega)) AS MediaTempoEntrega FROM Restaurantes r 
INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
WHERE p.StatusPedido = 2
GROUP BY r.NomeRestaurante

/*
Listar os 3 entregadores com a maior distância total percorrida (soma das distâncias de todos os pedidos).
*/

SELECT TOP 3 e.NomeEntregador FROM Res_Entregadores e
INNER JOIN Res_Pedidos p ON p.idEntregador = e.idEntregador
WHERE p.StatusPedido = 2 AND
MONTH(p.DataHoraEntrega) = 
(SELECT MAX(MONTH(pe.DataHoraEntrega)) FROM Res_Pedidos pe WHERE pe.idEntregador = e.idEntregador)
GROUP BY e.NomeEntregador
ORDER BY COUNT(DISTINCT p.idPedido) DESC

/*
3. Listar os clientes que fizeram pedidos em todos os meses do último ano.*/

SELECT c.NomeCliente FROM Res_Clientes c
INNER JOIN Res_Pedidos p ON p.idCliente = c.idCliente
WHERE YEAR(p.DataHoraPedido) = DATEADD(YEAR, -1, GETDATE()) AND p.StatusPedido = 2
GROUP BY c.NomeCliente
HAVING COUNT(DISTINCT DATENAME(MONTH, p.DataHoraPedido)) = 12
/*


4. Listar os restaurantes que nunca receberam uma nota inferior a 4.0 em nenhum pedido.
*/

SELECT r.NomeRestaurante FROM Restaurantes r
INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
GROUP BY r.NomeRestaurante
HAVING MIN(p.NotaPedido) >= 4

/*

5. Atualizar a nota média de todos os restaurantes para a média das notas dos pedidos dos últimos 6 meses.
*/

UPDATE Restaurantes SET NotaMedia = (
 SELECT AVG(p.NotaPedido) FROM Res_Pedidos p
 WHERE p.StatusPedido = 2 AND p.idRestaurante = Restaurantes.idRestaurante AND
 p.NotaPedido IS NOT NULL AND
 MONTH(p.DataHoraEntrega) BETWEEN MONTH(DATEADD(MONTH, -5,GETDATE())) AND MONTH(GETDATE())
)



/*

6. Excluir todos os pedidos que não têm itens associados na tabela Res_ItensPedido. */


DELETE FROM Res_Pedidos
WHERE NOT EXISTS(
 SELECT i.idItemPedido FROM ItensPedido i
 WHERE i.idPedido = idPedido
)

/*


5. Desafios Malignos
Criar uma consulta que retorne o restaurante com a maior variação de notas 
(diferença entre a maior e a menor nota recebida). */


SELECT TOP 1 WITH TIES r.NomeRestaurante FROM Restaurantes r
INNER JOIN Res_Pedidos p ON p.idRestaurante = r.idRestaurante
WHERE p.StatusPedido = 2
GROUP BY r.NomeRestaurante
ORDER BY MAX(p.NotaPedido)-MIN(p.NotaPedido) DESC

/*

6. Criar uma consulta que retorne os clientes que fizeram pedidos 
em mais de 3 restaurantes diferentes no último mês. */

SELECT c.NomeCliente FROM Res_Clientes c
INNER JOIN Res_Pedidos p ON p.idCliente = c.idCliente
INNER JOIN Restaurantes r ON r.idRestaurante = p.idRestaurante
WHERE p.StatusPedido = 2 AND MONTH(p.DataHoraEntrega) = MONTH(DATEADD(MONTH, -1, GETDATE()))
GROUP BY c.NomeCliente
HAVING COUNT(DISTINCT r.idRestaurante) > 3

/*


6. Gatilho (Trigger) Maligno
Implemente um gatilho que impeça a exclusão de um restaurante se ele tiver pedidos associados nos últimos 6 meses.
*/

CREATE TRIGGER CheckDelete ON Restaurantes
FOR DELETE AS
BEGIN

DECLARE @idRestaurante INT = (SELECT idRestaurante FROM deleted)

IF ((
SELECT COUNT(p.idPedido) FROM Res_Pedidos p
WHERE idRestaurante = @idRestaurante AND
MONTH(p.DataHoraEntrega) BETWEEN MONTH(DATEADD(MONTH, -5,GETDATE())) AND MONTH(GETDATE())
) > 0)
BEGIN
 RAISERROR('O restaurante ainda possui pedidos pendentes', 16, -1)
END

END


/*

7. Stored Procedure Maligna
Criar uma Stored Procedure que receba um intervalo de datas e retorne o faturamento total 
por restaurante, mas apenas para restaurantes que tiveram um aumento de pelo menos 20% no 
número de pedidos em comparação com o período anterior de mesmo tamanho.

Dica: Use subconsultas e cálculos percentuais.




*/