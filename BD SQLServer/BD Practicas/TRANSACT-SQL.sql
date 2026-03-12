USE PracticaBD
GO

create table autos(
	marca varchar(20),
	modelo varchar(20),
	tipo varchar(20),
	color varchar(20),
);

select * from autos

-- bulk es abultar
bulk insert 
autos --tabla destino
from 'C:\SQL\TABLA_AUTOS.txt'
with (firstrow = 2)


/* TRANSACT-SQL, ROW_NUMBER(), RANK() y RANK() */

CREATE TABLE empleados2 (
    idempleado INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    cedula VARCHAR(20),
    direccion VARCHAR(150),
    telefono VARCHAR(20),
    puesto VARCHAR(50),
    salario DECIMAL(10,2),
    fecha_ingreso DATE
);

INSERT INTO empleados2 (nombre, apellido, cedula, direccion, telefono, puesto, salario, fecha_ingreso)
VALUES 
('Juan', 'Pérez', '001-1234567-1', 'Calle 10 #23, Santo Domingo', '809-555-0001', 'Gerente', 85000.00, '2022-01-10'),
('María', 'Gómez', '002-7654321-2', 'Av. Bolívar #56, Santo Domingo', '809-555-0002', 'Secretaria', 28000.00, '2021-03-05'),
('Carlos', 'Ramírez', '003-2345678-3', 'Calle Duarte #12, Santiago', '809-555-0003', 'Contador', 45000.00, '2020-07-12'),
('Ana', 'López', '004-9876543-4', 'Res. Las Palmas, Sto Dgo', '809-555-0004', 'Asistente', 22000.00, '2019-11-01'),
('Pedro', 'Santos', '005-1112223-5', 'Calle Mella #45, La Vega', '809-555-0005', 'Supervisor', 22000.00, '2023-02-20'),
('Laura', 'Rodríguez', '006-3334445-6', 'Av. Churchill #101, Sto Dgo', '809-555-0006', 'Vendedora', 25000.00, '2022-10-11'),
('Miguel', 'Fernández', '007-5556667-7', 'Calle 5 #89, San Cristóbal', '809-555-0007', 'Programador', 60000.00, '2023-05-03'),
('Sofía', 'Martínez', '008-7778889-8', 'Av. Libertad #70, Santiago', '809-555-0008', 'Analista', 48000.00, '2021-09-25'),
('Andrés', 'Torres', '009-9990001-9', 'Calle 8 #14, Santo Domingo', '809-555-0009', 'Recursos Humanos', 42000.00, '2020-01-17'),
('Elena', 'Morales', '010-2223334-0', 'Calle 12 #55, San Pedro', '809-555-0010', 'Cajera', 22000.00, '2019-06-30'),
('Javier', 'Castillo', '011-4445556-1', 'Calle Principal #32, Bonao', '809-555-0011', 'Técnico', 22000.00, '2022-03-10'),
('Paola', 'Herrera', '012-6667778-2', 'Av. México #90, Sto Dgo', '809-555-0012', 'Diseñadora', 35000.00, '2023-01-01'),
('Luis', 'Vargas', '013-8889990-3', 'Calle 3 #22, La Romana', '809-555-0013', 'Mensajero', 18000.00, '2018-04-12'),
('Valentina', 'Rivas', '014-0001112-4', 'Calle F #77, Nagua', '809-555-0014', 'Marketing', 37000.00, '2022-09-09'),
('Roberto', 'Jiménez', '015-2223334-5', 'Calle J #18, Sto Dgo', '809-555-0015', 'Chofer', 21000.00, '2021-12-15'),
('Daniela', 'Mejía', '016-4445556-6', 'Urbanización Los Prados, SD', '809-555-0016', 'Supervisora', 40000.00, '2020-05-22'),
('Héctor', 'Cabrera', '017-6667778-7', 'Av. Duarte #44, Santo Domingo', '809-555-0017', 'Seguridad', 19000.00, '2019-08-01'),
('Isabel', 'Sánchez', '018-8889990-8', 'Calle 2 #90, Santiago', '809-555-0018', 'Cocinera', 17000.00, '2023-04-15'),
('Tomás', 'Reyes', '019-0001112-9', 'Barrio los Mina, SD Este', '809-555-0019', 'Almacén', 23000.00, '2022-07-30'),
('Patricia', 'Guzmán', '020-2223334-1', 'Calle Real #23, Baní', '809-555-0020', 'Auxiliar', 21000.00, '2021-02-14'),
('Eduardo', 'Peña', '021-4445556-2', 'Calle D #12, Higüey', '809-555-0021', 'Gerente', 90000.00, '2018-01-08'),
('Gabriela', 'Silva', '022-6667778-3', 'Av. España, SD Este', '809-555-0022', 'Analista', 46000.00, '2020-09-19'),
('Ricardo', 'Navarro', '023-8889990-4', 'Calle 19 #8, Bonao', '809-555-0023', 'Soporte Técnico', 32000.00, '2023-02-01'),
('Karla', 'Soto', '024-0001112-5', 'Av. Luperón #150, Sto Dgo', '809-555-0024', 'Vendedora', 26000.00, '2019-03-28'),
('Fernando', 'Paredes', '025-2223334-6', 'Calle H #10, San Cristóbal', '809-555-0025', 'Mecánico', 31000.00, '2021-11-11'),
('Yolanda', 'Campos', '026-4445556-7', 'Calle G #57, La Vega', '809-555-0026', 'Enfermera', 38000.00, '2020-06-05'),
('Manuel', 'Delgado', '027-6667778-8', 'Av. Sabana Larga, SD Este', '809-555-0027', 'Conserje', 15000.00, '2023-03-20'),
('Cecilia', 'Arroyo', '028-8889990-9', 'Calle I #33, Sto Dgo', '809-555-0028', 'Contadora', 47000.00, '2022-12-02'),
('Óscar', 'Bermúdez', '029-0001112-0', 'Urbanización Mirador Norte, SD', '809-555-0029', 'IT Manager', 95000.00, '2017-10-10'),
('Diana', 'Tejada', '030-2223334-7', 'Av. San Vicente, SD Este', '809-555-0030', 'Asistente', 23000.00, '2023-06-01');

SELECT * FROM empleados2

select * from empleados2 order by salario ASC

select * from empleados2 order by salario DESC

-- row_number(): definiendo una funcioón de ventana que va asignar números

select 
	nombre, apellido, cedula, salario, row_number() over(order by salario desc) as Ranking_salario 
from empleados2; --Este sigue la secuencia


--rank(): nivel es justo, y es capaz de colocarlos en el mismo ranking si tienen los mismos datos...
-- En este caso si 3 personas ganan lo mismo, los 3 estaran en el mismo ranking ose el ranking 21...
select 
	nombre, apellido, cedula, salario, rank() over(order by salario desc) as Ranking_salario 
from empleados2;

--dense_rank(): es te es parecido a "rank()" ya que asigna a varios el mismo ranking si tiene los mismos valores
select 
	nombre, apellido, cedula, salario, dense_rank() over(order by salario desc) as Ranking_salario 
from empleados2;


/*
Diferencias de rank() y dense_rank()

	rank() se salta la numeración por si estan en empate, ejemplo:
		jose 20, este en verdad es 20
		hugo 20, este este en verdad es 21
		teresa 20, este este en verdad es 22
		milena 23, este este en verdad es 23

	y 

	dense_rank() NO se salta la numeración
		jenifer 15,
		matias 15,
		mandy 15,
		josue 15,
		marlon 16
		terry 16,
		sara 17,
*/

/*TRANSACT-SQL: FIRST VALUE*/

CREATE TABLE ventas (
    idvendedor INT,
    ciudad VARCHAR(50),
    pais VARCHAR(50),
    cuota_ventas MONEY,
    comision MONEY,
    ven_ult_anio MONEY,
    fecha DATE
);

INSERT INTO ventas (idvendedor, ciudad, pais, cuota_ventas, comision, ven_ult_anio, fecha)
VALUES
    (1, 'Buenos Aires', 'Argentina', 2500.00, 150.00, 785432, '2019-05-10'),
    (2, 'Rosario', 'Argentina', 3800.00, 230.00, 623591, '2020-07-22'),
    (3, 'Córdoba', 'Argentina', 4200.00, 250.00, 752164, '2021-09-14'),
    (4, 'Mendoza', 'Argentina', 3100.00, 190.00, 926532, '2022-12-01'),
    (5, 'Mar del Plata', 'Argentina', 2700.00, 160.00, 531246, '2023-03-29'),
    (6, 'Sao Paulo', 'Brasil', 2900.00, 180.00, 654821, '2018-11-05'),
    (7, 'Río de Janeiro', 'Brasil', 4100.00, 240.00, 719638, '2019-10-18'),
    (8, 'Belo Horizonte', 'Brasil', 3600.00, 210.00, 897421, '2020-08-27'),
    (9, 'Salvador', 'Brasil', 3800.00, 220.00, 613579, '2021-06-02'),
    (10, 'Fortaleza', 'Brasil', 3200.00, 190.00, 735214, '2022-04-14'),
    (11, 'Ciudad de México', 'México', 2700.00, 160.00, 926485, '2019-01-07'),
    (12, 'Guadalajara', 'México', 3500.00, 210.00, 598723, '2020-02-21'),
    (13, 'Monterrey', 'México', 3900.00, 230.00, 813579, '2021-03-17'),
    (14, 'Puebla', 'México', 3200.00, 190.00, 754921, '2022-06-10'),
    (15, 'Tijuana', 'México', 2900.00, 170.00, 629348, '2023-09-03'),
    (16, 'Lima', 'Perú', 2800.00, 160.00, 832457, '2018-12-15'),
    (17, 'Arequipa', 'Perú', 3300.00, 200.00, 746921, '2019-11-27'),
    (18, 'Trujillo', 'Perú', 3600.00, 210.00, 925317, '2020-10-09'),
    (19, 'Chiclayo', 'Perú', 3100.00, 180.00, 618493, '2021-08-22'),
    (20, 'Cusco', 'Perú', 3000.00, 170.00, 743215, '2022-07-05'),
    (21, 'Rosario', 'Argentina', 2900.00, 180.00, 675821, '2019-08-05'),
    (22, 'Córdoba', 'Argentina', 3100.00, 190.00, 743216, '2020-09-18'),
    (23, 'Mendoza', 'Argentina', 2500.00, 150.00, 562714, '2021-11-02'),
    (24, 'Mar del Plata', 'Argentina', 2700.00, 160.00, 891457, '2022-12-30'),
    (25, 'Sao Paulo', 'Brasil', 3800.00, 220.00, 725913, '2018-10-10'),
    (26, 'Río de Janeiro', 'Brasil', 3600.00, 210.00, 914573, '2019-12-22'),
    (27, 'Belo Horizonte', 'Brasil', 3200.00, 190.00, 671942, '2020-08-05'),
    (28, 'Salvador', 'Brasil', 3100.00, 180.00, 859613, '2021-05-19'),
    (29, 'Fortaleza', 'Brasil', 2800.00, 170.00, 612374, '2022-03-03'),
    (30, 'Ciudad de México', 'México', 3900.00, 230.00, 759281, '2019-04-15'),
    (31, 'Guadalajara', 'México', 3700.00, 220.00, 923671, '2020-06-29'),
    (32, 'Monterrey', 'México', 3300.00, 200.00, 674192, '2021-08-13'),
    (33, 'Puebla', 'México', 3000.00, 180.00, 842519, '2022-11-01'),
    (34, 'Tijuana', 'México', 2600.00, 160.00, 536192, '2023-02-25'),
    (35, 'Lima', 'Perú', 3100.00, 190.00, 753219, '2019-01-12'),
    (36, 'Arequipa', 'Perú', 3300.00, 200.00, 924617, '2020-02-24'),
    (37, 'Trujillo', 'Perú', 3400.00, 200.00, 691534, '2021-04-08'),
    (38, 'Chiclayo', 'Perú', 2900.00, 170.00, 813597, '2022-06-22'),
    (39, 'Cusco', 'Perú', 2700.00, 160.00, 576921, '2023-08-06'),
    (40, 'Santiago', 'Chile', 3200.00, 190.00, 748315, '2018-09-20');


select * from ventas;
	
select MAX(ven_ult_anio) from ventas

--Manejar los campos de tipo contador de nuestra tabla

select a.idvendedor, a.ven_ult_anio from ventas a
order by a.ven_ult_anio desc

select * from ( --En mi opinión parece una sunconsulta
		select ROW_NUMBER() over (order by a.ven_ult_anio desc) as contador,
		a.idvendedor, a.ven_ult_anio from ventas a) as a
		where a.contador = 1


select a.idvendedor, a.ven_ult_anio from (
		select ROW_NUMBER() over (order by a.ven_ult_anio desc) as contador,
		a.idvendedor, a.ven_ult_anio from ventas a) as a
		where a.contador = 1

-- Hacemos la misma consula de arriba, pero utilizando first_value()
select FIRST_VALUE(a.idvendedor) over(order by a.ven_ult_anio desc) as contador,
	a.idvendedor, a.ven_ult_anio 
from ventas as a --se encarga de retornar  el 1er valor de un conjunto ordenado de valores

/* Lo pasamos a un SubQuery o una SubConsulta */

Select * from ventas a
where a.idvendedor = (
	select distinct FIRST_VALUE(a.idvendedor) over(order by a.ven_ult_anio desc) as contador
		from ventas as a);


