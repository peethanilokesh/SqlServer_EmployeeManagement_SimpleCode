--1)
create  database CompanyDB
go
use CompanyDB
go
--2)
create table Departments(
id int identity(1,1) primary key,
DepartmentName varchar(20),
[Location] varchar(20),
DepartmentHead varchar(20)
)
go
insert into Departments values ('IT','London','Rick'),
('Payroll','Delhi','Ron'),
('HR','NewYork','Christie'),
('OtherDepartments','Sydney','Cindrella')
go
select * from departments
go
--3)
create table Employees(
id int identity(1,1) primary key,
[Name] varchar(15),
gender varchar(15),
salary int check(salary > 2500),
Departmentid int foreign key references departments(id)
) 
go
insert into Employees values ('tom','male',4000,1),
 ('pam','female',3000,3),
 ('john','male',3500,1),
 ('sam','male',4500,2),
 ('todd','male',2800,2),
 ('ben','male',7000,1),
 ('sara','female',4800,3),
 ('valarie','female',5500,1),
 ('james','male',6500,null),
 ('russell','male',8800,null)
 go
 select * from employees
 go
 --4)
 create procedure sp_outputdE
 as
 begin
 select e.name,e.gender,e.salary,d.departmentname from employees e inner join departments d
 on e.Departmentid=d.id
 end
 go
 exec sp_outputdE
 go
 --5)
 create procedure sp_outputdELeft
 as
 begin
 select e.name,e.gender,e.salary,d.departmentname from employees e left join departments d
 on e.Departmentid=d.id
 end
 go

 exec sp_outputdELeft
 go
 --6)
 create procedure sp_totalSbygen
 as
 begin
 select sum(salary) as Total_salary , gender from employees 
 group by gender
 end
 go
 exec sp_totalSbygen
 go
 --7)
 create procedure sp_totalSbydep
 as
 begin
 select sum(salary) as Total_salary , departmentname from employees e inner join departments d
 on e.Departmentid=d.id
 group by departmentname
 end
 go
 exec sp_totalSbydep
 go
 --8)
 create procedure sp_updateSbyid
 @salary int ,@id int
 as
 begin
 update employees set salary=@salary
 where id=@id
 end
 go
 exec sp_updateSbyid 4000,1
 go
 select * from employees
 go
 --9)
 create procedure sp_delcolbyid
 @id int
 as
 begin
 delete from employees where id=@id
 end
 go
 --10)
 create procedure sp_totalemp
 as
 begin
 select count(e.id) as Total_emp , d.departmentname from employees e right join departments d
 on e.Departmentid=d.id
 group by departmentname
 end
 go
 exec sp_totalemp





