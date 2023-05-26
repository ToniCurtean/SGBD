USE Lab1v2

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_Tables
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tables
GO
 
if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunTables] DROP CONSTRAINT FK_TestRunTables_TestRuns
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_TestRuns
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestTables] DROP CONSTRAINT FK_TestTables_Tests
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Tests
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestRunViews] DROP CONSTRAINT FK_TestRunViews_Views
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [TestViews] DROP CONSTRAINT FK_TestViews_Views
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Tables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRunTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRunViews]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRuns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRuns]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestTables]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[TestViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestViews]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[Tests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Tests]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[Views]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Views]
GO

CREATE TABLE [Tables] (
	[TableID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestRunTables] (
	[TestRunID] [int] NOT NULL ,
	[TableID] [int] NOT NULL ,
	[StartAt] [datetime] NOT NULL ,
	[EndAt] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestRunViews] (
	[TestRunID] [int] NOT NULL ,
	[ViewID] [int] NOT NULL ,
	[StartAt] [datetime] NOT NULL ,
	[EndAt] [datetime] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestRuns] (
	[TestRunID] [int] IDENTITY (1, 1) NOT NULL ,
	[Description] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[StartAt] [datetime] NULL ,
	[EndAt] [datetime] NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestTables] (
	[TestID] [int] NOT NULL ,
	[TableID] [int] NOT NULL ,
	[NoOfRows] [int] NOT NULL ,
	[Position] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [TestViews] (
	[TestID] [int] NOT NULL ,
	[ViewID] [int] NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Tests] (
	[TestID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

CREATE TABLE [Views] (
	[ViewID] [int] IDENTITY (1, 1) NOT NULL ,
	[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [Tables] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tables] PRIMARY KEY  CLUSTERED 
	(
		[TableID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRunTables] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestRunTables] PRIMARY KEY  CLUSTERED 
	(
		[TestRunID],
		[TableID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRunViews] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestRunViews] PRIMARY KEY  CLUSTERED 
	(
		[TestRunID],
		[ViewID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRuns] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestRuns] PRIMARY KEY  CLUSTERED 
	(
		[TestRunID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestTables] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestTables] PRIMARY KEY  CLUSTERED 
	(
		[TestID],
		[TableID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestViews] WITH NOCHECK ADD 
	CONSTRAINT [PK_TestViews] PRIMARY KEY  CLUSTERED 
	(
		[TestID],
		[ViewID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [Tests] WITH NOCHECK ADD 
	CONSTRAINT [PK_Tests] PRIMARY KEY  CLUSTERED 
	(
		[TestID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [Views] WITH NOCHECK ADD 
	CONSTRAINT [PK_Views] PRIMARY KEY  CLUSTERED 
	(
		[ViewID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [TestRunTables] ADD 
	CONSTRAINT [FK_TestRunTables_Tables] FOREIGN KEY 
	(
		[TableID]
	) REFERENCES [Tables] (
		[TableID]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_TestRunTables_TestRuns] FOREIGN KEY 
	(
		[TestRunID]
	) REFERENCES [TestRuns] (
		[TestRunID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [TestRunViews] ADD 
	CONSTRAINT [FK_TestRunViews_TestRuns] FOREIGN KEY 
	(
		[TestRunID]
	) REFERENCES [TestRuns] (
		[TestRunID]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_TestRunViews_Views] FOREIGN KEY 
	(
		[ViewID]
	) REFERENCES [Views] (
		[ViewID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [TestTables] ADD 
	CONSTRAINT [FK_TestTables_Tables] FOREIGN KEY 
	(
		[TableID]
	) REFERENCES [Tables] (
		[TableID]
	) ON DELETE CASCADE  ON UPDATE CASCADE ,
	CONSTRAINT [FK_TestTables_Tests] FOREIGN KEY 
	(
		[TestID]
	) REFERENCES [Tests] (
		[TestID]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO

ALTER TABLE [TestViews] ADD 
	CONSTRAINT [FK_TestViews_Tests] FOREIGN KEY 
	(
		[TestID]
	) REFERENCES [Tests] (
		[TestID]
	),
	CONSTRAINT [FK_TestViews_Views] FOREIGN KEY 
	(
		[ViewID]
	) REFERENCES [Views] (
		[ViewID]
	)
GO

create table TestViewDTO
(
view_id int primary key not null,
StartAt datetime not null,
EndAt datetime not null
)

create table TestTableDTO
(
table_id int primary key not null,
StartAt datetime not null,
EndAt datetime not null
)


INSERT INTO Views(Name) VALUES('NumarLuptatoriSala'),('LuptatoriSponsori'),('LuptatoriSponsoriSala');

INSERT INTO Tables(Name) Values('TSala'),('TLuptatori'),('TSponsori'),('TLuptatoriiSponsori');

INSERT INTO Tests(Name) values ('getView'),('delete'),('insert');

INSERT INTO TestViews(TestID,ViewID) values(1,1),(1,2),(1,3)

INSERT INTO TestTables(TestID,TableID,NoOfRows,Position) values
(2, 1, 20, 4),
(2, 2, 30, 3),
(2, 3, 30, 2),
(2, 4, 900, 1),
(3, 1, 20, 1),
(3, 2, 30, 2),
(3, 3, 30, 3),
(3, 4, 900, 4)
GO

Select * from TestTables
go


create or alter procedure TestAll
as
begin
	exec stergeDinTables
	declare @startGeneralTime datetime=GETDATE()

	declare @table_id int
	declare @table_name varchar(100)
	declare @no_rows int
	declare cursor_insert_tables cursor
	for
	select TableID,NoOfRows from TestTables where TestID=3 order by Position
	open cursor_insert_tables

	fetch next from cursor_insert_tables into @table_id,@no_rows
	set @table_name=(select Name from Tables where TableID=@table_id)
	while @@FETCH_STATUS=0
	begin
		declare @startInsertTime datetime=GETDATE()
		exec populareTable @table_name=@table_name,@rows=@no_rows
		declare @endInsertTime datetime=GETDATE()

		insert into TestTableDTO(table_id,StartAt,EndAt) values (@table_id,@startInsertTime,@endInsertTime)
		
		fetch next from cursor_insert_tables into @table_id,@no_rows
		set @table_name=(select Name from Tables where TableID=@table_id)
	end
	close cursor_insert_tables
	deallocate cursor_insert_tables



	declare @view_id int
	declare @view_name varchar(100)
	declare cursor_views cursor
	for
	select ViewID from TestViews where TestID=1
	open cursor_views

	fetch next from cursor_views into @view_id
	set @view_name=(select Name from Views where ViewID=@view_id)
	while @@FETCH_STATUS=0
	begin
		declare @sql varchar(100)
		set @sql='select * from '+@view_name
		declare @startViewTime datetime=GETDATE()
		execute (@sql)
		declare @endViewTime datetime=GETDATE()

		insert into TestViewDTO(view_id,StartAt,EndAt) values (@view_id,@startViewTime,@endViewTime)

		fetch next from cursor_views into @view_id
		set @view_name=(select Name from Views where ViewID=@view_id)
	end
	close cursor_views
	deallocate cursor_views

	declare @endGeneralTime datetime=GETDATE()
	insert into TestRuns(Description,StartAt,EndAt) values ('',@startGeneralTime,@endGeneralTime)
	
	declare @lastTestRunID int=@@IDENTITY
	declare @StartAt datetime
	declare @EndAt datetime

	declare cursor_table_result cursor
	for
	select table_id,StartAt,EndAt from TestTableDTO
	open cursor_table_result
	fetch next from cursor_table_result into @table_id,@StartAt,@EndAt
	while @@FETCH_STATUS=0
	begin
		insert into TestRunTables(TestRunID,TableID,StartAt,EndAt) values (@lastTestRunID,@table_id,@StartAt,@EndAt)
		fetch next from cursor_table_result into @table_id,@StartAt,@EndAt
	end
	close cursor_table_result
	deallocate cursor_table_result


	declare @lastViewRunID int=@@IDENTITY
	declare cursor_views_result cursor
	for
	select view_id,StartAt,EndAt from TestViewDTO
	open cursor_views_result
	fetch next from cursor_views_result into @view_id,@StartAt,@EndAt
	while @@FETCH_STATUS=0
	begin
		insert into TestRunViews(TestRunID,ViewID,StartAt,EndAt) values (@lastTestRunID,@view_id,@StartAt,@EndAt)
		fetch next from cursor_views_result into @view_id,@StartAt,@EndAt
	end
	close cursor_views_result
	deallocate cursor_views_result

	delete from TestTableDTO
	delete from TestViewDTO
	

end

go
exec TestAll
select * from TestRuns
select * from TestRunTables
select * from TestRunViews

delete from TestRuns
delete from TestRunTables
delete from TestRunViews

select * from views