USE Lab1v2;
GO

CREATE OR ALTER PROCEDURE AddLupSpon
AS
BEGIN
BEGIN TRAN
BEGIN TRY
declare @cod_l int
set @cod_l=(SELECT IDENT_CURRENT('Luptatori'))
declare @cod_spon int
set @cod_spon=(SELECT IDENT_CURRENT('Sponsori'))
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s) values (@cod_l,@cod_spon)
INSERT INTO LoggerTable(TypeOperation, TableOperation, ExecutionDate) VALUES ('INSERT', 'LuptatoriiSponsorii', CURRENT_TIMESTAMP)
print 'INSERT LUPTATORISPONSORI COMPLET'
COMMIT TRAN
SELECT 'Transaction committed'
END TRY

BEGIN CATCH
ROLLBACK TRAN
SELECT 'LuptatoriSponsori transaction rollbacked'
END CATCH
END
GO


CREATE OR ALTER PROCEDURE AddLuptatoriSponsori2
	@nume_l varchar(100),
	@descriere_l varchar(100),
	@cod_cat int,
	@cod_style int,
	@cod_sala int,
	@cod_man int,
	@nume_spon varchar(100)
AS
BEGIN

declare @luptator int
execute @luptator=AddLuptator @nume_l,@descriere_l,@cod_cat,@cod_style,@cod_sala,@cod_man;

declare @sponsor int
execute @sponsor=AddSponsor @nume_spon;

if(@luptator<>1 and @sponsor<>1)
begin
	execute AddLupSpon
END

END



EXEC AddLuptatoriSponsori2 '','',null,null,null,null,'emaggg';-- se adauga doar sponsorul;

Select * from LoggerTable;

EXEC AddLuptatoriSponsori2 'dumitruu','spaima satului',2,2,2,2,'';--se adauga doar luptatorul;

EXEC AddLuptatoriSponsori2 'david haneyy','boxer',2,2,2,2,'binancee';--merge tot;


SELECT * FROM Luptatori
select * from Sponsori

select * from LuptatoriiSponsorii

Select * from LoggerTable;