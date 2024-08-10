-- Leftpad rellena a la izquierda de sql con * hasta un tamaño de 15
SELECT lpad('sql', 15, '*');

-- Recorre los ids hasta 9, rellenando o recordando dependiendo del tamaño del id
SELECT lpad('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;

-- Hace el triangulo desordenado porque al ordenar por id de carrera los ids no quedan ordenados
SELECT lpad('*', id, '*')
FROM platzi.alumnos
WHERE id < 10
ORDER BY carrera_id;

-- Al dibujar por row_id como dentro y fuera de la función de ventana ordenamos por carrera_id
-- No desordena el row_id a la hora de dibujar
SELECT lpad('*', CAST(row_id AS int), '*')
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY carrera_id) AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_id
WHERE row_id <= 5
ORDER BY carrera_id;

-- Rightpad rellena a la derecha de sql con * hasta un tamaño de 8
SELECT rpad('sql', 8, '*');

-- Recorre los ids hasta 9, rellenando o recordando dependiendo del tamaño del id
SELECT rpad('sql', id, '*')
FROM platzi.alumnos
WHERE id < 10;