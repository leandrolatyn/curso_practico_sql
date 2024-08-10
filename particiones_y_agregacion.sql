-- Sobre la tabla del FROM asigna row_number
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos;

-- Ordena la tabla por fecha de incorporación y a eso le aplica row_number
SELECT ROW_NUMBER() OVER(ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- PARTITION crea particiones de la tabla del FROM agrupando en base a una condición
-- Luego a esas particiones se les puede aplicar otras funciones como FIRST_VALUE o LAST_VALUE
SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS primera_colegiatura, *
FROM platzi.alumnos;

SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id) AS primera_colegiatura, *
FROM platzi.alumnos;

-- NTH es como FIRST o LAST solo que busca el N elemento, en el ejemplo es el elemento 3
SELECT NTH_VALUE(colegiatura, 3) OVER(PARTITION BY carrera_id) AS primera_colegiatura, *
FROM platzi.alumnos;

-- RANK nos dice el lugar que ocupa de acuerdo a un orden, pero genera gaps o saltos
-- Para los casos donde hay mas de un elemento en un puesto del rank
SELECT  *,
		RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

-- DENSE_RANK no genera los gaps
SELECT  *,
		DENSE_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

-- PERCET_RANK ranquea a traves de porcentajes a partir de una formula (rank -1) / (total_rows -1)
SELECT  *,
		PERCENT_RANK() OVER(PARTITION BY carrera_id ORDER BY colegiatura DESC) AS colegiatura_rank
FROM platzi.alumnos
ORDER BY carrera_id, colegiatura_rank;

