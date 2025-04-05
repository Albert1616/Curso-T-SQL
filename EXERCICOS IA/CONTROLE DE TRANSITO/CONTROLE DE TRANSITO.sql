-- Tabela de Usu�rios
CREATE TABLE Usuarios (
    idUsuario INT IDENTITY(1,1) PRIMARY KEY,
    NomeUsuario VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DataCadastro DATE NOT NULL
);

DROP TABLE Livros
-- Tabela de Livros
CREATE TABLE Livros (
    idLivro INT IDENTITY(1,1) PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Autor VARCHAR(100) NOT NULL,
    AnoPublicacao INT NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    QuantidadeDisponivel INT NOT NULL
);

-- Tabela de Empr�stimos
CREATE TABLE Emprestimos (
    idEmprestimo INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT NOT NULL,
    idLivro INT NOT NULL,
    DataEmprestimo DATE NOT NULL,
    DataDevolucaoPrevista DATE NOT NULL,
    DataDevolucaoReal DATE NULL,
    StatusEmprestimo VARCHAR(20) NOT NULL, -- (Ativo, Devolvido, Atrasado)
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro)
);

-- Tabela de Multas
CREATE TABLE Multas (
    idMulta INT IDENTITY(1,1) PRIMARY KEY,
    idEmprestimo INT NOT NULL,
    ValorMulta MONEY NOT NULL,
    StatusMulta VARCHAR(20) NOT NULL, -- (Pendente, Paga)
    FOREIGN KEY (idEmprestimo) REFERENCES Emprestimos(idEmprestimo)
);

-- Tabela de Avalia��es de Livros
CREATE TABLE AvaliacoesLivros (
    idAvaliacao INT IDENTITY(1,1) PRIMARY KEY,
    idLivro INT NOT NULL,
    idUsuario INT NOT NULL,
    Nota INT NOT NULL, -- (1 a 5)
    Comentario TEXT NULL,
    DataAvaliacao DATE NOT NULL,
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro),
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario)
);

-- Tabela de Reservas
CREATE TABLE Reservas (
    idReserva INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT NOT NULL,
    idLivro INT NOT NULL,
    DataReserva DATE NOT NULL,
    StatusReserva VARCHAR(20) NOT NULL, -- (Ativa, Cancelada, Conclu�da)
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario),
    FOREIGN KEY (idLivro) REFERENCES Livros(idLivro)
);

/*

1. Consultas Recursivas
1. Listar todos os livros emprestados por um usu�rio espec�fico, incluindo os livros emprestados por 
usu�rios que compartilham o mesmo e-mail (dom�nio) e que se cadastraram no mesmo m�s. */
DROP TABLE #T1
SELECT e.idUsuario, u.DataCadastro, u.Email, e.idEmprestimo, e.idLivro, e.DataEmprestimo INTO #T1 FROM Usuarios u
INNER JOIN Emprestimos e ON e.idUsuario = u.idUsuario
INNER JOIN Livros l ON l.idLivro = e.idLivro
WHERE u.idUsuario = 1

INSERT INTO #T1(idUsuario, DataCadastro, Email, idEmprestimo, idLivro, DataEmprestimo)
SELECT e.idUsuario, u.DataCadastro, u.Email, e.idEmprestimo, e.idLivro, e.DataEmprestimo FROM Usuarios u
INNER JOIN #T1 t ON MONTH(t.DataCadastro) = MONTH(u.DataCadastro)
INNER JOIN Emprestimos e ON e.idUsuario = u.idUsuario
INNER JOIN Livros l ON l.idLivro = e.idLivro
WHERE SUBSTRING(u.Email, CHARINDEX('@', u.Email)-1, LEN(u.Email)) = 
SUBSTRING(t.Email, CHARINDEX('@', t.Email)-1, LEN(t.Email))

SELECT DISTINCT * FROM #T1


/*


2. Fun��es de Janela (Window Functions)
Listar os 3 livros mais populares de cada categoria, com base no n�mero de empr�stimos no �ltimo ano.*/
SELECT t.* FROM(
SELECT l.Categoria,l.Titulo,
RANK() OVER(
PARTITION BY l.Categoria
ORDER BY COUNT(e.idEmprestimo) DESC) AS Rank FROM Livros l 
INNER JOIN Emprestimos e ON e.idLivro = l.idLivro
WHERE YEAR(e.DataEmprestimo) = YEAR(DATEADD(YEAR, -1, GETDATE()))
GROUP BY l.Categoria,l.Titulo) t
WHERE t.Rank <= 3
/*

Dica: Use ROW_NUMBER() ou RANK().

4. Calcular a m�dia m�vel de empr�stimos por m�s nos �ltimos 12 meses.

Dica: Use AVG() com OVER(). */

SELECT MONTH(e.DataEmprestimo), COUNT(e.idEmprestimo) FROM Emprestimos e 
WHERE (MONTH(e.DataEmprestimo) >= MONTH(GETDATE()) AND YEAR(e.DataEmprestimo) < YEAR(GETDATE())) OR
(MONTH(e.DataEmprestimo) <= MONTH(GETDATE()) AND YEAR(e.DataEmprestimo) = YEAR(GETDATE()))
GROUP BY MONTH(e.DataEmprestimo)



/*

3. Manipula��o de JSON
Criar uma consulta que retorne os livros em formato JSON, incluindo t�tulo, autor e avalia��o m�dia.

Dica: Use FOR JSON PATH. */

SELECT Titulo, Autor, AVG(a.Nota) AS AvaliacaoMedia FROM Livros 
INNER JOIN AvaliacoesLivros a ON a.idLivro = Livros.idLivro
GROUP BY Titulo, Autor
FOR JSON PATH

/*

Atualizar a tabela de livros para incluir uma coluna JSON com informa��es adicionais (ex: editora, ISBN).

Dica: Use ALTER TABLE e JSON_VALUE.

4. Transa��es e Concorr�ncia
Implementar uma transa��o que realize o empr�stimo de um livro, 
atualize a quantidade dispon�vel e crie uma reserva caso o livro n�o esteja dispon�vel. */

BEGIN TRANSACTION
DECLARE @qtd INT = (SELECT QuantidadeDisponivel FROM Livros WHERE idLivro = 1)

IF @qtd = 0
 INSERT INTO Reservas (idLivro, idUsuario, DataReserva, StatusReserva) VALUES
 (1,1,GETDATE(),'Ativa')
ELSE
BEGIN
 INSERT INTO Emprestimos (idLivro, idUsuario, DataEmprestimo, DataDevolucaoPrevista, DataDevolucaoReal,StatusEmprestimo)
 VALUES (1,1,GETDATE(), DATEADD(MONTH, 3, GETDATE()), DATEADD(MONTH, 2, GETDATE()), 'Ativo')

 UPDATE Livros SET QuantidadeDisponivel = QuantidadeDisponivel - 1
 WHERE idLivro = 1
END


COMMIT TRANSACTION

/*

Dica: Use BEGIN TRANSACTION, COMMIT e ROLLBACK.

Criar uma consulta que detecte deadlocks em transa��es concorrentes.

Dica: Use sys.dm_tran_locks.

5. Gatilhos (Triggers) Avan�ados
5. Implementar um gatilho que calcule automaticamente o valor da multa quando um livro � devolvido com atraso.

Dica: Use AFTER UPDATE e c�lculos de datas. */

CREATE TRIGGER Multa ON Emprestimos
FOR INSERT, UPDATE AS
BEGIN
 SELECT i.idEmprestimo,u.idUsuario, l.idLivro, 
 FORMAT(DATEDIFF(DAY, i.DataDevolucaoPrevista, i.DataDevolucaoReal) * 2, 'C', 'pt-br') AS Multa
 FROM inserted i
 INNER JOIN Livros l ON l.idLivro = i.idLivro
 INNER JOIN Usuarios u ON u.idUsuario = i.idUsuario
 WHERE DATEDIFF(DAY, i.DataDevolucaoPrevista, i.DataDevolucaoReal) > 0
END

/*

6. Criar um gatilho que impe�a a exclus�o de um livro se ele tiver avalia��es ou empr�stimos ativos.

Dica: Use RAISERROR ou THROW. */

CREATE TRIGGER VerifyDelete ON Livros
FOR DELETE AS
BEGIN

 DECLARE @idLivro INT = (SELECT idLivro FROM DELETED);
 DECLARE @emprestimos INT;
 DECLARE @reservas INT;

 SELECT @emprestimos = COUNT(DISTINCT e.idEmprestimo),
 @reservas = COUNT(DISTINCT r.idReserva) FROM Livros l
 INNER JOIN Emprestimos e ON e.idLivro = l.idLivro
 INNER JOIN Reservas r ON r.idLivro = l.idLivro
 WHERE l.idLivro = @idLivro AND e.StatusEmprestimo = 'Ativo' AND r.StatusReserva = 'Ativa'
 GROUP BY l.Titulo

 IF @emprestimos > 0 OR @reservas > 0
  RAISERROR('O livro n�o pode ser deletado pois possue emprestimos ou resevas ativas',16,1)
END

/*

6. Consultas Complexas com Subconsultas
Listar os usu�rios que pegaram emprestado pelo menos um livro de cada categoria.

Dica: Use GROUP BY e HAVING.*/

SELECT u.NomeUsuario FROM Usuarios u
INNER JOIN Emprestimos e ON e.idUsuario = u.idUsuario
INNER JOIN Livros l ON l.idLivro = e.idLivro
GROUP BY u.NomeUsuario
HAVING COUNT(DISTINCT l.Categoria) = (SELECT COUNT(DISTINCT Categoria) FROM Livros)

/*

Listar os livros que nunca foram emprestados, mas t�m pelo menos 3 reservas ativas.

Dica: Use NOT EXISTS e COUNT. */

SELECT l.Titulo FROM Livros l 
INNER JOIN Reservas r ON r.idLivro = l.idLivro
WHERE NOT EXISTS(
 SELECT idEmprestimo FROM Emprestimos
 WHERE idLivro = l.idLivro
)
GROUP BY l.Titulo
HAVING COUNT(DISTINCT r.idReserva) >= 3

/*

7. An�lise de Dados
Criar uma consulta que retorne o tempo m�dio de devolu��o por categoria de livro.

Dica: Use DATEDIFF e agrega��es. */

SELECT l.Categoria, 
AVG(DATEDIFF(DAY, e.DataEmprestimo, e.DataDevolucaoReal)) AS TempoMedioDevolucao FROM Livros l 
INNER JOIN Emprestimos e ON e.idLivro = l.idLivro
GROUP BY l.Categoria

/*

8. Listar os usu�rios que t�m mais de 5 empr�stimos ativos e uma m�dia de atraso superior a 7 dias.

Dica: Use subconsultas e fun��es de agrega��o. */

SELECT u.idUsuario, u.NomeUsuario FROM Usuarios u 
INNER JOIN Emprestimos e ON e.idUsuario = u.idUsuario
GROUP BY u.idUsuario, u.NomeUsuario
HAVING COUNT(
CASE
 WHEN e.StatusEmprestimo = 'Ativo' THEN 1
 ELSE 0
END
) > 5 AND
AVG(DATEDIFF(DAY, e.dataEmprestimo, e.DataDevolucaoReal)) > 7

/*

8. Stored Procedures Complexas
Criar uma Stored Procedure que receba um intervalo de datas e retorne o n�mero de empr�stimos, 
reservas e multas por usu�rio.

Dica: Use agrega��es e GROUP BY. */

CREATE PROCEDURE RelatorioUser(
 @dataInicio DATETIME,
 @dataFim DATETIME
) AS BEGIN

 SELECT u.NomeUsuario, COUNT(DISTINCT e.idEmprestimo) AS Emprestimos,
 COUNT(DISTINCT r.idReserva) AS Reservas, 
 COUNT(DISTINCT m.idMulta) FROM Usuarios u
 INNER JOIN Emprestimos e ON e.idUsuario = u.idUsuario
 INNER JOIN Reservas r ON r.idUsuario =u.idUsuario
 INNER JOIN Multas m ON m.idEmprestimo = e.idEmprestimo
 WHERE e.DataEmprestimo BETWEEN @dataInicio AND @dataFim AND
 r.DataReserva BETWEEN @dataInicio AND @dataFim
 GROUP BY u.NomeUsuario

END

/*

9. Implementar uma Stored Procedure que atualize o status de todos os empr�stimos atrasados e 
calcule as multas correspondentes. 

Dica: Use UPDATE e c�lculos de datas. */

CREATE PROCEDURE UpdateStatus AS
BEGIN
 
 UPDATE Emprestimos SET StatusEmprestimo = 'Atrasado'
 WHERE DATEDIFF(DAY, DataDevolucaoPrevista, DataDevolucaoReal) > 0

 SELECT e.idEmprestimo, 
 FORMAT(DATEDIFF(DAY, e.DataDevolucaoPrevista, e.DataDevolucaoReal) * 2, 'C', 'pt-br') AS Multa
 FROM Emprestimos e
 WHERE DATEDIFF(DAY, e.DataDevolucaoPrevista, e.DataDevolucaoReal) > 0
END