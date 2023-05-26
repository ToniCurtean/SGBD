USE Sub4
go

CREATE OR ALTER PROCEDURE UPSERT
@cod_serv int,
@cod_client int,
@nota int
as
begin
	if(exists(SELECT * FROM Note WHERE cod_serv=@cod_serv and cod_client=@cod_client))
		UPDATE Note set nota=@nota where cod_serv=@cod_serv and cod_client=@cod_client;
	else
		INSERT INTO Note(nota,cod_serv,cod_client) values(@nota,@cod_serv,@cod_client);
end
go