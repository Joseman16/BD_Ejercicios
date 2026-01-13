
--Vamos usar "serial" en vez de "int" --
--Con serial: se autoincremeta el id --
create table estudiante(
	id_estudiante serial not null,
	cedula char(10) not null,
	nombres varchar(50) not null,
	apellidos varchar(50) not null,
	edad int not null,
	correo varchar(40), 
	estado boolean not null,
	constraint estudiante_pk primary key (id_estudiante)
)

-- llamar a toda la tabla estudiante --
select * from estudiante

--Eliminar tabla de una BDD (estudiante)--
drop table estudiante

--Ingresar datos en la tabla --
insert into estudiante (cedula, nombres, apellidos, edad, correo, estado) values
('0942677111','Jose','Leon',22, 'jose.leoncar@ug.edu.ec', true),
('0942677202','Joaquin','Correa',19, 'joaquinCor@gmail.com', true),
('1342677998','Santiago','Bernabeu',19, 'San123iago@hotmail.com', false),
('1422394950','Derek','Carranza',28, 'DerekCarranza@hotmail.com', true),
('0911111323','Jennifer','Lopez',25, 'JenLopez@ug.edu.ec', true),
('1722838940','Sara','Toscano',30, 'SaraToscano.lor@ug.edu.ec', false),
('1304959502','Rosario','Tijera',27, 'Rosarii_Tije@gmail.com', true),
('0932898293','Karla','Carpio',29, 'Karlaa_carpio@Outlook.ec', false),
('0999902221','Carmen','Gonzales',21, 'carmen_gonzaDu@gmail.com', false),
('1572824032','Hugo','Carrera',18, 'hugo_Carrera@gmail.com', true),
('0978488921','Justin','Leon',17, 'justin.LeonZam@ecotec.edu.ec', true);


--Eliminar un dato de la tabla
delete from estudiante
where cedula = '0942677998'


create table cursos(
	id_curso serial not null,
	nombre_Curso varchar(40) not null,
	creditos int not null,
	horas int not null,
	estado boolean not null,
	constraint cursos_pk primary key (id_curso)
)

insert into cursos (nombre_curso, creditos, horas, estado) values 
('programación python', 3, 30, true),
('Contabilidad', 4, 40, true),
('programación C#', 5, 50, false),
('programación c++', 3, 45, true),
('Finanzas', 3, 40, true),
('Base de datos', 3, 40, true),
('Base de datos avanzados', 3, 40, true),
('programación en PsInt', 2, 30, false),
('Sistemas Operativos', 3, 26, false);

--Eliminar tabla de una BDD (cursos)--
drop table cursos

-- llamar a todos de la tabla cursos --
select * from cursos


create table matriculas(
	id_matricula serial not null,
	id_estudiante int not null,
	id_curso int not null,
	fecha_matricula date not null,
	nota_final decimal not null,

	constraint matricula_pk primary key (id_matricula),
	constraint estudiante_fk foreign key(id_estudiante) references estudiante (id_estudiante ),
	constraint curso_fk foreign key (id_curso) references cursos (id_curso)
)

--Eliminar tabla de una BDD (matriculas)--
drop table matriculas

--Eliminar un dato en matricula por id --
delete from matriculas
where id_matricula = 2

-- Trae a todas las matriculas --
select * from matriculas

--Llamar a las dos tablas curso y estudiante --
select * from cursos, estudiante
select cu.id_curso, cu.nombre_curso, es.id_estudiante, es.nombres from cursos cu, estudiante es

insert into matriculas (id_estudiante, id_curso, fecha_matricula ,nota_final) values
(1, 2, '16/08/2026', 10),
(2, 3, '05/08/2025', 9),
(4, 1, '19/08/2024', 5.9),
(5, 1, '20/11/2025', 6.44),
(6, 9, '31/12/2025', 9),
(6, 5, '20/10/2025', 10),
(7, 7, '30/04/2025', 8.99),
(8, 7, '01/03/2025', 8.32),
(10, 9, '02/01/2026', 9.34),
(11, 5, '07/01/2026', 7.98),
(11, 6, '11/01/2025', 7),
(7, 5, '10/06/2025', 8),
(7, 3, '11/08/2025', 6.85);


--Eliminar todo los datos de la BDD (matriculas) --
delete from matriculas

select * from estudiante
select * from cursos
select * from matriculas

/*Aqui en los retos (consultas) hice un plus, que consiste en hacer la misma consulta, pero lo contrario*/

--1: Listar todos los estudiantes activos --

select * from estudiante
where estado = true

select * from estudiante
where estado = false

--2:  Mostrar los cursos con más de 3 créditos --
select * from cursos
where creditos > 3

select * from cursos
where creditos < 4


--3: Mostra los estudiante mayores de 20 años --
select * from estudiante
where edad > 20

select * from estudiante
where edad < 21

--4: Listar el nombre del estrudiante junto con el curso en el que esta matriculado --
select es.nombres, cu.id_curso, cu.nombre_curso from estudiante es, cursos cu, matriculas ma
where ma.id_estudiante = es.id_estudiante and ma.id_curso = cu.id_curso

--5: Mostrar los estudiantes que no estan matriculados en ningun curso --
select es.id_estudiante, es.nombres
from estudiante es
where not exists(
	select 1 -- El valor que se seleccione NO importa, solo importa si existe o no una fila. también se puede utilizar "*"--
	from matriculas ma
	where ma.id_estudiante = es.id_estudiante
)

--6: Obtener el promedio de notas por curso.
select sum(ma.nota_final)/count(es) as promedio
from matriculas ma, estudiante es

--7: Mostrar los estudiantes que tienen una nota mayor o igual a 8
select es.id_estudiante, cu.nombre_curso ,es.nombres, ma.nota_final 
from estudiante es, matriculas ma, cursos cu
where ma.nota_final >= 8 and (ma.id_estudiante = es.id_estudiante and ma.id_curso = cu.id_curso) 

--8: Contar cuantos estudiantes hay por curso
SELECT 
    cu.id_curso,
    cu.nombre_curso,
    COUNT(es.id_estudiante) AS cantidad
FROM cursos cu, estudiante es, matriculas ma
WHERE ma.id_curso = cu.id_curso
  AND ma.id_estudiante = es.id_estudiante
GROUP BY cu.id_curso, cu.nombre_curso;


--9: Mostrar los cursos que no tienen estudiante matriculados

select cu.id_curso, cu.nombre_curso 
from cursos cu
where not exists(
	select 1
	from matriculas ma
	where ma.id_curso = cu.id_curso
);

--10: Listar estudiantes ordenados por apellido de forma ascendente
select * from estudiante es order by es.apellidos asc








