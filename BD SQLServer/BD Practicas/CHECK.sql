/* CHECK CONSTRAINT */

--1:chequear que su sueldo, supere un sueldo Basico

drop table empleado

create table empleado(
	id int identity (1,1) not null,
	nombre varchar(40) not null,
	salario varchar(50) not null,
	constraint empleado_pk primary key (id),
	constraint salario_chk check (salario > 450)
)

select * from empleado
-- Ingrearon los datos, ya que ningun salario es menor que 450
insert into empleado (nombre, salario)
values ('Jose', 555),('Fernanda', 490), ('Carlos', 600),
('Tatiana',900),('Hugo',451),('Marianela',502)

-- Basicamente no se registrara, ya que su salario no alcanza para registrarlo, deber 
-- ser de ley 451 o mas
insert into empleado (nombre, salario)
values ('Robert', 449)

--2: Registrar solo personas que son de la provincia del Guayas

create table usuarios_Guayas(
	id int identity (1,1) not null,
	nombre varchar (30) not null,
	cedula varchar(10) not null,
	constraint usuarios_Guayas_pk primary key (id),
	constraint cedula_chk check (cedula like '09%')
)

select * from usuarios_Guayas

insert into usuarios_Guayas (nombre, cedula)
values ('Jose','0942677998'),('Sebastian','0923111098'),
('Gabriel', '0912878793'),('Sara', '0999111098'),
('Silvia', '1233154092') -- Este ultimo no se puede registrar ya que es de otra provincia del Ecuador, ya que su nùmero de cedula no comienza con el '09'


-- 3: Quiero registrar personas con el siguiente rango de edad para un programa de viaje
-- el rango es de 19 - 25

create table usuarioViaje(
	id int identity(1,1) not null,
	nombre varchar(40) not null,
	edad int not null,
	constraint usuarioViaje_pk primary key (id),
	constraint edad_chk check (edad between 19 and 25)
)

select * from usuarioViaje

insert into usuarioViaje (nombre, edad)
values ('Dereck', 20),('Veronica',23),
('Juan Jose',19), ('Sara', 21),
('Pacho', 25), ('Marta', 28) -- Marta no entra, ya que no cumple el rango de edad