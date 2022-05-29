create database QuanLyCafe
go

--kich hoat database: QuanLyCafe
use QuanLyCafe
go
-------------------------------------------------------Khai bao tao cac bang quan ly-------------------------------------------------------------------------------------------------
--Tao bang Category(Danh muc)
create table Category(
	id int primary key identity(1,1),
	name nvarchar(50) not null
)
go

--Bang san pham
create table Product(
	id int primary key identity(1,1),
	title nvarchar(50) not null,
	price float,
	category_id int references Category(id)
)
go

--Bang nhan vien
create table Staff(
	id int primary key identity(1,1),
	fullname nvarchar(50) not null,
	address nvarchar(200),
	gender nvarchar(20),
	birthday date,
	phone_number nvarchar(20)
)
go

--Bang khach hang
create table Customer(
	id int primary key identity(1,1),
	fullname nvarchar(50) not null,
	phone_number nvarchar(20),
	email nvarchar(50)
)
go

--Bang don hang
create table Orders(
	id int primary key identity(1,1),
	customer_id int references Customer(id),
	staff_id int references Staff(id),
	price_total float,
	created_at datetime
)
go

create table OrderDetail(
	id int primary key identity(1,1),
	product_id int references Product(id),
	price float,
	num int, --so luong san pham
	price_total float,
	order_id int references Orders(id), --Don hang thu may
	created_at datetime
)
go


--------------------------------------------------------Nhap du lieu cho database-------------------------------------------------------------------------------------------------------------
--Category
insert into Category(name) values ('Caffe'),('Nuoc ep'),('Sinh to'),('Tra'),('Soda')
go

--Product
insert into Product(title,price,category_id) values 
/*caffe */		('Caffe da xay',15000,1),('Culi sua da',18000,1),('Espresso (Caffe nong)',28000,1),('Cappuccino (Caffe Y)',25000,1)
,('Latte (Caffe tao hinh)',25000,1),('Cookies Que',30000,1),('Cookies Mocha(Vodka)',30000,1),('Da me',15000,1),('Bac xiu',15000,1),
('Cacao nong da',15000,1),('Caffe sua Bailey',18000,1),('Sua tuoi',15000,1),
/*Nu?c ép*/     ('Nuoc ep dua hau',25000,2),('Nuoc ep dua chuot',25000,2),('Nuoc ep carrot',28000,2),('Nuoc ep dua',28000,2),
('Nuoc ep chanh leo',28000,2),('Nuoc ep ca chua',28000,2),('Nuoc ep Tao',28000,2),('Nuoc ep Cam',28000,2),('Nuoc ep Oi',32000,2),
('Nuoc ep Tao & Dua',32000,2),('Nuoc ep Cam & Carrot',32000,2),('Nuoc ep Cam & Dua',32000,2),('Tropical crush (Cam, dua, xoai)',35000,2),
('Nuoc ep Buoi',40000,2),
/*Sinh t?*/    ('Sinh to dua hau',25000,3),('Sinh to sua chuoi',25000,3),('Sinh to xoai',28000,3),('Sinh to chanh leo',28000,3),
('Sinh to chuoi xoai',28000,3),('Sinh to dau tay',32000,3),('Sinh to bo',32000,3),('Sinh to sen sua',32000,3),('Sinh to Mang cau & bo',35000,3),
('Sinh to bo mit',35000,3),('Sinh to bo & Sau rieng',40000,3),('Sinh to Mang cau & Sau rieng',40000,3),
/*Trà*/		   ('Tra sua chan chau',20000,4),('Tra sua dau tay',20000,4),('Tra sua dao',20000,4),('Tra sua bac ha',20000,4),
('Tra sua Socola',20000,4),('Tra sua Blueberry',20000,4),('Tra sua Matcha',20000,4),('Tra sua thai xanh',20000,4),('Tra sua thai do',20000,4),
('Hong tra',15000,4),('Hong tra dao',20000,4),('Hong tra vai',20000,4),('Hong tra mut dau tay',20000,4),('Hong tra mut Kiwi',20000,4),
('Hong tra mut Raspbery',20000,4),('Tra chanh con ca',15000,4),
/*Soda*/	   ('Soda DeepBlue',20000,5),('Soda Chanh Day',20000,5), ('Soda Kiwi',20000,5),('Soda Raspbery',20000,5),('Soda Blueberry',20000,5)
go

--Nhan Vien(Staff)
insert into Staff(fullname,gender,birthday,phone_number,address) values ('Nguyen Phi Long','Nam','2002-07-28','123456789','Ha Noi'),
('Tran Ngoc Anh','Nu','2002-03-9','12341234','Ha Noi'),('Nguyen Van Khanh','Nam','2001-01-05','123123123','Ha Noi'),
('Mai Quoc Viet','Nam','2002-05-16','12341231234','Thai Binh')
go

--Khach hang(Customer)
insert into Customer(fullname,email,phone_number) values ('Do Duy Manh','duymanh@gmail.com','12345'),('Tran Dinh Trong','dinhtrong@gmail.com','23456'),
('Vu Thi Thuy','thithuy@gmail.com','34567'), ('Hoang Thi Thu Hong','thithuhong@gmail.com','45678'),('Dinh Manh Quan','manhquan@gmail.com','56789'),
('Trinh Duc Thang Binh','ducthangbinh@gmail.com','98765'),('Nguyen Van An','An@gmail.com','87654'),('Tran Ngoc Thu Hang','ngocthuhang@gmail.com','76543'),
('Hoang Minh Hieu','minhhieu@gmail.com','65432'),('Ðinh Thi Hong','thihong@gmail.com','54321')
go

--------------------------------------------------------Ngay 1----------------------------------------------------------------
--Order(Don thu 1 trong ngay)
insert into Orders(customer_id,staff_id,price_total,created_at) values (1,1,75000,'2022-03-11')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (1,1,25000,3,75000,'2022-03-11')
go
---------------------------------
--Order(Don thu 2)
insert into Orders(customer_id,staff_id,price_total,created_at) values (3,1,55000,'2022-03-11')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (2,1,15000,2,30000,'2022-03-11'),(2,5,25000,1,25000,'2022-03-11')
go
--------------------------------
--Order(Don thu 3 trong ngay 2022-03-11)
insert into Orders(customer_id,staff_id,price_total,created_at) values (9,1,50000,'2022-03-11')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (3,13,25000,1,25000,'2022-03-11'),
(3,4,25000,1,25000,'2022-03-11')
go
---------------------------------------------------------Done---------------------------------------------------------------

---------------------------------------------------------Ngày 2-------------------------------------------------------------
--Order(Don thu 1 trong ngay 2022-03-12)
insert into Orders(customer_id,staff_id,price_total,created_at) values (2,2,110000,'2022-03-12')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (1,7,30000,1,30000,'2022-03-12'),
(1,20,28000,1,28000,'2022-03-12'),(1,22,32000,1,32000,'2022-03-12'),(1,39,20000,1,20000,'2022-03-12')
go
-----------------------------------
--Order(Don thu 2 trong ngay)
insert into Orders(customer_id,staff_id,price_total,created_at) values (8,2,25000,'2022-03-12')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (2,1,25000,1,25000,'2022-03-12')
go
----------------------------------
--Order(Don thu 3 trong ngay)
insert into Orders(customer_id,staff_id,price_total,created_at) values (5,2,40000,'2022-03-12')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (3,50,20000,2,40000,'2022-03-12')
go
---------------------------------
--Order(Don thu 4 trong ngay 2022-03-12)
insert into Orders(customer_id,staff_id,price_total,created_at) values (6,2,60000,'2022-03-12')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (4,55,20000,1,20000,'2022-03-12'),
(4,45,20000,1,20000,'2022-03-12'),(4,43,20000,1,20000,'2022-03-12')
go
-----------------------------------------------------Done-------------------------------------------------------------------

----------------------------------------------------Ngày 3------------------------------------------------------------------
--Order(Don thu 1 trong ngay 2022-03-13)
insert into Orders(customer_id,staff_id,price_total,created_at) values (4,3,18000,'2022-03-13')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (1,2,18000,1,18000,'2022-03-13')
go
-----------------------------------------
--Order(Don thu 2)
insert into Orders(customer_id,staff_id,price_total,created_at) values (8,3,88000,'2022-03-13')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (2,19,28000,2,56000,'2022-03-13'),
(2,21,32000,1,32000,'2022-03-13'),(2,43,20000,1,20000,'2022-03-13')
go
----------------------------------------
--Order(Don thu 3)
insert into Orders(customer_id,staff_id,price_total,created_at) values (1,3,80000,'2022-03-13')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (3,37,40000,1,40000,'2022-03-13'),
(3,42,20000,1,20000,'2022-03-13'),(3,53,20000,1,20000,'2022-03-13')
go
---------------------------------------
--Order(Don thu 4)
insert into Orders(customer_id,staff_id,price_total,created_at) values (2,4,121000,'2022-03-13')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total) values (4,59,20000,1,20000,'2022-03-13'),
(4,9,15000,3,45000,'2022-03-13'),(4,17,28000,2,56000,'2022-03-13')
go
------------------------------------------------
--Order(Don thu 5 trong ngay 2022-03-13)
insert into Orders(customer_id,staff_id,price_total,created_at) values (10,4,106000,'2022-03-13')
go
--OrderDetail
insert into OrderDetail(order_id,product_id,price,num,price_total,created_at) values (5,3,28000,2,56000,'2022-03-13'),(5,4,25000,1,25000,'2022-03-13'),
(5,5,25000,1,25000,'2022-03-13')
go
------------------------------------------------------------Done------------------------------------------------------------------------------------------------------------

select * from Category
select * from Product
select * from Staff
select * from Customer
select * from Orders
select * from OrderDetail

---------------------------------------------------------------Hien thi---------------------------------------------------------------------------------------------------------------------

----------------------------------------------Select all staff order by Name------------------------------------------------------------
select * from Staff 
order by Staff.fullname
-----------------------Done-----------------------------

-----------------------------------------------count the product have price < 20000 vnd-------------------------------------------------
select count(p.id) as 'Products less than 20000'
from Product p
where p.price < 20000
-----------------------Done-----------------------------

---------------------------------------------Select top 6 Most expensive and smallest products -----------------------------------------
select * from (select top(6) * from Product p
order by p.price desc) as l
union
select * from (select top(6) * from Product p
order by p.price asc) as s
order by l.price desc
-----------------------Done-----------------------------

--------------------------------------------Matching in the where clause----------------------------------------------------------------
select * from Product
where title like '%ep%' and price > 30000
-----------------------Done-----------------------------

-----------------------------------------------Find Customer who have highest Order-----------------------------------------------------
select o.customer_id, c.fullname, count(*) as NumberOfOrders
from Customer c, Orders o
where o.customer_id = c.id
group by o.customer_id, c.fullname
having count(c.fullname) = (select top 1 count(*) as NumberOfOrders
							from Customer c, Orders o
							where o.customer_id = c.id
							group by o.customer_id
							order by NumberOfOrders desc)
-----------------------Done-----------------------------

-----------------------------------------------Find Staff who have highest Bill---------------------------------------------------------
select o.staff_id, s.fullname, count(*) as NumberOfBill
from Staff s, Orders o
where o.staff_id = s.id
group by o.staff_id, s.fullname
having count(s.fullname) = (select top 1 count(*) as NumberOfBill
							from Staff s, Orders o
							where o.staff_id = s.id
							group by o.staff_id
							order by NumberOfBill desc)

-----------------------Done-----------------------------

----------------------------------------------------Try Catch------------------------------------------------------------------------------------------------------------
begin try
	--begin tran insert_Staff
	insert into Staff(fullname,gender,birthday,phone_number,address) values ('Phung Minh Hue','Nu','2002-07-14','987654321','Ha Noi')
	insert into Staff(fullname,gender,birthday,phone_number,address) values ('Dang Manh Hieu','Nam','1999-01-16','11111111111111111111111111111111111111','Ha Noi')
	print 'Them thanh cong'
	--commit tran insert_Staff
end try
begin catch 
	print 'Them that bai hay dien dung form! ' + error_message()
	--rollback tran insert_Staff
end catch

select * from Staff
-----------------------Done-----------------------------

----------------------------------------------Delete staff who have bill null-------------------------------------------------------------
delete from Staff
where Staff.id not in (select distinct OrderDetail.order_id from OrderDetail)
-----------------------Done-----------------------------

--------------------------------------------------------Trigger------------------------------------------------------------------------------------------------------
---------------------------------------------------------Delete Staff----------------------------------------------------------------------
drop trigger trg_dele_staff
create trigger trg_dele_staff
on Staff for delete
as
begin
	select d.id, d.fullname, d.address, d.gender, d.birthday, d.phone_number
	from deleted d, Orders o, Staff s
	where o.id = d.id and o.staff_id = s.id
end

delete from Orders where Orders.staff_id = 3
delete from Staff where Staff.id = 3
select * from Staff
select * from OrderDetail
-----------------------Done-----------------------------
----------------------------------------------------------Insert Staff---------------------------------------------------------------------
create trigger trg_inse_staff
on Staff after insert
as
begin
	select i.fullname,i.gender,i.birthday,i.phone_number,i.address
	from inserted i
end

insert into Staff(fullname,gender,birthday,phone_number,address) values ('Nguyen Thi Viet Ha','Nu','2002-02-12','6969696969','Ha Noi')
-----------------------Done-----------------------------

 ---------------------------------------------------------Insert Product--------------------------------------------------------------------
drop trigger trig_check_price
create trigger trig_check_price
on Product for insert
as
begin
	if(select i.price from inserted i) > 0
	begin
		print 'Them thanh cong';
	end;
	else 
	begin
		print 'Them That Bai, Price phai > 0';
		rollback tran;
	end;
end;
go

select * from Product
insert into Product(title,price,category_id) values ('Soda Schweppes',15000,5)
insert into Product(title,price,category_id) values ('Soda Schweppes-2',0,5)
insert into Product(title,price,category_id) values ('Soda Schweppes-3',-90,5)
-----------------------Done-----------------------------

--------------------------------------------------------Update price-------------------------------------------------------------------------
drop trigger trg_Up_Price
create trigger trg_Up_Price
on Product for update
as
begin
	if(UPDATE(title))
	begin
		print 'Ban khong the sua du lieu tren cot title'
		rollback tran;
	end;
	else if(select price from inserted) < 0
	begin
		print 'Gia phai > 0'
		rollback tran;
	end;
end

update Product set title = 'Long' where title = 'Caffe da xay'
update Product set price = 17000 where price = 15000
select * from Product
-----------------------Done-----------------------------

----------------------------------------------------Delete Product--------------------------------------------------------------------------
drop trigger trg_dele_Product

create trigger trg_dele_Product
on Product for delete
as
begin 
	select d.id, d.title, d.price, d.category_id
	from deleted d
end

--delete from OrderDetail where OrderDetail.product_id = 60
delete from Product where Product.id = 58
-----------------------Done-----------------------------

--------------------------------------------------------------------------Procdure-----------------------------------------------------------------------------------------------------------

--Hien thi Menu  (1-Caffe 2-Nuoc Ep 3-Sinh To 4-Tra 5-Soda)
create proc proc_Menu_danhmuc
	@id int
as
begin
	select Category.name CategoryName, Product.title ProductName, Product.price Price
	from Category, Product
	where Category.id = Product.category_id
			and Category.id = @id

end
exec proc_Menu_danhmuc 5

-------------------------------------------------------------------------------------------
--Hien thi danh muc san pham trong 1 don hang
drop proc proc_Xem_DonHang_TheoNgay

create proc proc_Xem_DonHang_TheoNgay
	@createdDate date,
	@orderID int
as
begin
	select Orders.id OrderID, Staff.fullname StaffName, Customer.fullname CustomerName, 
						   Product.title ProductName, OrderDetail.price Price, OrderDetail.num Num, OrderDetail.created_at OrderDate 
	from Orders, OrderDetail, Staff,Customer, Product
	where Orders.id = OrderDetail.order_id 
		and Orders.customer_id = Customer.id
		and Orders.staff_id = Staff.id
		and OrderDetail.product_id = Product.id
		and OrderDetail.created_at = @createdDate
		and Orders.id = @orderID
end

exec proc_Xem_DonHang_TheoNgay '2022-03-11', 1
exec proc_Xem_DonHang_TheoNgay '2022-03-12', 1
exec proc_Xem_DonHang_TheoNgay '2022-03-13', 1

-------------------------------------------------------------------------------------------
--Hien thi danh sach san pham theo ma khach hang
drop proc proc_Xem_DonHang_TheoMaKH
create proc proc_Xem_DonHang_TheoMaKH
	@customerID int
as
begin
	select Orders.id OrderID, Staff.fullname StaffName, Customer.fullname CustomerName, 
						   Product.title ProductName, OrderDetail.price Price, OrderDetail.num Num, OrderDetail.created_at OrderDate 
	from Orders, OrderDetail, Staff,Customer, Product
	where Orders.id = OrderDetail.order_id 
		and Orders.customer_id = Customer.id
		and Orders.staff_id = Staff.id
		and OrderDetail.product_id = Product.id
		and Orders.customer_id = @customerID
		and OrderDetail.created_at in ('2022-03-11', '2022-03-12','2022-03-13')
end

exec proc_Xem_DonHang_TheoMaKH 1

-------------------------------------------------------------------------------------------
--Tinh tong doanh thu trong ngay hoac nhieu ngay
create proc proc_TongDoanhThu
     @fromDate date,
	 @toDate date
as
begin
	select sum(price_total) 'Tong Doanh Thu'
	from Orders
	where Orders.created_at >= @fromDate and Orders.created_at <= @toDate --trong ngay
																			  --nhieu ngay thi chi viec thay doi khoang
end

exec proc_TongDoanhThu '2022-03-11', '2022-03-11'
exec proc_TongDoanhThu '2022-03-12', '2022-03-12'
exec proc_TongDoanhThu '2022-03-13', '2022-03-13'
exec proc_TongDoanhThu '2022-03-11', '2022-03-13'
-------------------------------------------------------------------------------------------
--Tinh tong tien trong mot order
create proc proc_TongTienOrder
	@orderID int,
	@date date
as
begin
	select  Customer.id as CustomerID, Staff.id as StaffID, OrderDetail.created_at, OrderDetail.order_id,sum(OrderDetail.price_total) as 'Tong tien trong Order'
	from Orders, OrderDetail, Staff,Customer, Product
	where Orders.id = OrderDetail.order_id 
		and Orders.customer_id = Customer.id
		and Orders.staff_id = Staff.id
		and OrderDetail.product_id = Product.id
		and OrderDetail.order_id = @orderID
		and OrderDetail.created_at = @date
	group by Customer.id, Staff.id, OrderDetail.created_at, OrderDetail.order_id
end
drop proc proc_TongTienOrder

exec proc_TongTienOrder 5, '2022-03-13'
exec proc_TongTienOrder 4, '2022-03-12'

select * from OrderDetail
select * from Orders
------------------------------------------------------------------Done---------------------------------------------------------------------------------------------------


