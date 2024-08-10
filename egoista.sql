-- Retorna los alumnos con su respectivo tutor
SELECT  CONCAT(a.nombre, ' ', a.apellido) AS almno,
		CONCAT(t.nombre, ' ' , t.apellido) AS tutor
FROM platzi.alumnos AS a
INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id;

-- Retorna un top 10 de los tutores con mas cantidad de alumnos
SELECT  CONCAT(t.nombre, ' ' , t.apellido) AS tutor,
		COUNT(*) AS alumnos_por_tutor
FROM platzi.alumnos AS a
INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
GROUP BY tutor
ORDER BY alumnos_por_tutor DESC
LIMIT 10;

-- Promedio general de alumnos por tutor
SELECT AVG(alumnos_por_tutor) AS promedio_alumnos_por_tutor
FROM(
	SELECT  CONCAT(t.nombre, ' ' , t.apellido) AS tutor,
			COUNT(*) AS alumnos_por_tutor
	FROM platzi.alumnos AS a
	INNER JOIN platzi.alumnos AS t ON a.tutor_id = t.id
	GROUP BY tutor
) AS alumnos_tutor;