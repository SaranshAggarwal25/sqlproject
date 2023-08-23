use  cases;
select *from continent
select *from customers
select *from  Transaction1


1) Display the count of customer in each region who has done the transaction in year 2020
select count(customers.customer_id),region_name,year(txn_date) from customers join continent on customers.region_id=continent.region_id join transaction1 on customers.customer_id=transaction1.customer_id group by region_name,customers.customer_id,txn_date having year(txn_date)=2020;
2) Display the maximum, minimum of transaction amount of each transaction type.
select min(txn_amount),max(txn_amount) ,txn_type from transaction1 group by txn_type,txn_amount

3) Display customer id, region name and transaction amount where transaction type is deposit and
transaction amount > 2000.
select customers.customer_id,region_name,txn_amount from customers join continent on customers.region_id=continent.region_id join transaction1 on customers.customer_id=transaction1.customer_id group by customers.customer_id,region_name,txn_amount,txn_type having txn_type ='deposit' and txn_amount >2000;


4) Find duplicate records in a customer table.
select customer_id from customers group by customer_id having count(*)>1

5) Display the detail of customer id, region name, transaction type and transaction amount for the
minimum transaction amount in deposit.
select  customers.customer_id,region_name,txn_type,txn_amount from customers join continent on customers.region_id=continent.region_id join transaction1 on customers.customer_id=transaction1.customer_id group by customers.customer_id,region_name,txn_type,txn_amount having txn_amount=(select min(txn_amount) from transaction1 where txn_type='deposit')
6) Create a stored procedure to display details of customer and transaction table where transaction
date is greater than Jun 2020.
select *from continent
select *from customers
select *from  Transaction1

go

create  procedure customerjun2020
as
select *from customers join Transaction1 on customers.customer_id=Transaction1.customer_id where  year(txn_date) >2020 and month(txn_date)>06
go;

exec customerjun2020

7) Create a stored procedure to insert a record in the continent table.







create procedure sp_insert_data1 (@region_id int, @region_name varchar(40))
as 
begin
insert into continent (region_id ,region_name)
values( @region_id,@region_name)
end
exec sp_insert_data1  6,'antartica'
select *from continent

8) Create a stored procedure to display the details of transactions that happened on a specific day.
create procedure specific_day_txn (@date date)
as
begin
select *from Transaction1 where  txn_date =@date
end;
exec specific_day_txn '2020-01-21'






-----------------------------------------------------------------------------------
9) Create a user defined function to add 10% of the transaction amount in a table.
create function dbo.new_amount (@txn_amount int)
returns int
as 
begin
declare @new_amount int
set @new_amount=@txn_amount + @txn_amount*0.10;
return @new_amount
end
select dbo.new_amount (txn_amount) from dbo.transaction1


select *from transaction1
---------------------------------------------------------------------------------


---------------------------------------------------------------------------------
10) Create a user defined function to find the total transaction amount for a given transaction type.

create FUNCTION total_amt (@txn_type VARCHAR(20), @txn_date date)
RETURNS DECIMAL(18,2)
AS
BEGIN
  DECLARE @result DECIMAL(18,2)
  SELECT @result = SUM(txn_amount)
  FROM transactions1
  WHERE txn_type = @txn_type and txn_date=@txn_date
  RETURN @result
END


---------------------------------------------------------------------------------------
11) Create a table value function which comprises of the following columns customer_id,
region_id ,txn_date , txn_type , txn_amount which will retrieve data from the above table.

select *from continent
select *from customers
select *from  Transaction1

create procedure data_retrieval
as 
begin
select customers.customer_id, region_id ,txn_date , txn_type , txn_amount from Customers join Transaction1 on Customers.customer_id=Transaction1.customer_id
end
exec data_retrieval
-----------------------------


go
12) Create a try catch block to print a region id and region name in a single column.

begin try
 select region_id + region_name from continent
 end try
 begin catch
   print('error')
end catch;




13) Create a try catch block to insert a value in the continent table.
begin try
insert into  continent values(5,'europe')
end try
begin catch 
  print 'the name has been changed'

end catch
select *from continent
select *from customers
select *from  Transaction1

14) Create a trigger to prevent deleting a table in a database.
create trigger tr_prevent_table
on database
for drop_table
as 
begin

print('not allowed')
 --raiserror('table drop not allowed',16,1)
 rollback;
end

drop table continent


15) Create a trigger to audit the data in a table.

create table customer_audit(id int identity(1,1), AuditData varchar(50))
drop table customer_audit
select * from customer_audit
CREATE TRIGGER trg_audit 
ON customers
FOR INSERT
as begin
Declare @id int
select @id = customer_id from inserted
insert into customer_audit values
('New customer with ID = ' + cast(@id as varchar(5)) + ' ' +'is added at')
end

insert into Customers values(2003,2,'2001-11-14','2001-11-14')

drop trigger trg_audit 

select * from customer_audit
select * from Customers


16) Create a trigger to prevent login of the same user id in multiple pages.
elect * from sys.dm_exec_sessions order by is_user_process desc
select is_user_process, original_login_name from sys.dm_exec_sessions
order by is_user_process desc

create trigger trg_logon
on all server
for logon
as begin
declare @LoginName varchar(50)
set @LoginName = ORIGINAL_LOGIN()
if(select count(*) from sys.dm_exec_sessions where
   is_user_process = 1 and original_login_name = @LoginName) > 3
   begin
   print 'Fourth connection attempt by ' +@loginName + 'Blocked'
   rollback;
   end
end

drop trigger trg_logon on all server
17) Display top n customers on the basis of transaction type.
create procedure top_customers @transaction varchar(50)
as
begin 
select top 1 customer_id from transaction1 group by txn_type,customer_id having @transaction=txn_type
end
exec top_customers @transaction= 'deposit'
18) Create a pivot table to display the total purchase, withdrawal and deposit for all the customers.

select txn_type,txn_amount
from Transaction1
pivot 
(
sum(txn_amount) for txn_type in ([withdrawal],[deposit]) )
as PIV
----pivot table triggers
select *from Transaction1
create or alter trigger tr_prevent_table
on database
for drop_table
as 
begin

print('not allowed')
 --raiserror('table drop not allowed',16,1)
 rollback;
end

drop table continent




begin try
  select 1/0
end try
begin catch
 print 'level1'
end catch


-------------
