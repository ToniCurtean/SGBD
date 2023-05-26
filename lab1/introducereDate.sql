USE Lab1v2


INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('MMA Factory','Paris');

SELECT * FROM SalaDeProvenienta;

INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('BEYOND Martial Arts','Cluj-Napoca');

INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('Mike Gym','Amsterdam');
INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('Banchamek Gym','Phuket');
INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('American Kickboxing Academy','Phoenix');
INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('American Top Team','Coconut Creek');
INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('MMA Transilvania','Cluj-Napoca');
INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('Tengu Martial Arts','Cluj-Napoca');
INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('City Kickboxing','Auckland');
INSERT INTO SalaDeProvenienta(nume_sala,oras_sala) VALUES('Tiger Muay Thai Archangel Michael Fight Club','Thailand');

SELECT * FROM SalaDeProvenienta;

INSERT INTO Manageri(nume_man) VALUES('Curtean Toni');

SELECT * FROM Manageri;

INSERT INTO Manageri(nume_man) VALUES('Morariu Serban');
INSERT INTO Manageri(nume_man) VALUES('Costinas Serban');
INSERT INTO Manageri(nume_man) VALUES('Mihalca Eduard');
INSERT INTO Manageri(nume_man) VALUES('Ciplea Stefan');
INSERT INTO Manageri(nume_man) VALUES('Mutu Adrian');
INSERT INTO Manageri(nume_man) VALUES('Gigi Becali');
INSERT INTO Manageri(nume_man) VALUES('Lupoian George');
INSERT INTO Manageri(nume_man) VALUES('Muresan Tudor');
INSERT INTO Manageri(nume_man) VALUES('Zapartan David');

ALTER TABLE Sponsori

DROP COLUMN descriere_l;

INSERT INTO Sponsori(nume_spon) VALUES('MyProtein');
INSERT INTO Sponsori(nume_spon) VALUES('GymBean');
INSERT INTO Sponsori(nume_spon) VALUES('Venum');
INSERT INTO Sponsori(nume_spon) VALUES('McGregor Fast');
INSERT INTO Sponsori(nume_spon) VALUES('Crypto.com');
INSERT INTO Sponsori(nume_spon) VALUES('Reebok');
INSERT INTO Sponsori(nume_spon) VALUES('Puma');
INSERT INTO Sponsori(nume_spon) VALUES('EA Sports');
INSERT INTO Sponsori(nume_spon) VALUES('Monster Energy');
INSERT INTO Sponsori(nume_spon) VALUES('Draft Kings');

SELECT * FROM Sponsori

INSERT INTO Categorie(tip_cat) VALUES('Flyweight');
INSERT INTO Categorie(tip_cat) VALUES('Bantamweight');
INSERT INTO Categorie(tip_cat) VALUES('Featherweight');
INSERT INTO Categorie(tip_cat) VALUES('Lightweight');
INSERT INTO Categorie(tip_cat) VALUES('Welterweight');
INSERT INTO Categorie(tip_cat) VALUES('Middleweight');
INSERT INTO Categorie(tip_cat) VALUES('Light-Heavyweight');
INSERT INTO Categorie(tip_cat) VALUES('Heavyweight');

USE Lab1v2

INSERT INTO FightingStyle(tip_style) VALUES('Kickbox');
INSERT INTO FightingStyle(tip_style) VALUES('Jiu-Jitsu');
INSERT INTO FightingStyle(tip_style) VALUES('Wrestler');
INSERT INTO FightingStyle(tip_style) VALUES('Taekwondo');
INSERT INTO FightingStyle(tip_style) VALUES('Judo');
INSERT INTO FightingStyle(tip_style) VALUES('Kung Fu');

INSERT INTO Arbitrii(nume_arb) VALUES('Sal Damato'); 
INSERT INTO Arbitrii(nume_arb) VALUES('Derek Cleary');
INSERT INTO Arbitrii(nume_arb) VALUES('Chris Lee');
INSERT INTO Arbitrii(nume_arb) VALUES('Junichiro Kamijo');
INSERT INTO Arbitrii(nume_arb) VALUES('Dave Hagen');
INSERT INTO Arbitrii(nume_arb) VALUES('David Lethaby');
INSERT INTO Arbitrii(nume_arb) VALUES('Clemens Werner');
INSERT INTO Arbitrii(nume_arb) VALUES('Anders Ohlsson'); 

SELECT * FROM Categorie
SELECT * FROM FightingStyle
SELECT * FROM SalaDeProvenienta
SELECT * FROM Manageri

INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Israel Adesanya','record 23-1-0',6,1,6,1);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Robert Whittaker','record 25-6-0',6,1,10,2);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Ciryl Gane','record 11-1-0',8,1,2,4);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Francis Nougannu','record 17-3-0',8,3,6,3);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Aljamain Sterling','record 15-1-0',2,3,7,5);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Sean O Malley','record 27-1-0',2,1,4,6);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Kamaru Usman','record 20-2-0',5,3,3,4);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Colby Convington','record 17-3-0',5,3,7,6);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Alexander Volkanovski','record 25-1-0',3,1,2,7);
INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) VALUES('Max Holloway','record 23-7-0',3,1,9,1);

SELECT * FROM Luptatori

USE Lab1v2

SELECT * FROM Luptatori
SELECT * FROM Sponsori

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (1,5);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (6,5);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (2,5);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (4,5);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (3,5);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (7,5);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (1,1);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (1,9);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (1,7);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (1,8);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (2,10);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (2,8);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (2,2);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (3,6);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (3,9);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES (3,2);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(4,1);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(4,7);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(4,9);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(5,10);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(5,7);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(5,1);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(6,8);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(6,10);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(6,9);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(6,3);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(7,3);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(7,2);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(7,8);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(7,9)
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(7,4);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(8,4);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(8,10);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(8,5);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(8,3);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(8,1);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(8,2);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(9,3);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(9,5);

INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(11,3);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(11,10);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(11,5);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(11,2);
INSERT INTO LuptatoriiSponsorii(cod_l,cod_s)VALUES(11,7);

SELECT * FROM LuptatoriiSponsorii

SELECT * FROM Luptatori
SELECT * FROM Arbitrii

INSERT INTO Meciuri(cod_l1,cod_l2)VALUES(1,2);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES (1,1);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES (1,5);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES (1,8);

INSERT INTO Meciuri(cod_l1,cod_l2)VALUES(3,4);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES (2,1);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES (2,3);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES (2,4);

SELECT * FROM Luptatori

INSERT INTO Meciuri(cod_l1,cod_l2)VALUES(5,6);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(3,2);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(3,6);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(3,7);

INSERT INTO Meciuri(cod_l1,cod_l2)VALUES(7,8);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(4,8);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(4,5);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(4,1);

INSERT INTO Meciuri(cod_l1,cod_l2)VALUES(9,11);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(5,1);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(5,3);
INSERT INTO MeciuriiArbitrii(cod_meci,cod_arb)VALUES(5,7);

SELECT * From MeciuriiArbitrii