/*
DESCRIÇÃO DAS TABELAS

Uper_Corridas: Registra informações sobre as corridas, como o cliente associado, locais de origem e destino, horários de solicitação e conclusão, status da corrida e outras informações relacionadas à corrida.
Uper_Pagamentos: Armazena informações sobre os pagamentos feitos para cada corrida, incluindo o Valor pago e a forma de pagamento utilizada.
Uper_Clientes: Registra os clientes do sistema, incluindo seu nome, CPF/CNPJ, forma de pagamento padrão e classificação dada pelos motoristas (NotaCliente).
Uper_Motoristas: Contém informações sobre os motoristas, como nome, CPF, nota atribuída pelos clientes (NotaMotorista) e data de início de suas atividades na plataforma.
Uper_Veiculos: Registra os veículos utilizados pelos motoristas, incluindo sua categoria (como luxo, padrão, básico), cor, marca, modelo e ano de fabricação.
Uper_FormaPagamento: Mantém informações sobre as formas de pagamento disponíveis no sistema, como dinheiro, cartão de crédito, etc., e o percentual de bonificação da empresa associado a cada forma de pagamento.
Uper_TrajetoPercorrido: Registra os diferentes locais (CEPs) percorridos durante cada corrida, juntamente com o horário em que o veículo passou por cada local. Isso pode ser útil para análise de rotas, por exemplo.
Uper_CEP: Armazena informações sobre os CEPs, como o tipo de logradouro e o nome do logradouro.
Uper_Categoria: Define as categorias dos veículos, como luxo, padrão, básico.
*/ 

/*
TABELA QUE REGISTRA AS CORRIDAS 

INCLUSÃO: Evento gerado na solicitação de corrida pelo cliente
CANCELAMENTO: Evento gerado pelo cliente ou pelo motorista, instante que o campo corrida cancelada recebe o Valor 1
ENCERRAMENTO: Evento gerado pelo motorista na finalização da corrida
*/
DROP TABLE IF EXISTS Uper_Corridas

CREATE TABLE Uper_Corridas (
	idCorrida INT IDENTITY (1,1) NOT NULL,
	idCliente INT NOT NULL,  
	idCepOrigem INT NOT NULL, 
	NumeroOrigem INT NOT NULL, -- Número na rua
	DataHoraSolicitacaoCorrida DATETIME NOT NULL,
	idCepDestino INT NOT NULL,
	NumeroDestino INT NOT NULL, -- Número na rua
	idMotorista INT NULL,
	DataHoraInicioCorrida DATETIME NULL,
	StatusCorrida INT NOT NULL, -- (0-não iniciada; 1-em execução; 2-concluída; 9-cancelada)  
	CorridaCanceladaPorCliente BIT NULL,
	NotaCorrida INT NULL,
	DataHoratermino DATETIME NULL)


/*
TABELA QUE REGISTRA OS PAGAMENTOS REALIZADOS PARA CADA CORRIDA 
*/
DROP TABLE IF EXISTS Uper_Pagamentos

CREATE TABLE Uper_Pagamentos (
	idPagamento INT IDENTITY (1,1) NOT NULL, 
	idCorrida INT NOT NULL,
	Valor money NOT NULL,
	idFormaPagamento INT NOT NULL) 


/*
TABELA QUE REGISTRA OS CLIENTES(passageiros) DA UPER
*/
DROP TABLE IF EXISTS Uper_Clientes

CREATE TABLE Uper_Clientes (
	idCliente INT IDENTITY (1,1) NOT NULL,
	Nome VARCHAR (50) NOT NULL,
	CNPJ_CPF VARCHAR (14) NOT NULL,
	IdFormapagamentoPadrao INT  NULL,
	NotaCliente INT NULL)


/*
TABELA QUE REGISTRA OS MOTORISTAS DA UPER
*/
DROP TABLE IF EXISTS Uper_Motoristas

CREATE TABLE Uper_Motoristas (
	idMotorista INT IDENTITY (1,1) NOT NULL, 
	idVeiculo INT NOT NULL,
	Nome VARCHAR (50) NOT NULL,
	CPF VARCHAR (11) NOT NULL,
	NotaMotorista INT NULL,
	DataInicioAtividadesUper DATETIME)


/*
TABELA QUE REGISTRA OS VEÍCULOS DA UPER
*/
DROP TABLE IF EXISTS Uper_Veiculos

CREATE TABLE Uper_Veiculos (
	idVeiculo INT IDENTITY (1,1) NOT NULL,
	placa varchar(7) NOT NULL,
	idCategoria INT NOT NULL, 
	Cor VARCHAR(50) NOT NULL,
	MarcaModelo VARCHAR(50) NOT NULL,
	Tipo VARCHAR(20) NOT NULL, -- Sedan, SUV, Hatch, Van, Caminhão, Ônibus ...
	AnoFabricacao INT NOT NULL,
	DataInicioAtividadesUper DATETIME)


/*
TABELA QUE REGISTRA AS FORMAS PAGAMENTOS DA UPER
*/
DROP TABLE IF EXISTS Uper_FormaPagamento

CREATE TABLE Uper_FormaPagamento (
	idFormaPagamento INT IDENTITY (1,1) NOT NULL,
	DescricaoFormaPagamento VARCHAR (50) NOT NULL,
	PercentualBonificacaoUper MONEY NOT NULL )   -- Valor de 0 a 1 onde 10% está registrado por 0,10


/*
TABELA QUE REGISTRA OS CEPS PERCORRIDOS A CADA CORRIDA A PARTIR DA LOCALIZAÇÃO DO CELULAR DO MOTORISTA,
O EVENTO DE ATUALIZAÇÃO DA TABELA OCORRE NO INSTANTE QUE O VEÍCULO ENTRA NA VIA 
*/
DROP TABLE IF EXISTS Uper_TrajetoPercorrido

CREATE TABLE Uper_TrajetoPercorrido (
	idTrajetoPercorrido INT IDENTITY (1,1) NOT NULL,
	idCorrida INT NOT NULL,
	idCep INT NULL,
	Distancia FLOAT NULL, -- Distância em Km
	DataHoraEvento DATETIME NULL)


/*
TABELA QUE REGISTRA OS CEPS
*/
DROP TABLE IF EXISTS Uper_CEP

CREATE TABLE Uper_Cep (
	idCep INT IDENTITY(1,1) NOT NULL,
	CEP INT NOT NULL,
	TipoLogradouro VARCHAR(20) NOT NULL,
	NomeLogradouro VARCHAR(50) NOT NULL,
	Bairro VARCHAR(20) NOT NULL)


/*
TABELA QUE REGISTRA AS CATEGORIAS DOS VEICULOS (LUXO, STANDART, BASICO)
*/
DROP TABLE IF EXISTS Uper_Categoria

CREATE TABLE Uper_Categoria (
	idCategoria INT IDENTITY (1,1) NOT NULL,
	Descricao VARCHAR(50) NOT NULL)
 
INSERT INTO Uper_Corridas (
	idCliente,  
	idCepOrigem, 
	NumeroOrigem , -- Número na rua
	DataHoraSolicitacaoCorrida,
	idCepDestino,
	NumeroDestino, -- Número na rua
	idMotorista,
	DataHoraInicioCorrida,
	StatusCorrida,
	CorridaCanceladaPorCliente,
	NotaCorrida,
	DataHoratermino
)
VALUES
(1,1,1025,GETDATE(),2,2500,1,DATEADD(MINUTE, 10, GETDATE())),1

/*  Q U E S T Õ E S 




1) Listar o motorista com o maior faturamento em cada mês de 2023, para entrega de premio promovido pela Uper
(Considerar apenas corridas concluídas)

Exemplo do  formato de saída:
Mes         Ano         NomeMotorista                           Faturamento
----------- ----------- --------------------------------------- ------------

(Valor da questão 1,5 ponto)

*/
SELECT t.Mes, '2023' as Ano, t.Nome AS NomeMotorista, t.Valor AS Faturamento FROM(
SELECT m.idMotorista, m.Nome, MONTH(c.DataHoratermino) AS Mes, SUM(p.Valor) AS Valor FROM Uper_Motoristas m 
INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
INNER JOIN Uper_Pagamentos p ON p.idCorrida = c.idCorrida
WHERE c.StatusCorrida = 2
GROUP BY m.idMotorista, m.Nome, MONTH(c.DataHoratermino)) t
WHERE NOT EXISTS(
 SELECT m.Nome, MONTH(c.DataHoratermino) AS Mes, SUM(p.Valor) AS Valor FROM Uper_Motoristas m 
 INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
 INNER JOIN Uper_Pagamentos p ON p.idCorrida = c.idCorrida
 WHERE c.StatusCorrida = 2 AND MONTH(c.DataHoratermino) = t.Mes
 GROUP BY m.Nome, MONTH(c.DataHoratermino)
 HAVING SUM(p.Valor) > t.Valor
)


/*




2) Listar os 10 passageiros com maior numero de viagens em dezembro de 2023, para entrega de premio pela Uper
(Considerar apenas corridas concluídas)

Exemplo do  formato de saída:
NomePassageiro                                     NumeroDeViagens
-------------------------------------------------- ---------------

(Valor da questão 0,5 ponto)

*/
SELECT TOP 10 WITH TIES c.Nome AS NomePassageiro, 
COUNT(DISTINCT co.idCorrida) AS NumeroDeViagens FROM Uper_Clientes c
INNER JOIN Uper_Corridas co ON co.idCliente = c.idCliente
WHERE co.StatusCorrida = 2 AND MONTH(co.DataHoraInicioCorrida) = 12 AND YEAR(co.DataHoraInicioCorrida) = 2023
GROUP BY c.Nome
ORDER BY COUNT(DISTINCT co.idCorrida) DESC
/*



3) Listar a hora do dia com maior procura de viagens, para equipe de marketing propor melhoria  na atuação dos motoristas, 
(Considerar todas as corridas)
Exemplo do  formato de saída:
HoraDoDia   NumeroDeViagens
----------- ---------------
12          80 
11          76

(Valor da questão 0,5 ponto)

*/
 SELECT DATENAME(HOUR, c.DataHoraSolicitacaoCorrida) AS HoraDoDia, COUNT(c.idCorrida) AS NumeroDeViagens FROM Uper_Corridas c
 GROUP BY DATENAME(HOUR, c.DataHoraSolicitacaoCorrida)
 ORDER BY COUNT(c.idCorrida)
 
*/*/




 4) Listar as 100 maiores lucratividades de cada motorista em dezembro de 2023, política de incentivo da empresa,
 considerar lucro o Valor da corrida menos a bonificação da Uper, menos os 20% de custos de combustivel
 Exemplo do  formato de saída:
 idMotorista NomeMotorista                                      ValorTotalCorridas    Lucro
 ----------- -------------------------------------------------- --------------------- ------------- 
 12          JOSÉ CARLOS                                                    5000,90       3.004,60
 27			 JOÃO PEDRO                                                     4905,90       2.984,60

 (Valor da questão 1,0 ponto)

 /**//**/*/

SELECT m.idMotorista, m.Nome, SUM(p.Valor) AS ValorTotalCorridas INTO #T1 FROM Uper_Motoristas m
INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
INNER JOIN Uper_Pagamentos p ON p.idCorrida = c.idCorrida
INNER JOIN Uper_FormaPagamento f ON f.idFormaPagamento = p.idFormaPagamento
WHERE MONTH(c.DataHoraInicioCorrida) = 12 AND YEAR(c.DataHoraInicioCorrida) = 2023 AND
c.StatusCorrida = 2
GROUP BY m.idMotorista, m.Nome

SELECT TOP 100 WITH TIES t.*, (
 t.ValorTotalCorridas * ((1 - f.PercentualBonificacaoUper)-0.2)
) AS Lucro FROM #T1 t
INNER JOIN Uper_Corridas c ON c.idMotorista = t.idMotorista
INNER JOIN Uper_Pagamentos p ON p.idCorrida = c.idCorrida
INNER JOIN Uper_FormaPagamento f ON f.idFormaPagamento = p.idFormaPagamento
WHERE MONTH(c.DataHoraInicioCorrida) = 12 AND YEAR(c.DataHoraInicioCorrida) = 2023 AND
c.StatusCorrida = 2
ORDER BY Lucro DESC
 /*


5) Listar o faturamento por forma de pagamento em dezembro de 2023,  negociação com as empresas parceiras responsaveis pelos canais de cobrança. exibir o relatorio na Ordem "Valor faturado" descendente.
 Exemplo do  formato de saída:
 FormaPagamento       Faturamento
 -------------------- --------------- 
 CARTÃO	CREDITO         590.987,90
 PIX                     89.909,00

 (Valor da questão 0,5 ponto)

 */
  SELECT f.DescricaoFormaPagamento AS FormaPagamento,
  SUM(p.Valor) AS Faturamento FROM Uper_Corridas c
  INNER JOIN Uper_Pagamentos p ON p.idCorrida = c.idCorrida
  INNER JOIN Uper_FormaPagamento f ON p.idFormaPagamento = f.idFormaPagamento
  WHERE MONTH(c.DataHoraInicioCorrida) = 12 AND YEAR(c.DataHoraInicioCorrida) = 2023
  AND c.StatusCorrida = 2
  GROUP BY f.DescricaoFormaPagamento
 /*




6) Uma denuncia realizada à Policia militar, aponta para um Uper vermelho em crime cometido no CEP 59200300, no dia 24/12/2023, 
por volta das 20:00hs, logo em seguida o mesmo veículo foi visto na avenida Tancredo Neves. 
Listar os possiveis veículos com tais características para averiguações  
 Exemplo do  formato de saída:
 placa   Cor                                                MarcaModelo                                        AnoFabricacao
 ------- -------------------------------------------------- -------------------------------------------------- -------------
DEF9J80  VERMELHO                                          VOYAGE                                              2022

(Valor da questão 1,0 ponto)

*/

SELECT v.placa,
v.Cor,
v.MarcaModelo FROM Uper_Veiculos v
INNER JOIN Uper_Motoristas m ON m.idVeiculo = v.idVeiculo
INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
INNER JOIN Uper_TrajetoPercorrido t ON t.idCorrida = c.idCorrida
INNER JOIN Uper_Cep cep ON cep.idCep = t.idCep
WHERE v.Cor = 'Vermelho' AND 
CONVERT(VARCHAR, c.DataHoraInicioCorrida, 103) = '24/12/2023' AND
cep.CEP = '59200300' AND DATEPART(HOUR, c.DataHoraInicioCorrida) >= 20 AND
EXISTS(
 SELECT m.idMotorista FROM Uper_Motoristas m1
 INNER JOIN Uper_Corridas c1 ON c1.idMotorista = m.idMotorista
 INNER JOIN Uper_TrajetoPercorrido t1 ON t1.idCorrida = c.idCorrida
 INNER JOIN Uper_Cep cep ON cep.idCep = t1.idCep
 WHERE m1.idMotorista = m.idMotorista AND
 CONVERT(VARCHAR, c1.DataHoraInicioCorrida, 103) = '24/12/2023' AND
 cep.NomeLogradouro = 'avenida Tancredo Neves' AND
 DATEPART(HOUR,t1.DataHoraEvento) > DATEPART(HOUR, t.DataHoraEvento)
)

/*


7) Listar os motoristas que obtiveram uma classificação média superior a 4.5 em todas as viagens que realizaram, e que não tenham sido avaliados com notas inferiores a 4.5.
   Ordenar os motoristas com maiores médias primeiro. 
   OBSERVAÇÃO: Não usar a coluna NotaMotorista da tabela Uper_Motoristas.
   Exemplo do  formato de saída:

   idMotorista NomeMotorista                                      ClassificacaoMedia
   ----------- -------------------------------------------------- ------------------

(Valor da questão 1,0 ponto)

*/
 SELECT m.idMotorista, m.Nome as NomeMotorista, AVG(c.NotaCorrida) AS ClassificacaoMedia FROM Uper_Motoristas m
 INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
 WHERE NOT EXISTS(
   SELECT m1.* FROM Uper_Motoristas m1
   INNER JOIN Uper_Corridas c1 ON c1.idMotorista = m1.idMotorista
   WHERE m1.idMotorista = m.idMotorista AND c1.NotaCorrida < 4.5
 )
 GROUP BY m.idMotorista, m.Nome
 HAVING AVG(c.NotaCorrida) > 4.5
 ORDER BY AVG(c.NotaCorrida) DESC
 
/*

8) Identificar as marca/modelo dos veículos que tiveram uma taxa de cancelamento de viagem superior a 10% em relação ao total de viagens realizadas.
(Considerar corridas concluídas e canceladas)
MarcaModelo                                        ViagensCanceladas TotalViagens TaxaCancelamento
-------------------------------------------------- ----------------- ------------ ---------------------------------------

*/

 SELECT v.MarcaModelo, COUNT(
  CASE
   WHEN c.CorridaCanceladaPorCliente = 1 THEN 1
   ELSE 0
  END
 ) AS ViagensCanceladas,
 COUNT(c.idCorrida) AS TotalViagens,
 (
  COUNT(
  CASE
   WHEN c.CorridaCanceladaPorCliente = 1 THEN 1
   ELSE 0
  END
 ) * 100 / COUNT(c.idCorrida)) AS TaxaCancelamento FROM Uper_Veiculos v
 INNER JOIN Uper_Motoristas m ON v.idVeiculo = m.idVeiculo
 INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
 GROUP BY v.MarcaModelo
 HAVING (
  COUNT(
  CASE
   WHEN c.CorridaCanceladaPorCliente = 1 THEN 1
   ELSE 0
  END
 ) * 100 / COUNT(c.idCorrida)) > 10
 
 /*

(Valor da questão 1,0 ponto)




9) Criar uma Stored Procedure(Procedimento armazenado) que receba um ano como parâmetro e liste para cada motorista o aumento percentual no número de viagens realizadas
       em comparação com o mesmo período do ano anterior. Ordene pelos motoristas com maior aumento percentual. Exibir o Valor percentual arrendondado.
	   Caso o motorista tenha iniciado somente no ano atual, assumir o aumento percentual como 0. 
      (Considerar as corridas concluídas)

Exemplo esperado de saída 
       
       | idMotorista | NomeMotorista | ViagensAnterior | ViagensAtual | AumentoPercentual | 
       | ----------- | ------------- | --------------- | ------------ | ----------------- |
       | 15          | Pedro Costa   | 15              | 30           | 100               |
       | 33          | José Alves    | 0               | 3            | 0                 |
       | 12          | Ana Silva     | 12              | 10           | -16               |
     
(Valor da questão 1,5 ponto)

*/

 CREATE PROCEDURE Aumento(
  @ano INT
 ) AS
 BEGIN
 SELECT t.*,
  (
   CASE
    WHEN (SELECT YEAR(m1.DataInicioAtividadesUper) FROM Uper_Motoristas m1
	WHERE m1.idMotorista = t.idMotorista) = YEAR(GETDATE()) THEN 0
	WHEN t.ViagensAnterior = 0 THEN 0
	ELSE FLOOR(
	 ((t.ViagensAtual * 100) / t.ViagensAnterior) - 100
	)
   END
  ) AS AumentoPercentual
 FROM(
  SELECT m.idMotorista, m.Nome AS NomeMotorista,
  COUNT(
   CASE
    WHEN YEAR(c.DataHoratermino) = @ano-1 THEN 1
	ELSE 0
   END
  ) AS ViagensAnterior,
  COUNT(
   CASE
    WHEN YEAR(c.DataHoratermino) = @ano THEN 1
	ELSE 0
   END
  ) AS ViagensAtual
  FROM Uper_Motoristas m
  INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
  GROUP BY m.idMotorista, m.Nome) t
  INNER JOIN Uper_Motoristas m ON m.idMotorista = t.idMotorista
  INNER JOIN Uper_Corridas c ON c.idMotorista = m.idMotorista
  GROUP BY t.idMotorista, t.NomeMotorista, t.ViagensAnterior, t.ViagensAtual
 END

 EXEC dbo.Aumento @ano = 2023

/*
10) Implemente um gatilho que atualize automaticamente o campo  "NotaMotorista" na tabela "Uper_Motorista" sempre que uma nova classificação for enviada para uma de suas viagens.
(Considerar apenas corridas concluídas)
(Valor da questão 1,5 ponto)

*/
 ALTER TRIGGER update_nota ON Uper_Corridas
 FOR INSERT AS
 BEGIN
  DECLARE @idMotorista INT;
  SELECT idMotorista = inserted.idMotorista FROM inserted;
  

  IF (SELECT inserted.StatusCorrida FROM inserted) = 2
  BEGIN
   UPDATE Uper_Motoristas SET NotaMotorista = (
    SELECT AVG(c.NotaCorrida) FROM Uper_Corridas c 
	WHERE c.idMotorista = @idMotorista AND c.StatusCorrida = 2
   )WHERE idMotorista = @idMotorista
  END
 END
/*


*/


