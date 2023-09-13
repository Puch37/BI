use NORTHWND

select * from Products

select count(*) 
from Products
go

update Products
set UnitsInStock = ?
where ProductID = 11