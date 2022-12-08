create procedure TestProcedur(
	@FamilySurName varchar(255)
)
as
	if @FamilySurName in (select FamilySurName from dbo.Family)
		begin
			declare @summ decimal(18,2)
			select @summ = sum(Value)
			from dbo.Basket;

			UPDATE dbo.Family
			set BudgetValue = dbo.Family.BudgetValue - @summ
			where @FamilySurName = FamilySurName;
		end;
	else
		raiserror ('такой семьи нет', 11, 1) -- 11 (Severity) - Указывает, что данный объект или сущность не существует.
go
