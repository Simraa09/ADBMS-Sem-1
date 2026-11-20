-- Filtering data from tables
-- WHERE, SELECT, DISTINCT, AND, OR, NOT, IN, NOT IN, BETWEEN, LIKE, LIMIT, IS NULL

CREATE database organization;
USE organization;
CREATE table employee( Empid int not null primary key,
    First_name varchar(15), Last_name varchar(15),
    Gender char, Role varchar(15), Dept varchar(15), Manager_id varchar(10) );
DESC employee;

insert into employee values(1,'Ram','Sharma','M','Team leader','Retail','M11');
insert into employee values(2,'Radha','Mali','F','Team leader','Marketing','M12');
insert into employee values(3,'Shyam','Kumar','M','President','HR','M13');
insert into employee values(4,'Girish','Patil','M','President','Finance','M14');
insert into employee values(5,'Sunita','Chavan','F','Manager','HR','M15');
select * from employee;

-- DISTINCT clause in the SELECT statement is used to eliminate duplicate rows from the result set that may be produced.
-- when using DISTINCT to provide a column with null values, the clause will only preserve one null alue since it considers all null values to be the same
-- in short no null values rows will be printed
select distinct Dept from employee order by Dept;
select distinct Role from employee order by Role;

-- AND operator is a logical operator that combines 2 or more boolean operatuions and returns 1, 0, or NULL. Used with WHERE clause
select * from employee where role='president' and dept='hr';
select * from employee where role='president' and dept='marketing';

-- OR operator  is a logical operator that combines 2 or more boolean operations and returns true if either of the expressions is true.
select * from employee where role='president' or dept='hr';

-- IN operator is used to determin if a value matches any other value in a list. true(1) or false(0)
select * from employee where role in('President','Manager');

-- NOT IN operator is used to determin if a value does not match any other value in a list.
select * from employee where role NOT IN('President','Manager');

-- BETWEEN operator is a logical operator that determines whether a value belongs in a range. Returns Null if value is high or low.
alter table employee add column Experience int;
update employee set Experience=8 where Empid=1;
update employee set Experience=5 where Empid=2;
update employee set Experience=10 where Empid=4;
update employee set Experience=15 where Empid=5;

select * from employee where experience between 10 and 15;
select * from employee where experience=5 or experience=10 ;

-- LIKE operator is a logical operator that determines whether a string contains a specified pattern. (not case sensitive)
select * from employee where last_name like 'P%';
select * from employee where first_name like '%m';

-- LIMIT operator used to limit the no of rows returned
select * from employee order by experience limit 3;
select * from employee order by experience desc limit 3;

-- IS NULL operator determines whether or not a value is NULL. true(1) for null and false(0) for not null
select * from employee where Experience IS NULL;

-- IS NOT NULL operator determines whether or not a value is NOT NULL. true(1) for not null and false(0) for null
select * from employee where Experience IS NOT NULL;


-- AGGREGATE FUNCTIONS
-- COUNT, AVG, MIN, MAX, SUM
select * from Employee;
select count(*) from Employee;								-- COUNTS ALL EMPLOYEES
select count(empid) from Employee where dept = 'HR';		-- COUNTS ALL EMPLOYEES IN A PARTICULAR DEPT
select MAX(Experience) from Employee;						-- DISPLAYS THE MINIMUM EXPERIENCE OF AN EMPLOYEE
select MIN(Experience) from Employee;						-- DISPLAYS THE MAXIMUM EXPERIENCE OF AN EMPLOYEE
select SUM(Experience) from Employee;						-- DISPLAYS THE SUM OF EXPERIENCE OF ALL EMPLOYEES
select AVG(Experience) as Emp_Avg  from Employee;			-- DISPLAYS THE AVERAGE EXPERIENCE OF THE EMPLOYEES


-- GROUP BY CLAUSE divides a set of rows into sub groups depending on column or expression values.
-- It is used with aggregate functions such as SUM, AVG, MAX, MIN, COUNT.
select dept, count(*) as Emp_count from Employee GROUP BY dept;				-- DISPLAYS THE DEPT WISE COUNT OF EMPLOYEES
select gender, count(*) as Emp_count from Employee GROUP BY gender;			-- DISPLAYS THE GENDER WISE COUNT OF EMPLOYEES


-- HAVING CLAUSE: Each group produced by the group by clause is evaluated by this clause.
-- if result is true, the row is included in the result set.
-- This clause was added to SQL because the WHERE clause cannot be used with aggregate functions.
select dept, SUM(experience) as total_exp from employee GROUP BY dept HAVING total_exp >= 10 AND total_exp <=20;
select ROLE, SUM(experience) as total_exp from employee GROUP BY ROLE HAVING total_exp >= 10 AND total_exp <=20;

-- Fetch dept wise emp count using having clause and sort data
select dept, count(empid) as emp_count from employee group by dept having count(empid) >= 2 order by emp_count;
select dept, sum(experience) as exp from employee group by dept having exp >= 10 or exp <= 12 order by exp;

