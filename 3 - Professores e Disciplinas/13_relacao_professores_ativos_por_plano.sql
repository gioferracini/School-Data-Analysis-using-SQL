#13 - Relação de professores ativos por turno

SELECT t.turno AS 'Turno',
       COUNT(DISTINCT pd.id_professor) AS 'Qtde. Professores'
  FROM (
        SELECT DISTINCT h.id_disciplina, h.id_turma
          FROM historico h
       ) AS hd
 INNER JOIN professor_disciplina pd ON hd.id_disciplina = pd.id_disciplina
 INNER JOIN turmas t ON hd.id_turma = t.id_turma
 GROUP BY t.turno;
