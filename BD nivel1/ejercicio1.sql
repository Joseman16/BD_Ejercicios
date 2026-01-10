
/******************** Ejercicio 1 ********************/
create table clientes(
	cedula char(10), 
	nombre varchar(50),
	apellido varchar(50),
	edad int,
	constraint clientes_pk primary key (cedula)
)

/*Drop table (nombre tabla): permite eliminar */
drop table clientes

/*char: Manejar una cadena de caracteres*/
/*varchar: Maneja String osea que si acepta espacios*/

select * from clientes

/*Puedo especificar que una de mis columnas sean nn(not null)*/
/*not null: que me exige enviar de ley el dato, no puede estar vacio o nulo el dato a ingresar*/
create table clientes(
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	edad int not null,
	constraint clientes_pk primary key (cedula)
)



/******************** Ejercicio 2 ********************/
/*Creamos una nueva tabla personas*/

create table personas(
	cedula char(10) not null,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	estatura decimal,
	fecha_nacimiento date,
	hora_nacimiento time,
	cantidad_ahorrada money,
	numero_hijos int,
	constraint personas_pk primary key (cedula)
)

select * from personas

/*Esto esta mal, ya que "apellido es not null", osea que debo ingresar el dato apellido de ley*/
insert into personas (cedula, nombre) values ('0942677998', 'jose') /* Esta mal */

insert into personas (cedula, nombre, apellido) values ('0942677998', 'jose', 'leon') /* Esta bien */

/*Insert donde agregamos "estatura"*/
insert into personas (cedula, nombre, apellido, estatura) values ('1722929912', 'Lorena', 'Perez', 1.67)

/*Insert donde agregamos "numero_hijos"*/
insert into personas (cedula, nombre, apellido, numero_hijos) values ('1212212132', 'Teresa', 'Calcuta', 2)

insert into personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos)
values ('0922114671', 'Joder','Gonzales', 1.77, '1994-08-09', '19:00:00', 700, 1)

insert into personas (cedula, nombre, apellido, estatura, fecha_nacimiento, hora_nacimiento, cantidad_ahorrada, numero_hijos)
values ('0939913206', 'Sebastian','Carvajal', 1.74, '1998/08/09', '08:31', 930, 4)


select * from personas
select cedula, nombre, numero_hijos from personas

select * from personas where cedula = '0942677998'

select * from personas where nombre = 'jose'

select numero_hijos, * from personas where numero_hijos > 1

select numero_hijos, * from personas where numero_hijos = 2

select * from personas where estatura > 1.70

select * from personas where fecha_nacimiento = '1998/08/09'

insert into personas (cedula, nombre, apellido, fecha_nacimiento)
values ('1020213334', 'Johan','Farfan','10/10/2000')

insert into personas (cedula, nombre, apellido, fecha_nacimiento)
values ('0966213334', 'Viviana','Salinas','11/11/1999')

select * from personas where fecha_nacimiento >= '1998/08/09'

select * from personas

/*El uso de between, pemite crear un rango (valor inicial) and (valor final)*/

select * from personas
where fecha_nacimiento > '01/01/1999'

select * from personas
where fecha_nacimiento
between '01/01/1997' and '01/01/2003' 

insert into personas (cedula, nombre, apellido, fecha_nacimiento, hora_nacimiento)
values ('0900100234', 'Saray','Ponce','11/11/1999','13:44:00')

select * from personas
where hora_nacimiento ='19:00:00'

select * from personas
where hora_nacimiento >='19:00:00'


select * from personas
where personas.hora_nacimiento
between '12:30:00' and '22:00:00'


/*El uso de like: */
select * from personas
where nombre like 'Jo%'

select * from personas
where nombre like '%e'

select * from personas
where nombre like '%o%'

select * from personas
where apellido like '%n%'

select * from personas 
where cedula like '17%'

select * from personas 
where cedula like '09%'







