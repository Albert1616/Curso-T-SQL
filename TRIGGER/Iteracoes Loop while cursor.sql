--------------------------------------------------------
-- Gerar 10 registros
--------------------------------------------------------
DECLARE @i INT = 1

WHILE @i <= 10
BEGIN
	PRINT 'Registro número ' + CONVERT(VARCHAR, @i)
	SET @i = @i + 1
END


--------------------------------------------------------
-- Gerar 50 registros numa tabela
--------------------------------------------------------
DECLARE @T TABLE (
	Numero INT,
	Descricao VARCHAR (50)
)

DECLARE @i INT = 1

WHILE @i <= 50
BEGIN
    INSERT INTO @T VALUES (@i, 'Registro' + CONVERT(VARCHAR, @i))
    SET @i += 1
END

SELECT *
FROM @T


--------------------------------------------------------
-- Contagem regressiva
--------------------------------------------------------
DECLARE @i SMALLINT = 10

WHILE @i > 0
BEGIN
	PRINT @i
	SET @i = @i - 1
END


--------------------------------------------------------
-- Par / Impar
--------------------------------------------------------
DECLARE
	@n TINYINT = 10,
	@i TINYINT = 1

WHILE @i <= @n
BEGIN
	SELECT
		@i AS 'Número',
		CASE
			WHEN (@i % 2) = 1
			THEN 'ÍMPAR'
		ELSE 'PAR'
	END AS Tipo

	SET @i = @i + 1
END

--------------------------------------------------------
-- Gerar 3 números aleatórios
--------------------------------------------------------
DECLARE @i SMALLINT = 3

WHILE @i > 0
BEGIN
	PRINT CONVERT(INT, RAND() * 10)
	SET @i = @i - 1
END


--------------------------------------------------------
-- Soma dos primeiros n números usando WHILE
--------------------------------------------------------
DECLARE
	@soma INT = 0,
	@n SMALLINT = 5,
	@i SMALLINT = 1

WHILE @i <= @n
BEGIN
	SET @soma = @soma + @i
	SET @i = @i + 1
END

SELECT @soma

--------------------------------------------------------
-- Gerar senha aleatória
--------------------------------------------------------
DECLARE
	@caracteres VARCHAR(36) = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
	@senha VARCHAR(10) = '',
	@i INT = 1

WHILE @i <= 8
BEGIN
	SET @senha = @senha + SUBSTRING(@caracteres, (CONVERT(INT, RAND() * 100) % LEN(@caracteres)) + 1, 1)
	SET @i = @i + 1
END

SELECT @senha


/*******************************************************
    EXERCÍCIO - Árvore de asterisco de n andares
*******************************************************

1  *
2 ***

1   *
2  ***
3 *****

1    *
2   ***
3  *****
4 *******

1     *
2    ***
3   *****
4  *******
5 *********
*/

--------------------------------------------------------
-- Cursor Pessoa
--------------------------------------------------------

DECLARE @idPessoa INT, @Nome VARCHAR(80)

-- Definição do cursor para percorrer os registros da tabela
DECLARE cursorPessoa CURSOR FAST_FORWARD FOR
SELECT idPessoa, Nome FROM Pessoa

-- Abertura do cursor
OPEN cursorPessoa

-- Busca do primeiro registro
FETCH NEXT FROM cursorPessoa
INTO @idPessoa, @Nome

-- Loop para percorrer os registros e imprimir os nomes
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Listar o id e o nome
    SELECT @idPessoa AS idPessoa, @Nome AS Nome

    -- Buscar o próximo registro
    FETCH NEXT FROM cursorPessoa
	INTO @idPessoa, @Nome
END

-- Fechar o cursor
CLOSE cursorPessoa

-- Desalocar o cursor
DEALLOCATE cursorPessoa


--------------------------------------------------------
-- WHILE Pessoa
--------------------------------------------------------

DECLARE @idPessoa INT, @Nome VARCHAR(80)

-- Definição do cursor para percorrer os registros da tabela
SELECT @idPessoa = MIN(idPessoa)
FROM Pessoa

-- Loop para percorrer os registros e imprimir os nomes
WHILE @idPessoa IS NOT NULL
BEGIN
    -- Listar o id e o nome
    SELECT @idPessoa = idPessoa, @Nome = Nome
	FROM Pessoa
	WHERE idPessoa = @idPessoa

	SELECT @idPessoa AS idPessoa, @Nome AS Nome

	SELECT @idPessoa = MIN(idPessoa)
	FROM Pessoa
	WHERE idPessoa > @idPessoa
END


----------------------------------------
-------- Cursor 01
----------------------------------------

DECLARE
	@sql VARCHAR(800),
	@ano INT

SET @ano = '2015'
SELECT @sql = 'SELECT Nome, Cpf into ##T FROM Pessoa WHERE YEAR(DataNascimento) = ' + '''' + CONVERT(VARCHAR,@ano) + '''' + ' order by idPessoa'
EXEC(@sql)

DECLARE mycursor CURSOR FOR 
SELECT * FROM ##T

DECLARE @nome VARCHAR(80), @cpf CHAR(11)

OPEN mycursor
FETCH NEXT FROM mycursor
INTO @nome, @cpf

WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT CONCAT(@cpf, ',', @nome)

	FETCH NEXT FROM mycursor
	INTO @nome, @cpf
END

CLOSE mycursor
DEALLOCATE mycursor

-- DROP TABLE ##T
GO


----------------------------------------
-------- Cursor 02
----------------------------------------

-- Receberá o resutlado
CREATE TABLE #res (
	Linha VARCHAR(200)
) 

-- Tabela massa de teste
CREATE TABLE #tab (
	Nome VARCHAR(20),
	Data DATETIME,
	Valor INT
)

INSERT INTO #tab (Nome,  Data, Valor) VALUES ('Marcos', '2024-01-01', 100)
INSERT INTO #tab (Nome,  Data, Valor) VALUES ('Marcos', '2024-02-02', 135)
INSERT INTO #tab (Nome,  Data, Valor) VALUES ('Carlos', '2024-02-01', 75)
INSERT INTO #tab (Nome,  Data, Valor) VALUES ('Carlos', '2024-01-02', 35)

-- Resultado Esperado
-- nome + loop[data valor]
-- Marcos 01/01/2024 100 02/02/2024 135
-- Carlos 01/01/2024 75 02/02/2024 35

DECLARE
	@nome VARCHAR(20),
	@nome_antes VARCHAR(20),
	@data DATETIME,
	@valor INT,
	@var VARCHAR(500)

DECLARE mycursor CURSOR FOR 
SELECT *
FROM #tab
ORDER BY Nome, Data

OPEN mycursor
FETCH NEXT FROM mycursor
INTO @nome, @data, @valor 

SELECT @nome_antes = @nome
SELECT @var = ''

WHILE @@FETCH_STATUS = 0
BEGIN
	IF @nome = @nome_antes
	BEGIN
		SET @var = @var + ' ' + CONVERT(VARCHAR(12), @data, 103) + ' ' + CONVERT(VARCHAR(10), @valor)
	END
	ELSE
	BEGIN
		INSERT INTO #res (linha) VALUES (@nome_antes + ' ' + @var)

		SELECT @var = ''
		SELECT @nome_antes = @nome
		SET @var =  @var + ' ' + CONVERT(VARCHAR(12), @data, 103) + ' ' + CONVERT(VARCHAR(10),@valor)
   	END

	FETCH NEXT FROM mycursor
	INTO @nome, @data, @valor 
END

SELECT @var = @nome_antes + ' ' + @var 

INSERT INTO #res (linha) VALUES (@var)

CLOSE mycursor
DEALLOCATE mycursor

SELECT *
FROM #res

-- DELETE #res
-- DROP TABLE #res
-- DROP TABLE #tab



