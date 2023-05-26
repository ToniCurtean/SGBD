Use Sub3
go

CREATE VIEW Cerinta3 AS
SELECT F.nume_florararie,A.nume_aranj,A.pret,AP.nr_exemplare,P.nume_p 
FROM Florarie F INNER JOIN
AranjamentFlorar A on A.cod_florarie=F.cod_florarie and F.nume_florararie not like 'm%' INNER JOIN
AranjamentPlanta AP on AP.cod_aranj=A.cod_aranj INNER JOIN
Planta P on P.cod_p=AP.cod_p 
GO

INSERT INTO Florarie(nume_florararie,telefon,adresa) values ('Magnolia','0264','mogo');
INSERT INTO Florarie(nume_florararie,telefon,adresa) values ('traian','0253','almas');


INSERT INTO CategorieAranjament(nume_cat) values ('festiv');
INSERT INTO CategorieAranjament(nume_cat) values ('casual');

INSERT INTO AranjamentFlorar(nume_aranj,pret,descriere,inaltime,cod_cat,cod_florarie) values ('nunta',10000,'frumos',100,1,2);
INSERT INTO AranjamentFlorar(nume_aranj,pret,descriere,inaltime,cod_cat,cod_florarie) values('valentines',500,'romantic',70,2,1);

INSERT INTO Planta(nume_p,descriere) values('trandafiri','spinosi');
INSERT INTO Planta(nume_p,descriere) values('magnoli','parfumate');

select * from AranjamentFlorar

select * from Planta
s
exec UPSERT 1,1,2;
exec UPSERT 2,2,4;

SELECT * FROM Cerinta3

select * from AranjamentPlanta
