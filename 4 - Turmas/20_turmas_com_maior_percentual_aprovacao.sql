#20 - Turmas com maior percentual de aprovação

WITH aprovado AS (SELECT t.id_turma AS ID,
	   t.nome_turma AS Nome,
       COUNT(h.status) AS Aprovados
  FROM historico h
 INNER JOIN turmas t ON h.id_turma = t.id_turma
 WHERE h.status = 'Aprovado'
 GROUP BY t.id_turma, t.nome_turma
 ),
total AS (SELECT t.id_turma AS ID,
	   t.nome_turma AS Nome,
       COUNT(h.status) AS Total
  FROM historico h
 INNER JOIN turmas t ON h.id_turma = t.id_turma
 GROUP BY t.id_turma, t.nome_turma
 )
 SELECT t.id_turma AS 'ID',
		t.nome_turma AS 'Nome Turma',
	ROUND((SUM(a.Aprovados) / SUM(tt.Total)) * 100 , 2) AS Taxa_Aprovados
   FROM historico h
 INNER JOIN turmas t ON h.id_turma = t.id_turma
 INNER JOIN aprovado a ON a.ID = h.id_turma
 INNER JOIN total tt ON tt.ID = h.id_turma
 GROUP BY t.id_turma, t.nome_turma
 ORDER BY Taxa_Aprovados DESC