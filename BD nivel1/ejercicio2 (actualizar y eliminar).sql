select * from personas 
where cedula = '1212212132'

/*Actualizar datos*/

/*Si ejecuto este comando, lo que hace es actualizar toda la columna con dicho valor (1.70)*/
/*Es un Upate sin where*/
update personas set estatura = 1.70


/*Update con where*/
update personas set estatura = 1.70
where cedula= '1212212132'

/*Colocar todas las cuentas ahorradas en 0 siempre y caundo esten en null (cuenta_ahorrada)*/
update personas set cantidad_ahorrada = 0.0
where cantidad_ahorrada is null

/*Colocar todas las filas, que en la columna hijo esten en null, actualizarla y colocar 0 (0 hijos).*/
update personas set numero_hijos = 0
where numero_hijos is null

select * from personas
where cedula = '0942677998'

update personas set estatura = 1.80, fecha_nacimiento='16/11/2003'
where cedula ='0942677998'

/*DELETE = ELIMINAR */

select * from personas

/*Aqui elimino a la persona que tenga la siguiente cedula = '0942677998'*/
delete from personas
where cedula = '0942677998'

/*Aqui estoy eliminando todo las personas que tenga estatura null*/
delete from personas
where estatura is null


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







