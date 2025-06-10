#6 - Número de matrículas por ano letivo

SELECT YEAR(data_matricula) AS 'Ano Letivo',
	   COUNT(*) AS 'Qtde. Matrículas'
  FROM alunos 
 GROUP BY YEAR(data_matricula)
 ORDER BY YEAR(data_matricula) ASC