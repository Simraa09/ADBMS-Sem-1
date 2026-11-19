create database user;
use user;

create table customer(custid int, custname varchar(20), city varchar(15), product varchar(15), price int);
desc customer;

alter table customer modify custid int primary key;     -- 1st way-- 
alter table customer add primary key(custid);     -- 2nd way-- 

insert into customer values(1, 'Om', 'Pune', 'Mobile', 15000);
insert into customer values(2, 'Rucha', 'Nagpur', 'laptop', 30000);
insert into customer values(3, 'Raj', 'Mumbai', 'Mouse', 5000);
select * from customer;
select custname, product from customer;        

create table clonetable as select * from customer;       -- it clones the data of the first table-- 
select * from clonetable;
drop table clonetable;        

-- Where Clause--    
select custname , city from customer;
select custname , city from customer where custid = 1;
select custname , city from customer where price>15000;
select custname , city from customer where price<15000;
select * from customer where price>=15000;
select * from customer where custid=1;	
select * from customer where city='Nagpur';	

-- Sorting the data-- 
select * from customer order by price;
select * from customer order by price desc;
select * from customer order by custid desc;
select * from customer order by custid asc;
select * from customer order by city asc;

-- Sorting data order by multiple columns-- 
select * from customer order by city, price;          -- first column will get priority-- 
select * from customer order by price, city;
select * from customer order by city desc, price asc;

-- Single row functions
-- Case conversion function
select upper(custname), lower(product) from customer;              -- uppercase and lowercase function 
select upper(custname), lower(product) from customer where custid<3;  

alter table customer add column lastname varchar(15);
desc customer;

update customer set lastname='Sharma' where custid=1;
update customer set lastname='Jadhav' where custid=2;
update customer set lastname='Patil' where custid=3;
select * from customer;

select concat(custname, lastname) from customer;     -- it will concat the custname and lastname without space ('OmSharma')
select concat(custname,' ', lastname) from customer;             -- it will concat the custname and lastname with space ('Om Sharma')
select concat(custname,' ', lastname) as Fullname from customer;            -- It will give new column name

-- use of substr(substring)  and instring functions 
select substr(custname,1,0) from customer;             -- it will print empty
select substr(custname,1,1) from customer;            -- it will starts from first letter and print only one letter
select substr(custname,1,2) from customer;           -- it will starts from first letter and print 2 letter
select substr(custname,2,1) from customer;            -- it will starts from second letter and print only one letter

select instr(custname,'a') as position from customer;        -- it will show the position of the given letter
select * from customer;
select substr(custname,1,3), instr(custname,'a') from customer where custid<3;

-- Current date and time of the system
select now();
select now() as current_datetime; 					-- column name becomes current_datetime

alter table customer add column date date;
select * from customer;

update customer set date='2024/2/20' where custid=1;
update customer set date='2024-8-24' where custid=2;
update customer set date='2024-10-2' where custid=3;
select * from customer;

alter table customer drop column date;



