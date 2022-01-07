create database assignment1
go

use  assignment1
go

--1 Thi?t k? co s? d? li?u
create table customer(
	cusID int primary key,
	namekhachhang nvarchar (100),
	diachi nvarchar (100),
	telphione char (100)
	)
go

create table DatHang(
	orderID int primary key,
	orderdate date ,
	cusID int foreign key references customer(cusID)
	)
go

create table Product(
	productID int primary key,
	NameSP nvarchar (100),
	MotaSP nvarchar (100),
	Donvi nvarchar (100),
	Gia int,
	Soluong int,
	)
go

create table OrderDatails (
	productID int foreign key references Product(productID),
	orderID int foreign key references DatHang(orderID),
	Gia char (100),
	Soluong char (100),
	)
go

insert into customer (cusID, namekhachhang, diachi, telphione) values (1, N'Nguyễn Văn An', '111 Nguyaabx Trãi, Thanh Xuân Hà Nội', 987654321),
																	(2, N'Nguyễn Văn Bảo', '111 Nguyaabx Trãi, Thanh Xuân Hà Nội', 987654321),	
																	(3, N'Nguyễn Văn Cường', '111 Nguyaabx Trãi, Thanh Xuân Hà Nội', 987654321),
																	(4, N'Nguyễn Văn Dũng', '111 Nguyaabx Trãi, Thanh Xuân Hà Nội', 987654321),
																	(5, N'Nguyễn Văn Em', '111 Nguyaabx Trãi, Thanh Xuân Hà Nội', 987654321),
																	(6, N'Nguyễn Văn Phở', '111 Nguyaabx Trãi, Thanh Xuân Hà Nội', 987654321),
																	(7, N'Nguyễn Văn Vũ', '111 Nguyaabx Trãi, Thanh Xuân Hà Nội', 987654321)
go

insert into Dathang (orderID, orderdate, cusID) values (123, '11/18/09', 1)
go

insert into Product (productID, NameSP, MotaSP, Donvi, Gia, Soluong) values (1, N'Máy tính T450', N'Máy Nhập mới', N'Chiếc', 1000, 1),
																			(2, N'Điện thoại nokia5670', N'Điện thoại đang hot', N'Chiếc', 200, 2),
																			(3, N'Máy in Samsung 450', N'Máy in đang ế', N'Chiếc', 100, 1)
go

insert into OrderDatails (productID, orderID, Gia, Soluong) values (1, 123, 1000, 1),
																	(2, 123, 400, 2),
																	(3, 123, 100, 1)
go

--4
--Liệt kê danh sách khách hàng đã mua hàng ở cửa hàng
select * from customer
go

select * from DatHang
go

--Liệt kê danh sách sản phâm của cửa hàng
select * from Product
go

--Liệt kê danh sách các đơn đặt hàng của cửa hàng
select * from OrderDatails
go

--5
--a
select * from customer
order by namekhachhang

--b
select * from Product
order by Gia desc

--c
select * from Product
go

--6
--a
select COUNT(namekhachhang) from customer

--b
select COUNT(NameSP) from Product

--c
select sum (Gia) from Product
where Gia >99

--6
--a
alter table Product
	add check (Gia>0) 

--b 
alter table DatHang
	add check (orderdate>0)

--8 index 
--a
create index NameSP on Product(NameSP)
go

create index namekhachhang on customer(namekhachhang)
go

--b
create view View_KhachHang as
select namekhachhang, diachi, telphione
from customer
go

create view View_SanPham as
select NameSP, Gia
from Product
go

create view View_KhachHang_SanPham as
select namekhachhang, diachi, telphione , NameSP, Gia
join OrderDatails
on orderID


