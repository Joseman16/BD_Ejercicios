USE SAMPLEDB
GO


SELECT *
FROM hcm.departments;


SELECT COUNT(*) AS row_count, COUNT(DISTINCT department_id) AS distinct_row_count
FROM hcm.departments;


/*
INFORMATION_SCHEMA.TABLE_CONSTRAINTS view returns one row for each table constraint
in the current database.

INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE view returns one row for each 
column in the current database that has a constraint defined on the column.
*/

-- Query information schema views to get metadata on constraints on hcm.departments table:
SELECT 
	tc.TABLE_SCHEMA,
	tc.TABLE_NAME,
	tc.CONSTRAINT_TYPE,
	ccu.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS tc 
JOIN INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE ccu
ON tc.CONSTRAINT_NAME = ccu.CONSTRAINT_NAME
AND tc.TABLE_NAME = ccu.TABLE_NAME
AND tc.TABLE_SCHEMA = ccu.TABLE_SCHEMA
WHERE tc.TABLE_SCHEMA = 'hcm' AND tc.TABLE_NAME = 'departments';


/* EJERCICIOS CON JOIN: inner o rigth */
select * from hcm.employees

select * from hcm.departments

select emp.employee_id, emp.first_name, emp.last_name, emp.salary, dep.department_name
from hcm.employees emp
inner join hcm.departments dep on dep.department_id = emp.department_id

select emp.employee_id, emp.first_name, emp.last_name, emp.salary, dep.department_name
from hcm.employees emp
right join hcm.departments dep on dep.department_id = emp.department_id

select dep.department_id, dep.department_name, Count(emp.employee_id) as Cantidad_Empleado_Departamento 
from hcm.departments dep
inner join hcm.employees emp on emp.department_id = dep.department_id
group by dep.department_id, dep.department_name

select dep.department_id, dep.department_name, Count(emp.employee_id) as Cantidad_Empleado_Departamento 
from hcm.departments dep
right join hcm.employees emp on emp.department_id = dep.department_id
group by dep.department_id, dep.department_name

select count(*) from hcm.employees

/* JOIN sin fk */

create table cities(
	id int identity(1,1) not null,
	city varchar(40) not null,
	country varchar(40) not null,
	popultion decimal(10,2) not null,
	constraint cities_pk primary key (id)
)

create table stores(
	store_id int identity(1,1) not null,
	city varchar(40) not null,
	country varchar(40) not null,
	area_sqm int not null,
	constraint stores_pk primary key (store_id)

)

/*INSERTS*/
insert into cities(city, country, popultion) 
values ('Melbourne', 'USA', 82826),('Melbourne','Australia', 4936000),
('Sydney','Australia', 4936000)

insert into stores (city, country, area_sqm) 
values ('Melbourne','USA',250),('Melbourne','Australia',450),
('Melbourne','Australia',270),('Sydney','Australia',270)

select * from cities
select * from stores

select ci.popultion, ci.city, ci.country, st.country as store_country, st.store_id, st.area_sqm  
from cities ci
inner join stores st on st.city = ci.city


/*Basicamente, le pido que me traiga a los datos que coincidan en las ciudades*/
/* 
	Ejemplo:
		Guayaquil(st) = Guayaquil (ci)
*/
select ci.popultion, ci.city, ci.country, st.country as store_country, st.city , st.store_id, st.area_sqm  
from cities ci
inner join stores st on st.city = ci.city


/*Basicamente, le pido que me traiga a los datos que coincidan en los paises */
/* 
	Ejemplo:
		Colombia(st) = Colombia (ci)
		Japon (st) = Japon(ci)
*/
select ci.popultion, ci.city, ci.country, st.country as store_country, st.city , st.store_id, st.area_sqm  
from cities ci
inner join stores st on st.country = ci.country 

select ci.popultion, ci.city, ci.country, st.country as store_country, st.city , st.store_id, st.area_sqm  
from cities ci
inner join stores st on st.country = ci.country and st.city = ci.city

/* RETOS DE JOIN */

/* 1. Aqui tememos que traer los nombre de los manager que nos referencia o referenciamos */ 
select e.employee_id, e.first_name, e.last_name, e2.first_name as manager_name, e2.last_name as manager_last_name
from hcm.employees e
right join hcm.employees e2 on e2.manager_id = e.employee_id

select e.employee_id, e.first_name, e.last_name, e2.first_name as manager_name, e2.last_name as manager_last_name
from hcm.employees e
inner join hcm.employees e2 on e2.manager_id = e.employee_id


/* 2. saber en que almacen se guarda los productos */
select * from oes.products
select * from oes.inventories
select * from oes.warehouses

select pro.product_id, pro.product_name, war.warehouse_id, war.warehouse_name, inv.quantity_on_hand
from oes.inventories inv
inner join oes.products pro on pro.product_id = inv.product_id
inner join oes.warehouses war on war.warehouse_id = inv.warehouse_id

/* 
	2. Colocar el nombre de los departamentos, sabiendo que 
	tengo e id del departamento en la tabla employeed
*/


select * from hcm.employees
select * from hcm.departments


select emp.employee_id, emp.first_name, emp.last_name, dep.department_name, j.job_title, emp.state_province
from hcm.employees emp
inner join hcm.departments dep on dep.department_id = emp.department_id
inner join hcm.jobs j on j.job_id = emp.job_id




select * from oes.order_items
select * from oes.products

select pc.category_name, count(oi.quantity) as cantidad_producto_cat from oes.products p
inner join oes.order_items oi on oi.product_id = p.product_id
inner join oes.product_categories pc on pc.category_id = p.category_id
group by pc.category_name
order by pc.category_name ASC 

/* SUBCONSULTAS*/
select * from oes.products
select * from oes.order_items

select pr.product_id, pr.category_id, pr.list_price 
from oes.products pr
where product_id in ( select oi.product_id from oes.order_items oi)

select * from hcm.departments;
select * from hcm.employees;


select emp.employee_id, emp.department_id from hcm.employees emp;
select  dep.department_id, dep.department_name from hcm.departments dep

select dep.department_name,  emp.department_id
from hcm.departments dep
left join hcm.employees emp on emp.department_id = dep.department_id


/* SUBCONSULTAS	*/
select * from oes.products
select * from oes.order_items

select p.product_id, p.category_id, p.list_price 
from oes.products p
where exists(
	select * from oes.order_items ord
	where ord.product_id = p.product_id
)


/*Aqui conseguimos los productos con el precio màs alto en cada categoria*/
select p1.product_id, p1.category_id, p1.list_price
from oes.products p1
inner join (
	select category_id, max(list_price) as max_cat_price
	from oes.products
	group by category_id) p2
on p1.category_id = p2.category_id
and p1.list_price = p2.max_cat_price


select 
	p.product_id, 
	p.category_id, 
	p.list_price, 
	rank() over (partition by p.category_id order by p.list_price DESC) as rnk
from oes.products p

