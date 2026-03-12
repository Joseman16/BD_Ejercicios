USE PracticaBD
GO

create table Cuentas(
	id int identity(1,1) not null,
	nombre varchar (50),
	saldo decimal(10,2),
	constraint Cuentas_pk primary key(id)
)


insert into Cuentas(nombre, saldo) 
values ('Jose', 1000),('Fernanda',600), ('Pablo',750)

select * from Cuentas
/*
	Begin transaction
		espacio de los updates
	rollback: deshace cambios no confirmados en una BD

*/
Begin transaction
update Cuentas
set saldo = saldo - 200
where id = 1

update Cuentas
set saldo = saldo + 200
where id = 2

rollback -- Este ultimo cancela la transacción

/*
	Begin transaction
		espacio de los updates
	commit: Control de transacciones que guarda de forma permanente

*/

Begin transaction
update Cuentas
set saldo = saldo - 200
where id = 1

update Cuentas
set saldo = saldo + 200
where id = 2

commit -- Guarda definitivamente los cambios

/*
	Haciendo una transacción con validaciones  
*/

select * from Cuentas


begin transaction 
update Cuentas
set saldo = saldo - 100
where id = 1

if(select saldo from Cuentas where id = 1) < 0
	begin
		rollback
		print 'No hay saldo suficiente'
	end
else
	begin 
		update Cuentas
		set saldo = saldo + 100
		where id = 2
	
		commit
		print 'Transferencia correcta'
	end

/*
	1er Ejercicio:
		-Reste 5 laptos
		-Si el stock queda negativo .-> ROLLBACK
		-Si no COMMIT
*/

create table Productos(
	id int identity (1,1) not null,
	nombre varchar(50) not null,
	stock int not null,
	constraint Productos_pk primary key (id)
)
insert into Productos 
values ('Laptop', 10),('Mouse',20),
('Teclado',14),('Monitor',12)

select * from Productos

/* Estoy quitandole la cantidad de stok en laptop*/
begin transaction 
if(select stock from Productos where nombre = 'Laptop') < 0
	begin 
		rollback
		print'No hay stock suficente'
	end
else
	begin
	update Productos 
	set stock = stock - 5
	where nombre = 'Laptop'
		commit
		print 'transacción exitosa!'
	end


	-- Otra forma para stock, declarar una variable de ayuda

begin transaction

declare @stock int 

select @stock = stock from Productos where id = 1

if @stock - 5 < 0
	begin
		print 'Stock insuficiente'
		ROLLBACK
	end
else
	begin
		update Productos
		set stock = stock - 5
		where id = 1

		commit
	end

/*
	2do Ejercicio:
		-aumenta el sueldo a juan +100
		-Disminuye sueldo a Ana -100
		-Si Ana queda con menos de 400 -> ROLLBACK
		-Si no -> COMMIT
*/
create table empleados3(
	id int identity(1,1) not null,
	nombre varchar(50) not null,
	sueldo decimal(10,2) not null,
	constraint empleado3_pk primary key (id)
)

insert into empleados3 
values ('Juan', 700),('Ana',500),('Rosa',200)

select * from empleados3

begin transaction

-- Aqui le digo que si el empleado con id 2 llegase a tener menos de 400, entonces no se efectua la transacción
-- A si mismo le indico que el empleado con id 1 tiene menos de 0, no puede realizar transacción ya que no tiene
if (select sueldo from empleados3 where id = 2) < 400 or (select sueldo from empleados3 where id = 1) <= 0
	begin
		rollback
		print 'No se concreto la transaccion'
	end
else
	begin
		update empleados3
		set sueldo = sueldo + 100
		where id = 1

		update empleados3
		set sueldo = sueldo - 100
		where id = 2

		commit
		print 'Se conrecto la transaccion'
	end

	select * from Productos

