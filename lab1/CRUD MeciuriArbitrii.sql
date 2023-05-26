USE Lab1v2
GO

CREATE FUNCTION validareDateMeciuriArbitri(@cod_meci int,@cod_arb int,@scor varchar(100))
RETURNS INT
AS
BEGIN
DECLARE @valid int=1;
if(@cod_meci is null)
	set @valid=0;
if(@cod_arb is null)
	set @valid=0;
if LEN(ISNULL(@scor,''))=0
	set @valid=0;
RETURN @valid;
END
GO

DROP FUNCTION validareDateMeciuriArbitri
GO

CREATE OR ALTER PROCEDURE AdaugaMeciuriArbitri
@cod_meci int,
@cod_arb int,
@score varchar(100)
AS
BEGIN
DECLARE @valid int;
set @valid=dbo.validareDateMeciuriArbitri(@cod_meci,@cod_arb,@score)
if(@valid=1)
	if(EXISTS(SELECT * FROM TMeciuri where cod_meci=@cod_meci) and EXISTS(SELECT * FROM TArbitrii where cod_arb=@cod_arb))
		if(EXISTS(SELECT * FROM TMeciuriArbitri where cod_meci=@cod_meci and cod_arb=@cod_arb))
			throw 50005,'exista deja!',1;
		else
			INSERT INTO TMeciuriArbitri(cod_arb,cod_meci,score) VALUES (@cod_arb,@cod_meci,@score)
	else
		throw 50005,'nu exista meciul sau arbitrul introdusi',1;
else
	throw 50005,'date invalide!',1;
END;

exec AdaugaMeciuriArbitri 1,2,'30-27'

SELECT * FROM TMeciuri
SELECT * FROM TArbitrii

select * from TMeciuriArbitri
GO

CREATE OR ALTER PROCEDURE CautaMeciuriArbitri
@cod_meci int,
@cod_arb int
AS
BEGIN
if(EXISTS(SELECT * FROM TMeciuriArbitri WHERE cod_meci=@cod_meci and cod_arb=@cod_arb))
	SELECT * FROM TMeciuriArbitri WHERE cod_meci=@cod_meci and cod_arb=@cod_arb;
else
	throw 50005,'nu exista meciul cu arbitrul asociat',1;
END;
GO


exec CautaMeciuriArbitri 1,1;
go
CREATE OR ALTER PROCEDURE StergeMeciuriArbitri
@cod_meci int,
@cod_arb int
AS
BEGIN
if(EXISTS(SELECT * FROM TMeciuriArbitri WHERE cod_meci=@cod_meci and cod_arb=@cod_arb))
	DELETE FROM TMeciuriArbitri WHERE cod_meci=@cod_meci and cod_arb=@cod_arb;
else
	throw 50005,'nu exista meciul cu arbitrul asociat',1;
END;

exec StergeMeciuriArbitri 1,2;

select * from TMeciuriArbitri

exec AdaugaMeciuriArbitri 1,2,'30-27'
GO

CREATE OR ALTER PROCEDURE UpdateMeciuriArbitri
@cod_meci int,
@cod_arb int,
@score varchar(100)
AS
BEGIN
if(EXISTS(SELECT * FROM TMeciuriArbitri WHERE cod_meci=@cod_meci and cod_arb=@cod_arb))
	UPDATE TMeciuriArbitri SET score=@score WHERE cod_meci=@cod_meci and cod_arb=@cod_arb;
else
	throw 50005,'nu exista meciul cu arbitrul asociat',1;
END;
GO

exec UpdateMeciuriArbitri 1,2,'28-28'

SELECT * FROM TMeciuriArbitri