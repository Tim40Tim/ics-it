create view ViewCntProducts
as 
	select ID, Code, Name,
		(select dbo.TestFunction(ID)) as ItemPrice
	from dbo.SKU
go

