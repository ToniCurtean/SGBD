USE Sub2
go

CREATE OR ALTER PROCEDURE UPSERT
@comentariu varchar(100) ,
@cod_vin int ,
@cod_som int
AS
BEGIN
if(EXISTS(SELECT * FROM Comentariu WHERE cod_vin=@cod_vin and cod_som=@cod_som))
	UPDATE Comentariu set comentariu=@comentariu where cod_vin=@cod_vin and cod_som=@cod_som;
else
	INSERT INTO Comentariu(comentariu,cod_vin,cod_som) values(@comentariu,@cod_vin,@cod_som);
END
GO

