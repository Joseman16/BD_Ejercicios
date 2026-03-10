USE BDPractice
GO

USE SAMPLEDB
GO

/* UNIQUEIDENTIFIER */

create table school_1_dbo_students(
	student_id int identity (1,1) not null,
	student_name varchar(20) not null,
	constraint school_1_dbo_students_pk primary key (student_id)
)


create table school_2_dbo_students(
	student_id int identity (1,1) not null,
	student_name varchar(20) not null,
	constraint school_2_dbo_students_pk primary key (student_id)
)

/* INSERCCIONES */
insert into school_1_dbo_students (student_name)
values ('James'),('Jane'),('Mary') -- insercciòn a escuela 1

insert into school_2_dbo_students (student_name)
values ('Bernadine'),('Jane'),('Mark') -- insercciòn a escuela 2

/* CONSULTAS */
select * from school_1_dbo_students
select * from school_2_dbo_students

--Uso UNION, Pero no me trae valores duplicados
select student_id, student_name from school_1_dbo_students
UNION
select student_id, student_name from school_2_dbo_students

--Uso UNION ALL, Me trae valores duplicados...
select student_id, student_name from school_1_dbo_students
UNION ALL
select student_id, student_name from school_2_dbo_students


/* NEWID() */
-- Esto utilizaremos en mi tabla para crear los GUIDs.
Select newid() as guid_value; --esto genera un valor unico

create table dbo.subjects1(
	subject_id int identity(1,1) not null,
	subject_NAME VARCHAR(20) not null,
	global_id UNIQUEIDENTIFIER,
	constraint pk_subjects1_subject_id primary key (subject_id)
)

--Insercciòn de la tabla subject1
insert into dbo.subjects1 (subject_NAME, global_id)
values ('Biologia', newid()), ('Fisica', newid()), ('Ingles', newid())

--consulta
select * from dbo.subjects1

---------------------------------------------------
create table dbo.subjects2(
	subject_id int identity(1,1) not null,
	subject_NAME varchar (20) not null,
	global_id UNIQUEIDENTIFIER DEFAULT NEWID(), -- Me genera un Guid automaticamente
	constraint pk_subjects2_subject_id primary key (subject_id)
)

--Insercciòn de la tabla subject1
--NO ingreso el newid() en cada insercciòn sino que este ya me lo gener automaticamanete
insert into dbo.subjects2 (subject_NAME)
values ('Biologia'),('Fisica'),('Ingles')

--consulta
select * from dbo.subjects2


--Consulta con UNION
select subject_id, subject_NAME, global_id from subjects1
UNION -- Ahora si me trae todo sin utilizar el UNION ALL, ya que tengo el GUID generado por newid()
select subject_id, subject_NAME, global_id from subjects2

--Creamos una tercera tabla 

create table dbo.subjects3(
	subject_id int identity(1,1) not null,
	subject_NAME varchar(20) not null,
	global_id uniqueidentifier default newsequentialid(),
	constraint pk_subjects3_subject_id primary key (subject_id)
);

--drop table dbo.subjects3

select * from dbo.subjects3
 
insert into dbo.subjects3 (subject_NAME)
values ('Biologia'),('Fisica'),('Ingles')

/* UPDATE  AND DELETE*/

create table empleado(
	emp_id int identity (1,1) not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	hire_date date not null,
	dept_id int not null,
	constraint empleado_pk primary key (emp_id)
)

-- insertar datos a la tabla empleado
insert into empleado(first_name, last_name, hire_date, dept_id)
values('Scott','Davies','2020-12-11',1),('Miriam','Yardley','2021-02-07',1),
('Regina','Salazar','2020-07-30',1),('Dario','Leon','2021-01-26',2)

/*Actualizar o Update*/

--actualizar datos a la tabla empleado
update empleado set last_name = 'Lion'
where emp_id = 4 --actualizamos el apelido, dependiendo del ID

update empleado set hire_date = '2022-03-15'
where first_name = 'Regina' --actualizamos la fecha de contraro dependiendo de su nombre, algo no muy comun

update empleado set dept_id = 3
where emp_id = 2 --actualizamos su departamentos, dependiendo de su ID de empleado

select * from empleado

/*Eliminar o Delete*/

insert into empleado(first_name, last_name, hire_date, dept_id)
values('Carlos','Ramirez','2023-02-01',3),('Matt','Smith','2021-10-13',1),
('Viviana','Salinas','2021-12-14',2)

select * from empleado

delete from empleado
where emp_id = 4 --Eliminamos dependiendo del id del empleado

delete from empleado --Elimino empleado dependiendo del rango de fecha que coloque
where hire_date between '2021-12-01' and '2021-12-29' 

delete from empleado --Elimino los empleados que su primer nombre comience con m ('m%')
where first_name like 'm%'


/* Aqui estoy usando la base de datos: SAMPLEDB */
/*
	transaction!
*/

select * from oes.products
select * from oes.inventories

-- Begin a new Transaction
-- Iniciar una nueva trasacciòn
begin transaction

-- Declare a variable called @new_product_id that will hold the new product_id value:
-- Declarar una variable llamada fnew_product_id que almacenarà el nuevo valor de prodcut_id
declare @new_product_id int;

--Insertar el nuevo producto. EL valor de product_id se genera mediante la propiedad IDENTITY:
insert into oes.products ( product_name, category_id, list_price, discontinued)
values ('PBX Printer', 7, 45.99, 0)

--La funciòn SCOPE_IDENTITY() devuelve el ùltimo valor insertado en la columna IDENTITY
set @new_product_id = SCOPE_IDENTITY(); -- Devuelve el ultimo valor insertado

-- insertar la informaciòn del inventario para el nuevo prodcuto:
insert into oes.inventories (product_id, warehouse_id, quantity_on_hand)
values (@new_product_id, 1, 100),
		(@new_product_id, 4, 35)

select * from oes.warehouses
/* Otro metodo: */
select * from oes.products
select * from oes.inventories

begin transaction

declare @new_product_id int;

insert into oes.products (product_name, category_id, list_price, discontinued)
values ('PBX Printer', 7, 45.99, 0)

set @new_product_id = SCOPE_IDENTITY();

insert into oes.inventories (product_id, warehouse_id, quantity_on_hand)
values (@new_product_id, 1, 100),
       (@new_product_id, 4, 35)

/*
	VERIFICAR EN CASA SOBRE LAS TRANSACCIONES
*/

/* PROCEDIMIENTO ALMACENADOS (STORED PROCEDURE) */

select 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name
from hcm.employees e
inner join hcm.departments d on e.department_id = d.department_id
where d.department_name = 'Finance'

/* 1.Ejemplo de procedimiento almacenado */
create procedure hcm.getEmployeesByDepartment (@department_name varchar(50))
as
select 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name
	from hcm.employees e
inner join hcm.departments d on e.department_id = d.department_id
where d.department_name = @department_name;

/*
	Ejecutamos el procedimeinto alamacenado hcm.getEmployeesByDepartment 
	para obtener 11 empleados en el departamento de 'Finanzas'
*/

execute hcm.getEmployeesByDepartment @department_name = 'Sales';

-- tamnbièn se puede:
execute hcm.getEmployeesByDepartment 'Finance';

-- o sino:
exec hcm.getEmployeesByDepartment 'Finance';


select 
	customer_id,
	first_name,
	last_name,
	email,
	street_address
from oes.customers
where street_address like '%34th%'

go 

/* 2.Ejemplo de procedimiento almacenado */
create procedure oes.searchCustomerByStreetAddress (@street_address_search varchar(50))
as
select 
	customer_id,
	first_name,
	last_name,
	email,
	street_address
from oes.customers
where street_address like '%'+@street_address_search+'%';
go

-- Ejecutamos los procedimientos almacenados
execute oes.searchCustomerByStreetAddress @street_address_search = 'Bin';

execute oes.searchCustomerByStreetAddress 'tr';

exec oes.searchCustomerByStreetAddress '74';


/* 2.Ejemplo de procedimiento almacenado */
-- Consulta SELECT que seleccion cliented de UsAustrala que tienen direcciones de correo electronico gmail
select * 
from oes.customers cu
inner join hcm.countries ct on cu.country_id = ct.country_id
where ct.country_name = 'Australia'
and cu.email like '%gmail.com';

create procedure oes.getUstomerBntryEmail(
	@country varchar(50),
	@email_domain varchar(50)
)
as
begin
select 
	cu.customer_id,
	cu.first_name,
	cu.last_name,
	cu.email,
	ct.country_name
from oes.customers cu
inner join hcm.countries ct on cu.country_id = ct.country_id
where ct.country_name = @country
and cu.email like '%'+@email_domain;
end --Aqui finalizamos el begin
go

--Ejecutamos el procedimiento alamacenado
exec oes.getUstomerBntryEmail @country='Australia', @email_domain = '@gmail.com';

execute oes.getUstomerBntryEmail 'Australia', '@gmail.com'

exec oes.getUstomerBntryEmail 'Australia','@hotmail.com'

create procedure hcm.getEmployeesBySalaryRange
(
	@min_salary decimal(12,2),
	@max_salary decimal(12,2)
)
as
select  
	employee_id,
	first_name,
	last_name,
	department_id,
	salary
from hcm.employees
where salary >= @min_salary and salary <= @max_salary

go

--Ejecutar el procedimiento almacenado de salario
execute hcm.getEmployeesBySalaryRange @min_salary=250000, @max_salary=300000
exec hcm.getEmployeesBySalaryRange 200000, 250000

create procedure hcm.getEmployeesBySalaryRange2
(
	@min_salary decimal(12,2),
	@max_salary decimal(12,2)
)
as
select  
	employee_id,
	first_name,
	last_name,
	department_id,
	salary
from hcm.employees
where salary between @min_salary and @max_salary
 
go

execute hcm.getEmployeesBySalaryRange2 @min_salary=250000, @max_salary=300000
exec hcm.getEmployeesBySalaryRange2 200000, 250000

/*
alter procedure hcm.getEmployeesySalaryRange_3
(
@min_salary decimal(12,2) = 0,
@max_salary decimal(12,2) = 100000
)
as
select  
	employee_id,
	first_name,
	last_name,
	department_id,
	salary
from hcm.employees
where salary >= @min_salary and salary <= @max_salary

go
*/

-- Output parameters:
select * from dbo.parks2

create table dbo.parks2(
	park_id int identity(1,1) not null,
	park_name varchar(50) not null,
	entry_fee decimal (8,2) not null,
	constraint pk_parks2_park_id primary key (park_id)
);

-- Inserts de dbo.parks2
insert into dbo.parks2 (park_name, entry_fee)
values('Bellmont park', 5), ('Redmond Park', 10),
('Parque la Carlina', 15),('Parque Centenario', 10),('Dino Park', 5)

select * from dbo.parks2

go
create procedure dbo.addNewPark
(
	@park_name varchar(50),
	@entry_fee decimal(6,2) = 0,
	@new_park_id int out
)
as 

set nocount on;

set xact_abort on;

begin
insert into (dbo.parks2 (park_name, entry_fee)
values (@park_name, @entry_fee);


select @new_park_id = SCOPE_IDENTITY();

/*
	Màs de Procedimiento Almacenados
*/

create procedure oes.getQuantityONHand(
	@prodcuct_id int,
	@warehouse_id int
)
as
begin 
 
end 
go

create procedure oes.getCurrentProducts
(
	@product_name as varchar(100),
	@max_list_price as decimal (19,4)
)
as
begin

select 
	product_id,
	product_name,
	list_price
from oes.products
where discontinued = 0
and product_name like '%'+product_name+'%'
and list_price <=@max_list_price;
end
go

/* Exect*/
exec  oes.getCurrentProducts @product_name = 'Max Steal', @max_list_price = 2000

execute  oes.getCurrentProducts 'Diego Maradona', 2100

select * from hcm.departments

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
WHERE tc.TABLE_SCHEMA = 'hcm' AND tc.TABLE_NAME = 'departments'

select * from hcm.departments

insert into hcm.departments value ('Administration', 1800)

select count (*), count (distinct department_name)
from hcm.departments --compruebo que 27 tiene valores unicos

select count (*) as total_count, count (distinct department_name) as unique_value_count
from hcm.departments;

--challenge Solution - Add a Unique constraintr on to the department column in the hcm

alter table hcm.departments
add constraint uk_departments_department_name unique (department_name);