#17 - Turnos mais lotados (manhã/tarde) por ano

SELECT DISTINCT
    h.anoletivo AS 'Ano Letivo',
    t.turno AS 'Turno',
    COUNT(DISTINCT h.id_aluno) AS 'Qtde. Alunos'
  FROM turmas t
 INNER JOIN historico h ON t.id_turma = h.id_turma
 GROUP BY h.anoletivo, t.turno