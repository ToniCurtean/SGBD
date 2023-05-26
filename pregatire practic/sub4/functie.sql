USE Sub4
GO

CREATE FUNCTION ufCerinta3()
RETURNS @Cerinta3 Table(nume_spa varchar(100),nume_serv varchar(100),descriere varchar(100),nota int,nume_client varchar(100)) AS
BEGIN
INSERT INTO @Cerinta3(nume_spa,nume_serv,descriere,nota,nume_client)
SELECT CE.nume_spa,S.nume,S.descriere,N.nota,C.nume_client FROM CentruSpa CE
INNER JOIN ServiciuSpa S on S.cod_spa=CE.cod_spa and LEN(S.descriere)!=0
INNER JOIN Note N on N.cod_serv=S.cod_serv
INNER JOIN Client C on N.cod_client=C.cod_client;
RETURN;
END;

INSERT INTO Oras(nume_oras) values ('Cluj');

INSERT INTO CentruSpa(nume_spa,web_site,cod_oras) values ('SunGarden','m',1);
INSERT INTO CentruSpa(nume_spa,web_site,cod_oras) values ('Tulip','a',1);

SELECT * FROM CentruSpa

INSERT INTO ServiciuSpa(nume,descriere,pret,recomandare,cod_spa) values ('sauna','bun',50,'haide',1);
INSERT INTO ServiciuSpa(nume,descriere,pret,recomandare,cod_spa) values ('sauna','bun',70,'haide',2);

INSERT INTO ServiciuSpa(nume,descriere,pret,recomandare,cod_spa) values ('masaj',null,150,'haide',1);
INSERT INTO ServiciuSpa(nume,descriere,pret,recomandare,cod_spa) values ('masaj','bun',250,'haide',2);

INSERT INTO Client(nume_client,prenume_client,ocupatie) values('toni','toni','toni');
INSERT INTO Client(nume_client,prenume_client,ocupatie) values('alex','alex','alex');

SELECT * FROM Client
SELECT * FROM ServiciuSpa

exec UPSERT 1,1,10;
exec UPSERT 1,2,9;

EXEC UPSERT 2,1,10;

EXEC UPSERT 3,1,8;
EXEC UPSERT 4,2,10;

SELECT * FROM Note

SELECT * FROM ufCerinta3()




