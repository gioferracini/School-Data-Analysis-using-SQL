#19 - Relação entre série, idade média dos alunos e ano letivo

SELECT 
    t.anoletivo AS 'Ano Letivo',
    t.nome_turma AS 'Nome da Turma',
    ROUND(AVG(YEAR(CONCAT(t.anoletivo, '-12-31')) - YEAR(a.data_nasc_aluno)), 1) AS 'Idade Média'
  FROM historico h
INNER JOIN alunos a ON h.id_aluno = a.id_aluno
INNER JOIN turmas t ON h.id_turma = t.id_turma
GROUP BY t.anoletivo, t.id_turma, t.nome_turma
ORDER BY t.anoletivo, t.nome_turma
