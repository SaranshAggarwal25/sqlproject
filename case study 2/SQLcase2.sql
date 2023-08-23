create database cases;
CREATE TABLE LOCATION (LOCATION_ID INT,CITY VARCHAR(10))

INSERT INTO LOCATION VALUES(122,'New York'),
(123, 'Dallas'),
(124,'Chicago'),
(167,'Boston')

SELECT * FROM LOCATION;

Create TABLE DEPARTMENT (DEPARTMENT_ID INT, NAME VARCHAR(20), LOCATION_ID INT)

INSERT INTO DEPARTMENT VALUES(10,'Accounting',122),
(20,'Sales',124),
(30,'Research',123),
(40,'Operations',167)

SELECT * FROM DEPARTMENT

CREATE TABLE JOB(JOB_ID INT,DESIGNATION VARCHAR(20))

INSERT INTO JOB VALUES (667,'Clerk'),
(668,'Staff'),
(669,'Analyst'),
(670,'Sales Person'),
(671,'Manager'),
(672,'President')


SELECT * FROM JOB;

CREATE TABLE EMPLOYEEINCASES (Employee_ID INT, Last_Name VARCHAR(20), First_Name VARCHAR(20), Middle_Name VARCHAR(20), 
Job_ID INT, Manager_ID INT, Hire_Date DATE,Salary MONEY, Comm INT,Department_ID INT)

INSERT INTO EMPLOYEEINCASES VALUES
(7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '17-DEC-84', 800, NULL, 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '20-FEB-85', 1600, 300, 30),
(7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '04-APR-85', 2850, NULL, 30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '15-MAY-85', 2750, NULL, 30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '10-JUN-85', 2200, NULL, 40),
(7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '22-FEB-85', 1250, 500, 30)


SELECT *FROM EMPLOYEEINCASES;

1. LIST ALL THE EMPLOYEE DETAILS.

select *from EMPLOYEEINCASES;
2. LIST ALL THE DEPARTMENT DETAILS

select *from DEPARTMENT;
3. LIST ALL JOB DETAILS.

select *from JOB;
4. LIST ALL THE LOCATIONS.

select *from LOCATION
5. LIST OUT THE FIRSTNAME, LASTNAME, SALARY, COMMISSION FOR ALL EMPLOYEES.

select FIRST_NAME, LAST_NAME, SALARY, COMM from EMPLOYEEINCASES;
6. LIST OUT EMPLOYEEID,LAST NAME, DEPARTMENT ID FOR ALL EMPLOYEES AND ALIAS
select Employee_ID as "ID OF THE EMPLOYEE",Last_Name as "NAME OF THE EMPLOYEE",Department_ID as "DEP_ID" from EMPLOYEEINCASES;

EMPLOYEEID AS "ID OF THE EMPLOYEE", LAST NAME AS "NAME OF THE EMPLOYEE",
DEPARTMENTID AS "DEP_ID".

7. LIST OUT THE EMPLOYEES ANNUAL SALARY WITH THEIR NAMES ONLY.


select last_name , salary*12 as annual_salary  from EMPLOYEEINCASES;

select first_name+' '+last_name  as full_name from employeeincases;

select *from EMPLOYEEINCASES;

1. LIST THE DETAILS ABOUT "SMITH"

--select *from EMPLOYEEINCASES where First_Name, last_name like 'SMITH';---wrong cant use two conditions with like statement

select *from EMPLOYEEINCASES where 'SMITH' in (First_Name,Last_Name); 

2. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 20.

select *from EMPLOYEEINCASES where Department_ID=20;
3. LIST OUT THE EMPLOYEES WHO ARE EARNING SALARY BETWEEN 3000 AND 4500.

select * from EMPLOYEEINCASES where salary between 3000 and 4500;

4. LIST OUT THE EMPLOYEES WHO ARE WORKING IN DEPARTMENT 10 OR 20.

select *from EMPLOYEEINCASES where Department_ID=10 or department_id=20;
5. FIND OUT THE EMPLOYEES WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30.

   select *from EMPLOYEEINCASES where  Department_ID not in (10,30) ;

6. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S'.

select *from EMPLOYEEINCASES where First_Name like 'S%';


7. LIST OUT THE EMPLOYEES WHOSE NAME STARTS WITH 'S' AND ENDS WITH 'H'.

select*from EMPLOYEEINCASES where First_Name like 'S%' AND Last_Name LIKE 'H%';
8. LIST OUT THE EMPLOYEES WHOSE NAME LENGTH IS 4 AND START WITH 'S'.
select *from EMPLOYEEINCASES where First_Name like 'S___';

SELECT * FROM EMPLOYEEINCASES WHERE First_Name like 'S%' and LEN(First_Name)=4;
9. LIST OUT EMPLOYEES WHO ARE WORKING IN DEPARRTMENT 10 AND DRAW THE
SALARIES MORE THAN 3500.

select *from EMPLOYEEINCASES where Department_ID=10 and Salary > 3500;
10. LIST OUT THE EMPLOYEES WHO ARE NOT RECEVING COMMISSION.

SELECT * FROM EMPLOYEEINCASES WHERE comm IS NULL;


select *from employeeincases;

1. LIST OUT THE EMPLOYEE ID, LAST NAME IN ASCENDING ORDER BASED ON THE EMPLOYEE ID.


select employee_id ,last_name from employeeincases order by Employee_ID asc;
2. LIST OUT THE EMPLOYEE ID, NAME IN DESCENDING ORDER BASED ON SALARY.

select employee_id,first_name+' '+middle_name+' '+last_name as full_name  from EMPLOYEEINCASES order by Salary desc;
3. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER
select *from EMPLOYEEINCASES order by Last_Name asc;
4. LIST OUT THE EMPLOYEE DETAILS ACCORDING TO THEIR LAST-NAME IN ASCENDING ORDER AND THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
 select *from EMPLOYEEINCASES order by Last_Name asc , Department_ID desc;  
 

 select *from employeeincases;
1. HOW MANY EMPLOYEES WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION.


select department_id ,count(employee_id) as count_employees from employeeincases group by department_id;
 
2. LIST OUT THE DEPARTMENT WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARY OF
THE EMPLOYEES.

select max(salary) as max_employeesalary,min(salary) as min_employeesalary,avg(salary) as avg_employeesalary from employeeincases group by department_id;

3. LIST OUT JOB WISE MAXIMUM SALARY, MINIMUM SALARY, AVERAGE SALARIES OF THE
EMPLOYEES.
select job_id,count(job_id) as job_idcount ,max(salary) as max_employeesalary,min(salary) as min_employeesalary,avg(salary) as avg_employeesalary from employeeincases group by job_id;

4. LIST OUT THE NUMBER OF EMPLOYEES JOINED IN EVERY MONTH IN ASCENDING ORDER.
select count(*) as count_of_employees,month(Hire_Date) as month_of_employees from EMPLOYEEINCASES group by month(hire_Date) order by month(hire_date); 

select *from employeeincases order by Hire_Date asc;

5. LIST OUT THE NUMBER OF EMPLOYEES FOR EACH MONTH AND YEAR, IN THE ASCENDING
ORDER BASED ON THE YEAR, MONTH.

select count(employee_id) ,month(hire_date) as month_of_employees,YEAR(hire_date) as year_of_employees from EMPLOYEEINCASES group by year(hire_date) , month(hire_date) order by year(hire_date), month(hire_date);  



6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EMPLOYEES.
select count(department_id) from employeeincases;
select department_id from employeeincases  group by department_id having  count(department_id)>=4;

select *from EMPLOYEEINCASES;

7. HOW MANY EMPLOYEES JOINED IN JANUARY MONTH.

select count(employee_id) from EMPLOYEEINCASES where month(hire_date)=1;
8. HOW MANY EMPLOYEES JOINED IN JANUARY OR SEPTEMBER MONTH.

select count(employee_id) from EMPLOYEEINCASES where month(hire_date)=1 or month(hire_date)=9;
9. HOW MANY EMPLOYEES WERE JOINED IN 1985?
select count(employee_id) from EMPLOYEEINCASES where year(hire_date)=1985;
10. HOW MANY EMPLOYEES WERE JOINED EACH MONTH IN 1985.
select count(employee_id) as count_of_employees from EMPLOYEEINCASES group by month(hire_date),year(hire_date) having YEAR(hire_date)=1985;
11. HOW MANY EMPLOYEES WERE JOINED IN MARCH 1985?

select count(employee_id) as count_of_employees from EMPLOYEEINCASES group by Hire_Date having year(hire_date)=1985 and month(hire_date)=3;
12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EMPLOYEES JOINED IN
APRIL 1985?

select count(Employee_ID) from EMPLOYEEINCASES group by Department_ID having Department_ID >=3;

---------------------------------------------------------------------------------------
---joins

select *from department;
select *from employeeincases;
select *from job;
select *from location;
1. LIST OUT EMPLOYEES WITH THEIR DEPARTMENT NAMES.
select name,first_name+' '+middle_name+' '+last_name as fullname from department join employeeincases on department.department_id=employeeincases.department_id;
2. DISPLAY EMPLOYEES WITH THEIR DESIGNATIONS.
select first_name+' '+middle_name+' '+last_name as fullname,designation from employeeincases join job on job.job_id=employeeincases.job_id;

3. DISPLAY THE EMPLOYEES WITH THEIR DEPARTMENT NAMES AND REGIONAL GROUPS.
select first_name+' '+middle_name+' '+last_name as fullname,name,designation from  employeeincases join department on department.department_id=employeeincases.department_id join job on employeeincases.job_id=job.job_id;

4. HOW MANY EMPLOYEES WHO ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH
DEPARTMENT NAMES.
select *from department;
select *from employeeincases;
select *from job;
select *from location;




SELECT department.department_id, count(employeeincases.employee_id) as aggregate_employees, department.name
FROM DEPARTMENT
JOIN EMPLOYEEINCASES ON DEPARTMENT.department_id = EMPLOYEEINCASES.department_id
GROUP BY department.department_id,  department.name;

5. HOW MANY EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.

select COUNT(employee_id) as sales_employees,name from DEPARTMENT join EMPLOYEEINCASES on DEPARTMENT.DEPARTMENT_ID=EMPLOYEEINCASES.Department_ID where name='sales' group by department.name ;
6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5
EMPLOYEES AND DISPLAY THE DEPARTMENT NAMES IN ASCENDING ORDER.

select *from department;
select *from employeeincases;
select *from job;
select *from location;

select name from DEPARTMENT join EMPLOYEEINCASES on DEPARTMENT.DEPARTMENT_ID=EMPLOYEEINCASES.Department_ID  group by NAME having  count(employee_id) >= 5 order by name;   --wont display as there is no department with 5 employees

7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
--doubt

8. HOW MANY EMPLOYEES ARE WORKING IN "NEW YORK".
select count(employee_id),city from department join employeeincases on DEPARTMENT.DEPARTMENT_ID=EMPLOYEEINCASES.Department_ID join location on department.LOCATION_ID=LOCATION.LOCATION_ID group by city having city='New York';
9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
---doubt grade 

10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
---doubt 
11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO
5000 RANGE OF SALARY.
---doubt
12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.

na
select *from job;
select *from location;



13. DISPLAY THE EMPLOYEE DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
14. SHOW THE NO. OF EMPLOYEES WORKING UNDER EVERY MANAGER.

select manager_id,count(employee_id) as total_employees from EMPLOYEEINCASES group by Manager_ID;



15. DISPLAY EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.


16. DISPLAY ALL EMPLOYEES IN SALES OR OPERATION DEPARTMENTS.
select employee_id,first_name+' '+middle_name+' '+last_name as fullname from EMPLOYEEINCASES join DEPARTMENT on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID where name='Sales' OR name='Operations';


--SET OPERATORS
select *from department;
select *from employeeincases;
select *from job;
select *from location;


1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
select   distinct designation,employeeincases.job_id from employeeincases  join department  on DEPARTMENT.DEPARTMENT_ID=EMPLOYEEINCASES.Department_ID join job on employeeincases.job_id=job.job_id ;

2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.

select  department.name,job.designation,employeeincases.job_id from employeeincases  join department  on DEPARTMENT.DEPARTMENT_ID=EMPLOYEEINCASES.Department_ID join job on employeeincases.job_id=job.job_id where department.name in ('sales' ,'accounting');   ---doubt
3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN
 ASCENDING ORDER.
 select job.designation from employeeincases  join department  on DEPARTMENT.DEPARTMENT_ID=EMPLOYEEINCASES.Department_ID join job on employeeincases.job_id=job.job_id where DEPARTMENT.NAME in ('research','accounting');

--SUB QUERIES

select *from department;
select *from employeeincases;
select *from job;
select *from location;

1. DISPLAY THE EMPLOYEES LIST WHO GOT THE MAXIMUM SALARY.
select * from EMPLOYEEINCASES where salary = (select max(Salary) from employeeincases);

2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
select employee_id,first_name+' '+middle_name+' '+last_name as fullname from EMPLOYEEINCASES join DEPARTMENT on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID where name='Sales';



3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERCK'.
select employee_id,first_name+' '+middle_name+' '+last_name as fullname from EMPLOYEEINCASES join DEPARTMENT on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID join job on employeeincases.job_id=job.job_id where DESIGNATION='Clerk';
4. DISPLAY THE LIST OF EMPLOYEES WHO ARE LIVING IN "NEW YORK".
select employee_id,first_name+' '+middle_name+' '+last_name as fullname from DEPARTMENT join LOCATION on DEPARTMENT.LOCATION_ID=LOCATION.LOCATION_ID join EMPLOYEEINCASES on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID where city='New York';

5. FIND OUT NO. OF EMPLOYEES WORKING IN "SALES" DEPARTMENT.

select count(employee_id) as total_employees from EMPLOYEEINCASES join DEPARTMENT on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID where name='sales';


6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.

update employeeincases set salary =salary*1.1 from employeeincases join  DEPARTMENT on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID join job on employeeincases.job_id=job.job_id  where designation='clerk'; ---doubt
7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
select *from department;
select *from employeeincases;
select *from job;
select *from location;


select * from EMPLOYEEINCASES join DEPARTMENT on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID ;
delete from DEPARTMENT where NAME='accounting';
8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
select *from EMPLOYEEINCASES where Salary = (select max(salary) from EMPLOYEEINCASES where salary < (select max(salary) from EMPLOYEEINCASES))

9. DISPLAY THE N'TH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.'
  ---doubt
10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
select *from EMPLOYEEINCASES where salary > (select max(Salary) from EMPLOYEEINCASES where Department_ID =30);
11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
select *from EMPLOYEEINCASES where salary > (select min(salary) from EMPLOYEEINCASES where Department_ID=30)
12. FIND OUT WHOSE DEPARTMENT HAS NOT EMPLOYEES.
--sentence mistake
13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
select * from EMPLOYEEINCASES join DEPARTMENT on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID where employeeincases.Department_ID is null ;
14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR
DEPARTMENT.


select *from department;
select *from employeeincases;
select *from job;
select *from location;



select * from EMPLOYEEINCASES group by Department_ID,Salary
select avg(salary) ,department_id from EMPLOYEEINCASES group by salary,Department_ID having 
select *from EMPLOYEEINCASES join department on EMPLOYEEINCASES.Department_ID=DEPARTMENT.DEPARTMENT_ID group by salary,employeeincases.Department_ID having salary > ( select  avg(salary) ,department_id from EMPLOYEEINCASES ) ---doubt




