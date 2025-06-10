#22 - Top 10 alunos com maior presença por ano

WITH presenca AS (
  SELECT 
    id_aluno AS ID_Aluno,
    anoletivo AS Ano,
    ROUND(AVG(presenca), 2) AS Presenca
  FROM historico
  GROUP BY id_aluno, anoletivo
),
ranking AS (
  SELECT 
    p.Ano,
    a.nome_aluno AS Nome_Aluno,
    p.Presenca,
    ROW_NUMBER() OVER (PARTITION BY p.Ano ORDER BY p.Presenca DESC) AS posicao
  FROM presenca p
  INNER JOIN alunos a ON p.ID_Aluno = a.id_aluno
)
SELECT 
  Ano,
  Nome_Aluno,
  Presenca
FROM ranking
WHERE posicao <= 10
ORDER BY Ano, posicao;
