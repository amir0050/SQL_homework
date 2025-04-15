use class_2
create table employees
(empid int,name varchar(50),salary decimal(10,2))

insert into employees values 
(1,'amir',300.50),
(2,'abror',500),
(3,'nazima',250.35)


update employees
set salary=400.20
where empid=1

delete from employees
where salary=500
--5
delete from customers
truncate table customers
drop table customers
-- farqi truncate table ni ichidagi informatsiyani hammasini ochiradi, delete bilan bitta record ochirsa boladi, drop tableni ochirib tashidi.

alter table employees
alter column name varchar(100)

alter table employees
add departament varchar(50)

 alter table employees
 alter column salary float

 create table departaments
 (demartamentid int primary key,departamentsname varchar(50))

 truncate table employees

 insert into departaments select*from existing

 truncate table employees

 alter table employees 
 drop column departament

exec sp_rename 'employees', 'staffmembers'

drop table departaments
 
 --advanced level

create table products
(productid int primary key,productname varchar(50),category varchar(50),price decimal(5,2))
