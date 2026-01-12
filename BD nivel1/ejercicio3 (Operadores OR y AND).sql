
/*Ingresar datos en la BD*/

insert into personas(cedula, nombre, apellido)
values('1793209321','Hugo','Serrano');

insert into personas(cedula, nombre, apellido)
values('1231332402','Rafael','Nadal');

insert into personas(cedula, nombre, apellido)
values('1232777340','Enner','Valencia'),
	('0983831832','Leonel','Messi'),
	('1521912939','Cristiano','Ronaldo'),
	('1388771111','Juliana','Robins');


/*En esta consulta debe cumplir todas las condiciones*/
select * from personas
where nombre = 'Leonel' and apellido='Messi' and estatura is null


select * from personas
where nombre = 'Leonel' or nombre = 'Teresa' or nombre='Hugo'

-- personas que se llamen leonel o Hugo y su estatura null --
select * from personas
where (nombre = 'Leonel' or nombre = 'Hugo') and estatura is null


-- personas que se llamen leonel o Hugo y su estatura null o estatura > 1.50 --
select * from personas
where (nombre = 'Leonel' or nombre ='Hugo') 
and (estatura is null or estatura > 1.50)


