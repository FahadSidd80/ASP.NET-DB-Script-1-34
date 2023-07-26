select * from sys.objects where type = 'U'
select * from sys.objects where type = 'P'
select * from sys.objects where type = 'PK'
select * from sys.objects where type = 'F'
--------------------------------------------------------
use [DB_Master_Page_With_Login]
--use [ShippingDB]
sp_helptext sp_Employee_Insert

  
create proc sp_Employee_Insert  
  
@name varchar(100),  
@age int,  
@gender varchar(100),  
@bloodgroup int,  
@country int,  
@state int,  
@city int,  
@email varchar(100),  
@mobileno varchar(100)  
as   
begin  
insert into Employee(name,age,gender,bloodgroup,country,state,city,email,mobileno)values(@name,@age,@gender,@bloodgroup,@country,@state,@city,@email,@mobileno)  
end  


--select * from Admins
--select * from Employees
--select * from Attendances
--select * from Leaves
--select * from __EFMigrationsHistory

use [EmployeeAttendanceSystemContext]
--select * from Shipping

