-------------------------------------------------
-- Curso T-sql - Log Tecnologia e Sistemas
-- Objetivo: Uso de Triggers
-------------------------------------------------

-- é disparado quando determinado evento acontece

USE [dbCurso]

INSERT INTO Pessoa (CPF, Nome)
VALUES ('11122233311', 'José Oliveira')

----------------------------------------------------------
CREATE TRIGGER tg_Pessoa_ins ON Pessoa
FOR INSERT
AS
BEGIN 
	SELECT * 
	FROM INSERTED -- armazena os registros da operacao corrente, armazena os registros inseridos
END

INSERT INTO Pessoa (CPF, Nome)
VALUES ('12345678909', 'Pedro Oliveira')

----------------------------------------------------------

ALTER TRIGGER tg_Pessoa_Ins ON Pessoa
FOR INSERT
AS
BEGIN 
	IF (
		SELECT COUNT(*) -- verifica se o CPF ja esta cadastrado
		FROM Pessoa p
		INNER JOIN INSERTED i ON i.CPF = p.CPF
	) > 1
	BEGIN
		RAISERROR ('CPF Já cadastrado', 16, 1) -- apresenta erro caso sim
   		ROLLBACK TRANSACTION
	END
END

INSERT INTO Pessoa (CPF, Nome)
VALUES ('12345678909', 'Pedro Oliveira')

SELECT * FROM Pessoa

----------------------------------------------------------

CREATE TRIGGER tg_Pessoa_Upd ON Pessoa
FOR UPDATE
AS
BEGIN 
	SELECT 'Antigo', * FROM DELETED
	UNION
	SELECT 'Novo', * FROM INSERTED
END

CREATE TRIGGER delete_pessoa_t ON Pessoa
FOR DELETE
AS BEGIN
 SELECT * FROM DELETED
END

DELETE FROM Pessoa

UPDATE Pessoa SET 
	Nome = 'Pedro Oliveira Silva'
WHERE cpf = '12345678909'

----------------------------------------------------------
CREATE TRIGGER tg_Pessoa_Del ON Pessoa
FOR DELETE
AS
BEGIN
    SELECT 'registro a ser apagado ', *
    FROM deleted
END

DELETE Pessoa
WHERE CPF = '12345678909'

----------------------------------------------------------



