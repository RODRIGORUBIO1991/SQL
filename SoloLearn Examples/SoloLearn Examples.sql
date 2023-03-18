/*
Este es un comando SQL para obtener informaci�n de la tabla "Customers". La consulta devuelve los datos de todos los campos ("*") de los clientes que tienen una edad ("age") no nula ("IS NOT NULL").

Los datos se ordenan en orden descendente seg�n el valor de la columna "age" ("ORDER BY age DESC"), lo que significa que los clientes m�s mayores aparecer�n primero en los resultados.

La consulta est� limitada a solo dos registros ("LIMIT 2"), lo que significa que solo se mostrar�n los dos primeros clientes m�s mayores.
*/
SELECT * FROM Customers
WHERE age IS NOT NULL
ORDER BY age DESC
LIMIT 2
