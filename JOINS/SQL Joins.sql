CREATE TABLE TabelaA (
	id INT,
	Nome VARCHAR(50)
)

CREATE TABLE TabelaB (
	id INT,
	Nome VARCHAR(50)
)

INSERT INTO TabelaA (id, Nome) VALUES (1, 'João')
INSERT INTO TabelaA (id, Nome) VALUES (2, 'Maria')
INSERT INTO TabelaA (id, Nome) VALUES (3, 'Pedro')
INSERT INTO TabelaA (id, Nome) VALUES (4, 'Ana')

INSERT INTO TabelaB (id, Nome) VALUES (3, 'Pedro')
INSERT INTO TabelaB (id, Nome) VALUES (4, 'Ana')
INSERT INTO TabelaB (id, Nome) VALUES (5, 'Carlos')
INSERT INTO TabelaB (id, Nome) VALUES (6, 'Sofia')

-- UNION
SELECT * FROM TabelaA
UNION
SELECT * FROM TabelaB

-- UNION ALL
SELECT * FROM TabelaA
UNION ALL
SELECT * FROM TabelaB

-- INTERSECT
SELECT * FROM TabelaA
INTERSECT
SELECT * FROM TabelaB

-- EXCEPT A e B
SELECT * FROM TabelaA
EXCEPT
SELECT * FROM TabelaB

-- EXCEPT B e A
SELECT * FROM TabelaB
EXCEPT
SELECT * FROM TabelaA

-- SELF JOIN
SELECT *
FROM TabelaA a1
INNER JOIN TabelaA a2 ON a1.id = a2.id

-- INNER JOIN
SELECT *
FROM TabelaA
INNER JOIN TabelaB ON TabelaA.id = TabelaB.id

-- LEFT JOIN
SELECT *
FROM TabelaA
LEFT JOIN TabelaB ON TabelaA.id = TabelaB.id

-- LEFT JOIN EXCLUSIVO
SELECT *
FROM TabelaA
LEFT JOIN TabelaB ON TabelaA.id = TabelaB.ID
WHERE TabelaB.id IS NULL

SELECT *
FROM TabelaB
RIGHT JOIN TabelaA ON TabelaA.id = TabelaB.ID
WHERE TabelaB.id IS NULL

-- RIGHT JOIN
SELECT *
FROM TabelaA
RIGHT JOIN TabelaB ON TabelaA.id = TabelaB.id

-- RIGHT JOIN EXCLUSIVO
SELECT *
FROM TabelaA
RIGHT JOIN TabelaB ON TabelaA.id = TabelaB.id
WHERE TabelaA.id IS NULL

-- FULL OUTER JOIN
SELECT *
FROM TabelaA
FULL OUTER JOIN TabelaB ON TabelaA.id = TabelaB.id

-- FULL OUTER JOIN EXCLUSIVO
SELECT *
FROM TabelaA
FULL OUTER JOIN TabelaB ON TabelaA.ID = TabelaB.ID
WHERE TabelaA.ID IS NULL OR TabelaB.ID IS NULL

-- CROSS JOIN
SELECT *
FROM TabelaA
CROSS JOIN TabelaB



