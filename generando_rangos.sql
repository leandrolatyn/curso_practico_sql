-- Genera una serie de 4 filas del 1 al 4
SELECT *
FROM generate_series(1,4);

-- Si queremos generar una serie de mayor a menor, tenemos que indicar el paso o delta
SELECT *
FROM generate_series(5,1,-2);

-- Genera series de flotantes
SELECT *
FROM generate_series(1.1,4,1.3);

-- Genera una serie que incrementa en 7 días desde la fecha actual hasta el día 14
SELECT current_date + s.a AS dates
FROM generate_series(0,14,7) AS s(a);

-- Genera una serie de timestamps incrementando 10 horas
SELECT *
FROM generate_series('2020-09-01 00:00:00'::timestamp,
					'2020-09-04 12:00:00', '10 hours');

-- Realiza un join con ids de carrera generados a partir de una serie (sin usar la tabla carreras)
SELECT 	a.id,
		a.nombre,
		a.apellido,
		a.carrera_id,
		s.a
FROM platzi.alumnos AS a
	INNER JOIN generate_series(0,10) AS s(a)
	ON s.a = a.carrera_id
ORDER BY a.carrera_id;

-- Uso de series para triangular
SELECT lpad('', a, '*')
FROM generate_series(1,15) AS a;

SELECT lpad('*', CAST(ordinality AS int), '*')
FROM generate_series(10,2,-2) WITH ordinality;
	