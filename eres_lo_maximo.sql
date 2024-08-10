-- Retorna la fecha mas reciente
SELECT fecha_incorporacion
FROM platzi.alumnos
ORDER BY fecha_incorporacion DESC
LIMIT 1;

-- Agrupa por carrera y retorna la fecha maxima por agrupacion
SELECT carrera_id, MAX(fecha_incorporacion)
FROM platzi.alumnos
GROUP BY carrera_id
ORDER BY carrera_id;

-- Retorna el minimo nombre
SELECT MIN(nombre)
FROM platzi.alumnos;

-- Agrupa por tutor y retorna por el minimo nombre en la agrupacion
SELECT tutor_id, MIN(nombre)
FROM platzi.alumnos
GROUP BY tutor_id
ORDER BY tutor_id;

