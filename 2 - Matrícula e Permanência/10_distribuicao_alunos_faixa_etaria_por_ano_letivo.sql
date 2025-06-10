#10 - Distribuição de alunos por faixa etária por ano letivo

SELECT
	   base.anoletivo,
	   base.faixa_etaria,
	   SUM(CASE WHEN base.sexo_aluno = 'M' THEN 1 ELSE 0 END) AS 'Masculino',
       SUM(CASE WHEN base.sexo_aluno = 'F' THEN 1 ELSE 0 END) AS 'Feminino',
       COUNT(*) AS 'Total Alunos(as)'
  FROM (
	SELECT h.anoletivo,
	CASE 
		WHEN a.idade_aluno <= 6 THEN 'Menos de 6 Anos'
        WHEN a.idade_aluno = 7 THEN '7 Anos'
        WHEN a.idade_aluno = 8 THEN '8 Anos'
        WHEN a.idade_aluno = 9 THEN '9 Anos'
        WHEN a.idade_aluno = 10 THEN '10 Anos'
        WHEN a.idade_aluno = 11 THEN '11 Anos'
        WHEN a.idade_aluno = 12 THEN '12 Anos'
        WHEN a.idade_aluno = 13 THEN '13 Anos'
        WHEN a.idade_aluno = 14 THEN '14 Anos'
        WHEN a.idade_aluno = 15 THEN '15 Anos'
        WHEN a.idade_aluno = 16 THEN '16 Anos'
        WHEN a.idade_aluno = 17 THEN '17 Anos'
        ELSE 'Acima de 18 Anos'
        END AS faixa_etaria,
        a.sexo_aluno
 FROM alunos a
 INNER JOIN historico h ON a.id_aluno = h.id_aluno   
 WHERE data_termino IS NULL
  ) AS base
  GROUP BY h.anoletivo, faixa_etaria
  ORDER BY h.anoletivo, faixa_etaria ASC