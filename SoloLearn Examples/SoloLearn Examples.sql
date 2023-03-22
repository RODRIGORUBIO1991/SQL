/*
Este es un comando SQL para obtener información de la tabla "Customers". La consulta devuelve los datos de todos los campos ("*") de los clientes que tienen una edad ("age") no nula ("IS NOT NULL").

Los datos se ordenan en orden descendente según el valor de la columna "age" ("ORDER BY age DESC"), lo que significa que los clientes más mayores aparecerán primero en los resultados.

La consulta está limitada a solo dos registros ("LIMIT 2"), lo que significa que solo se mostrarán los dos primeros clientes más mayores.
*/
SELECT * FROM Customers
WHERE age IS NOT NULL
ORDER BY age DESC
LIMIT 2



/*
Este es un comando SQL para seleccionar datos específicos de la tabla "Customers". La consulta devuelve el nombre y apellido de los clientes, así como una versión modificada del campo "city".

El comando "REPLACE" se utiliza para modificar el valor del campo "city". En este caso, cualquier aparición de "New York" en el campo "city" se reemplazará con "NY".

Por lo tanto, la consulta mostrará el nombre y apellido de los clientes, así como una versión modificada de su ciudad, donde "New York" se habrá reemplazado por "NY".
*/

SELECT firstname, lastname, 
REPLACE(city, 'New York', 'NY') 
FROM Customers

/*
Este es un comando SQL para crear una nueva columna llamada "name" que contiene el nombre completo de cada cliente en un formato específico, 
donde se toma el primer carácter del campo "firstname", se le agrega un punto y un espacio, y luego se agrega el apellido en letras mayúsculas.
*/

SELECT CONCAT(
    SUBSTRING(firstname, 1, 1), 
    '. ', 
    UPPER(lastname)) AS name
FROM Customers 

/*
Este es un comando SQL para seleccionar los datos del campo "firstname" y "lastname" de la tabla "Employees" y 
luego concatenarlos con la cadena "@company.com" para crear la dirección de correo electrónico de cada empleado en minúsculas. 
La consulta también crea una columna nueva llamada "email" para almacenar las direcciones de correo electrónico y las ordena en orden ascendente.

*/

SELECT CONCAT(LOWER(firstname), '.', LOWER(lastname), '@company.com') AS email
FROM Employees
ORDER BY email ASC


/*
Este es un comando SQL para actualizar los datos de la tabla "Products". La consulta utiliza el comando "UPDATE" para cambiar el valor del campo "price" 
en todos los productos con un precio mayor a 100.
El precio se modificará a un valor nuevo, que se obtiene al multiplicar el precio actual por un factor de 0.9. 
Por lo tanto, la consulta reducirá el precio de todos los productos seleccionados en un 10%.
*/

UPDATE Products
SET price = price * 0.9
WHERE price > 100

/*
Este es un comando SQL para eliminar registros de la tabla "Orders". La consulta utiliza el comando "DELETE" para eliminar todos los pedidos realizados por clientes de la ciudad de "Chicago" ("city = 'Chicago'").

Por lo tanto, la consulta eliminará todos los registros de pedidos de los clientes que residen en Chicago.
*/

DELETE FROM Orders
WHERE customer_id IN (
SELECT id FROM Customers
WHERE city = 'Chicago'
)