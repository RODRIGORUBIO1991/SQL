
SELECT * FROM CLIENTES;
SELECT * FROM RUBRO;
SELECT * FROM COMPAÑIA;
SELECT * FROM PRIMA;

---CONECTO TABLA CLIENTES CON RUBRO---
SELECT CLIENTES.Provincia, CLIENTES.Asegurado, RUBRO.Rubro
FROM CLIENTES INNER JOIN RUBRO ON CLIENTES.Asegurado = RUBRO.Asegurado

---CONECTO TABLA RUBRO CON COMPAÑIA---
SELECT RUBRO.Asegurado ID, RUBRO.Asegurado, COMPAÑIA.Estado
FROM RUBRO INNER JOIN COMPAÑIA ON RUBRO.Asegurado_ID = COMPAÑIA.Asegurado_ID

---CONECTO TABLA COMPAÑIA CON PRIMA---
SELECT COMPAÑIA.Asegurado_ID, PRIMA.Gestion_AsesorID, PRIMA.Premio
FROM PRIMA INNER JOIN COMPAÑIA ON COMPAÑIA.Gestion_AsesorID = PRIMA.Gestion_AsesorID

---CONECTO TODOS LAS TABLAS---
SELECT CLIENTES.Provincia, CLIENTES.Asegurado, RUBRO.Rubro, COMPAÑIA.Estado, PRIMA.Gestion_AsesorID, PRIMA.Premio
FROM CLIENTES  INNER JOIN RUBRO ON CLIENTES.Asegurado = RUBRO.Asegurado
INNER JOIN COMPAÑIA ON RUBRO.Asegurado_ID = COMPAÑIA.Asegurado_ID
INNER JOIN PRIMA ON COMPAÑIA.Gestion_AsesorID = PRIMA.Gestion_AsesorID



From Staff FULL OUTER JOIN Estudiantes ON Staff.DocentesID = Estudiantes.Docente
FULL OUTER JOIN Asignaturas ON Staff.Asignatura = Asignaturas.AsignaturasID
FULL OUTER JOIN Area ON Asignaturas.Area = Area.AreaID 
GROUP BY Area.Nombre,Asignaturas.AsignaturasID,Asignaturas.Nombre, Asignaturas.Tipo, Asignaturas.Jornada 
ORDER BY costo_total desc


SELECT Provincia FROM CLIENTES

ALTER TABLE CLIENTES CHANGE ID cliente   int;