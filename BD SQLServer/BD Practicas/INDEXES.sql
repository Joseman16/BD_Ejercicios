/* INDICES */

USE BDPractice
GO

create table orders(
	order_id int identity (1,1) not null,
	order_status varchar (15) not null,
	constraint order_pk primary key (order_id)
)

insert into orders(order_status)
values ('Closed'),('Closed'),('Shipped'),('Packed'),
('Shipped'),('Open'),('Shipped'),('Shipped'),('Open'),
('Open')

select * from orders

-- cardinalidad
select count(distinct (order_status)) as cardinalidad
from orders -- Verifica cuantos tipos de estados existen...

select (count(distinct(order_status))* 1.0 / count(*)) as avg_selectivity
from orders -- lo que acabamos de hacer, es calcular la selectvidad media


/* Asi que la actividad para un valor especifico 'Closed' es de 0,2 */
select 
	(select count(*) from orders where order_status = 'Closed') * 1.0 / count(*)
	as selectivity_for_value_closed 
from orders; -- Closed = 0.2
  
select 
	(select count(*) from orders where order_status = 'Shipped') * 1.0 / count(*)
	as selectivity_for_value_closed 
from orders; -- Shipped = 0.4

select 
	(select count(*) from orders where order_status = 'Packed') * 1.0 / count(*)
	as selectivity_for_value_closed 
from orders; -- Packed = 0.1

select 
	(select count(*) from orders where order_status = 'Open') * 1.0 / count(*)
	as selectivity_for_value_closed 
from orders; -- Open = 0.3

-- Si sumo el valor de las actividades me da 1.00 (osea el 100%)
Select (0.20 + 0.40 + 0.10 + 0.30) as suma 

 
 /* Index Types - Tipo de indices */

 create table orders2(
	order_id int identity (1,1) not null,
	order_status varchar (15) not null,
	constraint order2_pk primary key (order_id)
)

insert into orders2(order_status)
values ('Closed'),('Closed'),('Closed'),
('Closed'),('Closed'),('Closed'),('Closed'),
('Shipped'),('Open'),('Open')

select * from orders2

--crear filtro indez
create index ix_orders_order_status
on orders2(order_status)
where order_status <> 'Closed';

select *
from orders2
where order_status <> 'Closed';

select * from customers

create table customers2(
	customer_id int identity (1,1) not null,
	first_name varchar (25) not null,
	last_name varchar (25) not null,
	city varchar (20) not null,
	constraint customers2_pk primary key (customer_id)
)

insert into customers2 (first_name, last_name, city)
values ('Amy', 'Diaz', 'New York'),('Joan', 'Chui', 'Seattle'),
('Alisha', 'Jones', 'Seattle'),('Brooklyn', 'Jones', 'Cleveland'),
('Robert', 'Jones', 'Houston'),('Liam', 'West', 'Detroit')

select * from customers2

--Composite non clustered index:
create index ix_customers_last_first_name on customers2 (first_name, last_name)

create index ix_customers_last_first_name2 
on customers2 (first_name, last_name) include (city)

select customer_id, first_name, last_name 
from customers2
where first_name = 'Alisha' and last_name = 'Jones'

select customer_id, first_name, last_name 
from customers2
where last_name = 'Jones'