ALTER FUNCTION Num_dias(
 @mes INT,
 @ano INT
) RETURNS INT AS
BEGIN
 DECLARE @date DATE = CAST(CAST(@ano AS VARCHAR) + '-' + 
 RIGHT('00'+CAST(@mes AS VARCHAR), 2)+ '-' + '01' AS DATE);

 RETURN CAST(RIGHT(EOMONTH(@date),2) AS INT)
END

SELECT dbo.Num_dias(2, 2024) -- 29
SELECT dbo.Num_dias(2, 2023) -- 28
SELECT dbo.Num_dias(3, 2024) -- 31
SELECT dbo.Num_dias(9, 2024) -- 30

SELECT CAST(CAST(2024 AS VARCHAR) + '-' + 
 RIGHT('00'+CAST(9 AS VARCHAR), 2)+ '-' + '01' AS DATE)

 /***/

 CREATE FUNCTION Diferenca_minutos(
  @hora1 TIME,
  @hora2 TIME
 ) RETURNS INT AS
 BEGIN
  RETURN DATEDIFF(MINUTE, @hora1, @hora2)
 END

SELECT dbo.Diferenca_minutos('01:00:00', '02:00:00') -- 60
SELECT dbo.Diferenca_minutos('01:40:00', '06:20:00') -- 280

/***/

CREATE FUNCTION Num_palavras(
 @frase NVARCHAR(MAX)
) RETURNS INT AS
BEGIN
 DECLARE @words TABLE(word VARCHAR(50));
 DECLARE @palavra VARCHAR(50) = ''

 SET @frase = REPLACE(@frase, ',', '') + ' ';

 WHILE CHARINDEX(' ',@frase) > 0
 BEGIN
  SET @palavra = SUBSTRING(@frase, 1, CHARINDEX(' ',@frase));
  INSERT INTO @words (word) VALUES (@palavra);
  SET @frase = SUBSTRING(@frase, CHARINDEX(' ',@frase) + 1, LEN(@frase))
 END

 RETURN (SELECT COUNT(DISTINCT word) FROM @words)
END

SELECT dbo.Num_palavras('Debaixo da pia tem um pinto, o pinto pia, a pia pinga') -- 9
SELECT dbo.Num_palavras('Se o papa papasse papa, Se o papa papasse pão, Se o papa tudo papasse, Seria um papa papão.') -- 9

/***/


