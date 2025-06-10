#14 - Distribuição de professores por faixa etária e sexo

SELECT 
	   faixa_etaria AS 'Faixa Etária', 
	   SUM(CASE WHEN sexo_prof = 'M' THEN 1 ELSE 0 END) AS 'Masculino',
       SUM(CASE WHEN sexo_prof = 'F' THEN 1 ELSE 0 END) AS 'Feminino',
       COUNT(*) AS 'Total Professores'
  FROM (
	SELECT CASE 
	WHEN idade_prof BETWEEN 19 AND 23 THEN '19 a 23 anos'
	WHEN idade_prof BETWEEN 24 AND 28 THEN '24 a 28 anos'
	WHEN idade_prof BETWEEN 29 AND 33 THEN '29 a 33 anos'
	WHEN idade_prof BETWEEN 34 AND 38 THEN '34 a 38 anos'
	WHEN idade_prof BETWEEN 39 AND 43 THEN '39 a 43 anos'
	WHEN idade_prof BETWEEN 44 AND 48 THEN '44 a 48 anos'
	WHEN idade_prof BETWEEN 49 AND 53 THEN '49 a 53 anos'
	WHEN idade_prof BETWEEN 54 AND 58 THEN '54 a 58 anos'
	ELSE 'Acima de 59 anos'
	END AS faixa_etaria,
    sexo_prof
 FROM professor
 WHERE status_prof = 'Ativo'
  ) AS base
  GROUP BY faixa_etaria 
  ORDER BY faixa_etaria