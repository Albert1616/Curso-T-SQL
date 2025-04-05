-- Função para Calcular o Número de Dias em um Mês - FINALIZADO
CREATE FUNCTION NumeroDiasMes(@Mes INT, @Ano INT)
RETURNS INT
AS
BEGIN
	DECLARE @date DATE = CAST(@Ano AS VARCHAR) + '-' + RIGHT('00' + CAST(@Mes AS VARCHAR),2) + '-' + '01'
	-- DATEFROMPARTS(ANO, MES, DIA) - RETORNA A DATA FORMATADA
	DECLARE @LastDate DATE = EOMONTH(@Date) -- EOMONTH QUE RETORNA A ÚLTIMA DATA DO MES
	--DECLARE @NumberDays INT = CAST(RIGHT(@LastDate, 2) AS INT)
	RETURN DAY(@LastDate)
END

---- Função para Calcular a Diferença em minutos entre Duas Horas
CREATE FUNCTION fn_DiferencaEntreHoras(@HoraInicial VARCHAR(10), @HoraFinal VARCHAR(10))
RETURNS INT
AS
BEGIN

	DECLARE @Hour_1 INT = DATEPART(HOUR, @HoraInicial) * 60; -- DATEPART JÁ RETORNA UMA INTEIRO
	DECLARE @Minute_1 INT = DATEPART(MINUTE, @HoraInicial);

	DECLARE @Hour_2 INT = DATEPART(HOUR, @HoraFinal) * 60;
	DECLARE @Minute_2 INT = DATEPART(MINUTE, @HoraFinal);

	-- DATEDIFF JA FUNCIONARIA

	DECLARE @Result INT = (@Hour_2 + @Minute_2) - (@Hour_1 + @Minute_1);
	Return @Result
END




---- Função para Calcular o Número de Palavras Únicas em uma Frase - FINALIZADO
ALTER FUNCTION dbo.ContarPalavrasUnicas (
    @frase NVARCHAR(MAX)
)
RETURNS INT
AS
BEGIN
	DECLARE @TableWords INT = 0;
	--SELECT DISTINCT 
	--@TableWords = COUNT(DISTINCT value) 
	--FROM STRING_SPLIT(REPLACE(@frase,',',''), ' ') -- , NA PALAVRA TORNA ELA DIFERENTE

	 SELECT @TableWords = COUNT(*) FROM 
	 (
	  SELECT DISTINCT value FROM STRING_SPLIT(REPLACE(@frase,',',''), ' ')
	 ) t
	RETURN @TableWords
END

---- Função para Contar o Número de Vogais em uma String

CREATE FUNCTION dbo.ContarVogais (@texto NVARCHAR(MAX))
RETURNS INT
AS
BEGIN
	DECLARE @count_vogals INT = 0;
	DECLARE @i INT = 1;
	DECLARE @tamanho INT = LEN(@texto)

	DECLARE @word VARCHAR = ''

	WHILE @i <= @tamanho
	BEGIN
	 SET @word = SUBSTRING(LOWER(@texto),@i,1)

	 IF CHARINDEX(@word, 'aeiou') > 0
		SET @count_vogals = @count_vogals + 1;
	 SET @i = @i + 1;
	END

	RETURN @count_vogals;
END

---- Função para remover caracteres especiais de uma string - FINALIZADO
CREATE FUNCTION dbo.RemoverCaracteresEspeciais (@texto NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    declare @i int = 1;
	declare @tam int = LEN(@texto)
	declare @word VARCHAR = '';

	declare @result NVARCHAR(MAX) = '';

	WHILE @i <= @tam
	BEGIN
		SET @word = SUBSTRING(@texto, @i, 1);
		IF CHARINDEX(@word, '~@#$%&*().!:;?></_|^\') = 0
		 SET @result = @result + @word
		SET @i = @i + 1
	END
	RETURN @result;
END

---- Função que retorne somente caracteres numéricos - FINALIZADO
CREATE FUNCTION dbo.GetNumeric (@texto NVARCHAR(MAX))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    
END

SELECT dbo.GetNumeric('123.456.789-09')

-- Função de cálculo de número fatorial

CREATE FUNCTION dbo.Fatorial (@n INT)
RETURNS INT
AS
BEGIN
   DECLARE @result INT = 1;

   IF @n = 0
    RETURN 1

   WHILE @n > 0
   BEGIN
	SET @result = @result * @n;
	SET @n = @n - 1;
   END

   RETURN @result
END

---- Função de cálculo da sequência de Fibonacci - FINALIZADO
CREATE FUNCTION dbo.Fibonacci (@n INT)
RETURNS BIGINT
AS
BEGIN
   IF @n = 0
	RETURN 0
   IF @n = 1
	RETURN 1

   RETURN dbo.Fibonacci(@n-1) + dbo.Fibonacci(@n-2)
END

-- SUBSTRING

ALTER FUNCTION dbo.SUB(
 @texto NVARCHAR(MAX),
 @inicio INT,
 @qtd INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
 DECLARE @result NVARCHAR(MAX) = ''
 IF @inicio = 1
 BEGIN
  SELECT @result = STUFF(@texto,@qtd+1,LEN(@texto)-1,'')
  RETURN @result
 END
 SELECT @result = STUFF(@texto,1,@inicio-1,'')
 SET @result = LEFT(@result,@qtd)
 RETURN @result
END

-- LEFT

CREATE FUNCTION LEFTV2
(
 @txt NVARCHAR(MAX),
 @qtd INT
)RETURNS NVARCHAR(MAX) 
AS
BEGIN
	RETURN SUBSTRING(@txt, 1, @qtd)
END

-- RIGTH

ALTER FUNCTION RIGHTV2
(
 @txt NVARCHAR(MAX),
 @qtd INT
) RETURNS NVARCHAR(MAX)
AS
BEGIN
 RETURN SUBSTRING(@txt, LEN(@txt)-@qtd+1, LEN(@txt)-1)
END

-- LEN
CREATE FUNCTION LENV2(
 @txt NVARCHAR(MAX)
)RETURNS INT
AS 
BEGIN
 DECLARE @i INT = 1;

 WHILE SUBSTRING(@txt, @i, 1) <> ''
 BEGIN
  SET @i = @i + 1
 END

 RETURN @i - 1
END

-- STUFF
ALTER FUNCTION STUFFV2(
 @texto NVARCHAR(MAX),
 @inicio INT,
 @fim INT,
 @exp NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX)
BEGIN
	DECLARE @i INT = 1;
	DECLARE @word NVARCHAR(1) = ''
	DECLARE @search NVARCHAR(MAX) = ''
	DECLARE @result NVARCHAR(MAX) = ''

	WHILE @i <= LEN(@texto)
	BEGIN
	SET @word = SUBSTRING(@texto, @i, 1)
	 IF @i >= @inicio AND @i <= @fim
	  SET @search = @search + @word
	SET @i = @i + 1
	END

	SELECT @result = REPLACE(@texto, @search, @exp)

	RETURN @result
END

-- REPLACE

CREATE FUNCTION REPLACEV2(
 @txt NVARCHAR(MAX),
 @exp NVARCHAR(MAX),
 @sub NVARCHAR(MAX)
)RETURNS NVARCHAR(MAX)
AS
BEGIN
 DECLARE @index INT = CHARINDEX(@exp, @txt)
 DECLARE @result NVARCHAR(MAX) = ''

 SELECT @result = STUFF(@txt, @index, LEN(@exp), @sub)

 RETURN @result
END

-- PATCHINDEX - REVISAR - MAIS ESPECIFICO, %xx_x% POR EXEMPLO, %word%
-- STUFF - REVISAR

SELECT CHARINDEX('abc', 'asdfsdadsfabckjjio') + 3

-- CHARINDEX

ALTER FUNCTION CHARINDEXV2 (
 @find NVARCHAR(MAX),
 @texto NVARCHAR(MAX)
) RETURNS INT
AS 
BEGIN
 DECLARE @i INT = 1;
 DECLARE @word NVARCHAR(1) = ''
 DECLARE @first NVARCHAR(1) = LEFT(@find, 1)

 WHILE @i <= LEN(@texto)
 BEGIN
  SET @word = SUBSTRING(@texto, @i, 1)
  IF (@word = @first) AND (@find = SUBSTRING(@texto, @i, LEN(@find)))
  BEGIN
    RETURN @i
  END
 SET @i = @i + 1;
 END

 RETURN 0
END

--SELECT position = PATINDEX('%te_es%', 'interesting data');
--SELECT CHARINDEX('te_es', 'interesting data')



ALTER FUNCTION dbo.Numeros_Dias(
 @mes INT,
 @ano INT
)RETURNS INT AS
BEGIN
 declare @date DATE = DATEFROMPARTS(@ano, @mes, 1)
 declare @last_date DATE = EOMONTH(@date)

 RETURN DAY(@last_date)

END

SELECT dbo.Numeros_Dias(2, 2024) -- 29
SELECT dbo.Numeros_Dias(2, 2023) -- 28
SELECT dbo.Numeros_Dias(3, 2024) -- 31
SELECT dbo.Numeros_Dias(9, 2024) -- 30

SELECT DAY(EOMONTH(DATEFROMPARTS(2024,9,1)))

ALTER FUNCTION dbo.Diferenca_horas(
 @inicial NVARCHAR(MAX),
 @final NVARCHAR(MAX)
) RETURNS INT
AS
BEGIN
 declare @hora_inicial TIME = CONVERT(TIME, @inicial)
 declare @hora_final TIME = CONVERT(TIME, @final)

 RETURN DATEDIFF(MINUTE, @hora_inicial, @hora_final)

END

SELECT dbo.Diferenca_horas('01:00:00', '02:00:00') -- 60
SELECT dbo.Diferenca_horas('01:40:00', '06:20:00') -- 280

SELECT CONVERT(TIME, '01:00:00')

ALTER FUNCTION Contar_palavras (
 @frase NVARCHAR(MAX)
) RETURNS INT
AS
BEGIN
 DECLARE @words INT = 0;
 SELECT @words = COUNT(*) FROM (
 SELECT DISTINCT value FROM string_split(REPLACE(@frase,',',''), ' ')) t

 RETURN @words
END

SELECT dbo.Contar_palavras('Debaixo da pia tem um pinto, o pinto pia, a pia pinga') -- 9
SELECT dbo.Contar_palavras('Se o papa papasse papa, Se o papa papasse pão, Se o papa tudo papasse, Seria um papa papão.') -- 9

CREATE FUNCTION Cont_vogals (
 @text NVARCHAR(MAX)
) RETURNS INT AS
BEGIN
 DECLARE @vogals VARCHAR(5) = 'aeiou';
 DECLARE @i INT = 1;
 DECLARE @count INT = 0;
 DECLARE @word CHAR(1) = ''

 WHILE @i < LEN(@text)
 BEGIN
  SET @word = LOWER(SUBSTRING(@text, @i, 1))
  IF CHARINDEX(@word, @vogals) > 0
   SET @count = @count + 1;
  SET @i = @i + 1;
 END

 RETURN @count
END

SELECT dbo.Cont_vogals('Olá, mundo!') -- 3
SELECT dbo.Cont_vogals('SQL Server é incrível') -- 4
SELECT dbo.Cont_vogals('abcdefghijklmnopqrstuvwxyz') -- 5

ALTER FUNCTION Remover_especiais
(
 @text NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 DECLARE @especials VARCHAR(20) = '~@#$%&*().!:;?></_|^\'
 DECLARE @i INT = 1;
 DECLARE @count INT = 0;
 DECLARE @word CHAR(1) = ''
 DECLARE @aux NVARCHAR(MAX) = ''

 WHILE @i < LEN(@text)
 BEGIN
  SET @word = SUBSTRING(@text, @i, 1)
  IF CHARINDEX(@word, @especials) = 0
   SET @aux = @aux + @word
  SET @i = @i + 1
 END

 RETURN REPLACE(@aux, ',', '')
END

SELECT dbo.Remover_especiais('O$%l&$á!, M#@un#$^d^!)_)o./') -- Olá Mundo

ALTER FUNCTION Get_number(
 @text NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 DECLARE @numbers VARCHAR(20) = '0123456789'
 DECLARE @i INT = 1;
 DECLARE @word CHAR(1) = ''

 WHILE SUBSTRING(@text, @i, 1) <> ''
 BEGIN
  SET @word = SUBSTRING(@text, @i, 1)
  IF CHARINDEX(@word, @numbers) = 0
   SET @text = STUFF(@text, @i, 1, '')
  SET @i = @i + 1
 END

 RETURN @text
END

SELECT dbo.Get_number('123.456.789-09') -- 12345678909

CREATE FUNCTION dbo.Fatorial_V2(
 @n INT
) RETURNS INT AS
BEGIN
 IF @n <= 1
  RETURN 1 
 RETURN @n * dbo.Fatorial(@n-1)
END

SELECT dbo.Fatorial_V2(5)

CREATE FUNCTION dbo.fibo(
 @n INT
) RETURNS INT AS
BEGIN
 IF @n <= 1
  RETURN @n

 RETURN dbo.fibo(@n-1) + dbo.fibo(@n-2)
END

SELECT
	dbo.fibo(0) AS  fib0 -- 0
	,dbo.fibo(1) AS fib1 -- 1
	,dbo.fibo(2) AS fib2 -- 1
	,dbo.fibo(3) AS fib3 -- 2
	,dbo.fibo(4) AS fib4 -- 3
	,dbo.fibo(5) AS fib5 -- 5
	,dbo.fibo(6) AS fib6 -- 8
	,dbo.fibo(7) AS fib7 -- 13
	,dbo.fibo(8) AS fib8 -- 21
	,dbo.fibo(9) AS fib9 -- 34
	,dbo.fibo(10) AS fib10 -- 55

ALTER FUNCTION dbo.pangrama (
 @word NVARCHAR(MAX)
) RETURNS BIT AS
BEGIN
 DECLARE @isPangrama BIT = 1
 DECLARE @alfabeto VARCHAR(26) = 'abcdefghijklmnopqrstuvwxyz'
 DECLARE @i INT = 1;
 DECLARE @letra CHAR(1) = ''

 WHILE @i < LEN(@word) AND @isPangrama = 1
 BEGIN
 SET @letra = SUBSTRING(@word, @i, 1)
  IF @letra <> ' ' AND CHARINDEX(@letra, @alfabeto) = 0
   SET @isPangrama = 0
  SET @i = @i + 1
 END

 RETURN @isPangrama
END
SELECT dbo.pangrama('abcdefghijklmnopqrstuvwxyz')
SELECT dbo.pangrama('abcdefghijklm nopqrstuvwxyz')
SELECT dbo.pangrama('The quick brown fox jumps over the lazy dog')
SELECT dbo.pangrama('Pack my box with five dozen liquor jugs')
SELECT dbo.pangrama('Sphinx of black quartz, judge my vow')
SELECT dbo.pangrama('Waltz, nymph, for quick jigs vex Bud')

SELECT 'arara'
SELECT REVERSE('arara')


CREATE FUNCTION dbo.REPLACE_A(
 @texto NVARCHAR(MAX),
 @search NVARCHAR(MAX),
 @replace NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 WHILE CHARINDEX(@search, @texto) <> 0
 BEGIN
  SET @texto = STUFF(@texto, CHARINDEX(@search, @texto), LEN(@search), @replace)
 END

 RETURN @texto

END

SELECT REPLACE('teste de replace com foda', 't', 'X')
SELECT dbo.REPLACE_A('teste de replace com foda', 't', 'X')

ALTER FUNCTION CHARINDEX_A(
 @search NVARCHAR(MAX),
 @texto NVARCHAR(MAX)
) RETURNS INT AS
BEGIN
 DECLARE @first CHAR(1) = LEFT(@search, 1);
 DECLARE @i INT = 1;
 DECLARE @letra CHAR(1) = ''

 WHILE @i < LEN(@texto)
 BEGIN
  SET @letra = SUBSTRING(@texto, @i, 1);

  IF (@letra = @first) AND (@search = SUBSTRING(@texto, @i, LEN(@search)))
  BEGIN
   RETURN @i
  END
  SET @i = @i + 1.
 END

 RETURN 0
END

SELECT CHARINDEX('ce','Tudo bem com voce, Maria?')
SELECT dbo.CHARINDEX_A('ce','Tudo bem com voce, Maria?')




ALTER FUNCTION STUFF_V22(
 @texto NVARCHAR(MAX),
 @inicio INT,
 @qtd INT,
 @replace NVARCHAR(MAX)
) RETURNS NVARCHAR(MAX) AS
BEGIN
 DECLARE @index INT = CHARINDEX(SUBSTRING(@texto, @inicio, @qtd),@texto) + @qtd;
 DECLARE @texto_stuff NVARCHAR(MAX) = ''

 IF @inicio = 1
  SET @texto_stuff = @replace + SUBSTRING(@texto, @index, LEN(@texto))
 ELSE
  SET @texto_stuff = SUBSTRING(@texto, 1, @inicio-1) + @replace + SUBSTRING(@texto, @index+1, LEN(@texto))
 
 RETURN @texto_stuff

END

SELECT STUFF('TESTE DE STUFF', 1, 8, '')
SELECT dbo.STUFF_V22('TESTE DE STUFF', 1, 8, '')

-- CHARINDEX, 
ALTER FUNCTION SUBSTRING_V22(
 @texto NVARCHAR(MAX),
 @inicio INT,
 @qtd INT
) RETURNS NVARCHAR(MAX) AS
BEGIN
 IF @inicio = 1
  SET @texto = STUFF(@texto, @inicio + @qtd, LEN(@texto), '')
 ELSE
  SET @texto = STUFF(STUFF(@texto, @inicio+@qtd+1,LEN(@texto), ''),1,@inicio-1,'')

 RETURN @texto
END

SELECT dbo.SUBSTRING_V22('teste de sub', 1,7)
SELECT SUBSTRING('teste de sub', 1,7)






















CREATE FUNCTION Num_dias
(
 @mes INT,
 @ano INT
) RETURNS INT AS
BEGIN
 DECLARE @date DATE = CONVERT(VARCHAR, 
  CAST(@ano AS VARCHAR) + '-' + RIGHT('00'+CAST(@mes AS VARCHAR), 2) + '-' + '01', 103)

 DECLARE @last DATE = EOMONTH(@date)

 RETURN CAST(DAY(@last) AS INT)
END

CREATE FUNCTION Dif_minutes (
 @hora1 TIME,
 @hora2 TIME
) RETURNS INT AS
BEGIN
 RETURN DATEDIFF(MINUTE, @hora1, @hora2)
END

SELECT dbo.Dif_minutes('01:40:00', '06:20:00')

ALTER FUNCTION Palavras_unicas(
 @frase NVARCHAR(MAX)
) RETURNS INT AS
BEGIN
 DECLARE @words TABLE(word VARCHAR(50));
 DECLARE @word VARCHAR(50)

 SET @frase = REPLACE(@frase, ',', '') + ' ';

 WHILE CHARINDEX(' ', @frase) <> 0
 BEGIN
  SET @word = SUBSTRING(@frase, 1, CHARINDEX(' ', @frase)-1)
  INSERT INTO @words (word) VALUES (@word)
  SET @frase = SUBSTRING(@frase, CHARINDEX(' ', @frase)+1, LEN(@frase))
 END

 RETURN (SELECT COUNT(DISTINCT word) FROM @words)
END

SELECT dbo.Palavras_unicas('Debaixo da pia tem um pinto, o pinto pia, a pia pinga') -- 9
SELECT dbo.Palavras_unicas('Se o papa papasse papa, Se o papa papasse pão, Se o papa tudo papasse, Seria um papa papão.') -- 9


ALTER FUNCTION Num_vogais(
 @frase NVARCHAR(MAX)
) RETURNS INT AS
BEGIN
 DECLARE @i INT = 1;
 DECLARE @count INT = 0;
 DECLARE @vogais VARCHAR(5) = 'aeiou'

 WHILE @i < LEN(@frase)
 BEGIN
  IF (CHARINDEX(SUBSTRING(@frase, @i, 1), @vogais) > 0)
   SET @count = @count + 1

  SET @i = @i + 1;
 END

 RETURN @count
END

SELECT dbo.Num_vogais('Olá, mundo!') -- 3
SELECT dbo.Num_vogais('SQL Server é incrível') -- 4
SELECT dbo.Num_vogais('abcdefghijklmnopqrstuvwxyz') -- 5