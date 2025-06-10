#12 - Carga horária total por professor (Considerando disciplinas)

SELECT p.nome_prof AS 'Nome Prof.',
	   SUM(d.carga_horaria) AS 'Total Carga Horária'
  FROM professor p
 INNER JOIN professor_disciplina pd ON p.id_professor = pd.id_professor
 INNER JOIN disciplina d ON pd.id_disciplina = d.id_disciplina
 GROUP BY p.nome_prof
 ORDER BY SUM(d.carga_horaria) DESC