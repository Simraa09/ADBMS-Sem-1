-- JOIN OPERATIONS
CREATE database BasicJoin;
USE BasicJoin;

CREATE table Employees (
	employee_id int primary key, 
    ename varchar(50));
INSERT into Employees values 
	(101, 'Raghav'), 
    (102, 'Raashi'), 
    (103, 'Rohan'), 
    (104, 'Mohan'),
    (105, 'Sanjay');
SELECT * from Employees;

CREATE table Projects (
	project_id int primary key, 
    pname varchar(50), 
	employee_id int, 
    foreign key (employee_id) references employees(employee_id));
INSERT into Projects values 
	(1, 'Project A', 101), 
    (2, 'Project B', 102),
    (3, 'Project C', 101),
    (4, 'Project D', 103),
    (5, 'Project E', 103),
    (6, 'Project F', Null);
SELECT * from Projects;

-- INNER JOIN: matching data from both tables will be displayed..
-- default join in sql.. no need to mention 'inner join' u can just write 'join'
SELECT * from Employees INNER JOIN Projects ON employees.employee_id = projects.employee_id;

-- fetch only employee name and project name they belong to
-- here e. and p. are objects created for the tables to shorten the query..
SELECT e.ename, p.pname from projects p inner join employees e on e.employee_id = p.employee_id;

-- LEFT JOIN: matching data from both tables + non matching data from left table
-- here 1st mentioned table is left table and 2nd mentioned table is right table...
SELECT e.employee_id, e.ename, p.pname from employees e left join projects p on e.employee_id = p.employee_id; -- all data from e --- 1
SELECT e.employee_id, e.ename, p.pname from projects p left join employees e on e.employee_id = p.employee_id; -- all data from p --- 2

-- RIGHT JOIN: matching data from both tables + non matching data from right table
-- here 1st mentioned table is left table and 2nd mentioned table is right table...
SELECT e.employee_id, e.ename, p.pname from employees e right join projects p on e.employee_id = p.employee_id; -- all data from e --- 3
SELECT e.employee_id, e.ename, p.pname from projects p right join employees e on e.employee_id = p.employee_id; -- all data from p --- 4

-- LEFT JOIN FROM A TO B == RIGHT JOIN FROM B TO A ( 1 == 4 )
-- LEFT JOIN FROM B TO A == RIGHT JOIN FROM A TO B ( 2 == 3 )

-- FULL OUTER JOIN USING UNION: displays all matching and non matching data from both tables
SELECT * from employees LEFT JOIN projects on employees.employee_id = projects.employee_id 
	UNION 																						-- basically 1+3 / 1+3 == 2+4 
SELECT * from employees RIGHT JOIN projects on employees.employee_id = projects.employee_id;

-- Display employee name who has not been assigned any project
select e.ename, p.pname from employees e LEFT JOIN projects p on e.employee_id = p.employee_id where p.employee_id is not null;
-- here in this case inner join givest he same result but need not be the same case evrytime.. so it is better to use where conditions instead of inner join
