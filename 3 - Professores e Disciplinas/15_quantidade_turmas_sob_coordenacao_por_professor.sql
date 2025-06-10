#15 - Quantidade de turmas sob coordenação de cada professor

SELECT p.nome_prof AS 'Nome Prof.',
	   COUNT(id_turma) AS 'Qtde. Coordenações'
  FROM professor p
 INNER JOIN turmas t ON p.id_professor = t.id_coordenador
 GROUP BY p.nome_prof
 ORDER BY COUNT(id_turma) DESC