create function TestFunction(
	@ID_SKU int
)
returns decimal(18, 2)
as
	begin
		declare @PointProduct dec(18, 2);

		select @PointProduct = summV / summQ
		from (select ID_sku, sum(value) as summV, sum(Quantity) as summQ 
				from dbo.Basket 
					group by ID_sku) as n
		where n.ID_SKU = @ID_SKU

		return @PointProduct
	end
go
