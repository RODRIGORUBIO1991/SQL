/*
Mostrar a todos los empleados que se encuentran en el departamento de manufactura y de aseguramiento de la calidad.
*/
select e.BusinessEntityID, e.*,
d.Name
from HumanResources.Employee e 
inner join 
HumanResources.EmployeeDepartmentHistory h
on e.BusinessEntityID = h.BusinessEntityID
inner join HumanResources.Department d
on d.DepartmentID = h.DepartmentID
and h.EndDate is null
and d.Name in ('Quality Assurance', 'Production');