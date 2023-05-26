Use Sub2
go

CREATE FUNCTION ufVinComentari()
RETURNS @VinComentari TABLE(nume_vin VARCHAR(100),nr_com int)AS
BEGIN
INSERT INTO @VinComentari(nume_vin,nr_com) SELECT V.nume_v,COUNT(C.cod_vin) as [nr comentari] from Vin V
INNER JOIN Comentariu C on C.cod_vin=V.cod_v
GROUP BY V.nume_v 
HAVING COUNT(C.cod_vin)!=2;

IF(@@ROWCOUNT=0)
	INSERT INTO @VinComentari(nume_vin,nr_com) VALUES('NICIUN VIN CU NR DE DE COMENTARI DIF DE 2',-1);
RETURN;
END;

INSERT INTO SoiStruguri(nume_soi,calitate) values('muscat','superioara');
INSERT INTO SoiStruguri(nume_soi,calitate) values('dulci','inferioara')

INSERT INTO Tara(nume_t) values('Franta');

SELECT * FROM Tara

INSERT INTO Vin(nume_v,descriere,an,cod_t,cod_soi) values('jidvei','bun',1907,1,2);
INSERT INTO Vin(nume_v,descriere,an,cod_t,cod_soi) values('issa','bun',2000,1,1);

INSERT INTO Somelier(nume_som,tel,email) values('toni','toni','toni');
INSERT INTO Somelier(nume_som,tel,email) values('alex','alex','alex');
INSERT INTO Somelier(nume_som,tel,email) values('david','david','david');

exec UPSERT 'bun',1,1;
exec UPSERT 'bun',1,2;
exec UPSERT 'bun',1,3;

exec UPSERT 'rau',2,1;
exec UPSERT 'rau',2,2;

DROP FUNCTION ufVinComentari

SELECT * FROM Comentariu


SELECT * FROM dbo.ufVinComentari();