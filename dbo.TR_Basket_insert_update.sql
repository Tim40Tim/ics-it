create trigger TRG_audit on dbo.Basket
	after insert, update
as
	with dupl as (
		select id_sku, count(*) as cnt 
			from inserted 
			group by ID_SKU 
			having count(*) > 1
		)

	update dbo.Basket
	set DiscountValue =  case 
							when dbo.Basket.id in (
								select id 
									from inserted 
									where id_sku in (
										select id_sku 
											from dupl
										)
								) then value * 5 / 100
							else 0
						 end
	from dbo.Basket
	where id in (
		select id 
			from inserted
		)
go