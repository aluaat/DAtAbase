create table locations(
location_id serial primary key,
	street_adress varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12)
);

create table departments(
department_id serial primary key,
	department_name varchar(50) unique,
	budget integer,
	location_id integer references locations
);

create table employees(
employee_id serial primary key,
	first_name varchar(50),
	lastname varchar(50),
	email varchar(50),
	phone_number varchar(20),
	salary integer,
	department_id integer references departments
);

Select employees.first_name, employees.lastname, employees.department_id, departments.department_name 
from employees cross join departments;

Select employees.first_name, employees.lastname, employees.department_id, departments.department_name 
from employees inner join departments on department_id = 40 or department_id = 80;

Select employees.first_name, employees.lastname, 
departments.department_name, locations.city, locations.state_province from employees
inner join (departments cross join locations) on department_id is not null;

Select * from departments left join employees where employees.employee_id is null;
