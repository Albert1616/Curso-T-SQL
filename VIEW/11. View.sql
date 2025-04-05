CREATE VIEW [dbo].[vw_Matricula] AS 
SELECT
	a.idAluno,
	a.Nome,
	a.Endereco,
	a.Complemento,
	a.Bairro,
	a.Nacionalidade,
	m.idMatricula,
	m.DataMatricula,
	c.idCurso,
	c.Descricao AS Curso,
	n.idNota,
	n.Nota,
	 CASE
        WHEN n.Nota < 5 THEN 'Reprovado'
        WHEN n.Nota >= 7 THEN 'Aprovado'
        WHEN n.Nota < 7 AND n.Nota >= 5 THEN 'Recuperação'
    END AS Situacao
FROM Esc_Matricula m
INNER JOIN Esc_Aluno a ON a.idAluno = m.idAluno
INNER JOIN Esc_Curso c ON c.idCurso = m.idCurso
LEFT JOIN Esc_Nota n ON n.idAluno = n.idAluno AND n.idCurso = m.idCurso




SELECT *
FROM vw_Matricula
WHERE idAluno = 3

SELECT COUNT(*)
FROM vw_Matricula
WHERE Nome LIKE '%Maria%'

SELECT MIN(Nota)
FROM vw_Matricula

SELECT AVG(Nota)
FROM vw_Matricula
WHERE Curso = 'Matemática'

SELECT *
FROM vw_Matricula
WHERE Nota IS NULL

SELECT Situacao, COUNT(DISTINCT idMatricula) AS Quantidade
FROM vw_Matricula
WHERE Situacao IS NOT NULL
GROUP BY Situacao



