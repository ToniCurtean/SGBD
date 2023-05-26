USE Lab1v2
GO

CREATE OR ALTER PROCEDURE populareSali
	@rows int
as
begin
	declare @sala varchar(100)
	declare @oras varchar(220)
	while @rows > 0
	begin
		set @sala='Sala' + CONVERT(varchar(5),@rows)
		set @oras='Oras' + CONVERT(varchar(5),@rows)
		insert into TSala(nume_sala,oras_sala) values(@sala,@oras)
		set @rows=@rows-1
	end
end

GO

CREATE OR ALTER PROCEDURE populareSponsori
	@rows int
as
begin
	declare @nume varchar(100)
	while @rows > 0
	begin
		set @nume='Sponsor'+CONVERT(varchar(5),@rows)
		insert into TSponsori(nume_spon) values(@nume)
		set @rows=@rows-1
	end
end
go

CREATE OR ALTER PROCEDURE populareLuptatori
	@rows int
as
begin
	declare @nume_l varchar(100)
	declare @descriere_l varchar(100)
	declare @cod_sala int
	declare @cod_cat int
	declare @cod_style int
	declare @cod_man int
	while @rows>0
	begin
		set @nume_l='Nume'+CONVERT(varchar(5),@rows)
		set @descriere_l='Descriere'+CONVERT(varchar(5),@rows)
		select top 1 @cod_sala=cod_sala from TSala order by NEWID()
		select top 1 @cod_cat=cod_cat from Categorie order by NEWID()
		select top 1 @cod_style=cod_style from FightingStyle order by NEWID()
		select top 1 @cod_man=cod_man from Manageri order by NEWID()
		insert into TLuptatori(nume_l,descriere_l,cod_sala,cod_cat
		,cod_style,cod_man) values (@nume_l,@descriere_l,@cod_sala,
		@cod_cat,@cod_style,@cod_man)
		set @rows=@rows-1
	end
end

GO
CREATE OR ALTER PROCEDURE populareLuptatoriSponsori
	@rows int
as
begin
	declare @cod_l int
	declare @cod_s int
	declare cursor_table cursor
	for
	select cod_l,cod_spon from TLuptatori
	cross join TSponsori

	open cursor_table
	while @rows>0
	begin
		fetch next from cursor_table into @cod_l,@cod_s
		insert into TLuptatoriiSponsori(cod_l,cod_s) values(@cod_l,@cod_s)
		set @rows=@rows-1
	end
	close cursor_table
	deallocate cursor_table
end

go
CREATE OR ALTER PROCEDURE stergeSali
as
begin
	delete from TSala
end

go

CREATE OR ALTER PROCEDURE stergeSponsori
as
begin
	delete from TSponsori
end

go
create or alter procedure stergeLuptatori
as
begin
	delete from TLuptatori
end

go
create or alter procedure stergeLuptatoriSponsori
as
begin
	delete from TLuptatoriiSponsori
end

go
CREATE OR ALTER PROCEDURE populareTable
	@table_name varchar(100),
	@rows int
as
begin
	if @table_name='TSala'
		exec populareSali @rows;
	else if @table_name='TSponsori'
		exec populareSponsori @rows;
	else if @table_name='TLuptatori'
		exec populareLuptatori @rows
	else if @table_name='TLuptatoriiSponsori'
		exec populareLuptatoriSponsori @rows
end

go

CREATE OR ALTER PROCEDURE stergeTabel
	@table_name varchar(100)
as
begin
	if @table_name='TSala'
		exec stergeSali	
	else if @table_name='TSponsori'
		exec stergeSponsori 
	else if @table_name='TLuptatori'
		exec stergeLuptatori 
	else if @table_name='TLuptatoriiSponsori'
		exec stergeLuptatoriSponsori 
end

go
CREATE OR ALTER PROCEDURE stergeDinTables
as
begin
	declare @table_id int
	declare @table_name varchar(50)
	declare cursor_delete_table cursor
	
	for
	select TableID from TestTables where TestID=2 order by Position
	open cursor_delete_table
	fetch next from cursor_delete_table into @table_id
	set @table_name=(select Name from Tables where TableID=@table_id)
	while @@FETCH_STATUS=0
	begin
		exec stergeTabel @table_name=@table_name
		fetch next from cursor_delete_table into @table_id
		set @table_name=(select Name from Tables where TableID=@table_id)
	end
	close cursor_delete_table
	deallocate cursor_delete_table
end



exec stergeDinTables

select * from Tables

exec stergeTabel TSala

select * from TSala
select * from TSponsori
select * from TLuptatori
select * from TLuptatoriiSponsori