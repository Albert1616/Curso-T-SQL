-- Tabela de Produtos
DROP TABLE IF EXISTS Produtos;

CREATE TABLE Produtos (
    idProduto INT IDENTITY(1,1) NOT NULL,
    NomeProduto VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    QuantidadeEstoque INT NOT NULL
);

-- Tabela de Clientes
DROP TABLE IF EXISTS Clientes;

CREATE TABLE Clientes (
    idCliente INT IDENTITY(1,1) NOT NULL,
    NomeCliente VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataCadastro DATETIME NOT NULL
);

-- Tabela de Pedidos
DROP TABLE IF EXISTS Pedidos;

CREATE TABLE Pedidos (
    idPedido INT IDENTITY(1,1) NOT NULL,
    idCliente INT NOT NULL,
    DataPedido DATETIME NOT NULL,
    StatusPedido VARCHAR(20) NOT NULL,  -- (Ex: "Pendente", "Concluído", "Cancelado")
    ValorTotal DECIMAL(10, 2) NOT NULL);

-- Tabela de Itens de Pedido
DROP TABLE IF EXISTS ItensPedido;

CREATE TABLE ItensPedido (
    idItemPedido INT IDENTITY(1,1) NOT NULL,
    idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    Quantidade INT NOT NULL,
    PrecoUnitario DECIMAL(10, 2) NOT NULL
);

-- Tabela de Avaliações de Produtos
DROP TABLE IF EXISTS Avaliacoes;

CREATE TABLE Avaliacoes (
    idAvaliacao INT IDENTITY(1,1) NOT NULL,
    idProduto INT NOT NULL,
    idCliente INT NOT NULL,
    Nota INT NOT NULL,  -- Nota de 1 a 5
    Comentario VARCHAR(255) NULL,
    DataAvaliacao DATETIME NOT NULL
);

-- QUESTÕES

/*
1. Listar os 10 produtos mais vendidos no último trimestre de 2023. 
Exiba o nome do produto, quantidade vendida e total faturado por produto. Formato de saída:

NomeProduto            QuantidadeVendida    TotalFaturado
-------------------    -------------------   ---------------
Produto A              500                   10000.00
Produto B              450                   9000.00

*/
SELECT t.NomeProduto,t.QuantidadeVendida, t.QuantidadeVendida * p.Preco AS TotalFaturado FROM (
SELECT pro.idProduto, pro.NomeProduto AS NomeProduto, 
COUNT(pro.idProduto) AS QuantidadeVendida FROM Pedidos p
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
INNER JOIN Produtos pro ON pro.idProduto = i.idProduto
WHERE MONTH(p.DataPedido) IN (9,10,11,12) AND YEAR(p.DataPedido) = 2023
GROUP BY pro.idProduto,pro.NomeProduto) t
INNER JOIN Produtos p ON p.NomeProduto = t.idProduto

/*

2. Listar os 5 clientes com maior gasto total na loja em 2023. Formato de saída:

NomeCliente           TotalGasto
-------------------   -----------
Cliente X             12000.00
Cliente Y             9500.00

*/

SELECT TOP 5 c.NomeCliente, SUM(CAST(i.Quantidade * i.PrecoUnitario AS MONEY)) AS TotalGasto FROM Clientes c
INNER JOIN Pedidos p ON p.idCliente = c.idCliente
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
GROUP BY c.NomeCliente
ORDER BY TotalGasto DESC


/*

3. Listar as categorias de produtos com maior número de avaliações em 2023. 
Exiba o nome da categoria e o número de avaliações. Formato de saída:

CategoriaProduto      NumeroDeAvaliacoes
-------------------   -------------------
Eletrônicos           120
Roupas                100

*/

SELECT p.Categoria AS CategoriaProduto, 
COUNT(a.idAvaliacao) AS NumeroDeAvaliacoes FROM Produtos p
INNER JOIN Avaliacoes a ON a.idProduto = p.idProduto
WHERE YEAR(a.DataAvaliacao) = 2023
GROUP BY p.Categoria
ORDER BY NumeroDeAvaliacoes DESC

/*

4. Listar os 10 produtos mais bem avaliados (nota média maior que 4) em 2023. 
Exiba o nome do produto e a nota média. Formato de saída:

NomeProduto           NotaMedia
-------------------   ----------
Produto X             4.8
Produto Y             4.7

*/

SELECT p.NomeProduto AS NomeProduto, 
CAST(AVG(a.Nota) AS DECIMAL(2,1)) AS NotaMedia FROM Produtos p
INNER JOIN Avaliacoes a ON a.idProduto = p.idProduto
WHERE a.Nota IS NOT NULL AND YEAR(a.DataAvaliacao) = 2023
GROUP BY p.NomeProduto
HAVING AVG(a.Nota) > 4
ORDER BY NotaMedia DESC

/*

5. Listar todos os pedidos feitos por um cliente específico (ID 5) no ano de 2023. 
Exiba o ID do pedido, data do pedido, status do pedido e o valor total. Formato de saída:

idPedido  DataPedido            StatusPedido  ValorTotal
-------   -------------------    ------------  -----------
1         2023-05-01 10:00:00    Concluído     250.00
2         2023-07-10 14:30:00    Cancelado     100.00


*/

SELECT p.idPedido, p.DataPedido, p.StatusPedido,
i.Quantidade * i.PrecoUnitario AS ValorTotal FROM Clientes c
INNER JOIN Pedidos p ON p.idCliente = c.idCliente
INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
WHERE c.idCliente = 5 AND YEAR(p.DataPedido) = 2023

/*

6. Listar os produtos com menos de 10 unidades em estoque e que não foram vendidos no último mês. 
Exiba o nome do produto, categoria, quantidade em estoque e o total de vendas no último mês. Formato de saída:

NomeProduto            Categoria           QuantidadeEstoque   VendasUltimoMes
-------------------    ------------------  ------------------  ---------------
Produto A              Eletrônicos         5                    0
Produto B              Roupas              8                    0


*/


SELECT p.NomeProduto, p.Categoria,
p.QuantidadeEstoque, '0' AS VendasUltimoMes FROM Produtos p
WHERE p.QuantidadeEstoque < 10 AND
NOT EXISTS(
 SELECT pe.idPedido FROM Pedidos pe
 INNER JOIN ItensPedido i ON i.idPedido = pe.idPedido
 INNER JOIN Produtos p1 ON p1.idProduto = i.idProduto
 WHERE p1.idProduto = p.idProduto AND
 MONTH(pe.DataPedido) = (SELECT MAX(MONTH(DataPedido)) FROM Pedidos)
)


/*


7. Criar uma Stored Procedure que receba o ID do cliente e um período (data inicial e data final) 
e retorne todos os pedidos realizados pelo cliente dentro do período informado. 
O relatório deve exibir o ID do pedido, data do pedido, status e valor total. Exemplo de saída:

idPedido  DataPedido            StatusPedido  ValorTotal
-------   -------------------    ------------  -----------
1         2023-05-01 10:00:00    Concluído     250.00
2         2023-06-15 16:00:00    Pendente      100.00

*/

CREATE PROCEDURE Relatorio(
 @id INT,
 @dataInicio DATETIME,
 @dataFim DATETIME
) AS BEGIN

 SELECT p.idPedido, p.DataPedido, p.StatusPedido,
 CAST(i.Quantidade * i.PrecoUnitario AS DECIMAL(5,2)) AS ValorTotal FROM Clientes c
 INNER JOIN Pedidos p ON p.idCliente = c.idCliente
 INNER JOIN ItensPedido i ON i.idPedido = p.idPedido
 WHERE c.idCliente = @id AND DAY(p.DataPedido) BETWEEN DAY(@dataInicio) AND DAY(@dataFim)
 AND MONTH(p.DataPedido) BETWEEN MONTH(@dataInicio) AND MONTH(@dataFim)
 AND YEAR(p.DataPedido) BETWEEN YEAR(@dataInicio) AND YEAR(@dataFim)
END

EXEC dbo.Relatorio @id = 1, @dataInicio = '2025-03-11T13:14:49', 
@dataFim = '2025-05-11T13:14:49'



/*
8. Criar um gatilho para atualizar a quantidade de produtos em estoque na tabela Produtos 
sempre que um item de pedido for inserido ou atualizado na tabela ItensPedido. 
O gatilho deve garantir que a quantidade de estoque seja diminuída pela quantidade de itens vendidos.

*/

ALTER TRIGGER Update_Estoque ON ItensPedido
FOR INSERT,UPDATE AS
BEGIN
 UPDATE p SET p.QuantidadeEstoque = IIF(p.QuantidadeEstoque - i.Quantidade > 0, p.QuantidadeEstoque - i.Quantidade, 0)
 FROM Produtos p
 INNER JOIN inserted i ON i.idProduto = p.idProduto
END


/*


9. Listar os 5 produtos mais caros em estoque (preço por unidade) 
que possuem mais de 100 unidades no estoque. Exiba o nome do produto, 
preço e quantidade em estoque. Formato de saída:

NomeProduto            PrecoUnitario    QuantidadeEstoque
-------------------    --------------   -------------------
Produto X              500.00           200
Produto Y              350.00           150

*/

SELECT TOP 5 p.NomeProduto, p.Preco, p.QuantidadeEstoque FROM Produtos p
WHERE p.QuantidadeEstoque > 100
ORDER BY p.Preco DESC


/*

10. Criar uma Trigger que atualize automaticamente o campo "StatusPedido" na tabela Pedidos para "Concluído" 
sempre que todos os itens do pedido forem marcados como "Enviado" na tabela ItensPedido. (
Use a tabela ItensPedido para verificar o status dos itens e realizar a atualização do status do pedido).

*/

CREATE TRIGGER StatusPedido ON ItensPedido
FOR INSERT, UPDATE AS
BEGIN

 DECLARE @idPedido INT = (SELECT idPedido FROM inserted);
 UPDATE Pedidos SET StatusPedido = 'Enviado'
 WHERE idPedido = @idPedido AND NOT EXISTS(
  SELECT idItemPedido FROM ItensPedido
  WHERE idPedido = @idPedido AND Statu
 )
 
END


/*

*/