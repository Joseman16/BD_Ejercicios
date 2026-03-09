USE PracticaBD
GO

create table Empleados(
	idEmpleado int,
	nombre varchar(20),
	apellido varchar(30),
	edad numeric(2),
	telefono numeric(10),
	direccion varchar(100),
	fecha_nacimiento date,
	salario decimal(18,2), --18 digitos enteros, y 2 decimales
	activo char(2) --si o no
 
)
/*Consulta*/
select * from Empleados

exec sp_help empleados; --Me muestra los detalles de mi tabla
exec sp_rename 'Empleados','Usuarios'; --Cambio el nombre de la tabla (Nombre actual)(Nombre nuevo)


exec sp_rename 'Usuarios', 'Empleados';

/*Inserts*/
insert into Empleados 
values(1, 'Jose', 'Messi',35,0969223703, 'Otto Robles chambers Y Olmedo', '2003-05-11', 3000.00, 'SI');

insert into Empleados 
values(2, 'Linda', 'Perez',30,0911220912, '9 de OCtubre y Boyaca', '2001-12-08', 2000.00, 'NO');

/*Estamos haciendo una consulta a nuestro sistema*/
/*Cuales tablas pertenecen a nuestra Base de datos*/
select * from sys.tables;

/*Consulta a Empleado*/
select * from Empleados
select nombre, apellido, salario from Empleados
select emp.nombre, emp.apellido, emp.salario from Empleados emp --Aqui le proporciono un alias

-/* Eliminar tabla */
drop table Empleados 
--drop table (Nombre de la tabla)

/*Consuulta a Usuarios*/
--select * from Usuarios

