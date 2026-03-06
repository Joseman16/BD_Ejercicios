Use BDPractice
GO


drop table trabajador

/*CREAR TABLA*/
Create table trabajador(
	EmployeeID int identity (1,1) not null,
	FirstName varchar(40) not null,
	LastName varchar(40) not null,
	bonus decimal(10,2),
	salary decimal(10,2) not null,
	constraint trabajador_pk primary key (EmployeeID),
	constraint salary_chk check (salary > 0.0)
)


/*INSERTS*/
insert into trabajador (FirstName, LastName, bonus, salary) 
values ('Hill', 'Vera', 2000, 9000), ('Ben', 'Jones', 500,9000),
('Herb', 'Andrews', null,9000),('CHelsea', 'Walsh', 1400,9000)

/*ACTUALIZAR*/
update trabajador set salary = 8500 where EmployeeID =4

/*drop table trabajador -*/

/*CONSULTAS*/
select * from trabajador
select EmployeeID, FirstName from trabajador where salary > 8500
select tra.FirstName, tra.LastName from trabajador tra;
select tra.FirstName, tra.EmployeeID, tra.salary from trabajador tra

/*DARLE NOMBRE A LA COLUMNA CON AS*/
select tra.FirstName as nombre, tra.LastName as apellido, tra.salary as salario from trabajador tra 


select tra.EmployeeID, tra.FirstName, tra.LastName, tra.salary, 4000 as bonus, tra.salary + 4000 as total from trabajador tra

select  EmployeeID, FirstName, LastName, salary, 4000 as bonus, salary + 4000 as total from trabajador

select *, 4000 as bonus, salary + 4000 as total from trabajador



/* PRACTICA DE CONSULTAS*/

/*select FirstName, LastName from EmployeeID*/

create table hotel_roms(
	room_number int identity(1,1) not null,
	room_style varchar(20) not null,
	window_view varchar(20) not null,
	constraint hotel_rooms primary key (room_number)
)

insert hotel_roms(room_style, window_view) 
values ('Single','Ocean'),('Double','Ocean'),('Single','Ocean'),
('Single','Mountain'),('Double','Mountain')

select * from hotel_roms


/*REEMPLAZO DE NULOS EN CONSULTA*/
select tra.EmployeeID, 
tra.FirstName, 
tra.salary, 
tra.bonus,
tra.salary + isnull(bonus, 0) as total_amount
from trabajador tra

drop table Clientes

create table Clientes(
	customerID int identity(1,1) not null,
	customerName varchar(40) not null,
	contactName varchar(40) not null,
	address varchar(40) not null,
	city varchar(25) not null,
	postalCode varchar(20) not null,
	country varchar(20) not null,
	constraint clientes_pk primary key (customerID)
)


/*HAVING: ES UN FILTRO*/

select * from Clientes

insert into Clientes( customerName, contactName, address, city, postalCode, country) 
values ('Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
('Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'Mexico D.F', '05021', 'Mexico'),
('Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F', '05023', 'Mexico'),
('Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
('Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Lulea', 'S-958 22', 'Sweden')



insert into Clientes( customerName, contactName, address, city, postalCode, country) 
values ('Phillie Lam', 'Philie Lam', 'Obere Str. 57', 'Berlin', '12553', 'Germany'),
('Karla Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'Mexico D.F', '05021', 'Peru'),
('Sergio Hernandez Taquería', 'Sergio H', 'Av los Mayas', 'Mexico D.F', '05025', 'Mexico'),
('Around the Horn', 'Jeff Hardy', '120 Hanover Sq.', 'Manchester', 'WA1 1DP', 'UK'),
('Crystel snabbköp', 'Crystel', 'Berguvsvägen 8', 'Dormunt', 'S-958 22', 'Germany')

/*having con count*/

select cl.country, COUNT(customerID) as [Number of Customers] 
from Clientes cl
group by cl.country

/*
	Having es un filtro y aqui lo llamo a los clientes de diferentes paises
	pero aparte le digo que me diga los paises que tenga mas de 2 trabjadores
	en nuestra empres.
*/
select cl.country, COUNT(customerID) as [Number of Customers] 
from Clientes cl
group by cl.country
having  COUNT(customerID) > 2 

select cl.country, COUNT(customerID) as [Number of Customers] 
from Clientes cl
group by cl.country
having  COUNT(customerID) > 2
order by COUNT(customerID) DESC; /*Lo mismo de arriba pero me ordena de mayor a menor*/


/* Clase de relaciones y INNER JOIN */

create table doctors(
	doc_id int identity(1,1) not null,
	doc_last_name varchar(30) not null,
	constraint doctors_pk primary key (doc_id)
)

select * from doctors
drop table doctors


create table patients(
	patient_id int identity(1,1) not null,
	last_name varchar(40) not null,
	constraint patients_pk primary key (patient_id)
)

drop table patients
/*
	delete patients
	select * from patients 
*/

create table doctor_patients(
	doctor_patients int identity(1,1) not null,
	doc_id int not null,
	patient_id int not null,
	constraint doctor_patients_pk primary key (doctor_patients),
	constraint doc_id_fk foreign key (doc_id) references doctors (doc_id),
	constraint patients_fk foreign key (patient_id) references patients (patient_id)
)

drop table doctor_patients


insert into doctors (doc_last_name) values ('Jackson'), ('Juan'), ('Ronald')


insert into patients (last_name) 
values ('Erick'), ('Fernando'),('Ganriela'),('Victoria')

insert into patients(last_name) 
values ('Marianel'), ('Carlos'),('Sara'),('Marcos')

insert into doctor_patients(doc_id, patient_id) values (1,1),(2,1),(3,2),(1,8),(1,3),(2,4),(3,6),(3,7)

select * from doctor_patients


select doc.doc_last_name, pa.last_name from patients pa
right join doctor_patients dp on dp.patient_id = pa.patient_id
right join doctors doc on doc.doc_id = dp.doc_id
where pa.last_name like 'f%'

select doc.doc_last_name, pa.last_name from patients pa
full join doctor_patients dp on dp.patient_id = pa.patient_id
full join doctors doc on doc.doc_id = dp.doc_id
/* where pa.last_name like 'f%' */


create table employees(
	employee_id int identity(1,1) not null,
	first_name varchar(40) not null,
	job_title varchar(40) not null,
	manager_id int,
	constraint employees_pk primary key (employee_id)
)

insert into employees(first_name, job_title, manager_id)
values('Judy','CEO', null),('James','Sales Manager', 1),('Amanda','Accountant',1),
('Bob','Sales Rep',2), ('Henry','Sales Rep',2)

select * from employees

select e.employee_id, e.first_name, e.job_title, e2.first_name as manager_name, e2.job_title as manager_title 
from employees e
right join employees e2 on e.manager_id = e2.employee_id

select e.employee_id, e.first_name, e.job_title, e2.first_name as manager_name, e2.job_title as manager_title 
from employees e
inner join employees e2 on e.manager_id = e2.employee_id

/* RETOS DE JOIN */

select * from employees

create table customers(
	id int identity(1,1),
	first_name varchar (40),
	last_name varchar (40),
	email varchar(40),
	country varchar(20)
	constraint customer_pk primary key (id)
)

/*
drop table customers
drop table canadian_subscribers
*/

create table canadian_subscribers(
	id_canadian_sub int identity(1,1) not null,
	email_addres varchar(40),
	first_name varchar(40),
	last_name varchar(40),
	constraint canadian_sub_pk primary key (id_canadian_sub)
)


select * from customers
select * from canadian_subscribers

insert into customers(first_name, last_name, email, country)
values('Jorge','Lopez','joegeLopez121@gmail.com','Canada'),
('Juan','Moncayo','juaniroMon@gmail.com','Colombia'),
('Leydi','Valverde','leydiVal1931@gmail.com','Mexico'),
('Brisa','Carranza','BrisaulCarra09@gmail.com','USA'),
('Clara','Carrera','ClarimyCarrera@gmail.com','España')

insert into customers(first_name, last_name, email, country)
values('Hugo','Grey', null,'Canada')

insert into canadian_subscribers(first_name, last_name, email_addres) 
values ('Joel','Ordoñez','joelinOrdo@hotmail.com'),
('Gabriel','Lema','gabirelLemi@gmail.com'),
('Katherine','Azpiasu','KatheAz111@hotmail.com'),
('Pablo','Gutierrez','pablinGutierrez33@Outolook.com')

insert into canadian_subscribers(first_name, last_name, email_addres) 
values ('Jorge','Lopez','joegeLopez121@gmail.com')

insert into canadian_subscribers(first_name, last_name, email_addres) 
values ('Francisco','Leòn',null)

select cus.first_name, cus.last_name, cus.email
from customers cus
union
select cs.first_name, cs.last_name, cs.email_addres
from canadian_subscribers cs 
order by cus.email ASC

select * from customers
select * from canadian_subscribers

select cus.first_name, cus.last_name, cus.email 
from customers cus
intersect
select cs.first_name, cs.last_name, cs.email_addres 
from canadian_subscribers cs

select cus.first_name, cus.last_name, cus.email 
from customers cus
except
select cs.first_name, cs.last_name, cs.email_addres 
from canadian_subscribers cs