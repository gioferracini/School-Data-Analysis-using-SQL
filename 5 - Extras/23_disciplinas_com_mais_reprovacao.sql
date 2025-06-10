#23 - Ranking de disciplinas com maior número de reprovações

WITH reprovados AS (SELECT id_disciplina AS ID_Disciplina,
	   COUNT(status) AS Contagem
  FROM historico
 WHERE status = 'Reprovado'
 GROUP BY id_disciplina
),
total AS (
	SELECT id_disciplina AS ID_Disciplina,
	   COUNT(status) AS Contagem
  FROM historico 
 GROUP BY id_disciplina
)
SELECT d.nome_disciplina AS Disciplina,
	  ROUND((SUM(r.Contagem) / SUM(t.Contagem)) * 100, 2) AS Percentual
  FROM disciplina d
 INNER JOIN reprovados r ON d.id_disciplina = r.ID_Disciplina
 INNER JOIN total t ON d.id_disciplina = t.ID_Disciplina
 GROUP BY Disciplina
 ORDER BY Percentual DESC