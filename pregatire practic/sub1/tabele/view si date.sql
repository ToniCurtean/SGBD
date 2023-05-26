Use Sub1
go

CREATE VIEW RestaurantMedie AS
SELECT Restaurant.nume_r, AVG(Note.nota) AS media FROM Restaurant
	INNER JOIN Note ON Note.cod_r = Restaurant.cod_r
	GROUP BY Restaurant.nume_r
	HAVING AVG(Note.nota) > 5;
GO

Drop view RestaurantMedie

INSERT INTO TipRestaurant(nume_r,descriere) values ('chinezesc','bun')
INSERT INTO TipRestaurant(nume_r,descriere) values ('italian','bun')

Select * from TipRestaurant

INSERT INTO Oras(nume_o) values ('Cluj-Napoca')
INSERT INTO Oras(nume_o) values ('Bucuresti')

Select * from Oras

INSERT INTO Restaurant(nume_r,tel,cod_tip,cod_oras) values ('Shanghai','0264',1,1);
Insert into Restaurant(nume_r,tel,cod_tip,cod_oras) values ('DaPino','0254',2,2);

Select * from Restaurant

Insert into Utilizator(nume_u,email,parola) values ('toni','toni','toni');
Insert into Utilizator(nume_u,email,parola) values('alex','alex','alex');

INSERT INTO Note(nota,cod_r,cod_u) values(10,1,1);
INSERT INTO Note(nota,cod_r,cod_u) values(8,1,2);

Select * from Note

INSERT INTO Note(nota,cod_r,cod_u) values(4,2,1);
INSERT INTO Note(nota,cod_r,cod_u) values(4,2,2);

SELECT * FROM RestaurantMedie


