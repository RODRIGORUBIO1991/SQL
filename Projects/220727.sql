
SELECT * FROM CLIENTES;
SELECT * FROM RUBRO;
SELECT * FROM COMPA�IA;
SELECT * FROM PRIMA;

---CONECTO TABLA CLIENTES CON RUBRO---
SELECT CLIENTES.Provincia, CLIENTES.Asegurado, RUBRO.Rubro
FROM CLIENTES INNER JOIN RUBRO ON CLIENTES.Asegurado = RUBRO.Asegurado

---CONECTO TABLA RUBRO CON COMPA�IA---
SELECT RUBRO.Asegurado ID, RUBRO.Asegurado, COMPA�IA.Estado
FROM RUBRO INNER JOIN COMPA�IA ON RUBRO.Asegurado_ID = COMPA�IA.Asegurado_ID

---CONECTO TABLA COMPA�IA CON PRIMA---
SELECT COMPA�IA.Asegurado_ID, PRIMA.Gestion_AsesorID, PRIMA.Premio
FROM PRIMA INNER JOIN COMPA�IA ON COMPA�IA.Gestion_AsesorID = PRIMA.Gestion_AsesorID

---CONECTO TODOS LAS TABLAS---
SELECT CLIENTES.Provincia, CLIENTES.Asegurado, RUBRO.Rubro, COMPA�IA.Estado, PRIMA.Gestion_AsesorID, PRIMA.Premio
FROM CLIENTES  INNER JOIN RUBRO ON CLIENTES.Asegurado = RUBRO.Asegurado
INNER JOIN COMPA�IA ON RUBRO.Asegurado_ID = COMPA�IA.Asegurado_ID
INNER JOIN PRIMA ON COMPA�IA.Gestion_AsesorID = PRIMA.Gestion_AsesorID



From Staff FULL OUTER JOIN Estudiantes ON Staff.DocentesID = Estudiantes.Docente
FULL OUTER JOIN Asignaturas ON Staff.Asignatura = Asignaturas.AsignaturasID
FULL OUTER JOIN Area ON Asignaturas.Area = Area.AreaID 
GROUP BY Area.Nombre,Asignaturas.AsignaturasID,Asignaturas.Nombre, Asignaturas.Tipo, Asignaturas.Jornada 
ORDER BY costo_total desc


SELECT Provincia FROM CLIENTES

ALTER TABLE CLIENTES CHANGE ID cliente   int;