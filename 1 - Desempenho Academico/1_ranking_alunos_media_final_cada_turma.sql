#1 - Ranking de alunos por média final em cada turma

WITH medias AS (
  SELECT 
    h.id_aluno,
    a.nome_aluno,
    t.nome_turma,
    ROUND(AVG(h.nota_final), 2) AS media_final
  FROM historico h
  INNER JOIN alunos a ON h.id_aluno = a.id_aluno
  INNER JOIN turmas t ON h.id_turma = t.id_turma
  GROUP BY h.id_aluno, a.nome_aluno, t.nome_turma
),
ranking AS (
  SELECT *,
         RANK() OVER (PARTITION BY nome_turma ORDER BY media_final DESC) AS posicao
    FROM medias
)
SELECT *
  FROM ranking
 WHERE posicao <= 5
 ORDER BY nome_turma, posicao;
