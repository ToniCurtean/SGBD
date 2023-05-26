Use Lab1v2
Go


CREATE FUNCTION validareNume(@nume VARCHAR(100))
RETURNS INT AS
BEGIN
DECLARE @valid INT=1;
if LEN(ISNULL(@nume,''))=0
	set @valid=0;
RETURN @valid;
END;

GO;

CREATE FUNCTION validareCod(@cod int)
RETURNS INT AS
BEGIN
DECLARE @valid INT=1;
if (@cod is null)
	set @valid=0;
RETURN @valid;
END;
GO;

CREATE TABLE LoggerTable(
Lid INT IDENTITY PRIMARY KEY,
TypeOperation VARCHAR(50),
TableOperation VARCHAR(50),
ExecutionDate DATETIME)
GO

CREATE OR ALTER PROCEDURE AddLuptator
	@nume_l varchar(50),
	@descriere_l varchar(50),
	@cod_cat int,
	@cod_style int,
	@cod_sala int,
	@cod_man int
AS
BEGIN
BEGIN TRAN
BEGIN TRY
IF(dbo.validareNume(@nume_l)=0)
BEGIN
	RAISERROR('Numele nu poate fi null',14,1)
END
IF(dbo.validareNume(@descriere_l)=0)
BEGIN
	RAISERROR('Descrierea nu poate fi nulla',14,1)
END
IF(dbo.validareCod(@cod_cat)=0)
BEGIN
	RAISERROR('Categoria nu poate fi nulla',14,1)
END
IF(dbo.validareCod(@cod_style)=0)
BEGIN
	RAISERROR('Style nu poate fi null',14,1)
END
IF(dbo.validareCod(@cod_sala)=0)
BEGIN
	RAISERROR('Sala nu poate fi nulla',14,1)
END
IF(dbo.validareCod(@cod_man)=0)
BEGIN
	RAISERROR('Managerul nu poate fi null',14,1)
END
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) values(@nume_l,@descriere_l,@cod_cat,@cod_style,@cod_sala,@cod_man)
INSERT INTO LoggerTable(TypeOperation, TableOperation, ExecutionDate) VALUES ('INSERT', 'Luptatori', CURRENT_TIMESTAMP)
PRINT 'INSERT LUPTATORI COMPLET'
COMMIT TRAN
SELECT 'Transaction commited'
END TRY

BEGIN CATCH
ROLLBACK TRAN
SELECT 'Transaction rollbacked'
RETURN 1
END CATCH
RETURN 0
END

EXEC AddLuptator 'toni','neinvins',1,1,2,null;--nu merge cod_manager null
EXEC AddLuptator 'alex','',1,1,1,3;---nu merge descriere_l goala
EXEC AddLuptator 'maria','feroce',1,2,2,2;--merge totu ok 

SELECT * FROM Luptatori


GO;

CREATE OR ALTER PROCEDURE AddSponsor
	@nume_spon varchar(100)
AS
BEGIN
BEGIN TRAN
BEGIN TRY
IF(dbo.validareNume(@nume_spon)=0)
BEGIN
	RAISERROR('Numele nu poate fi null',14,1)
END
INSERT INTO Sponsori(nume_spon) values(@nume_spon)
INSERT INTO LoggerTable(TypeOperation, TableOperation, ExecutionDate) VALUES ('INSERT', 'Sponsor', CURRENT_TIMESTAMP)
COMMIT TRAN
SELECT 'Transaction commited'
END TRY

BEGIN CATCH
ROLLBACK TRAN
SELECT 'Transaction rollbacked'
RETURN 1
END CATCH
RETURN 0
END

EXEC AddSponsor 'dazn'---merge;
SELECT * FROM Sponsori

EXEC AddSponsor null--nu merge nu poate fi null numele;

EXEC AddSponsor ''--nu merge nu poate fi gol numele;

EXEC AddSponsor 'prime';--merge
GO

SELECT * FROM LoggerTable;
go

CREATE OR ALTER PROCEDURE AddLuptatoriSponsori1
	@nume_l varchar(100),
	@descriere_l varchar(100),
	@cod_cat int,
	@cod_style int,
	@cod_sala int,
	@cod_man int,
	@nume_spon varchar(100)
AS
BEGIN
BEGIN TRAN
BEGIN TRY
IF(dbo.validareNume(@nume_l)=0)
BEGIN
	RAISERROR('Numele luptatorului nu poate fi null',14,1)
END
IF(dbo.validareNume(@descriere_l)=0)
BEGIN
	RAISERROR('Descrierea luptatorului nu poate fi null',14,1)
END
IF(dbo.validareCod(@cod_cat)=0)
BEGIN
	RAISERROR('Categoria nu poate fi null',14,1);
END
IF(dbo.validareCod(@cod_style)=0)
BEGIN
	RAISERROR('Style nu poate fi null',14,1);
END
IF(dbo.validareCod(@cod_sala)=0)
BEGIN
	RAISERROR('Sala nu poate fi null',14,1);
END
IF(dbo.validareCod(@cod_man)=0)
BEGIN
	RAISERROR('Categoria nu poate fi null',14,1);
END

IF(dbo.validareNume(@nume_spon)=0)
BEGIN
	RAISERROR('Numele sponsorului nu poate fi null',14,1)
END

INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) values (@nume_l,@descriere_l,@cod_cat,@cod_style,@cod_sala,@cod_man)
INSERT INTO LoggerTable(TypeOperation, TableOperation, ExecutionDate) VALUES ('INSERT', 'Luptatori', CURRENT_TIMESTAMP)
print 'INSERT LUPTATOR COMPLET'
INSERT INTO Sponsori(nume_spon) values (@nume_spon)
INSERT INTO LoggerTable(TypeOperation, TableOperation, ExecutionDate) VALUES ('INSERT', 'Sponsori', CURRENT_TIMESTAMP)
print 'INSERT SPONSORI COMPLET'

declare @cod_l int
set @cod_l=(SELECT IDENT_CURRENT('Luptatori'))

declare @cod_spon int
set @cod_spon=(SELECT IDENT_CURRENT('Sponsori'))

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s) values (@cod_l,@cod_spon)
INSERT INTO LoggerTable(TypeOperation, TableOperation, ExecutionDate) VALUES ('INSERT', 'LuptatoriiSponsorii', CURRENT_TIMESTAMP)
PRINT 'INSERT LUPTATORISPONSORI COMPLET'
COMMIT TRAN
SELECT 'Transaction committed'
END TRY

BEGIN CATCH
ROLLBACK TRAN
SELECT 'Transaction rollbacked'
END CATCH
END

EXEC AddLuptatoriSponsori1 'Yair Rodriguezzzzz','unorthodox',1,2,3,4,'yakkaoooooo';--merge;

SELECT * FROM Luptatori

SELECT * FROM Sponsori

SELECT * FROM LuptatoriiSponsorii

EXEC AddLuptatoriSponsori1 '','unorthodox',1,2,3,4,'yakkao';--nu merge numele luptatorului vid;

EXEC AddLuptatoriSponsori1 'lucian bute','boxer',1,2,3,4,'';--nu merge numele sponsorului vid;

SELECT * FROM LoggerTable
