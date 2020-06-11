-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------TABLE CREATION-------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
create table tbcustomer
(
	ssn nvarchar(50) primary key not null ,
	customername nvarchar(100) not null,
	cphone char(11) not null
)

create table tbinclude
(
	orderid int primary key not null ,
	productid int not null
)

create table tborder
(
	orderid int primary key not null ,
	orderdate date not null,
	ssn nvarchar(50)  not null 
)

create table tbproducts
(
	productid int primary key not null ,
	productname nvarchar(100) not null,
	price char(10) not null
)

create table tbsupplier
(
	supplierid int primary key not null ,
	suppliername nvarchar(100) not null,
	addres nvarchar(150) ,
	sphone char(11) not null
)

create table tbsupply
(
	supplierid int primary key not null ,
	productid int not null,
	supplydate date not null,
	number nchar(10) not null
)




-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------INSERT STATMENTS-----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
insert into tbcustomer
values('29915649873614','ahmed','01245899874' )ahmed
insert into tbcustomer
values('29945678945612','mohamed','01281216159' )

insert into tbinclude
values(1,2)
insert into tbinclude
values(2,1)

insert into tborder
values(1,'2020-04-06','29915649873614' )
insert into tborder
values(2,'2020-05-06','29945678945612' )

insert into tbproducts
values(1,'battry ',150)
insert into tbproducts
values(2,'phoneA3',3200)
insert into tbproducts
values(3,'chargerF5',350)
insert into tbproducts
values(4,'coverB2',35)
insert into tbproducts
values(5,'phoneS4',1850)

insert into tbsupplier
values(1,'Mohamed Hossam','Alexandria','01245896321' )
insert into tbsupplier
values(2,'Ahmed Youssef','Cairo','01124356798' )
insert into tbsupplier
values(3,'Hessin Mohamed','Cairo','01012387945' )

insert into tbsupply
values(1,3,'2020-07-04', 35)
insert into tbsupply
values(2,1,'2020-05-04',30 )
insert into tbsupply
values(3,2,'2020-06-04' ,50)

insert into tbinclude
values(1,2)
insert into tbinclude
values(2,1)

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------SELECT STATEMENTS USING DIFFERENT FUNCTIONS--------------------
-----------------------------------------------------------------------------------------------------------------------------
--What is ASCII function used for?
SELECT customername, ASCII(customername) AS NumCodeOfFirstChar
FROM tbcustomer;
--What is LEFT function used for?
SELECT LEFT(customername, 5) AS ExtractString
FROM tbcustomer;
--What is LOWER function used for?
SELECT LOWER(customername) AS LowercaseCustomerName
FROM tbcustomer;
--What is REVERSE function used for?
SELECT REVERSE(customername)
FROM tbcustomer;
--What is DATALENGTH function used for?
SELECT DATALENGTH('products');
--What is RIGHT function used for?
SELECT RIGHT(customername, 2) AS ExtractString
FROM tbcustomer;
--What is SUBSTRING function used for?
SELECT SUBSTRING(customername, 1, 3) AS ExtractString
FROM tbcustomer;
--What is UPPER function used for?
SELECT UPPER(customername) AS UppercaseCustomerName
FROM tbcustomer;
--What is DIFFERENCE function used for?
SELECT DIFFERENCE('cat', 'car');
--What is UNICODE function used for?
SELECT UNICODE(customername) AS UnicodeOfFirstChar, customername
FROM tbcustomer;
--What is SUM function used for?
SELECT SUM(price) AS TotalItemsOrdered FROM tbproducts;
--What is AVG function used for?
SELECT AVG(price) AS AveragePrice FROM tbproducts;
--What is COUNT function used for?
SELECT COUNT(price) AS NumberOfProducts FROM tbproducts;
--What is LTRIM function used for?
SELECT LTRIM('     suppliers') AS LeftTrimmedString;
--What is MAX function used for?
SELECT MAX(price) AS LargestPrice FROM tbproducts;
--What is MIN function used for?
SELECT MIN(price) AS SmallestPrice FROM tbproducts;
--What is CHARINDEX function used for?
SELECT CHARINDEX('M', 'Customer') AS MatchPosition;
--What is REPLICATE function used for?
SELECT REPLICATE(customername, 2)
FROM tbcustomer;
--What is Len function used for?
SELECT Len(customername) AS LengthOfString
FROM tbcustomer;
--What is CHAR function used for?
SELECT CHAR(65) AS CodeToCharacter;

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------SELECT STATEMENTS USING SUB QUERY ----------------------------
-----------------------------------------------------------------------------------------------------------------------------
select productname 
from tbproducts 
where productid in  (select productid from tbsupply  where number>30)

select supplydate,number
from tbsupply
where supplierid in (select supplierid from tbsupplier where suppliername = 'Mohamed Hossam')

select orderdate
from tborder
where orderid in (select orderid from tbinclude where productid = 1)

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------SELECT STATEMENTS USING COUNT AND GROUP FUNCTIONS--------------
-----------------------------------------------------------------------------------------------------------------------------
select addres,count(suppliername)
from tbsupplier
group by addres

select productid,count(number)
from tbsupply
group by productid

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------SELECT STATEMENTS USING DIFFERENT JOINS  ----------------------
-----------------------------------------------------------------------------------------------------------------------------
select productname,number
from tbproducts,tbsupply
where tbsupply.productid= tbproducts.productid

select customername,cphone,orderdate
from tbcustomer,tborder
where tbcustomer.ssn= tborder.ssn

select orderdate,productid
from tborder,tbinclude
where tborder.orderid= tbinclude.orderid

select suppliername,productid,supplydate,number
from tbsupplier,tbsupply
where tbsupplier.supplierid=tbsupply.supplierid

select productname,number
from tbproducts,tbsupply
where tbsupply.productid=tbproducts.productid


---- Insert Statments----
insert into tbcustomer
values('29955649873614','youseef','01245899864' )

insert into tbcustomer
values('29915618973264','ebrahim','01245899854' )

insert into tbcustomer
values('29915123573664','motasem','01245899844' )

insert into tbcustomer
values('29919143873616','belal','01245899834' )

insert into tbcustomer
values('29915134693674','baraka','01245899824' )

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------UPDATE STATMENTS-----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------

update tbcustomer
set cphone = '01221816196'
where customername='youseef'

update tbcustomer
set cphone = '01221816197'
where customername='motasem'

update tbcustomer
set cphone = '01221816198'
where customername='ebrahim'

update tbcustomer
set cphone = '01221816199'
where customername='belal'

update tbcustomer
set cphone = '01221816191'
where customername='baraka'

-----------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------DELETE STATMENTS-----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
delete tbcustomer 
where ssn = '29955649873614'

delete tbcustomer 
where ssn = '29915618973264'

delete tbcustomer 
where ssn = '29915123573664'

delete tbcustomer 
where ssn = '29919143873616'

delete tbcustomer 
where ssn = '29915134693674'







