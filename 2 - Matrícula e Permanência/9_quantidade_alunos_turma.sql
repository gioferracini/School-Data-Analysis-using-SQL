#9 - Quantidade de alunos por turma

SELECT DISTINCT 
	   t.nome_turma AS 'Nome da Turma',
	   t.anoletivo AS 'Ano Letivo',
	   COUNT(DISTINCT h.id_aluno) AS 'Quantidade'
  FROM turmas t
 INNER JOIN historico h ON t.id_turma = h.id_turma
 GROUP BY t.nome_turma, t.anoletivo
 ORDER BY t.anoletivo