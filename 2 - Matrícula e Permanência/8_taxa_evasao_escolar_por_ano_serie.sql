#8 - Taxa de evasão escolar por ano/série

WITH matricula AS (
	SELECT YEAR(data_matricula) AS AnoLetivo,
	   COUNT(*) AS Matricula
  FROM alunos 
 GROUP BY YEAR(data_matricula)
),
termino AS (
	SELECT YEAR(data_termino) AS AnoLetivo,
		COUNT(*) AS Termino
  FROM alunos 
 WHERE data_termino IS NOT NULL
 GROUP BY YEAR(data_termino)
)
SELECT m.AnoLetivo,
	   m.Matricula,
       t.Termino,
	   ROUND((t.Termino / m.Matricula) * 100, 2) AS 'Taxa de Evasão'
  FROM matricula m
 INNER JOIN termino t ON m.AnoLetivo = t.AnoLetivo
 ORDER BY m.AnoLetivo ASC
