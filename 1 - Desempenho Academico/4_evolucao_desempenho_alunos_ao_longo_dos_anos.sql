#4 - Evolução do desempenho dos alunos ao longo dos anos (por aluno)

SELECT a.nome_aluno AS 'Nome do(a) Aluno(a)',
	   t.nome_turma AS 'Nome da Turma',
       h.anoletivo AS 'Ano Letivo',
       ROUND(AVG(h.nota_final), 2) AS 'Média Anual'
  FROM historico h
 INNER JOIN alunos a ON h.id_aluno = a.id_aluno
 INNER JOIN turmas t ON h.id_turma = t.id_turma
 WHERE h.id_aluno = 123
 GROUP BY a.nome_aluno, t.nome_turma, h.anoletivo
 ORDER BY h.anoletivo, t.nome_turma