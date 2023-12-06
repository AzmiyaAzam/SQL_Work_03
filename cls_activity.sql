/*
Create a table called  employees with the following columns and datatypes:

ID - INT autoincrement
last_name - VARCHAR of size 50 should not be null
first_name - VARCHAR of size 50 should not be null
age - INT
job_title - VARCHAR of size 100
date_of_birth - DATE
phone_number - INT
insurance_id - VARCHAR of size 15

SET ID AS PRIMARY KEY DURING TABLE CREATION

*/
CREATE table employees (
ID INT auto_increment primary key,
last_name  VARCHAR (50) not null,
first_name VARCHAR (50) not null,
age int,
job_title  VARCHAR  (100),  date_of_birth date ,phone_number INT,
insurance_id  VARCHAR(15)
);


/*
Add the following data to this table in a SINGLE query:

Smith | John | 32 | Manager | 1989-05-12 | 5551234567 | INS736 |
Johnson | Sarah | 28 | Analyst | 1993-09-20 | 5559876543 | INS832 |
Davis | David | 45 | HR | 1976-02-03 | 5550555995 | INS007 |
Brown | Emily | 37 | Lawyer | 1984-11-15 | 5551112022 | INS035 |
Wilson | Michael | 41 | Accountant | 1980-07-28 | 5554403003 | INS943 |
Anderson | Lisa | 22 | Intern | 1999-03-10 | 5556667777 | INS332 |
Thompson | Alex | 29 | Sales Representative| 5552120111 | 555-888-9999 | INS433 |

*/
insert into employees( last_name, first_name,age, job_title, date_of_birth,phone_number, insurance_id)
values
('Smith', 'John', 32, 'Manager', '1989-05-12', 55512345, 'INS736'),
('Johnson', 'Sarah', 28, 'Analyst', '1993-09-20', 55598765, 'INS832'),
('Davis', 'David', 45, 'HR', '1976-02-03', 55505559, 'INS007'),
('Brown', 'Emily', 37, 'Lawyer', '1984-11-15', 55511120, 'INS035'),
('Wilson', 'Michael', 41, 'Accountant', '1980-07-28', 55544030, 'INS943'),
('Anderson', 'Lisa', 22, 'Intern', '1999-03-10', 55566677, 'INS332');

-- Rename the ID column to employee_ID
alter table employees
change column ID employee_ID int auto_increment;


-- phone_number is INT right now. Change the datatype of phone_number to make them strings of FIXED LENGTH of 10 characters.
-- Do some research on which datatype you need to use for this.
alter table employees
modify  column phone_number varchar(10);


/*-- Create a table called employee_insurance with the following columns and datatypes:

insurance_id VARCHAR of size 15
insurance_info VARCHAR of size 100

Make insurance_id the primary key of this table
							
*/
create table employee_insurance(
insurance_id VARCHAR (15) primary key,
insurance_info VARCHAR (100)
);


/*
Insert the following values into employee_insurance:

"INS736", "unavailable"
"INS832", "unavailable"
"INS007", "unavailable"
"INS035", "unavailable"
"INS943", "unavailable"
"INS332", "unavailable"
"INS433", "unavailable"

*/
insert into employee_insurance (insurance_id, insurance_info) values("INS736", "unavailable"),
("INS832", "unavailable"),
("INS007", "unavailable"),
("INS035", "unavailable"),
("INS943", "unavailable"),
("INS332", "unavailable"),
("INS433", "unavailable");



-- Set the insurance_id column in employees table as a foreign key referencing the insurance_id column in the employee_insurance table. 
alter table employees
add constraint fk_insurance
foreign key (insurance_id) references employee_insurance(insurance_id);



-- Add a column called email to the employees table. Remember to set an appropriate datatype
alter table employees
add column email varchar(100);



-- Add the value "unavailable" for all records in email in a SINGLE query
UPDATE Employees
SET email = 'unavailable';


