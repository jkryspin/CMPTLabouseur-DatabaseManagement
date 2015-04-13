create table supplierLocation(
	     postalCode varchar(5) primary key,
	     City text,
	     State text)

create table supplierInformation(
	     supplierName text primary key,
	     Address text,
	     contactInformation text,
	     postalCode varchar(5))
	     
create table Orders(
	     orderNumber int primary key,
	     supplierName text,
	     dateOrdered date,
	     purchaseNumber int)	

create table SKUData(
	     purchaseNumber int primary key,
	     SKUPurchased text,
	     quantityOfSKU int,
	     purchasePrice money)

create table clothingDetails(
	     SKUPurchased text primary key,
	     itemDesctiption text,
	     retailPriceUSD money,
	     quantityRemaining int)

--Now some insert statements
insert into supplierLocation values (16824, 'Fairfield', 'Connecticut')
insert into supplierInformation values ('Fitch', '148, Smedley Road', '2032182285',16824)
insert into Orders values (0,'Fitch','20140413',7)
insert into SKUData values (7,'Pants',50,20)
insert into clothingDetails values ('Pants', 'A garment worn around your legs', 30, 200)

insert into supplierLocation values (12345, 'New York', 'New York')
insert into supplierInformation values ('North Face', '148, North Road', '2032182286',12345)
insert into Orders values (1,'North Face','20140414',9)
insert into SKUData values (9,'Shirts',50,20)
insert into clothingDetails values ('Shirts', 'A garment worn around your chest', 40, 150)

select * from supplierLocation
select * from supplierInformation
select * from orders
select * from SKUData
select * from clothingDetails


--Query
select quantityOfSKU from SKUData where SKUPurchased = 'Pants'
select quantityRemaining from clothingDetails where SKUPurchased = 'Pants' as 'val2'

select SUM(quantityOfSKU) from SKUData where SKUPurchased = 'Pants'
--Need to add quantityRemaining somehow, couldnt figure it out..


--Functional Dependencies
There are several functional dependences...
In supplierLocation both city and state depend on postalCode
In supplierInformation the address, contactInformation, and postalCode depend on who we are talking about and thusly their name
In orderNumber everything relies on what the orderNumber is
In SKUData everything depends on the purchase number
And in clothingDetails everything depends on what exact SKU we are looking at