/* UNICAS - UNIQUE */

USE BDPractice
GO

-- 1: Nombre de departamentos
create table departamentos(
	id int identity (1,1) not null,
	nombre varchar (40) unique not null, -- unique, el nombre debe ser unico
	constraint departamentos_pk primary key (id)
)

-- drop table departamentos
select * from departamentos

insert into departamentos (nombre) 
values('Administracion'),('Desarrollo'),('Marketing'),
('Contabilidad'),('Dece'),('Inspeccion')

insert into departamentos (nombre) 
values('Administracion') -- como estoy usando unique, no me va permitir ingresar este nombre, que ya esta registrado

--2: Nombre de posiciòn en el futbol

create table posicionFutbol(
	id int identity (1,1) not null,
	nombrePosicion varchar(5) unique not null,
	detalles varchar (40) not null, 
	constraint posicionFutbol_pk primary key (id)
)

--drop table posicionFutbol
select * from posicionFutbol

insert into posicionFutbol(nombrePosicion, detalles) 
values ('POR','Portero, aquero, guardameta'),('DEF','Defensor'),
('LI','Lateral izquierdo'),('LD','Laterall Derecho'),('MC','Mediocampista'),
('MCD','Mediocampista defensivo'),('MCO','Mediocampista ofensivo')


insert into posicionFutbol (nombrePosicion,detalles)
values ('ED','Extremo derecho'), ('EI','Extremo izquierdo'),
('DEL','Delantero') --,('MCO','Mediocampista ofensivo') -- este nombre "MCO" ya esta registrado, no me permitira ingresarlo...

--3: Roles en un colegio

create table rolesColegio (
	id int identity(1,1) not null,
	nombreROL varchar (20) not null,
	descripcion varchar (60) not null,
	constraint rolesColegio_pk primary key (id),
	constraint nombreROL_uk unique (nombreROL) -- Unique se puede indicar tambien en el constraint
)

select * from rolesColegio

insert into rolesColegio (nombreROL, descripcion)
values ('Psicolog@', 'Mantiene la estabilidad emocional de los alumno'),
('Profesor/a', 'Imparte la clases'),('Secretari@','Administra informaciòn del colegio'),
('Rector/a','Jefe del colegio'),('Vicerrector','Despues del rector, el esta a cargo'),
('Psicopedagog@','Docente que vela por las emociones de los alumnos')


--No se registrara, ya que existe el nombre del rol ya esta registrado como unico 
insert into rolesColegio(nombreROL, descripcion)
values ('Psicopedagog@','Docente que vela por las emociones de los alumnos')



