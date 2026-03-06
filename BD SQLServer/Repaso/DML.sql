
/*
	DDL: LENGUAJE DE DEFINÌCIÒN DE DATOS
		- Para consultar datos
	
	DML: LENGUAJE DE MANIPULACIÒN DE DATOS
		- Para editar datos

	DQL: LENGUAJE DE CONSULTAS DE DATOS
		- Para estructurar datos

	DCL: LENGUAJE DE CONTROL DE DATOS
		- Para administrar la base de datos

*/

declare @val decimal (12,2) = 0.0;
while @val != 10.0
begin 
	print @val;
	set @val +=1;
end;

declare @val FLOAT(24) = 0.0
while @val != 10.0
begin
	print str(@val, 20, 16);
	set @val += 0.1;
end;

