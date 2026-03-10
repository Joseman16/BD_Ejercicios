USE PracticaBD
GO

create table facturas(
  numero int not null,
  fecha datetime,
  cliente varchar(30),
  primary key(numero)
);

create table detalles(
  numerofactura int not null,
  numeroitem int not null, 
  articulo varchar(30),
  precio decimal(5,2),
  cantidad int,
  primary key(numerofactura,numeroitem),
   constraint FK_detalles_numerofactura
   foreign key (numerofactura)
   references facturas(numero)
   on update cascade
   on delete cascade
);

go

set dateformat ymd;

INSERT INTO facturas (numero, fecha, cliente) VALUES
  (1, '2023-06-28', 'Juan Pérez'),
  (2, '2023-06-28', 'María González'),
  (3, '2023-06-28', 'Carlos López'),
  (4, '2023-06-28', 'Ana Rodríguez'),
  (5, '2023-06-28', 'Luisa Martínez'),
  (6, '2023-06-28', 'Pedro Hernández'),
  (7, '2023-06-28', 'Laura Gómez'),
  (8, '2023-06-28', 'Diego Torres'),
  (9, '2023-06-28', 'Valentina Ramírez'),
  (10, '2023-06-28', 'Andrés Silva'),
  (11, '2023-06-28', 'Camila Vargas'),
  (12, '2023-06-28', 'Mateo Castro'),
  (13, '2023-06-28', 'Isabella Rios'),
  (14, '2023-06-28', 'Santiago Morales'),
  (15, '2023-06-28', 'Valeria Rojas'),
  (16, '2023-06-28', 'Daniel Acosta'),
  (17, '2023-06-28', 'Mariana Duarte'),
  (18, '2023-06-28', 'Alejandro Cardona'),
  (19, '2023-06-28', 'Fernanda Mendoza'),
  (20, '2023-06-28', 'Gabriel Medina');

INSERT INTO detalles (numerofactura, numeroitem, articulo, precio, cantidad) VALUES
  (1, 1, 'Lápiz', 1.99, 5),
  (1, 2, 'Cuaderno', 3.99, 3),
  (1, 3, 'Bolígrafo', 0.99, 10),
  (2, 1, 'Goma de borrar', 0.5, 8),
  (2, 2, 'Marcadores', 2.49, 4),
  (2, 3, 'Pegamento', 1.99, 2),
  (3, 1, 'Regla', 1.25, 5),
  (3, 2, 'Tijeras', 2.99, 2),
  (3, 3, 'Notas adhesivas', 0.75, 6),
  (4, 1, 'Lápices de colores', 4.99, 1),
  (4, 2, 'Borrador', 0.99, 3),
  (4, 3, 'Cinta adhesiva', 1.49, 2),
  (5, 1, 'Resaltador', 1.75, 4),
  (5, 2, 'Papel de carta', 2.99, 2),
  (5, 3, 'Clips', 0.25, 10),
  (6, 1, 'Corrector líquido', 1.99, 3),
  (6, 2, 'Carpeta', 2.49, 2),
  (6, 3, 'Sacapuntas', 0.99, 5),
  (7, 1, 'Calculadora', 9.99, 1),
  (7, 2, 'Agenda', 4.99, 1),
  (8, 1, 'Lápiz', 1.99, 5),
  (8, 2, 'Cuaderno', 3.99, 3),
  (8, 3, 'Bolígrafo', 0.99, 10),
  (9, 1, 'Goma de borrar', 0.5, 8),
  (9, 2, 'Marcadores', 2.49, 4),
  (9, 3, 'Pegamento', 1.99, 2),
  (10, 1, 'Regla', 1.25, 5),
  (10, 2, 'Tijeras', 2.99, 2),
  (10, 3, 'Notas adhesivas', 0.75, 6),
  (11, 1, 'Lápices de colores', 4.99, 1),
  (11, 2, 'Borrador', 0.99, 3),
  (11, 3, 'Cinta adhesiva', 1.49, 2),
  (12, 1, 'Resaltador', 1.75, 4),
  (12, 2, 'Papel de carta', 2.99, 2),
  (12, 3, 'Clips', 0.25, 10),
  (13, 1, 'Corrector líquido', 1.99, 3),
  (13, 2, 'Carpeta', 2.49, 2),
  (13, 3, 'Sacapuntas', 0.99, 5),
  (14, 1, 'Calculadora', 9.99, 1),
  (14, 2, 'Agenda', 4.99, 1),
  (15, 1, 'Lápiz', 1.99, 5),
  (15, 2, 'Cuaderno', 3.99, 3),
  (15, 3, 'Bolígrafo', 0.99, 10),
  (16, 1, 'Goma de borrar', 0.5, 8),
  (16, 2, 'Marcadores', 2.49, 4),
  (16, 3, 'Pegamento', 1.99, 2),
  (17, 1, 'Regla', 1.25, 5),
  (17, 2, 'Tijeras', 2.99, 2),
  (17, 3, 'Notas adhesivas', 0.75, 6),
  (18, 1, 'Lápices de colores', 4.99, 1),
  (18, 2, 'Borrador', 0.99, 3),
  (18, 3, 'Cinta adhesiva', 1.49, 2),
  (19, 1, 'Resaltador', 1.75, 4),
  (19, 2, 'Papel de carta', 2.99, 2),
  (19, 3, 'Clips', 0.25, 10),
  (20, 1, 'Corrector líquido', 1.99, 3),
  (20, 2, 'Carpeta', 2.49, 2),
  (20, 3, 'Sacapuntas', 0.99, 5),
  (1, 4, 'Calculadora', 9.99, 1),
  (1, 5, 'Agenda', 4.99, 1);


  /* SUBCONSULTAS */
-- Las subconsultas debe ir entre parentesis.
-- Se debe especificar solo una columna o expresión.
-- No pueden contener claususlas "between" ni "like"
-- No pueden contener "Order By"
-- No usar con Update en una tabla
-- No se puede usar un delete

/*
Posibles funciones a utilizar:
	IN
	ANY
	ALL
	EXISTS
*/

--Hacer inserccíones en empleados para luego practica 
insert into Empleados(nombre, apellido, edad, telefono, direccion, fecha_nacimiento, salario, activo) 
values ('Irina','Folleco',29, '22112211', 'Av Juan Tanca Marengo', '1997-12-10', 2100, 'SI'),
('Petter','Ruiz',22, '22112211', 'Av Juan Tanca Marengo', '2003-11-16', 1100, 'SI'),
('Gabriela','Castaño',28, '22112211', 'Av Juan Tanca Marengo', '1999-04-05', 1750, 'SI'),
('Damian','Blanco',33, '22112211', 'Av Juan Tanca Marengo', '1996-08-01', 2050, 'NO'),
('Karen','Miranda',50, '22112211', 'Av Juan Tanca Marengo', '1975-02-22', 3150, 'SI')


/*
	No es lo mas recomendado, pero le estoy dando su id, ya que me olvide que la tabla no 
	le agregue la propiedad identity(1,1)
	No es comun darle un id, atravez del nombre... (Update)
*/
update Empleados set idEmpleado = 7
where nombre = 'Karen'

select * from facturas

select * from detalles

select * from Empleados
--Promedio salarial de los empleados
select AVG (salario) from Empleados

--Cuales empleados ganan mas o igual al salario promedio
select idEmpleado, nombre, apellido, salario 
from Empleados
where salario >= (select AVG (salario) from Empleados)

/* Creación de tablas para hacer las subconsultas */

create table clientes(
	idCliente int identity(1,1) not null,
	nombre varchar(20) not null,
	direccion nvarchar(50) not null,
	ciudad varchar(20) not null,
	codigo_postal nvarchar(15) not null,
	pais varchar(15) not null,
	constraint clientes_pk primary key (idCliente)
)

insert clientes(nombre, direccion, ciudad, codigo_postal, pais)
values ('Maria Garcia', 'Calle siempre viva', 'Guayaquil', '0929231', 'Ecuador'),
('Carmen Gonzales', 'Calle siempre viva', 'Monterrey', '1213321', 'Mexico'),
('Juan Jose', 'Calle Salsa buena', 'Bogota', '1221373', 'Colombia'),
('Hugo Benabidez', 'Los chorillos', 'Lima', '4524232', 'Peru'),
('Pablo Nuñez', 'Parque de las mercedes', 'Quito', '0929222', 'Ecuador'),
('Lionel Messi', 'Palermo y Av Central', 'Buenos Aires', '1732143', 'Argentina'),
('Gonzalo Plata', '9 de octubre y Boyaca', 'Guayaquil', '0929231', 'Ecuador'),
('Stefany Rosario', 'Calle 123 de amor', 'Medellin', '1221373', 'Colombia'),
('Karla Tomala', 'Plaza de los gatos', 'Cali', '1121373', 'Colombia'),
('Rafaela Bueno', 'Calle siempre viva', 'Cuenca', '0929231', 'Ecuador')

insert clientes(nombre, direccion, ciudad, codigo_postal, pais)
values ('Toño Garcia', 'Plaza la independencia', 'Sinaloa', '1213321', 'Mexico'),
('Magdalena Paredez', 'Los Mayas vivos 23', 'Ciudad de Mexico', '1213321', 'Mexico'),
('Naruto Hernandez', 'Av America nueva', 'Tijuana', '1213321', 'Mexico')

select * from clientes

-- Subconsulta de buscar clientes de Mexico
select cli.idCliente from clientes cli
where cli.pais = 'Mexico'

-- Buscar todos lo nombre de clientes con idCliente de 

select nombre, ciudad from clientes 
where idCliente in (select idCliente from clientes
					where pais = 'Mexico'
					)

select nombre, ciudad from clientes --any 
-- Donde el idcliente sea igual  a cualquier coincidencia (any), es decir el valor que venga en la subconsulta
where idCliente = any (select idCliente from clientes
					where pais = 'Mexico'
					)

/* Clausula "exists" y "not exists" */

-- any: busca cualquier valor que coincida
-- exists: va a buscar especificamente lo que estamos sugiriendo

select * from facturas
select * from detalles

--Cuales Clientes han comprado Lapices

/*
	Aqui basicamente le indico que me traiga los detlles de 
	la factura numero (id de factura) sea igual al numeroFactura de 
	"detalles", y a la vez que el articulo de detalle sea "Lápiz"
*/
(select * from  detalles 
where f.numero  = d.numerofactura 
and d.articulo = 'Lápiz')


select cliente, numero, fecha 
from facturas f -- Aqui le indico que si existe informacón ya ante mencionada, que la traiga
where exists(select * from  detalles d
where f.numero  = d.numerofactura
and d.articulo = 'Lápiz')

--Cuales Clientes no han comprado Lapices

select cliente, numero, fecha 
from facturas f -- Aqui le indico que si existe informacón ya ante mencionada, que la traiga
where not exists(select * from  detalles d
where f.numero  = d.numerofactura
and d.articulo = 'Lápiz')
