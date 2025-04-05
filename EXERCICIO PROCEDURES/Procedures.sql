use [LogCurso]

-- INSERT

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'p' AND name = 'Insert_Pessoa')
DROP PROCEDURE Insert_Pessoa
GO

CREATE PROCEDURE Insert_Pessoa(
	@Nome VARCHAR(30),
	@DataNascimento DATE,
	@Telefone VARCHAR(20),
	@CPF VARCHAR(11),
	@Renda MONEY
)
AS
BEGIN
	DECLARE @Especials_caracteres VARCHAR(8) = '()- ';
	DECLARE @Telefone_format VARCHAR(20) = '';
	DECLARE @i INT = 1;
	DECLARE @tam INT = LEN(@Telefone)
	DECLARE @word VARCHAR(1) = ''

	WHILE @i <= @tam
	BEGIN
		SET @word =	SUBSTRING(@Telefone, @i, 1)
		IF CHARINDEX(@word, @Especials_caracteres) = 0
		 SET @Telefone_format = @Telefone_format + @word
		SET @i = @i + 1;
	END
	INSERT INTO Pessoa VALUES (@Nome, @DataNascimento, @Telefone_format, @CPF, @Renda);
	SELECT 'Pessoa Inserida com sucesso!' AS Mensagem,* FROM Pessoa ORDER BY idPessoa DESC
END
GO
EXEC Insert_Pessoa
   @Nome = 'Ana Maria',
   @DataNascimento = '2010-03-15',
   @Telefone = '(84) 9 9123-5478',
   @CPF = '12345678909',
   @Renda = 2057.00

-- END

-- SELECT

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'Select_Pessoa_By')
CREATE PROCEDURE Select_Pessoa_By
(
	@Nome VARCHAR(80)
)
AS
BEGIN
 SELECT * FROM Pessoa WHERE Nome = @Nome
END

EXEC Select_Pessoa_By
   @Nome = 'Ana Maria'

-- END

-- UPDATE

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'p' AND name = 'Update_Pessoa')
DROP PROCEDURE Update_Pessoa
GO

CREATE PROCEDURE Update_Pessoa(
	@idPessoa INT,
	@Nome VARCHAR(30),
	@DataNascimento DATE,
	@Telefone VARCHAR(20),
	@CPF VARCHAR(11),
	@Renda MONEY
)
AS
BEGIN
	DECLARE @Especials_caracteres VARCHAR(8) = '()- ';
	DECLARE @Telefone_format VARCHAR(20) = '';
	DECLARE @i INT = 1;
	DECLARE @tam INT = LEN(@Telefone)
	DECLARE @word VARCHAR(1) = ''

	WHILE @i <= @tam
	BEGIN
		SET @word =	SUBSTRING(@Telefone, @i, 1)
		IF CHARINDEX(@word, @Especials_caracteres) = 0
		 SET @Telefone_format = @Telefone_format + @word
		SET @i = @i + 1;
	END
	UPDATE Pessoa
	SET Nome = @Nome, DataNascimento = @DataNascimento, CPF = @CPF, Telefone = @Telefone_format,
	Renda = @Renda
	WHERE idPessoa = @idPessoa

	EXEC Select_Pessoa_By @Nome = @Nome
END

EXEC Select_Pessoa_By @Nome = 'Ana Maria'

EXEC Update_Pessoa
   @idPessoa = 1,
   @Nome = 'pessoa ATUALIZADA',
   @DataNascimento = '2010-03-15',
   @Telefone = '(84) 9 9123-5478',
   @CPF = '12345678909',
   @Renda = 3300.00

-- END

-- DELETE
CREATE PROCEDURE Delete_Pessoa
(
 @idPessoa INT
) AS
BEGIN
 DELETE FROM Pessoa WHERE idPessoa = @idPessoa
 SELECT 'Pessoa Deletada com sucesso!'
END

EXEC Delete_Pessoa
   @IdPessoa = 1

SELECT * FROM Pessoa

-- END

