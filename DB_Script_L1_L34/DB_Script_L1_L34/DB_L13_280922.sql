create database DB_L13_280922
use DB_L13_280922

create table Product
(
id int primary key identity,
name varchar(100),
price varchar(100),
mobileno bigint,
password varchar(100),
confirmpassword varchar(100)
)

create proc sp_Insert_Product
@name varchar(100),
@price varchar(100),
@mobileno bigint,
@password varchar(100),
@confirmpassword varchar(100)
as
begin
insert into Product(name,price,mobileno,password,confirmpassword)values(@name,@price,@mobileno,@password,@confirmpassword)
end

create proc  sp_Display_Product
as
begin
select * from product
end

create proc sp_Delete_Product
@id int
as
begin
delete from Product where id=@id
end

