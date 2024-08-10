-- LEFT JOIN EXCLUSIVO
SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
LEFT JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE c.id IS NULL;

-- LEFT JOIN INCLUSIVO
SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
LEFT JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- RIGHT JOIN INCLUSIVO
SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
RIGHT JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- RIGHT JOIN EXCLUSIVO
SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
RIGHT JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE a.id IS NULL
ORDER BY c.id DESC;

-- INNER JOIN
SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
JOIN platzi.carreras AS c ON a.carrera_id = c.id
ORDER BY c.id DESC;

-- FULL OUTER JOIN EXCLUSIVO - DIFERENCIA SIMETRICA (lo opuesto al INNER JOIN)
SELECT a.nombre,
		a.apellido,
		a.carrera_id,
		c.id,
		c.carrera
FROM platzi.alumnos AS a
FULL OUTER JOIN platzi.carreras AS c ON a.carrera_id = c.id
WHERE a.id IS NULL
OR c.id IS NULL
ORDER BY a.carrera_id DESC, c.id DESC;