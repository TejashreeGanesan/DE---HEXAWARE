create database demo;
select name from sys.databases;
use master;
use demo;

drop database demo;

create database MypracticeDB;
use MypracticeDB;
select name from sys.tables;

create table Students(
    StudentID int primary key,
    Name varchar(50),
    Age int,
    Department varchar(50));

alter table Students add Email varchar(100);

exec sp_rename 'Students', 'StudentInfo';

drop table StudentInfo;

/* DML */
create table Employees (
        EmpID int primary key,
        Name varchar(50),
        Role varchar(50),
        salary int);

insert into employees values 
(1, 'Teja', 'Developer', 60000),
(2, 'Nithish', 'Tester', 50000);

update Employees set salary = 65000 where name = 'Teja';

delete from employees where EmpID = 2;

insert into employees values 
(2, 'Anna', 'Data Engineer', 70000),
(3, 'Will', 'Data Analysts', 60000),
(4, 'Hema', 'Senior Developer', 75000);

/* Retrieving Specific Attributes */
select name, role from Employees;

/* Retrieving Selected Rows */
select * from Employees where salary < 75000;

/*  Filtering Data:IN,DISTINCT,AND,OR,IN,BETWEEN,LIKE,Column & table aliases */
-- and or
select * from Employees where role = 'Data Engineer' and salary >= 60000;

select * from Employees where role = 'Developer' or salary >=65000;

-- in
select * from Employees where role in ('Developer', 'Data Engineer');

-- between
select * from Employees where salary between 60000 and 65000;

--Like
select * from Employees where name like 'T%';
select * from Employees where name like '%a';
select * from Employees where name like '_n%';

--distinct
insert into employees values 
(5, 'Shiva', 'Developer', 65000);
select distinct role from Employees;

-- column alias
select name as EmployeeName, Salary as MonthlyPay from Employees;

-- table alias
select e.name, e.salary from Employees as e where e.role = 'Developer';

select e.name, e.salary from Employees as e 
where e.role in ('Developer','Data Analysts')
and e.salary between 50000 and 65000
and e.name like 'S%'
order by e.salary desc;

--DML
create table Departments (
    DeptID int primary key,
    DepartmentName varchar(50)
);

insert into Departments values
(101, 'Engineering'),
(102, 'Analytics'),
(103, 'Management');

alter table Employees
add DeptID int;

-- Add FOREIGN KEY constraint
alter table Employees
add constraint FK_Employees_Departments
foreign key (DeptID) references Departments(DeptID);

update Employees set DeptID = 101 where Role in ('Developer', 'Senior Developer');
update Employees set DeptID = 102 where Role in ('Data Engineer', 'Data Analysts');

insert into Employees (EmpID, Name, Role, Salary, DeptID)
values (6, 'Ravi', 'Product Manager', 80000, 103);

select
    E.EmpID,
    upper(E.Name) as NameInCaps,   -- String Function
    E.Role,
    D.DepartmentName as Department,
    round(E.Salary * 1.10, 0) as RaisedSalary,           
    getdate() as Today,                                  
    dateadd(year, 1, getdate()) as OneYearLater,
    suser_name() as ExecutedBy                           
from Employees E
join Departments D on E.DeptID = D.DeptID;


-- Summarizing and Grouping Data
select 
    count(*) as total_employees,
    avg(salary) as average_salary,
    min(salary) as lowest_salary,
    max(salary) as highest_salary,
    sum(salary) as total_salary
from employees;

-- Summarizing Data by Using Aggregate Functions
select 
    d.departmentname,
    count(e.empid) as total_employees,
    avg(e.salary) as average_salary
from employees e
join departments d on e.deptid = d.deptid
group by d.departmentname;

select 
    d.departmentname,
    avg(e.salary) as average_salary
from employees e
join departments d on e.deptid = d.deptid
group by d.departmentname
having avg(e.salary) > 65000;

-- joins

-- left join
select e.name, e.role, d.departmentname from Employees e 
left join departments d on e.deptid = d.deptid;

-- right join
select e.name, e.role, d.departmentname from Employees e 
right join departments d on e.deptid = d.deptid;

-- full outer join
select e.name, e.role, d.departmentname from Employees e 
full outer join departments d on e.deptid = d.deptid;

-- cross join
select e.Name, d.DepartmentName
from Employees e
cross join Departments d;


-- Join with GROUP BY and Aggregate Function
select d.departmentname, count(e.empid) as total_employees, avg(e.salary) as avg_sal
from Employees e
join Departments d on e.deptid = d.deptid
group by d.departmentname;

-- self join
select 
    a.name as employee1,
    b.name as employee2,
    a.role
from employees a
join employees b on a.role = b.role and a.empid < b.empid;

-- equi join
select e.name, e.role, d.departmentname from Employees e 
join departments d on e.deptid = d.deptid;

select * from departments;
insert into employees values 
(7, 'Yatra', 'Data Engineer', 70000, 102),
(8, 'Neha', 'Product Manager', 80000, 103);

-- having
select d.departmentname, count(*) as employee_count
from Employees e
join Departments d on e.deptid = d.deptid
group by d.departmentname
having count(*) >1;

-- grouping sets
select d.departmentname, e.role, avg(e.salary) as avgsalary
from Employees e
join Departments d on e.deptid = d.deptid
group by grouping sets ( (d.departmentname), (d.departmentname, e.role));

-- subqueries
--scalar sub query
select name,salary from Employees
where salary > (select avg(salary) from Employees);

-- subquery in from
select deptid, avgsal from (select deptid,
                            avg(salary) as avgsal from employees
                               group by deptid) as deptavg;

-- using exists, any, all
-- exists
select name from Employees e where exists (select 1 from Departments d where e.deptid = d.deptid);

-- any
select * from employees
where salary > any (select salary from employees where deptid = 102);

-- all
select name, salary from Employees where salary > all (select salary from Employees where role = 'Developer');


-- nested subquries
select name from Employees 
where deptid in (
    select deptid from departments
    where departmentname = 'Engineering');

-- correlated subquries
select name, salary from Employees e1
where salary > (select avg(salary) from Employees e2
                   where e1.deptid = e2.deptid);

-- union
select name from employees where salary > 70000 
union
select name from employees where role = 'Developer';

-- intersect
select name from employees where salary > 65000
intersect
select name from employees where deptid = 102;

-- except
select name from employees where deptid = 101
except
select name from employees where role = 'Developer';

-- merge
merge into Employees as Target
using (
    select 1 as empid, 'Updated name' as name
) as Source
on Target.empid = source.empid
when matched then 
update set target.name = source.name;