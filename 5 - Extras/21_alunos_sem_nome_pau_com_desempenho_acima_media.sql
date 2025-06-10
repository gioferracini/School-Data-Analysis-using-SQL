#21 - Alunos com nome de pai ausente e desempenho acima da média

WITH media_por_aluno AS (
    SELECT id_aluno,
           ROUND(AVG(nota_final), 2) AS media_individual
      FROM historico
     GROUP BY id_aluno
),
media_geral AS (
    SELECT ROUND(AVG(media_individual), 2) AS media_geral
      FROM media_por_aluno
)
SELECT a.id_aluno AS ID_Aluno,
       a.nome_aluno AS Nome_Aluno,
       mpa.media_individual AS Media_Final
  FROM media_por_aluno mpa
 INNER JOIN alunos a ON mpa.id_aluno = a.id_aluno
 CROSS JOIN media_geral mg
 WHERE a.nome_pai = ''
   AND mpa.media_individual >= mg.media_geral
 ORDER BY Media_Final DESC;
