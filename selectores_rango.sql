-- Retorna los alumnos asociados a ids de tutores en un rango
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (1,2,3,4);

SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

-- Retorna true si un valor dado esta dentro del rango
-- int4range hace rangos de enteros pequeños
SELECT int4range(1, 20) @> 3;

-- Retorna true si los rangos se solapan
-- numrange hace un rango numerico, que puede ser flotantes
SELECT numrange(11.1, 19.9) && numrange(20.0, 30.0);

-- Retorna el mayor valor del rango
-- int8range hace rangos de enteros grandes
SELECT UPPER(int8range(15,25));

-- Retorna el menor valor del rango
SELECT LOWER(int8range(15,25));

-- Retorna la interseccion entre rangos
SELECT int4range(10,20) * int4range(15,25);

-- Retorna si un range esta vacio
SELECT ISEMPTY(numrange(1,5));

-- Retorna los alumnos asociados a un tutor_id que se encuentre dentro del rango
SELECT *
FROM platzi.alumnos
WHERE int4range(10,20) @> tutor_id;

-- Retorna la interseccion entre los tutor_id y los carrera_id
SELECT numrange(
	(SELECT MIN(tutor_id) FROM platzi.alumnos),
	(SELECT MAX(tutor_id) FROM platzi.alumnos)
) * numrange(
	(SELECT MIN(carrera_id) FROM platzi.alumnos),
	(SELECT MAX(carrera_id) FROM platzi.alumnos)
);