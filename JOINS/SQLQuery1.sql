SELECT a.Nome, c.Descricao
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
ORDER BY c.Descricao, a.Nome


SELECT a.idAluno, a.Nome, n.Nota, c.Descricao
FROM Aluno a
INNER JOIN Nota n ON n.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = n.idCurso
WHERE c.Descricao = 'Matemática'
ORDER BY n.Nota DESC

SELECT a.*, m.idMatricula
FROM Aluno a
LEFT JOIN Matricula m ON a.idAluno = m.idAluno
WHERE m.idMatricula IS NULL

SELECT idAluno,Nome,(
CASE Nacionalidade
WHEN 'Brasil' THEN 'Brasileiro'
ELSE 'Estrangeiro'
END) Nacionalidade
FROM Aluno

SELECT * FROM
(SELECT a.Nome, c.Descricao, n.Nota,
(CASE
WHEN n.Nota >= 7 THEN 'Aprovado'
WHEN n.Nota < 7 AND n.Nota >= 5 THEN 'Recuperação'
ELSE 'Reprovado'
END) Situacao
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno 
INNER JOIN Curso c ON c.idCurso = m.idCurso
INNER JOIN Nota n ON n.idAluno = m.idAluno AND n.idAluno = m.idCurso
) dados
WHERE Situacao = 'Aprovado'

SELECT *,
(CASE
WHEN Media >= 7 THEN 'Aprovado'
WHEN Media < 7 AND Media >= 5 THEN 'Recuperação'
ELSE 'Reprovado'
END) Situacao
FROM 
(
SELECT a.Nome, c.Descricao, AVG(n.Nota) AS Media
FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno 
INNER JOIN Curso c ON c.idCurso = m.idCurso
INNER JOIN Nota n ON n.idAluno = m.idAluno AND n.idAluno = m.idCurso
GROUP BY a.Nome, c.Descricao ) AS dados

SELECT a.Nome, c.Descricao FROM Aluno a
INNER JOIN Matricula m ON a.idAluno = m.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
WHERE c.Descricao COLLATE Latin1_General_CI_AI = 'Matematica' OR c.Descricao COLLATE Latin1_General_CI_AI =  'Literatura' 

SELECT Nome FROM Aluno a
WHERE EXISTS (
 SELECT * FROM Matricula m
 WHERE a.idAluno = m.idAluno
)

SELECT Nome FROM Aluno a
WHERE NOT EXISTS(
 SELECT * FROM Matricula m
 WHERE a.idAluno = m.idAluno
)

SELECT * FROM
(
SELECT a.Nome, (
 SELECT m.DataMatricula FROM Matricula m
 WHERE m.idAluno = a.idAluno AND m.idCurso = (SELECT idCurso FROM Curso c
 WHERE c.Descricao = 'Matemática')
) AS Data_mat
FROM Aluno a
) dados
WHERE Data_mat IS NOT NULL

SELECT a.Nome, m.DataMatricula FROM Aluno a
INNER JOIN Matricula m ON m.idAluno = a.idAluno
INNER JOIN Curso c ON c.idCurso = m.idCurso
WHERE c.Descricao = 'Matemática'

SELECT *,
(CASE
 WHEN EXISTS(
  SELECT m.idMatricula FROM Matricula m
  WHERE m.idAluno = a.idAluno AND m.idCurso = 1
 ) THEN 'Sim'
 ELSE 'Não'
END) AS MatriculadosEmMatematica,
(CASE
 WHEN EXISTS(
  SELECT m.idMatricula FROM Matricula m
  WHERE m.idAluno = a.idAluno AND m.idCurso = (SELECT idCurso FROM Curso WHERE Descricao = 'Física')
 ) THEN 'Sim'
 ELSE 'Não'
END) AS MatriculadosEmFisica
FROM Aluno a

SELECT 