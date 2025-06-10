#7 - Média de idade na matrícula por ano

SELECT YEAR(data_matricula) AS 'Ano Matrícula',
	   ROUND(AVG(idade_aluno), 2) AS 'Média de Idade'
  FROM alunos
 GROUP BY YEAR(data_matricula)
 ORDER BY YEAR(data_matricula) ASC