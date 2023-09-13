-- Seleccionar los datos de la tabla customers
select * from Customers
go

-- Actualizar la tabla customers donde 
-- CustomerId = 'ALKFI'

select * from Customers
where CustomerID = 'ALFKI'
go

--Consulta selecciona el customerid de los customers
-- del pais francia y el nombre de contacto maria anders
SELECT CUSTOMERID FROM Customers
WHERE Country='France' and ContactName='Maria Anders'
go

update Customers
set Country = 'France'
where CustomerID = 'ALFKI'
go