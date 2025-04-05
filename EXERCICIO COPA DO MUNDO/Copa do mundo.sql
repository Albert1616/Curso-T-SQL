-- 1

CREATE TABLE Time(
 idTime INT IDENTITY(1,1),
 Nome VARCHAR(50) NOT NULL,

 PRIMARY KEY(idTime)
)

CREATE TABLE Jogador(
 idJogador INT IDENTITY(1,1),
 idTime INT NOT NULL,
 Nome VARCHAR(50),

 PRIMARY KEY(idJogador)
)

CREATE TABLE Jogo(
 idJogo INT IDENTITY(1,1),
 idTime1 INT NOT NULL,
 idTime2 INT NOT NULL,
 Placar1 INT NOT NULL,
 Placar2 INT NOT NULL,

 PRIMARY KEY(idJogo)
)

CREATE TABLE Participacao(
 idParticipacao INT IDENTITY(1,1),
 idJogo INT NOT NULL,
 idJogador INT NOT NULL,
 GolsMarcados INT NOT NULL,

 PRIMARY KEY(idParticipacao)
)

INSERT INTO Time (Nome) VALUES
('Brasil'),
('Croácia'),
('Austrália'),
('Japão')

INSERT INTO Jogo (idTime1, idTime2, Placar1, Placar2) VALUES
(1,2,1,0),
(3,4,3,1),
(2,4,1,1),
(1,3,1,1),
(4,1,1,3)

INSERT INTO Jogador (Nome, idTime) VALUES
('Kaka' ,1),
('Nakamura' ,4),
('Adriano' ,1),
('Kovac' ,2),
('Jonh' ,3),
('Wayne' ,3)


INSERT INTO Participacao (idJogo,idJogador, GolsMarcados) VALUES
(1,1,1),
(2,5,2),
(2,6,1),
(2,2,1),
(3,4,1),
(3,2,1),
(4,3,1)

-- 2

SELECT DISTINCT t.* FROM Time t 
INNER JOIN Jogo j ON j.idTime1 = t.idTime
WHERE j.Placar1 > j.Placar2
UNION
SELECT DISTINCT t.* FROM Time t 
INNER JOIN Jogo j ON j.idTime2 = t.idTime
WHERE j.Placar1 < j.Placar2

-- 3

SELECT t.Nome, SUM(t.[Gols pro]) AS 'Total de gols marcados', 
SUM(t.[Gols contra]) AS 'Total de gols sofridos', 
(SUM(t.[Gols pro]) - SUM(t.[Gols contra])) AS 'Saldo de gols' FROM(
SELECT DISTINCT t.Nome, SUM(j.Placar1) AS 'Gols pro', SUM(j.Placar2) AS 'Gols contra' FROM Time t 
INNER JOIN Jogo j ON j.idTime1 = t.idTime
GROUP BY t.Nome
UNION
SELECT DISTINCT t.Nome, SUM(j.Placar2), SUM(j.Placar1) FROM Time t 
INNER JOIN Jogo j ON j.idTime2 = t.idTime
GROUP BY t.Nome) t
GROUP BY t.Nome

-- 4

SELECT t.Nome, j.Nome, SUM(P.GolsMarcados) AS 'Gols marcados' FROM Time t
INNER JOIN Jogador j ON t.idTime = j.idTime
INNER JOIN Participacao p ON j.idJogador = p.idJogador
WHERE NOT EXISTS(
 SELECT j2.Nome, p2.GolsMarcados FROM Time t2
 INNER JOIN Jogador j2 ON t2.idTime = j2.idTime
 INNER JOIN Participacao p2 ON j2.idJogador = p2.idJogador
 WHERE t2.idTime = t.idTime AND p2.GolsMarcados > p.GolsMarcados
)
GROUP BY t.Nome, J.nome
ORDER BY t.Nome

-- 5

SELECT TOP 1 WITH TIES j.Nome, SUM(p.GolsMarcados) AS 'Gols marcados' FROM Jogador j
INNER JOIN Participacao p ON p.idJogador = j.idJogador
GROUP BY j.Nome
ORDER BY SUM(p.GolsMarcados) DESC

-- 6

SELECT t.Nome, SUM(t.Pontos) AS Pontos, SUM(t.[Gols pro]) AS 'Total de gols marcados', 
(SUM(t.[Gols pro]) - SUM(t.[Gols contra])) AS 'Saldo de gols' INTO #T1 FROM(
SELECT DISTINCT t.Nome,(
COUNT(
 CASE
  WHEN j.Placar1 > j.Placar2 THEN 1
 END
) * 3 + 
COUNT(
 CASE
  WHEN j.Placar1 = j.Placar2 THEN 1
 END
)) AS Pontos ,SUM(j.Placar1) AS 'Gols pro', SUM(j.Placar2) AS 'Gols contra' FROM Time t 
INNER JOIN Jogo j ON j.idTime1 = t.idTime
GROUP BY t.Nome
UNION
SELECT DISTINCT t.Nome, (
COUNT(
 CASE
  WHEN j.Placar2 > j.Placar1 THEN 1
 END
) * 3 + 
COUNT(
 CASE
  WHEN j.Placar2 = j.Placar1 THEN 1
 END
)) AS Pontos , SUM(j.Placar2), SUM(j.Placar1) FROM Time t 
INNER JOIN Jogo j ON j.idTime2 = t.idTime
GROUP BY t.Nome
) t
GROUP BY t.Nome

SELECT * FROM #T1
ORDER BY Pontos DESC, [Saldo de gols] DESC, [Total de gols marcados] DESC






-- 2

SELECT DISTINCT t.* FROM Time t
INNER JOIN Jogo j1 ON j1.idTime1 = t.idTime
INNER JOIN Jogo j2 ON j2.idTime2 = t.idTime
WHERE j1.Placar1 > j1.Placar2 OR j2.Placar2 > j2.Placar1

-- 3

SELECT t.Nome,
(
 SELECT SUM(j.Placar1) FROM Jogo j WHERE j.idTime1 = t.idTime
) + 
(
 SELECT SUM(j.Placar2) FROM Jogo j WHERE j.idTime2 = t.idTime
)AS 'GolsPro',
(
 SELECT SUM(j.Placar2) FROM Jogo j WHERE j.idTime1 = t.idTime
) + 
(
 SELECT SUM(j.Placar1) FROM Jogo j WHERE j.idTime2 = t.idTime
)AS 'GolsContra'
FROM Time t
INNER JOIN Jogo j1 ON j1.idTime1 = t.idTime
INNER JOIN Jogo j2 ON j2.idTime2 = t.idTime
GROUP BY t.idTime,t.Nome

SELECT DISTINCT
(
 CASE
  WHEN j.Placar1 > j.Placar2 THEN t1.Nome
  WHEN j.Placar2 >= j.Placar1 THEN t2.Nome
 END
),
SUM(
 CASE
  WHEN j.Placar1 > j.Placar2 THEN j.Placar1
  WHEN j.Placar2 >= j.Placar1 THEN j.Placar2
 END
) FROM Jogo j
INNER JOIN Time t1 ON t1.idTime = j.idTime1
INNER JOIN Time t2 ON t2.idTime = j.idTime2
GROUP BY (
 CASE
  WHEN j.Placar1 > j.Placar2 THEN t1.Nome
  WHEN j.Placar2 > j.Placar1 THEN t2.Nome
 END
)

SELECT t.Nome, SUM(t.[Gols pro]), SUM(t.[Gols contra]) FROM(
SELECT t.Nome, SUM(j.Placar1) AS 'Gols pro', SUM(j.Placar2) AS 'Gols contra' FROM Time t
INNER JOIN Jogo j ON j.idTime1 = t.idTime
GROUP BY t.Nome
UNION
SELECT t.Nome, SUM(j.Placar2), SUM(j.Placar1) FROM Time t
INNER JOIN Jogo j ON j.idTime2 = t.idTime
GROUP BY t.Nome
) t
GROUP BY t.Nome

DECLARE @Resultados TABLE(
 Nome VARCHAR(50),
 GolsPro INT,
 GolsContra INT
)

INSERT INTO @Resultados (Nome, GolsPro, GolsContra)
SELECT t.Nome, SUM(j.Placar1) AS GolsPro, SUM(j.Placar2) AS GolsContra FROM Time t
INNER JOIN Jogo J ON j.idTime1 = t.idTime
GROUP BY t.Nome

INSERT INTO @Resultados (Nome, GolsPro, GolsContra)
SELECT t.Nome, SUM(j.Placar2) AS GolsPro, SUM(j.Placar1) AS GolsContra FROM Time t
INNER JOIN Jogo J ON j.idTime2 = t.idTime
GROUP BY t.Nome

SELECT r.Nome, SUM(r.GolsPro), SUM(r.GolsContra) FROM @Resultados r
GROUP BY r.Nome

-- 4
SELECT r.* FROM(
SELECT j.Nome,t.Nome, SUM(p.GolsMarcados) as gols FROM Time t
INNER JOIN Jogador J ON j.idTime = t.idTime
INNER JOIN Participacao p ON p.idJogador = j.idJogador
GROUP BY t.Nome,j.Nome) r
WHERE NOT EXISTS(
 SELECT j1.Nome FROM Time t1
 INNER JOIN Jogador J1 ON j1.idTime = t1.idTime
 INNER JOIN Participacao p1 ON p1.idJogador = j1.idJogador
 WHERE  = t1.idTime
 GROUP BY j1.Nome
 HAVING SUM(p1.GolsMarcados) > r.gols
)

DECLARE @T1 TABLE(
 id VARCHAR(50),
 Time VARCHAR(50),
 Gols INT
)

INSERT INTO @T1 (id, Time, Gols)
SELECT j.idJogador,t.Nome, SUM(p.GolsMarcados) FROM Time t
INNER JOIN Jogador J ON j.idTime = t.idTime
INNER JOIN Participacao p ON p.idJogador = j.idJogador
GROUP BY t.Nome,j.idJogador
SELECT DISTINCT Time,id, MAX(Gols) FROM @T1 GROUP BY Time, id

SELECT t.Nome,j.Nome as jogador, SUM(p.GolsMarcados) AS Gols INTO #T5 FROM Time t
INNER JOIN Jogador J ON j.idTime = t.idTime
INNER JOIN Participacao p ON p.idJogador = j.idJogador
GROUP BY t.Nome, j.Nome

SELECT t.Nome,j.Nome as jogador, SUM(p.GolsMarcados) AS Gols FROM Time t
INNER JOIN Jogador J ON j.idTime = t.idTime
INNER JOIN Participacao p ON p.idJogador = j.idJogador
GROUP BY t.Nome, j.Nome
HAVING SUM(p.GolsMarcados) = (SELECT MAX(Gols) FROM #T5 WHERE Nome = t.Nome GROUP BY Nome)


-- 6

DECLARE @Resultados TABLE(
 Nome VARCHAR(50),
 Pontos INT,
 GolsPro INT,
 GolsContra INT
)

INSERT INTO @Resultados (Nome, Pontos, GolsPro, GolsContra)
SELECT t.Nome, SUM(
 CASE
  WHEN j.Placar1 > j.Placar2 THEN 3
  WHEN j.Placar2 = j.Placar1 THEN 1
  ELSE 0
 END
) AS Pontos,
SUM(j.Placar1) AS GolsPro, SUM(j.Placar2) AS GolsContra FROM Time t
INNER JOIN Jogo J ON j.idTime1 = t.idTime
GROUP BY t.Nome

INSERT INTO @Resultados (Nome,Pontos, GolsPro, GolsContra)
SELECT t.Nome,SUM(
 CASE
  WHEN j.Placar2 > j.Placar1 THEN 3
  WHEN j.Placar1 = j.Placar2 THEN 1
  ELSE 0
 END
) AS Pontos,
SUM(j.Placar2) AS GolsPro, SUM(j.Placar1) AS GolsContra FROM Time t
INNER JOIN Jogo J ON j.idTime2 = t.idTime
GROUP BY t.Nome

SELECT r.Nome,SUM(r.Pontos), SUM(r.GolsPro), SUM(r.GolsPro) - SUM(r.GolsContra) AS Saldo FROM @Resultados r
GROUP BY r.Nome