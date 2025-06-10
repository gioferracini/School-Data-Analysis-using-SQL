#11 - Professores que ministram mais de uma disciplina

SELECT p.nome_prof AS 'Nome Prof.',
	   COUNT(pd.id_PD) AS 'Total Matérias'
  FROM professor p
 INNER JOIN professor_disciplina pd ON p.id_professor = pd.id_professor
 INNER JOIN disciplina d ON pd.id_disciplina = d.id_disciplina
 GROUP BY p.nome_prof
 HAVING COUNT(pd.id_PD) > 1
 ORDER BY COUNT(pd.id_PD) DESC