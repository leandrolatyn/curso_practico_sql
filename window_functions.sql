-- Genera particiones por carrera_id y retorna el promedio para cada partición
SELECT  *,
		AVG(colegiatura) OVER (PARTITION BY carrera_id)
FROM platzi.alumnos;

-- Genera particiones por carrera_id y retorna la suma por colegiatura para cada partición
SELECT  *,
		SUM(colegiatura) OVER (PARTITION BY carrera_id ORDER BY colegiatura)
FROM platzi.alumnos;

-- Realiza un ranking de colegiaturas, filtrando las menores a 3
SELECT *
FROM (
	SELECT *,
	RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank	
	FROM platzi.alumnos
) AS ranked_colegiaturas_por_carrera
WHERE brand_rank < 3	
ORDER BY brand_rank;
		