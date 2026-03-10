USE BDPractice
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

