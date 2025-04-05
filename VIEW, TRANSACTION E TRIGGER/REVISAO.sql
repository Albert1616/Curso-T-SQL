/*
 VIEW - SERVE PARA ARMAZENAR O RESULTADO DE UMA CONSULTA EM UMA TABELA VIRTUAL
 ESTRUTURA:

 CREATE VIEW Nome da view AS TABELA 

*/

CREATE VIEW view_pessoa AS
SELECT c.* FROM Emp_Colaboradores c
INNER JOIN Emp_Departamentos d ON c.idDepartamento = d.idDepartamento
EXCEPT
SELECT c2.* FROM Emp_Colaboradores c2
INNER JOIN Emp_Departamentos d2 ON c2.idDepartamento = d2.idDepartamento
WHERE d2.idColaboradorDiretor =
(SELECT idColaborador FROM Emp_Colaboradores 
WHERE Nome = 'Ant�nio Xavier')

INSERT INTO view_pessoa(idColaborador, idDepartamento, Matricula, Nome,
Endereco, Cidade, Estado,Sexo, Salario)
SELECT top 1 * FROM Pessoa ORDER BY Nome

/*
 DBCC CHECKIDENT (nome_tabela, RESEED, 0)
*/

/*
 TRANSATION - EXECUTA OPERA��ES NAS TABELAS, QUE APENAS SAO CONFIRMADAS SE NAO HOUVER ERRO 
 EM NENHUMA DELAS

 BEGIN TRAN - INICIAR TRANSA��O
 COMMIT TRAN - SALVAR ALTERA��ES
 ROWBACK - REVERS�O DE TODAS AS ALTERA��ES


 sp_who2 - VER PROCESSOS EM EXECU��O
*/


BEGIN TRANSACTION

UPDATE Pessoa SET Nome = 'Editado'
WHERE idPessoa = 67

COMMIT TRAN


sp_who2

/*

TRIGGERS - GATILHOS QUE SAO DISPARADOS ATRAVES DE A�OES QUE SAO REALIZADAS NAS TABELAS

*/

CREATE TRIGGER nome_trigger ON nome_tabela
FOR INSERT,DELETE,UPDATE -- GATILHO
AS
BEGIN
 
END