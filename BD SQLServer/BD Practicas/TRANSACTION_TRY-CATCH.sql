USE PracticaBD
GO

create table productos2(
	id int identity(1,1) not null,
	nombre varchar(50) not null,
	stock int not null,
	constraint productos2_pk primary key (id)
)

select * from productos2

insert into productos2 
values ('Laptop', 10),('Monitor',12), ('Mouse',8)

/* DISMINUIR STOCK CON CONTROL DE ERROR */

begin try
	begin transaction
	declare @stock int

	select @stock = stock 
	from productos2 
	where id = 1

	if @stock < 8 
		begin
			print 'No hay suficiente stock'
			rollback
		end
	else 
		begin
			update productos2
			set stock = stock - 8
			where id = 1

			commit
			print 'Operación correcta'
		end

end try
begin catch
	print 'Ocurrio un error'
	rollback
end catch

/*
	1er Ejercicio:
		- Quite 200 a Jose
		- Agregue 200 a Maria
		- Si Jose queda en saldo negativo -> ROLLBACK
		- Si todo esta bien -> COMMIT 
		-Usar try catch

*/

create table cuentas2(
	id int identity(1,1) not null,
	nombre varchar(50) not null,
	saldo int not null,
	constraint cuenta2_pk primary key (id)
)

insert into cuentas2 (nombre, saldo)
values ('jose',700), ('maria',200),('silvia',550)

select * from cuentas2

begin try
	begin transaction
	declare @saldo int

	select @saldo = saldo from cuentas2
	
	if @saldo < 0
		begin 
			print 'No se puede efectuar la transaccion'
			rollback
		end
	else
		begin
			update cuentas2
			set saldo = saldo - 200 
			where id = 1

			update cuentas2 
			set saldo = saldo + 200
			where id = 2
			
			print 'Se pudo efectuar la transacción'
			
			commit
		end
end try
begin catch
	print 'Ocurrio un error'
	ROLLBACK
end catch

/*
	2do Ejercicio:
		-Restar 5 al teclado
		-Si no hay suficiente stock -> ROLLBACK
		-Si hay suficiente -> COMMIT
		-Usar try catch
*/

create table articulos(
	id int identity(1, 1) not null,
	nombre varchar(50) not null,
	stock int not null,
	constraint articulos_pk primary key (id)
)

insert into articulos 
values ('teclado', 3),('monitor', 7)

select * from articulos

	update articulos
	set stock = stock + 5
	where id = 1

begin try
	begin transaction
	declare @stock int
	declare @solicitado int

	select @stock = stock from articulos where id = 1
	set @solicitado = 5	 

	if @stock < @solicitado 
		begin 
			print 'El stock es menor de lo solicitado'
			rollback
		end
	else
		begin
			update articulos
			set stock = stock - @solicitado 
			where id = 1
		end
end try
begin catch
	print 'Ocurrio un error!'
	rollback
end catch

/* AHORA SE UTILIZARA LAS TRANSACTIONS DENTRO DE UN PROCEDMIENTO ALAMACENADO */


select * from articulos

create procedure DisminuirStock
	@id int,
	@cantidad int
as
begin
begin try
	begin transaction
	
	declare @stock int 
	
	select @stock = stock 
	from articulos
	where id = @id

	if @stock < @cantidad
		begin
			print 'El stock no es suficiente!'
			rollback
		end
	else
		begin
			print 'Stock actualizado!'
			update articulos
			set stock = stock - @cantidad
			where id = @id
		
			commit
		end
end try
begin catch
	print 'Ocurrio un error!'
	rollback
end catch

end

select * from articulos

exec DisminuirStock 1, 1
--------------------------------------------------------------------------------

select * from cuentas2

create procedure sp_transferirDinero
	@id_proveedor int,
	@id_acreedor int,
	@saldo int
as
begin 
begin try
	declare @saldo_proveedor int

	select @saldo_proveedor = saldo 
	from cuentas2
	where id = @id_proveedor

	if @saldo_proveedor < @saldo or @saldo_proveedor <= 0
		begin
			print 'EL saldo a pedir, supera el valor que contiene el proveedor!'
			rollback
		end
	else
		begin
			update cuentas2
			set saldo = saldo - @saldo
			where id = @id_proveedor

			update cuentas2
			set saldo = saldo + @saldo
			where id = @id_acreedor
			
			print 'La transacción fue exitosa!'
			commit
		end
end try
begin catch
	print 'Ocurrio un Error!'
	--es una variable del sistema de SQL Server que sirve para saber cuántas transacciones están activas en ese momento.
	IF @@TRANCOUNT > 0
		ROLLBACK
end catch
end
go

--Elimina el procedimiento almacenado
DROP PROCEDURE sp_transferirDinero

select * from cuentas2
		-- id_proveedor, id_acreedor, saldo_transferido
exec sp_transferirDinero 1, 2, 100

/*
	| Valor   | Significa               |
	| ------- | ----------------------- |
	| 0       | No hay transacción      |
	| 1       | Hay una transacción     |
	| 2 o más | Varias transacciones    |
	| >0      | Se puede hacer rollback |

*/