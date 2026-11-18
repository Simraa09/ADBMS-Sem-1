CREATE database Company_DB;
USE Company_DB;

-- NOT NULL CONSTRAINT --
CREATE table Employee(EmpID int NOT NULL, FisrtName varchar(50), LastName varchar(40), EmpAge int);
desc Employee;
select * from Employee;
INSERT into Employee value (101, 'Seema', 'Raj', 23);
INSERT into Employee value (102, 'RIya', 'Rao', 20);

-- UNIQUE CONSTRAINT --
CREATE table Employee1(EmpID int NOT NULL UNIQUE, FisrtName varchar(50), LastName varchar(40), EmpAge int);
desc Employee1;
select * from Employee1;
INSERT into Employee1 value (101, 'Seema', 'Raj', 23);
INSERT into Employee1 value (102, 'Riya', 'Rao', 20);

-- CHECK CONSTRAINT --
CREATE table Employee2(EmpID int NOT NULL, FisrtName varchar(50), LastName varchar(40), EmpAge int CHECK(EmpAge>20));
desc Employee2;
select * from Employee2;
INSERT into Employee2 value (101, 'Seema', 'Raj', 23);
INSERT into Employee2 value (102, 'Riya', 'Rao', 23);

-- CHECK CONSTRAINT USING ALTER COMMAND --
ALTER table Employee2 ADD COLUMN Salary int CHECK(Salary >=5000);
UPDATE Employee2 set Salary = 5000 where EmpID=101;
UPDATE Employee2 set Salary = 7500 where EmpID=102;

-- PRIMARY KEY CONSTRAINT --
CREATE table Employee3(EmpID int PRIMARY KEY, FisrtName varchar(50), LastName varchar(40), EmpAge int);
desc Employee3;
select * from Employee3;
INSERT into Employee3 value (101, 'Seema', 'Raj', 23);
INSERT into Employee3 value (102, 'Riya', 'Rao', 23-

-- NAMING CHECK CONSTRAINT ON MULTIPLE COLUMNS--
ALTER table Employee3 ADD COLUMN Salary int;
ALTER table Employee3 ADD CONSTRAINT chk_EmpAge_Salary CHECK(EmpAge>20 and Salary >=5000);
UPDATE Employee3 set Salary = 5000 where EmpID=101;
UPDATE Employee3 set Salary = 7500 where EmpID=102;

-- DROPING A COLUMN-LEVEL CONSTRAINT WHILE A TABLE-LEVEL CONSTRAINT REMAINS --
ALTER table Employee3 DROP CHECK chk_EmpAge_Salary;
SHOW CREATE table Employee3;
UPDATE Employee3 set Salary = 500 where EmpID=102;