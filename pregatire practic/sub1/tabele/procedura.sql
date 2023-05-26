USE Sub1
go

CREATE PROCEDURE UPSERT
@cod_r int,
@cod_u int,
@nota int
as
begin
if(EXISTS(SELECT * FROM Note WHERE cod_r=@cod_r and cod_u=@cod_u))
	UPDATE Note SET nota=@nota where cod_r=@cod_r and cod_u=@cod_u;
else
	INSERT INTO Note(nota,cod_r,cod_u) values(@nota,@cod_r,@cod_u);
END
GO

drop procedure UPSERT
go

exec UPSERT 1,2,9;
exec 

select * from Note