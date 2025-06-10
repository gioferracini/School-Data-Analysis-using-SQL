#18 - Comparativo de desempenho médio entre turmas A, B e C da mesma série

SELECT 
    t.anoletivo AS 'Ano Letivo',
    RIGHT(t.nome_turma, 1) AS 'Turma',
    ROUND(AVG(h.nota_final), 2) AS 'Média Notas'
  FROM historico h
 INNER JOIN turmas t ON h.id_turma = t.id_turma
WHERE RIGHT(t.nome_turma, 1) IN ('A', 'B', 'C')
GROUP BY t.anoletivo, RIGHT(t.nome_turma, 1)
ORDER BY t.anoletivo, Turma
