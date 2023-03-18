/*
Este es un comando SQL para obtener información de la tabla "Customers". La consulta devuelve los datos de todos los campos ("*") de los clientes que tienen una edad ("age") no nula ("IS NOT NULL").

Los datos se ordenan en orden descendente según el valor de la columna "age" ("ORDER BY age DESC"), lo que significa que los clientes más mayores aparecerán primero en los resultados.

La consulta está limitada a solo dos registros ("LIMIT 2"), lo que significa que solo se mostrarán los dos primeros clientes más mayores.
*/
SELECT * FROM Customers
WHERE age IS NOT NULL
ORDER BY age DESC
LIMIT 2
