-- Retorna las carreras con la cantidad de alumnos
SELECT carrera_id, COUNT(*) AS cuenta
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY cuenta DESC;

-- Elimina carreras por su id en un rango
DELETE FROM platzi.carreras
WHERE id BETWEEN 30 AND 40;

-- LEFT JOIN EXCLUSIVO, retorna lo alumnos que no tienen carreras asociadas
SELECT  a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
LEFT JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE c.id IS NULL
ORDER BY a.carrera_id;

-- Retorna todo sin excluir
SELECT  a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
FULL OUTER JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY a.carrera_id;