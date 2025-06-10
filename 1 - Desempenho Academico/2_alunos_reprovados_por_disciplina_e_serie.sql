#2 - Alunos reprovados por disciplina e por série

SELECT t.nome_turma AS 'Nome Turma',
	   d.nome_disciplina AS 'Nome Disciplina',
       COUNT(DISTINCT h.id_aluno) AS Contagem
  FROM historico h
 INNER JOIN alunos a ON h.id_aluno = a.id_aluno
 INNER JOIN disciplina d ON h.id_disciplina = d.id_disciplina
 INNER JOIN turmas t ON h.id_turma = t.id_turma
 WHERE h.status = 'Reprovado'
 GROUP BY t.nome_turma, d.nome_disciplina
 ORDER BY t.nome_turma