USE Lab1v2
go

CREATE FUNCTION validareDateMeciuri(@cod_l1 int,@cod_l2 int)
RETURNS INT
AS
BEGIN
DECLARE @valid int=1;
if(@cod_l1 is NULL)
	set @valid=0;
if(@cod_l2 is Null)
	set @valid=0;
RETURN @valid;
END;
GO

CREATE OR ALTER PROCEDURE AdaugaMeci
@cod_l1 int,
@cod_l2 int
AS
BEGIN
DECLARE @valid int;
set @valid=dbo.validareDateMeciuri(@cod_l1,@cod_l2);
if(@valid=1)
	if(EXISTS(SELECT * FROM Luptatori WHERE cod_l=@cod_l1) and EXISTS(SELECT * FROM Luptatori Where cod_l=@cod_l2))
		INSERT INTO TMeciuri(cod_l1,cod_l2) VALUES (@cod_l1,@cod_l2);
	else
		throw 50005,'Nu exista luptatorii cu codurile date',1;
else
	throw 50005,'date invalide',1;
end;

exec AdaugaMeci 1,2;

SELECT * FROM Luptatori
SELECT * FROM TMeciuri;

GO
CREATE OR ALTER PROCEDURE CautaMeci
@cod_l1 int,
@cod_l2 int
AS
BEGIN
	if(EXISTS(SELECT * FROM TMeciuri WHERE cod_l1=@cod_l1 and cod_l2=@cod_l2))
		SELECT * FROM TMeciuri WHERE cod_l1=@cod_l1 and cod_l2=@cod_l2;
	else
		throw 50005,'nu exista meciul cautat',1;
END;
GO
exec CautaMeci 1,2;
GO

CREATE OR ALTER PROCEDURE StergeMeci
@cod_meci int
AS
BEGIN
	if(EXISTS(SELECT * FROM TMeciuri WHERE cod_meci=@cod_meci))
		DELETE FROM TMeciuri where cod_meci=@cod_meci;
	else
		throw 50005,'nu exista meciul cu codul dat',1;
END;
GO

exec StergeMeci 2;
select * FROM TMeciuri
GO

CREATE OR ALTER PROCEDURE UpdateMeci
@cod_meci int,
@cod_l1 int,
@cod_l2 int
AS
BEGIN
	if(EXISTS(SELECT * FROM TMeciuri WHERE cod_meci=@cod_meci))
		if(EXISTS(SELECT * FROM Luptatori where cod_l=@cod_l1) and EXISTS(SELECT * FROM Luptatori where cod_l=@cod_l2))
			UPDATE TMeciuri SET cod_l1=@cod_l1,cod_l2=@cod_l2 WHERE cod_meci=@cod_meci;
		else
			throw 50005,'nu exista luptatori cu codurile date',1;
	else
		throw 50005,'nu exista meciul cu codul dat',1;
END
GO

exec UpdateMeci 1,2,3;

Select * from TMeciuri

