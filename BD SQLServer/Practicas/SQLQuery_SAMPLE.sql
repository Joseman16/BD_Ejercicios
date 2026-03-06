
USE SAMPLEDB;
GO

/* LLAMO EL NOMBRE Y EL APELLIDO DEL EMEPLEADO */
select first_name, last_name from hcm.employees

/* BUSCO EL NOMBRE DE LA CIUDAD */
select cus.last_name as nombre_del_cliente ,cus.city as ciudad  from oes.customers cus
select last_name as customers_last_name , city from oes.customers

/* LLAMA LA TABLA ORDER_ITEMS, QUE SE ENCUENTRA EN EL ESQUEMA "oes" */
select * from oes.order_items


/* CONSULTAR LOCALIDAD */
select * from bird.antarctic_populations

/* ME TRAE LAS LOCALIDADES QUE EXISTEN O QUE SE REPITEN DENTRO DE LA COLUMNA LOCALIDA */
select distinct locality from bird.antarctic_populations

/* BASICAMENTE LOS ID QUE CONTIENE DICHAS LOCALIDADES */
select distinct locality, species_id 
from bird.antarctic_populations

/* ORDER BY */

/* ORDENA DE FORMA ASCENDENTE */
select employee_id, first_name, last_name from hcm.employees
order by employee_id ASC

select * from hcm.employees
order by last_name /*ASC ya esta predeterminada*/

select * from hcm.employees
order by last_name ASC

select employee_id, first_name, last_name from hcm.employees
order by first_name ASC /*Ordena de forma abc (ascendete) "a - z" */

/* ORDENA DE FORMA DESCENDETE */
select employee_id, first_name, last_name from hcm.employees
order by employee_id DESC

select employee_id, last_name, salary from hcm.employees
order by salary DESC /*Me trae de 1ero quien gana màs*/

select employee_id, first_name, last_name from hcm.employees
order by first_name DESC /*Ordena de forma abc (descendente) "z - a" */


/* ORDENAR DEPENDIENDO DE LA COLUMNA */
select employee_id, first_name 
from hcm.employees
order by 2; /*toma la segunda columana para odernar*/

select employee_id, first_name, last_name 
from hcm.employees
order by 3; /*toma la tercera columana para odernar*/

/* ORDENAR POR FECHAS */
select employee_id, first_name, hire_date from hcm.employees

/* FECHAS ANTIGUAS */
select employee_id, first_name, hire_date 
from hcm.employees
order by hire_date ASC

/* FECHAS RECIENTES */
select employee_id, first_name, hire_date 
from hcm.employees
order by hire_date DESC

select employee_id, first_name, hire_date 
from hcm.employees
order by hire_date DESC, employee_id ASC
 

 /* FILTRADO DE DATOS CON TOP */
 select top (2) * from oes.customers;

 select top (3) cus.customer_id, cus.first_name, cus.city from oes.customers cus
 order by cus.city DESC

 /* SENTENCIAS WHERE */
 select loc.location_id, loc.city, loc.state_province 
 from hcm.locations loc
 where loc.state_province = null; /*No trae nada*/

 select loc.location_id, loc.city, loc.state_province 
 from hcm.locations loc
 where loc.state_province is null; /*Forma correcta de traer datos solo con esta columna nula*/

 select loc.location_id, loc.city, loc.state_province 
 from hcm.locations loc
 where loc.state_province is not null; /*Forma correcta de traer datos solo con esta columna nula*/


 /*USO DE LIKE*/

 select * from oes.products

 select pro.product_id, pro.product_name 
 from oes.products pro
 where product_name like '%[0-9]%' /*nombre de prodcutos que contenga un caracter numerico*/

 select pro.product_id, pro.product_name 
 from oes.products pro
 where product_name like 'c%' /*nombre de productos que comience con c*/

 select pro.product_id, pro.product_name 
 from oes.products pro
 where product_name like '%n' /*nombre de productos que terminen con n*/


 select * from oes.customers

 select cus.customer_id, cus.first_name, cus.email 
 from oes.customers cus
 where cus.email like '%@gmail.com%' /* Me trae correos con este dominio*/


 /*FUNCIONES AREGADAS*/

 select * from hcm.employees
 
 /*MAX, MIN */
select MAX(emp.salary) as salario_maximo 
from hcm.employees emp /*Salario maximo*/

select MIN(emp.salary) as salario_minimo
from hcm.employees emp /*Salario minimo*/

/*SUM*/
select SUM(emp.salary) as total_valor_salarios
from hcm.employees emp /*valor total de todos los salarios*/

/*AVG*/
select AVG(emp.salary) as promedio_salario
from hcm.employees emp /*Promedio de salario*/

/*COUNT*/
select COUNT(emp.employee_id) 
from hcm.employees emp /*Saber cuantos empleados hay*/


/*OPERADORES LOGICOS (OR - AND) */
select * from hcm.employees emp
where emp.job_id = 13 and emp.state_province = 'Washington';


select * from hcm.employees emp
where emp.job_id = 15 and (emp.state_province = 'Washington' or emp.state_province = 'New South Wales');

select * from hcm.employees emp
where (emp.first_name like 'r%') and (emp.last_name like 'm%') 

/*CLAUSULA IN*/
select * from hcm.employees emp
where emp.employee_id in (100, 102, 114, 116)

select emp.employee_id, emp.first_name, emp.state_province 
from hcm.employees emp
where emp.state_province in ('New South Wales', 'Queensland') 

select * from hcm.jobs


/*IN en subconsultas*/
select sum(emp.salary) as total_salario 
from hcm.employees emp
where job_id IN (select jo.job_id from hcm.jobs jo where jo.max_salary > 200000)

select * from hcm.employees

select emp.employee_id, emp.street_address, emp.postal_code 
from hcm.employees emp
where emp.employee_id = 119 or emp.employee_id = 111 or emp.employee_id = 100 /* Esta bien, pero se puede simplificar */

select emp.employee_id, emp.street_address, emp.postal_code 
from hcm.employees emp
where emp.employee_id in (100,111,116) /* De forma simplificada y entendible */

select emp.employee_id, emp.first_name, emp.state_province, emp.salary 
from hcm.employees emp /* Aqui le digo que traiga empleados de los 2 estados y que gane mas de $200000*/
where (emp.state_province in ('Queensland', 'New South Wales')) and emp.salary > 200000

select emp.employee_id, emp.first_name, emp.state_province, emp.salary 
from hcm.employees emp /* Hago la mismo consulta, pero tambipen me llamara a estados que esten en nulos */
where ((emp.state_province in ('Queensland', 'New South Wales')) or emp.state_province is null) 
and emp.salary > 200000

select * from hcm.employees emp

select emp.employee_id, emp.first_name, emp.city, emp.hire_date, emp.salary 
from hcm.employees emp /* Empleados que viven en una de las 2 ciudades, y que fuye contratado el 1 de enero del 2019 */
where (emp.city in ('Seattle', 'Sydney')) and (emp.hire_date > '2019-01-01')

/* INNER JOIN */
select * from hcm.employees
select * from hcm.departments
select * from hcm.countries

/* Ejemplos con Innert join */
select * from hcm.employees emp /* tabla principal es empleado */
inner join hcm.departments dep on dep.department_id = emp.department_id 

select * from hcm.departments dep
inner join hcm.employees emp /* tabla principal es departamento */
on emp.department_id = dep.department_id

select emp.employee_id, emp.first_name, emp.last_name, emp.department_id, dep.department_id, dep.department_name 
from hcm.employees emp 
inner join hcm.departments dep on dep.department_id = emp.department_id 

/* Outer join (Otros join) */
select emp.employee_id, emp.first_name, emp.last_name, emp.department_id, dep.department_id, dep.department_name 
from hcm.employees emp 
right join hcm.departments dep on dep.department_id = emp.department_id 

select emp.employee_id, emp.first_name, emp.last_name, emp.department_id, dep.department_id, dep.department_name 
from hcm.employees emp 
full join hcm.departments dep on dep.department_id = emp.department_id

select emp.employee_id, emp.first_name, emp.last_name, emp.department_id, dep.department_id, dep.department_name 
from hcm.employees emp 
left join hcm.departments dep on dep.department_id = emp.department_id 

/* MÀS EJEMPLO DE JOIN */

select emp.employee_id, emp.first_name, emp.country_id, cou.country_id, cou.country_name
from hcm.employees emp /* Me trae los paises, pero de forma ordeanada la relaciòn entre empleado y paises*/
inner join hcm.countries cou on cou.country_id = emp.country_id 

select emp.employee_id, emp.first_name, emp.country_id, cou.country_id, cou.country_name
from hcm.employees emp /* cuando no existe una relaciòn entre pk y fk de los paises (no tienen datos), los llena con NULL*/
right join hcm.countries cou on cou.country_id = emp.country_id 

select emp.employee_id, emp.first_name, emp.country_id, cou.country_id, cou.country_name
from hcm.employees emp /*Uno los datos relacionados con INner JOIN, pero que viva en uno de estos dos paises*/
inner join hcm.countries cou on cou.country_id = emp.country_id /*'Australia' o 'United Kingdom'*/
where country_name in ('Australia', 'United Kingdom')

select 
tc.TABLE_SCHEMA,
tc.TABLE_NAME,
tc.CONSTRAINT_TYPE,
ccu.COLUMN_NAME
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ccu
on tc.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
and tc.TABLE_NAME = ccu.TABLE_NAME
and tc.TABLE_SCHEMA = ccu.TABLE_SCHEMA
where tc.TABLE_SCHEMA = 'hcm' and tc.TABLE_NAME = 'departments';

/* Podemos ver los pk, fk, check */

select 
tc.TABLE_SCHEMA,
tc.TABLE_NAME,
tc.CONSTRAINT_TYPE
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
where tc.TABLE_SCHEMA = 'hcm'

select 
tc.TABLE_SCHEMA,
tc.TABLE_NAME,
tc.CONSTRAINT_TYPE
from INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc
where tc.TABLE_SCHEMA = 'hcm' and tc.TABLE_NAME = 'locations'

select * from hcm.countries
select * from hcm.employees