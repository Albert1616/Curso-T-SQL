-- TESTE DE FUNÇÕES

-- NumeroDias
SELECT dbo.NumeroDiasMes(2, 2023) -- 28
SELECT dbo.NumeroDiasMes(2, 2024) -- 29
SELECT dbo.NumeroDiasMes(3, 2024) -- 31
SELECT dbo.NumeroDiasMes(9, 2024) -- 30

-- DiferençaEntreHoras

SELECT dbo.fn_DiferencaEntreHoras('01:00:00', '02:00:00')
SELECT dbo.fn_DiferencaEntreHoras('01:40:00', '06:20:00')
SELECT CONVERT(TIME,'01:00:00')
SELECT DATEDIFF(MINUTE, '01:00:00','02:00:00')

-- ContarPalavrasUnicas
SELECT dbo.ContarPalavrasUnicas('Debaixo da pia tem um pinto, o pinto pia, a pia pinga')
SELECT dbo.ContarPalavrasUnicas('Se o papa papasse papa, Se o papa papasse pão, Se o papa tudo papasse, Seria um papa papão.')

---- ContarVogais
SELECT dbo.ContarVogais('Olá, mundo!') -- 3
SELECT dbo.ContarVogais('SQL Server é incrível') -- 4
SELECT dbo.ContarVogais('abcdefghijklmnopqrstuvwxyz') -- 5

-- RemoverCaracteresEspeciais
SELECT dbo.RemoverCaracteresEspeciais('O$%l&$á!, M#@un#$^d^!)_)o./') -- Olá Mundo
SELECT CHARINDEX('x', 'aeiou')


-- Fatorial

SELECT dbo.Fatorial(5)

-- Sequencia de Fibonacci

SELECT
	dbo.Fibonacci(0) as fib0 -- 0
	,dbo.Fibonacci(1) as fib1 -- 1
	,dbo.Fibonacci(2) as fib2 -- 1
	,dbo.Fibonacci(3) as fib3 -- 2
	,dbo.Fibonacci(4) as fib4 -- 3
	,dbo.Fibonacci(5) as fib5 -- 5
	,dbo.Fibonacci(6) as fib6 -- 8
	,dbo.Fibonacci(7) as fib7 -- 13
	,dbo.Fibonacci(8) as fib8 -- 21
	,dbo.Fibonacci(9) as fib9 -- 34
	,dbo.Fibonacci(10) as fib10 -- 55

SELECT dbo.SUB('abcasdfsdaf', 4,5)
SELECT SUBSTRING('abcasdfsdaf',4,5)

SELECT LEFT('5DSFASDFDSF45',7)
SELECT dbo.LEFTV2('5DSFASDFDSF45',7)

SELECT RIGHT('ASDFOJSADOIFJDSAOFJODSAFJOSDFNSDN', 4)
SELECT LEN('5DSFASDFDSF45')
SELECT dbo.RIGHTV2('ASDFOJSADOIFJDSAOFJODSAFJOSDFNSDN', 4)

SELECT LEFT('abc',0)

SELECT LEN('123465798')
SELECT dbo.LENV2('123465798')

SELECT STUFF('123465798',1,3,'A')
SELECT dbo.STUFFV2('123465798',1,3,'A')

SELECT REPLACE('123465798', '23', 'XX')
SELECT dbo.REPLACEV2('123465798','657', 'XX')

SELECT CHARINDEX('25', '1547825100')
SELECT dbo.CHARINDEXV2('25', '1547825100')
SELECT SUBSTRING('1547825100', 6, LEN('25'))

