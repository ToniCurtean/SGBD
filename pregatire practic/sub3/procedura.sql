Use Sub3
go

CREATE OR ALTER PROCEDURE UPSERT
@cod_aranj int,
@cod_p int,
@nr_exemplare int
AS
BEGIN
	if(exists(SELECT * FROM AranjamentPlanta WHERE cod_aranj=@cod_aranj and cod_p=@cod_p))
		UPDATE AranjamentPlanta set nr_exemplare=@nr_exemplare where cod_aranj=@cod_aranj and cod_p=@cod_p;
	else
		INSERT INTO AranjamentPlanta(nr_exemplare,cod_aranj,cod_p) values(@nr_exemplare,@cod_aranj,@cod_p);
END;
