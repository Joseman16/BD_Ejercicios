select * from paciente
select * from especialidad
select * from medico
select * from estado_cita
select * from cita
select * from factura

/************* EJEMPLOS DE INNER JOIN *************/
select *
from paciente pa
inner join cita
on pa.cedula = cita.cedula_paciente

select *
from cita ci
inner join estado_cita
on ci.estado = estado_cita.id_cita

select * 
from cita ci
inner join medico
on ci.id_medico = medico.id_medico


select * from estado_cita

--1: Listado de citas con información completa
select paciente.cedula, paciente.nombres, medico.nombre, especialidad.nombre, ci.fecha, ci.hora, estado_cita.descripcion
from cita ci 
inner join paciente on paciente.cedula = ci.cedula_paciente
inner join medico on medico.id_medico = ci.id_medico
inner join especialidad on especialidad.id_especialidad = medico.id_especialidad
inner join estado_cita on estado_cita.id_cita = ci.id_cita


--2: Paciente atendidos por especialidad
select paciente.nombres, medico.nombre, especialidad.nombre, ci.fecha
from cita ci
inner join paciente on paciente.cedula = ci.cedula_paciente
inner join medico on medico.id_medico = ci.id_medico
inner join especialidad on especialidad.id_especialidad = medico.id_especialidad
where ci.estado = 2

select * from cita
where cita.estado = 2

--3: Historial de citas por paciente
select paciente.nombres, ci.fecha, ci.hora, medico.id_medico, estado_cita.descripcion
from cita ci
inner join medico on medico.id_medico = ci.id_medico
inner join estado_cita on estado_cita.id_cita = ci.estado
inner join paciente on paciente.cedula = ci.cedula_paciente
order by paciente.nombres

--4: Medicos y números de citas programadas
select medico.nombre, especialidad.nombre, count(ci.id_cita) as cantidad_cita
from cita ci
inner join medico on medico.id_medico = ci.id_medico
inner join especialidad on especialidad.id_especialidad = medico.id_especialidad
group by medico.nombre, especialidad.nombre

--5: Facturación por citas
select * from factura

select fa.id_factura, paciente.nombres, medico.nombre, especialidad.nombre, count(fa.id_factura) as cantidad_factura, fa.fecha_emision
from factura fa
inner join cita on cita.id_cita = fa.id_cita
inner join paciente on paciente.cedula = cita.cedula_paciente
inner join medico on medico.id_medico = cita.id_cita
inner join especialidad on especialidad.id_especialidad = medico.id_especialidad
group by fa.id_factura, paciente.nombres, medico.nombre, especialidad.nombre,fa.fecha_emision


--6: Paciente con citas canceladas

select * from estado_cita
select * from cita where cita.estado = 3

select pa.nombres, pa.telefono, medico.nombre, cita.fecha, cita.hora
from paciente pa
inner join cita on cita.cedula_paciente = pa.cedula
inner join medico on medico.id_medico = cita.id_medico
where cita.estado = 3








