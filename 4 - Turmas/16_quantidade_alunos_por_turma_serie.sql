#16 - Quantidade de alunos por turma/série

SELECT DISTINCT
	t.nome_turma AS 'Nome Turma',
    t.anoletivo AS 'Ano Letivo',
    COUNT(DISTINCT h.id_aluno) AS 'Qtde. Alunos'
  FROM turmas t
 INNER JOIN historico h ON t.id_turma = h.id_turma
 GROUP BY t.nome_turma, t.anoletivo