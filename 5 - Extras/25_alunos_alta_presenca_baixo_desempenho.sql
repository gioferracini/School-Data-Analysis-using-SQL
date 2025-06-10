#25 - Alunos com alta presença, mas baixo desempenho
 
WITH media AS (SELECT id_aluno AS ID_Aluno,
	   ROUND(AVG(nota_final), 2) AS Media_Final
  FROM historico
 GROUP BY ID_Aluno
),
presenca AS (SELECT id_aluno AS ID_Aluno,
	ROUND(AVG(presenca), 2) AS Presenca
    FROM historico
    GROUP BY ID_Aluno
)
SELECT a.nome_aluno AS Nome_Aluno,
	   ROUND(AVG(m.Media_Final), 2) AS Media_Final,
       ROUND(AVG(p.Presenca), 2) AS Presenca
  FROM historico h
 INNER JOIN media m ON h.id_aluno = m.ID_Aluno
 INNER JOIN presenca p ON h.id_aluno = p.ID_Aluno
 INNER JOIN alunos a ON h.id_aluno = a.id_aluno
 WHERE m.Media_Final < 6
   AND p.Presenca >= 80
 GROUP BY a.nome_aluno
 ORDER BY Media_Final ASC