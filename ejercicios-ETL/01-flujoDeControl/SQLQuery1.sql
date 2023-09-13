select * from Customers

update Customers
set Country = 'France'
where CustomerID = 'ALFKI'
go

SELECT CUSTOMERID FROM Customers
WHERE Country='France' and ContactName='Maria Anders'
go

update Customers
set Country = 'Guanchumpein'
where CustomerID =?

select * from Customers
where  CustomerID='ALFKI'