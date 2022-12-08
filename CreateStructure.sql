create table dbo.SKU(
	ID int identity(1,1) primary key not null,
	Code as 's' + CAST(ID as varchar(14)) persisted not null,
	[Name] varchar(100) null,
	constraint UNIQ_code unique (Code)
)
go

create table dbo.Basket(
	ID int identity(1,1) primary key not null,
	ID_SKU int not null,
	Quantity smallint not null,
	[Value] decimal(18,2) not null,
	PurchaseDate date not null default(getdate()),
	DiscountValue decimal(18,2) null,
	constraint CHK_Basket check (Quantity>0 AND Value>=0),
	constraint FK_Basket foreign key (ID_SKU) references dbo.SKU(ID)
)
go

create table dbo.Family(
	ID int identity(1,1) not null, 
	FamilySurName varchar(255)  null, 
	BudgetValue decimal(18,2) not null
)
go
