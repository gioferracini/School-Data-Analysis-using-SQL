#24 - Bairros com maior taxa de aprovação

WITH aprovados AS (SELECT id_aluno AS ID_Aluno,
	   COUNT(status) AS Contagem
  FROM historico
 WHERE status = 'Aprovado'
GROUP BY id_aluno
),
total AS (SELECT id_aluno AS ID_Aluno,
	   COUNT(status) AS Contagem
  FROM historico
GROUP BY id_aluno
)
SELECT a.bairro_aluno AS Bairro,
	  ROUND((SUM(ap.Contagem) / SUM(t.Contagem)) * 100, 2) AS Percentual
  FROM historico h
 INNER JOIN alunos a ON h.id_aluno = a.id_aluno
 INNER JOIN aprovados ap ON h.id_aluno = ap.ID_Aluno
 INNER JOIN total t ON h.id_aluno = t.ID_Aluno
 GROUP BY a.bairro_aluno
 ORDER BY Percentual DESC