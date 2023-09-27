use datamart1
go

use NORTHWND

select * from Customers

select top 0 *
into datamart1.dbo.dcustomers
from Customers

select top 0 *
into datamart1.dbo.dshippers
from Shippers

select top 0 *
into datamart1.dbo.dorders
from Orders

select *
into datamart1.dbo.dcustomers1
from Customers
where 1=0

select * from datamart1.dbo.dcustomers1

-- agregar la restriccion de primary key a la tabla customers

alter table datamart1.dbo.dcustomers
add constraint pk_dcustomers
primary key (customerId)

--agregar la restriccion de primary key de las tablas

alter table datamart1.dbo.dcustomers
add constraint pk_dcustomers
primary key (customerId)

alter table datamart1.dbo.dshippers
add constraint pk_dshippers
primary key (shipperId)

alter table datamart1.dbo.dorders
add constraint pk_dorders
primary key (OrderID)
go

--agregar la restriccion de foreing key de las tablas

alter table datamart1.dbo.dorders
add constraint fk_dorders
foreign key (ShipVia)
references datamart1.dbo.dshippers (shipperID)

alter table datamart1.dbo.dorders
add constraint fk_dorders_dcustomers2
foreign key (CustomerID)
references datamart1.dbo.dcustomers (CustomerID)

alter table datamart1.dbo.dcustomers
drop constraint fk_dorders_dcustomers

use NORTHWND

select o.OrderID, o.OrderDate, 
o.EmployeeID, e.FullName, 
c.CompanyName, c.City,
c.Country, od.UnitPrice,
od.Quantity, od.Discount,
od.mount, p.ProductName
from Orders as o
inner join (
    select employeeid, 
    CONCAT(FirstName,' ' , LastName) 
    as FullName 
    from Employees
) as e
on o.EmployeeID = e.EmployeeID
inner join (
    select CompanyName, City, 
    Country, CustomerID 
    from Customers
) as c
on o.CustomerID = c.CustomerID
inner join(
    select UnitPrice, Quantity, 
    Discount, (UnitPrice*Quantity) as mount,
    OrderID, ProductID
    from [Order Details]
) as od
on o.OrderID = od.OrderID
inner join(
    select ProductName, ProductID 
    from Products
) as p
on od.ProductID = p.ProductID

go

-- Crear la vista de reportes de ventas

create view ReporteVentas
as
select o.OrderID, o.OrderDate, 
o.EmployeeID, e.FullName, 
c.CompanyName, c.City,
c.Country, od.UnitPrice,
od.Quantity, od.Discount,
od.mount, p.ProductName
from Orders as o
inner join (
    select employeeid, 
    CONCAT(FirstName,' ' , LastName) 
    as FullName 
    from Employees
) as e
on o.EmployeeID = e.EmployeeID
inner join (
    select CompanyName, City, 
    Country, CustomerID 
    from Customers
) as c
on o.CustomerID = c.CustomerID
inner join(
    select UnitPrice, Quantity, 
    Discount, (UnitPrice*Quantity) as mount,
    OrderID, ProductID
    from [Order Details]
) as od
on o.OrderID = od.OrderID
inner join(
    select ProductName, ProductID 
    from Products
) as p
on od.ProductID = p.ProductID

go

select * from ReporteVentas
where ProductName = 'Queso Cabrales'