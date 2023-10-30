--1. Download the AdventureWorks database from the following location and restore it in your server:
--Location:https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks
--File Name: AdventureWorks2012.bak

--questions
--a. Get all the details from the person table including email ID, phone number and phone number type
[Person].[Person]->business entity id 
[Person].[EmailAddress]->business entity id 
[Person].[PersonPhone]->business entity id, phonenumbertypeid
[Person].[PhoneNumberType]->phonenumbertypeid

select * from [Person].[Person] as a
inner join [Person].[EmailAddress] as b 
on a.BusinessEntityID=b.BusinessEntityID
inner join[Person].[PersonPhone]as c 
on b.BusinessEntityID=c.BusinessEntityID 
inner join [Person].[PhoneNumberType] as d 
on c.PhoneNumberTypeID=d.PhoneNumberTypeID

--b.Get the details of the sales header order made in May 2011
[Sales].[SalesOrderHeader]

select * from [Sales].[SalesOrderHeader] 
where month(OrderDate)=5 and year(OrderDate)=2011

select * from [Sales].[SalesOrderHeader] 
where OrderDate between '2011-05-01' and '2011-05-31'

select datepart(QUARTER,getdate())

select * from [Sales].[SalesOrderHeader] 
where datepart(year,OrderDate)=2011 and datepart(month,OrderDate)=5

--c.Get the details of the sales details order made in the month of May 2011
[Sales].[SalesOrderHeader]-> salerorderid
[Sales].[SalesOrderDetail]-> salerorderid

select * from [Sales].[SalesOrderHeader] as a inner join [Sales].[SalesOrderDetail] as b on a.SalesOrderID=b.SalesOrderID 
where datepart(year,OrderDate)=2011 and datepart(month,OrderDate)=5

--d.Get the total sales made in May 2011
select sum(totaldue) as total_sales from [Sales].[SalesOrderHeader]
where month(orderdate)=5 and year(orderdate)=2011

--e.Get the total sales made in the year 2011 by month order by increasing salesselect datepart(MM,orderdate) as month,sum(totaldue) as total_salesfrom [Sales].[SalesOrderHeader]where year(orderdate)=2011group by datepart(mm,OrderDate)order by total_sales--f.Get the total sales made to the customer with FirstName='Gustavo'and LastName ='Achong'select * from [Person].[Person] where FirstName='Gustavo'and LastName ='Achong'