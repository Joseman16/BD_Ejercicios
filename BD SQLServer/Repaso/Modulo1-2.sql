/* REPASO DE SAMPLEBD */

/* 1.- TABLA: hcm.employees */

select * from hcm.employees

/* ID, primer nombre, segundo apodo */
select emp.employee_id, emp.first_name, emp.middle_name from hcm.employees emp

select emp.employee_id, emp.first_name, emp.middle_name 
from hcm.employees emp
where emp.middle_name is not null /* Me traiga todos que si tengan segundo nombre */

select emp.employee_id, emp.first_name, emp.middle_name 
from hcm.employees emp
where emp.middle_name is null /* Me trae todos que tengan nulos en el segundo nombre */
 
/* ID, primer nombre, apellido */
select emp.employee_id, emp.first_name, emp.last_name  from hcm.employees emp

/* ID, primer, nombre, apellido, salario */
select emp.employee_id, emp.first_name, emp.last_name, emp.salary from hcm.employees emp

/* ID, primer, nombre, apellido, nùmero de celular*/
select emp.employee_id, emp.first_name, emp.last_name, emp.phone from hcm.employees emp

/* SELECT CON DISTINCT (SELECT DISTINCT) */
select emp.state_province from hcm.employees emp
select distinct emp.state_province from hcm.employees emp

select emp.city from hcm.employees emp
select distinct emp.city from hcm.employees emp

--------------------------------------------------------------------------------------------------

/* ORDER BY (ORDENAR POR) */

--ASC: ascendente
--DESC: descendente
select * from hcm.employees

select emp.first_name, emp.last_name, emp.salary
from hcm.employees emp
order by emp.first_name ASC --Ascendente (nombre: a - z)

select emp.first_name, emp.last_name, emp.salary
from hcm.employees emp
order by emp.first_name DESC --Descendente (nombre: z - a)

select emp.first_name, emp.last_name, emp.salary 
from hcm.employees emp
order by emp.salary ASC --Ascendente (salario: $100 - $900 )

select emp.first_name, emp.last_name, emp.salary 
from hcm.employees emp
order by emp.salary DESC --Descendente (salario: $900 - $100 )

select emp.employee_id, emp.first_name, emp.birth_date 
from hcm.employees emp -- Indicamos que la columna cumpleaños es DESC y ID empleado es ASC
order by emp.birth_date DESC, emp.employee_id ASC

select emp.employee_id, emp.first_name, emp.city, emp.state_province 
from hcm.employees emp -- Indico que ciudad se ordene ASC y provincia DESC
order by emp.city ASC, emp.state_province DESC

select emp.employee_id, emp.first_name, emp.city, emp.state_province 
from hcm.employees emp -- Indico que ciudad se ordene ASC y provincia DESC
where emp.state_province is not null -- Pero le indico que no me envie NULOS en esta columna (estado o provincia)
order by emp.city ASC, emp.state_province DESC

select emp.employee_id, emp.first_name, emp.city, emp.state_province 
from hcm.employees emp
where emp.state_province is null -- Pero aca le digo que me envie solo NULOS! 
order by emp.city ASC, emp.state_province DESC

--------------------------------------------------------------------------------------------------

/* SELECT TOP */

select emp.employee_id, emp.first_name, emp.salary 
from hcm.employees emp --Me trae los clientes que tenga el siguiente rango de salario:
where emp.salary between 80000 and 200000 -- rango de salario es $80000 a $200000

/* Selecciona el top 5 de la consulta que hice*/
select top (5) emp.employee_id, emp.first_name, emp.salary
from hcm.employees emp -- top 5 del rango de salario es $80000 a $200000 
where emp.salary between 80000 and 200000

/* Selecciona el top 5 de la consulta que hice*/
select top (5) emp.employee_id, emp.first_name, emp.salary
from hcm.employees emp -- top 5 del rango de salario es $80000 a $200000
where emp.salary between 80000 and 200000
order by emp.salary DESC -- Los puedo ordenar de forma ASC o DESC

/*
	with ties, me indica que si existe 2 iguales (empatados)
	igual me trae los 2, osea que en el select top (5) with ties
	me traeran 6 y no 5...
	Es decir que los empatados, me los considera como uno solo (1) 
	aun asi si existen 2, 3, o màs empatados considerara como 1
*/

select top (5) with ties emp.employee_id, emp.first_name, emp.salary
from hcm.employees emp -- top 5 del rango de salario es $80000 a $200000
where emp.salary between 80000 and 200000
order by emp.salary DESC -- Los puedo ordenar de forma ASC o DESC

select top (5)

--------------------------------------------------------------------------------------------------

/* WHERE  (or, and, like, betwwen, is null, null) */

-- OPERADOR: null, is null, like, between 
-- OPERADOR LOGICO: or, and
-- Clausula: ESCAPE

select * from hcm.employees emp -- si colocamos AND, no nos trae nada porque no existe un registro con 2 fechas 
where emp.hire_date = '2017-01-23' or emp.hire_date = '2006-12-28'

select * from hcm.employees emp
where emp.city = 'Seattle' -- Aca me trae los empleados que viven o pertenecen en esa ciudad

select * from hcm.employees emp -- Aca me trae los empleados que viven o pertenecen en esa ciudad
where emp.state_province = 'New South Wales'

select * from hcm.employees emp
where emp.middle_name is null -- Empleados que no tienen segundo nombre (osea esta en null)

select * from hcm.employees emp --Empleados que tienen segundo nombre (osea no esta en null)
where emp.middle_name is not null

select emp.employee_id, emp.first_name, emp.last_name, emp.street_address
from hcm.employees emp -- me trae a los empleados que en la direcciòn de calle contenga un caracter "ha"
where emp.street_address like '%Ha%'

select emp.employee_id, emp.first_name, emp.last_name, emp.street_address
from hcm.employees emp -- me trae a los empleados que en la direcciòn de calle contenga un caracter numerico "3"
where emp.street_address like '%3%'

select emp.employee_id, emp.first_name, emp.last_name, emp.street_address
from hcm.employees emp -- me trae los empleados que en su primer nombre comience con "m"
where emp.first_name like 'm%'

select emp.employee_id, emp.first_name, emp.last_name, emp.street_address
from hcm.employees emp -- me trae los empleados que su primer nombre termine en "o"
where emp.first_name like '%o'

/*
	-Investifar Escape

	select emp.employee_id, emp.first_name, emp.street_address
	from hcm.employees emp
	where emp.street_address like '%2!%'
	escape '!'
*/

select emp.employee_id, emp.first_name, emp.last_name, emp.hire_date 
from hcm.employees emp -- Le indico que traiga el rango de fechas cuando fueron contratados que les especifique 
where emp.hire_date between '2006-12-28' and '2013-06-09' -- dese diciembre del 2008 hasta junio del 2013

select emp.employee_id, emp.first_name, emp.last_name, emp.birth_date as fecha_cumpleaños 
from hcm.employees emp -- Aqui le indico que me traiga los trabjadores que cumplena en el rango de la siguiente fecha:
where emp.birth_date between '1987-03-06' and '1995-04-15' -- Personas que cumplen apartir "1987-03-06" hasta "1995-04-15"

select emp.employee_id, emp.first_name, emp.last_name, emp.birth_date as fecha_cumpleaños 
from hcm.employees emp
where emp.birth_date > '1987-03-06' and emp.birth_date < '1995-04-15'

select emp.employee_id, emp.first_name 
from hcm.employees emp --Me trae un empleado llamdo Jack
where emp.first_name = N'jack'

select emp.employee_id, emp.first_name, emp.street_address 
from hcm.employees emp -- Me trae la direcciones que terminen en numeraciòn 0 - 9 
where emp.street_address like '%[0-9]'

select emp.employee_id, emp.first_name, emp.street_address 
from hcm.employees emp -- Especifico que me traiga las direcciònes que comience entre 0 y 5
where emp.street_address like '[0-5]%'


/* Empleadosa que ganen mas de "100800" */
select emp.employee_id, emp.first_name, emp.salary 
from hcm.employees emp
where emp.salary > '100800.00' -- funciona con comilla

select emp.employee_id, emp.first_name, emp.salary 
from hcm.employees emp
where emp.salary > 100800.00 -- o sin comilla

--------------------------------------------------------------------------------------------------

/* FUNCIONES AGREGADAS */

select count(case when emp.salary > 110000 then emp.salary end) as Cantidad_salario_superior_110000
from hcm.employees emp -- Cantidad de los empleados que ganan mas de 110000

select avg(case when emp.salary < 110000 then emp.salary end) as promedio_salario_de_110000
from hcm.employees emp -- Promedio salarial, de los empleados que ganan màs de 110000

select round(avg(case when emp.salary < 200000 then emp.salary end), 2) 
from hcm.employees emp -- Promedio salarial, de los empleados que ganana màs de 200000 (redondealos) 

select sum(emp.salary) as cantidad_total_salario  
from hcm.employees emp -- Suma todos los salario de los empleados

select sum(emp.salary) as cantidad_total_salario  
from hcm.employees emp -- Suma los salarios que sean mayor a "120000"
where emp.salary > 120000

select emp.employee_id, emp.first_name, count(distinct emp.manager_id)  as cantidad_manager
from hcm.employees emp -- Me trae la cantidad de manager que tiene cada empleado 
group by emp.employee_id, emp.first_name

select top (10)  emp.employee_id, emp.first_name, max(emp.salary) as Salario 
from hcm.employees emp -- Me trae a los 10 empleados mejor pagados
group by emp.employee_id, emp.first_name
order by  max(emp.salary) DESC

select max(emp.salary) as salario_mas_alto
from hcm.employees emp -- Me indica el salario màs alto

select min( emp.salary) as salario_mas_bajo
from hcm.employees emp -- Me indica el salario màs bajo

select min( emp.salary) + 2000 as salario_mas_bajo
from hcm.employees emp -- Aqui al salario màs bajo pero le agrgeo (sumo) 2000 màs 

--group by emp.employee_id, emp.first_name

-------------------------------------------------------------------------------------------------
/* OPERADOR IN */

--------------------------------------------------------------------------------------------------

select (7000 + 100) / 2 as valor

--------------------------------------------------------------------------------------------------


declare @val decimal (12,2) = 0.0;
while @val != 10.0
begin 
	print @val;
	set @val +=1;
end;
