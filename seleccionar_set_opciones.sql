-- Retorna determinadas alumnos en base al numero de fila
SELECT *
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id IN (1,5,10,12,15,20);

-- Retorna los alumnos asociados a un tutor determinado
SELECT *
FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
);

-- Retorna los alumnos que no esten asociados a un tutor determinado
SELECT *
FROM platzi.alumnos
WHERE id NOT IN (
	SELECT id
	FROM platzi.alumnos
	WHERE tutor_id = 30
);