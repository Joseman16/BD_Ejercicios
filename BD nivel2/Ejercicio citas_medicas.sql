
create table paciente(
	cedula char(10) not null,
	nombres varchar(40) not null,
	telefono char(10) not null,
	fecha_nacimiento date not null,
	estado boolean not null,
	constraint paciente_pk primary key (cedula)
)

select * from paciente

--Ingresar datos del paciente --
insert into paciente (cedula, nombres, telefono, fecha_nacimiento, estado) values 
('0942677998', 'Jose ','0969223703', '16/11/1999', true),
('1792929301', 'Joaquin','0912221223', '11/10/2003', true),
('1293930011', 'Gabriela','0988383801', '15/11/2001', true),
('0502019112', 'Karla','0912111134', '01/02/2005', true),
('0812003156', 'Andrea','0969696922', '30/11/2006', false),
('0909658920', 'Julian ','0988884431', '08/11/2005', true),
('1629391000', 'Juan Jose','0969223110', '04/08/1980', false),
('1728399021', 'Yokoi','0955553145', '16/11/1989', true),
('1777929293', 'Renata','0800001124', '14/06/1999', false),
('1823002933', 'Nicole','0722333434', '27/03/2001', true);


create table especialidad(
	id_especialidad serial not null,
	nombre varchar(40) not null,
	constraint especialidad_pk primary key (id_especialidad)
)

insert into especialidad (nombre) values
('Anestesiologia'),('Cardiologia'),('Dermatologia'),
('Ginecologia y Obstetricia'),('Medicina de Emergencia'),('Medicina Interna'),
('Medicina Deportiva'),('Neumologia'),('Oftamologia'),
('Ortopedia'),('Pediatria'),('Radiologia');

select * from especialidad

create table medico(
	id_medico serial not null,
	nombre varchar(40) not null,
	correo varchar (35) not null,
	id_especialidad int not null,
	constraint medico_pk primary key (id_medico),
	constraint especialidad_fk foreign key (id_especialidad) references especialidad(id_especialidad)
)

insert into medico(nombre, correo, id_especialidad) values
('Angel', 'angelQnto@gmail.com', 3),('Justin','justinLeonZam@gmail.com', 6),
('Fatima', 'fatimaGutierrez@hotmail.com', 1),('Nancy','NancyRisol@gmail.com', 12),
('Vector', 'vecotrCabrFr122@hotmail.com', 11),('Kaysi','kaysiBarzola@gmail.com', 7),
('Sandy', 'sandyMoyano88@gmail.com', 9),('Roger','rogerTomala12@gmail.com', 8);

select * from medico

create table estado_cita(
	id_cita serial not null,
	descripcion varchar(20) not null,
	constraint estado_cita_pk primary key (id_cita)
)

insert into estado_cita(descripcion) values
('Programada'),('Atendida'),('Cancelada')

select * from estado_cita

create table cita(
	id_cita serial not null,
	cedula_paciente char(10) not null,
	id_medico int not null,
	fecha date not null,
	hora time not null,
	estado int not null,
	constraint cita_pk primary key (id_cita),
	constraint paciente_fk foreign key (cedula_paciente) references paciente (cedula),
	constraint medico_fk foreign key (id_medico) references medico(id_medico),
	constraint estado_fk foreign key (estado) references estado_cita (id_cita)
)

insert into cita (cedula_paciente, id_medico, fecha, hora, estado) values
('0942677998', 1, '02/04/2026','15:00:00', 1),
('1792929301', 7, '01/03/2026','08:40:00', 1),
('1293930011', 6, '10/10/2026','07:30:00', 2),
('0812003156', 8, '11/06/2026','15:45:00', 1),
('0909658920', 2, '25/07/2026','16:00:00', 2),
('1629391000', 1, '22/04/2026','13:00:00', 1),
('1777929293', 5, '30/07/2026','11:30:00', 3),
('1777929293', 3, '07/05/2026','12:00:00', 1);


create table factura(
	id_factura serial not null,
	id_cita int not null,
	total money not null,
	fecha_emision date default current_date, --para que se me registre el dia de hoy!
	constraint factura_pk primary key (id_factura),
	constraint cita_fk foreign key (id_cita) references cita (id_cita)
)

--Se puede ingresar de esta forma el tipo de dato money en Postgre
insert into factura (id_cita, total)
values (1, '$44.99');

--O también de la forma tradicional
insert into factura(id_cita, total) values
(2, 35.50),(3, 79.99),(4, 100), (5, 66.8),
(6, 58.9), (7, 20.49), (8, 120.22);


-- drop table estado_cita
select * from paciente
select * from especialidad
select * from medico
select * from estado_cita
select * from cita
select * from factura


/*Ejercicios de consultas*/

-- 1: Mostrar todos los pacientes activos
select * from paciente
where estado = true

select * from paciente pa
where pa.estado = true

-- 2: Listar las citas con el nombre del paciente y del médico
select ci.id_cita as Cod_Cita , pa.nombres as nombre_paciente, me.nombre as nombre_del_medico 
from cita ci, paciente pa, medico me
where ci.id_medico = me.id_medico and ci.cedula_paciente = pa.cedula
group by ci.id_cita, pa.nombres, me.nombre


-- 3:Mostrar los médicos junto con su especialidad
select me.id_medico, me.nombre ,es.nombre
from medico me, especialidad es
where me.id_especialidad = es.id_especialidad


-- 4:Obtener los pacientes que no tiene citas registradas
select *
from paciente pa
where not exists(
	select 1
	from cita ci
	where ci.cedula_paciente = pa.cedula
)

-- 5:Listar las citas que estén en estado "cancelada"
select * from cita ci
where ci.estado = 3

select ci.id_cita, ci.cedula_paciente, eci.descripcion 
from cita ci, estado_cita eci
where ci.estado = 3 and ci.estado = eci.id_cita

--6: Mostrar el total facturado por cada medico.
select me.id_medico, me.nombre, sum(fac.total) as valor_total_porMedico 
from cita ci, medico me, factura fac
where ci.id_medico = me.id_medico and ci.id_cita = fac.id_cita
group by me.id_medico, me.nombre, fac.total


SELECT me.id_medico, 
       me.nombre, 
       SUM(fac.total) AS valor_total_porMedico 
FROM cita ci
JOIN medico me ON ci.id_medico = me.id_medico
JOIN factura fac ON ci.id_cita = fac.id_cita
GROUP BY me.id_medico, me.nombre;


--7: Obtener el paciente con mayor numero de citas 
select pa.nombres
from paciente pa, cita ci
where ci.cedula_paciente = pa.cedula

SELECT pa.nombres
FROM paciente pa
JOIN cita ci ON ci.cedula_paciente = pa.cedula
GROUP BY pa.nombres
HAVING COUNT(ci.id_cita) = (
    SELECT MAX(total)
    FROM (
        SELECT COUNT(*) AS total
        FROM cita
        GROUP BY cedula_paciente
    ) AS sub
);

--8: Mostrar las especialidades que no tienen medicos asignados
select * 
from especialidad es
where not exists(
	select 1
	from medico me
	where me.id_especialidad = es.id_especialidad
)

--9: Listar las citas realizadas en una fecha especifica
select * from cita ci
where ci.fecha between '01/03/2026' and '30/05/2026'

select * from cita
where fecha= '10/10/2026'


--10: Mostrar el promedio de facturación por especialidad

SELECT esp.id_especialidad, 
       esp.nombre, 
       AVG(fac.total::NUMERIC) AS valor_total_porEspecialidad 
FROM cita ci
JOIN medico me ON ci.id_medico = me.id_medico
JOIN especialidad esp ON me.id_especialidad = esp.id_especialidad
JOIN factura fac ON ci.id_cita = fac.id_cita 
GROUP BY esp.id_especialidad, esp.nombre


SELECT esp.id_especialidad, 
       esp.nombre, 
       ROUND(AVG(fac.total::NUMERIC),2) AS valor_total_porEspecialidad 
FROM cita ci
JOIN medico me ON ci.id_medico = me.id_medico
JOIN especialidad esp ON me.id_especialidad = esp.id_especialidad
JOIN factura fac ON ci.id_cita = fac.id_cita 
GROUP BY esp.id_especialidad, esp.nombre





