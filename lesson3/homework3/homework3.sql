create database homework3
use homework3

--1 Bulk insert boshka sourse dan sqlga yoki sql dan boshka sourse ga otkazishni taminlaydi

--2 csv, text, xml, non xml


create table products
(productid int primary key,productname varchar(50),price decimal(10,2))

insert into products values
(1,'laptop',799.99),
(2,'mouse',25.50),
(3,'keyboard',99)

--5 not null table da bosh joy komasligini taminlaydi, null esa informatsiya yokligini anglatadi

alter table products add unique(productname)

--7 /*comment codlar chalkash bolmasligini va tushunarli bolishini taminlaydi sqript sfatida ishlatilad*/

create table categories
(categoryid int primary key,categoryname varchar(50) unique)
insert into categories values  (1,'expensive'),(2,'normalprice'),(3,'lowprice')



--присваивает каждой записи уникальный ID, что является ключом к сохранению целостности данных.

select*from products
select*from categories

bulk insert products
from 'ukytfkutfvf\emailinfo.csv'
with (firstrow=2,fieldterminator=',',rowterminator='\n')

alter table products
add catid int foreign key references categories(id)

--primary key faqat id da ishlatiladi va uni ichida null yoki bir hil id bomaydi, unique da esa bitta null bolishi mumkun

alter table products
add check (price>0)

alter table products
add stock int not null default 0

update products set price=isnull(price,0.00)

--foreign key boshqa tabledagi primary keyni ulidi

create table customers
(customerid int identity(100,10),age int
constraint ck_customer check(age>=18))

create table orderdetails
(orderid int primary key,age int)

--otmaganmiz
