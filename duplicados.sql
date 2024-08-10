-- Insert para los ejercicios de duplicados
INSERT INTO platzi.alumnos (id, nombre, apellido, email, colegiatura, fecha_incorporacion, carrera_id, tutor_id) 
VALUES (1001, 'Pamelina', null, 'pmylchreestrr@salon.com', 4800, '2020-04-26 10:18:51', 12, 16);

-- Retorna los alumnos que tienen ids duplicados
SELECT *
FROM platzi.alumnos AS ou
WHERE (
	SELECT COUNT(*)
	FROM platzi.alumnos AS inr
	WHERE ou.id = inr.id
) > 1;

-- Text convierte a texto plano las filas, el group by agrupa por todos los campos
-- Asi al contar podemos saber si hay duplicados exactos
SELECT (
	platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
	)::text, COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
HAVING COUNT(*) > 1;

-- Realiza una subconsulta donde genera particiones en base a todos los elementos de la fila, si una fila esta duplicada
-- La particion tendra mas de un row
SELECT *
FROM (
	SELECT id,
	ROW_NUMBER() OVER(
		PARTITION BY
			nombre,
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		ORDER BY id ASC
	) AS row,
	*
	FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row > 1;

-- Elimina los duplicados
DELETE FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM (
		SELECT ROW_NUMBER() OVER(
			PARTITION BY
				nombre,
				apellido,
				email,
				colegiatura,
				fecha_incorporacion,
				carrera_id,
				tutor_id
			ORDER BY id ASC
		) AS row,
		*
		FROM platzi.alumnos
	) AS duplicados
	WHERE duplicados.row > 1
);
