USE Lab1v2
go

CREATE FUNCTION validareDateArbitri(@nume VARCHAR(100))
RETURNS INT AS
BEGIN
DECLARE @valid INT=1;
if LEN(ISNULL(@nume,''))=0
	set @valid=0;
RETURN @valid;
END;
GO

drop function dbo.validareDateArbitri

INSERT INTO TArbitrii(nume_arb) VALUES ('toni'); 

select * from TArbitrii

PRINT dbo.validareDateArbitri('alex');
go

CREATE OR ALTER PROCEDURE AdaugaArbitri
@nume varchar(100)
AS
BEGIN
	declare @valid int;
	set @valid=dbo.validareDateArbitri(@nume);
	if(@valid=1)
		if(EXISTS(SELECT * FROM TArbitrii WHERE nume_arb=@nume))
			throw 50005,'deja exista un arbitru cu numele dat!',1;
		else
			INSERT INTO TArbitrii(nume_arb) VALUES (@nume);
	else
		throw 50005,'date invalide',1;
END
go

DROP PROCEDURE AdaugaArbitri

exec AdaugaArbitri 'marius'

SELECT * FROM TArbitrii

CREATE OR ALTER PROCEDURE CautaArbitri
@nume varchar(100)
AS
BEGIN
	if(EXISTS(SELECT * FROM TArbitrii where nume_arb=@nume))
		SELECT * FROM TArbitrii where nume_arb=@nume;
	else
		throw 50005,'nu exista arbitrul cu numele dat',1;
END
GO


CREATE OR ALTER PROCEDURE StergeArbitri
@nume varchar(100)
AS
BEGIN
	if(EXISTS(SELECT * FROM TArbitrii where nume_arb=@nume))
		DELETE FROM TArbitrii WHERE nume_arb=@nume;
	else
		throw 50005,'nu exista arbitrul cu numele dat',1;
END
GO

Select * from TArbitrii

exec StergeArbitri 'toni';


go
CREATE OR ALTER PROCEDURE UpdateArbitri
@cod int,
@nume varchar(100)
AS
BEGIN
	if(EXISTS(SELECT * FROM TArbitrii where cod_arb=@cod))
		UPDATE TArbitrii SET nume_arb=@nume WHERE cod_arb=@cod;
	else
		throw 50005,'nu exista arbitrul cu codul dat',1;
END
GO;

exec UpdateArbitri 2,'valer'
