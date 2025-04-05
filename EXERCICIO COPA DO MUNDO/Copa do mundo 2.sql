-- TIME
CREATE TABLE Time(
 idTime INT PRIMARY KEY,
 Nome VARCHAR(50) NOT NULL
)

-- JOGADOR
CREATE TABLE Jogador(
 idJogador INT PRIMARY KEY,
 idTime INT NOT NULL,
 Nome VARCHAR(50) NOT NULL
)

-- Jogo
CREATE TABLE Jogo(
 idJogo INT PRIMARY KEY,
 idTime1 INT NOT NULL,
 idTime2 INT NOT NULL,
 Placar1 INT NOT NULL,
 Placar2 INT NOT NULL
)

-- Participacao
CREATE TABLE Participacao(
 idParticipacao INT PRIMARY KEY,
 idJogo INT NOT NULL,
 idJogador INT NOT NULL,
 GolsMarcados INT NOT NULL
)

-- 2

SELECT t1.* FROM Time t1
INNER JOIN Jogo j1 ON j1.idTime1 = t1.idTime
WHERE j1.Placar1 > j1.Placar2
UNION
SELECT t1.* FROM Time t1
INNER JOIN Jogo j1 ON j1.idTime2 = t1.idTime
WHERE j1.Placar2 > j1.Placar1

-- ALTERNATIVA
SELECT DISTINCT t.* FROM Time t
INNER JOIN Jogo j1 ON j1.idTime1 = t.idTime
INNER JOIN Jogo j2 ON j2.idTime2 = t.idTime
WHERE j1.Placar1 > j1.Placar2 OR j2.Placar2 > j2.Placar1

-- 3

DECLARE @t1 TABLE (
 Nome VARCHAR(50),
 GolsPro INT,
 GolsContra INT
)

INSERT INTO @t1 (Nome, GolsPro, GolsContra) 
SELECT t.Nome, SUM(j.Placar1), SUM(j.Placar2) FROM Time t
INNER JOIN Jogo j ON j.idTime1 = t.idTime
GROUP BY t.Nome

INSERT INTO @t1 (Nome, GolsPro, GolsContra) 
SELECT t.Nome, SUM(j.Placar2), SUM(j.Placar1) FROM Time t
INNER JOIN Jogo j ON j.idTime2 = t.idTime
GROUP BY t.Nome

SELECT t.Nome, SUM(t.GolsPro) AS GolsMarcados, 
SUM(t.GolsContra) AS GolsSofridos,SUM(t.GolsPro) - SUM(t.GolsContra) AS Saldo FROM @t1 t
GROUP BY t.Nome

--4 

SELECT t.Nome AS Time, j.Nome AS Jogador, SUM(p.GolsMarcados) AS Gols FROM Time t
INNER JOIN Jogador j ON j.idTime = t.idTime
INNER JOIN Participacao p ON p.idJogador = j.idJogador
GROUP BY t.idTime,t.Nome,j.Nome
HAVING NOT EXISTS(
 SELECT j1.idJogador FROM Time t1
 INNER JOIN Jogador j1 ON j1.idTime = t1.idTime
 INNER JOIN Participacao p1 ON p1.idJogador = j1.idJogador
 WHERE t1.idTime = t.idTime
 GROUP BY j1.idJogador
 HAVING SUM(p1.GolsMarcados) > SUM(p.GolsMarcados)
)

-- 5

SELECT TOP 1 WITH TIES j.Nome FROM Jogador j
INNER JOIN Participacao p ON p.idJogador = j.idJogador
GROUP BY j.Nome
ORDER BY SUM(p.GolsMarcados) DESC

-- 6

DECLARE @t2 TABLE (
 Nome VARCHAR(50),
 GolsPro INT,
 GolsContra INT,
 Pontos INT
)

INSERT INTO @t2 (Nome, GolsPro,GolsContra, Pontos) 
SELECT t.Nome, SUM(j.Placar1), SUM(j.Placar2), SUM(
 CASE
  WHEN j.Placar1 > j.Placar2 THEN 3
  WHEN j.Placar1 = j.Placar2 THEN 1
  ELSE 0
 END
) FROM Time t
INNER JOIN Jogo j ON j.idTime1 = t.idTime
GROUP BY t.Nome

INSERT INTO @t2 (Nome, GolsPro,GolsContra, Pontos) 
SELECT t.Nome, SUM(j.Placar2), SUM(j.Placar1), 
SUM(
 CASE
  WHEN j.Placar2 > j.Placar1 THEN 3
  WHEN j.Placar1 = j.Placar2 THEN 1
  ELSE 0
 END
) FROM Time t
INNER JOIN Jogo j ON j.idTime2 = t.idTime
GROUP BY t.Nome

SELECT t.Nome, SUM(t.Pontos) AS Pontos, SUM(t.GolsPro) AS GolsMarcados, 
SUM(t.GolsPro) - SUM(t.GolsContra) AS Saldo FROM @t2 t
GROUP BY t.Nome
ORDER BY Pontos DESC, Saldo DESC, GolsMarcados DESC