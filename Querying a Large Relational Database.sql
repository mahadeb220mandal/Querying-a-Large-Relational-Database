use [AdventureWorks2022]

--a. Get all the details from the person table including email ID, phone
-- number and phone number type

select * from person.person
select * from person.EmailAddress
select * from person.PersonPhone
select * from person.PhoneNumberType


select p.businessentityid,p.persontype,p.firstname,p.middlename,p.lastname,em.emailaddress, pe.phonenumber, ph.name phone_no_type
from person.person p
left join person.EmailAddress em on p.businessentityid = em.businessentityid
left join person.PersonPhone pe on p.businessentityid = pe.businessentityid
left join person.PhoneNumberType ph on pe.phonenumbertypeid =ph.phonenumbertypeid


--b. Get the details of the sales header order made in May 2011

select * from sales.SalesOrderHeader
where orderdate between '2011-05-01' and '2011-05-31'

--C. Get the details of the sales details order made in the month of May
--2011

select d.salesorderid,d.salesorderdetailId,d.carriertrackingnumber,d.orderqty,
d.productid,d.specialofferid,d.unitpricediscount,d.linetotal,d.rowguid,d.modifiedDate from sales.SalesOrderDetail D
left join sales.SalesOrderHeader h
on D.salesorderid=h.salesorderid
where h.orderdate between '2011-05-01' and '2011-05-31'

--d. Get the total sales made in May 2011

select sum(totaldue) TotalSales from sales.SalesOrderHeader
where orderdate between'2011-05-01' and '2011-05-31'

--e. Get the total sales made in the year 2011 by month order by
 --increasing sales

 select month(orderdate) Month,sum(totaldue) Totalsales from sales.SalesOrderHeader
 where year(orderdate) = 2011
 group by month(orderdate)
 order by Totalsales asc

 --f. Get the total sales made to the customer with FirstName='Gustavo'
 --and LastName ='Achong'

select c.customerid,p.firstname,p.lastname,sum(soh.totaldue) TotalSales from sales.SalesOrderHeader soh
inner join sales.customer c on c.customerid=soh.customerid
inner join person.person p on p.businessentityid=c.personid
where p.FirstName='Gustavo'
and p.LastName ='Achong' 
group by c.customerid,p.firstname,p.lastname

