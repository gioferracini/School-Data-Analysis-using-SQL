#3 - Média de notas por disciplina e série

SELECT t.nome_turma AS 'Nome da Turma',
	   d.nome_disciplina AS 'Nome da Disciplina',
       ROUND(AVG(h.nota_final), 2) AS 'Média Geral (2007 a 2024)'
  FROM historico h
 INNER JOIN turmas t ON h.id_turma = t.id_turma
 INNER JOIN disciplina d ON h.id_disciplina = d.id_disciplina
 GROUP BY t.nome_turma, d.nome_disciplina