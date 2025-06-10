#5 - Análise de presença x aprovação (correlação entre faltas e reprovação)

WITH reprovado_por_falta AS (SELECT COUNT(id_historico) AS Contagem_Reprovados_Falta
  FROM historico
 WHERE presenca < 75
   AND nota_final >= 6
 ),
reprovado_por_nota AS (SELECT COUNT(id_historico) AS Contagem_Reprovados_Nota
  FROM historico
 WHERE nota_final < 6
 ),
aprovados AS (SELECT COUNT(id_historico) AS Contagem_Aprovados
  FROM historico
 WHERE status = 'Aprovado'
 ),  
total AS (SELECT COUNT(id_historico) AS Contagem_Total
  FROM historico
 )
SELECT DISTINCT
	ROUND(rpf.Contagem_Reprovados_Falta / t.Contagem_Total * 100, 2) AS 'Reprovados por Falta',
    ROUND(rpn.Contagem_Reprovados_Nota / t.Contagem_Total * 100, 2) AS 'Reprovados por Nota',
    ROUND(a.Contagem_Aprovados / t.Contagem_Total * 100, 2) AS 'Aprovados'
  FROM historico h
 CROSS JOIN reprovado_por_falta rpf
 CROSS JOIN reprovado_por_nota rpn
 CROSS JOIN aprovados a 
 CROSS JOIN total t