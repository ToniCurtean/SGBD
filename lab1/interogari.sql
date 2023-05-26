USE Lab1v2

--tipul categoriei numele si stilul luptatorilor care lupta la bantmanweight,featherweight sau flyweight
SELECT C.tip_cat AS categorie,F.tip_style,L.nume_l FROM Categorie C,FightingStyle F,Luptatori L WHERE C.cod_cat IN (1,2,3) AND C.cod_cat=L.cod_cat AND L.cod_style=F.cod_style;

--SELECT * FROM Luptatori
--SELECT * FROM Categorie
--SELECT * FROM SalaDeProvenienta
--SELECT * FROM Sponsori

--numele,categoria luptatorilor care se antreneaza la sala in cluj napoca
SELECT Sala.nume_sala as nume,F.tip_style,L.nume_l FROM SalaDeProvenienta Sala,FightingStyle F,Luptatori L where Sala.cod_sala=L.cod_sala and Sala.oras_sala='Cluj-Napoca' and L.cod_style=F.cod_style;

--numele,categoria,managerul luptatorilor care nu sunt sponsorizati de puma sau reebook
SELECT L.nume_l As nume,C.tip_cat,M.nume_man From Luptatori L,Categorie C,Manageri M WHERE cod_l NOT IN(SELECT cod_l FROM LuptatoriiSponsorii WHERE cod_s IN(7,6)) AND cod_l IN(SELECT cod_l FROM LuptatoriiSponsorii) AND L.cod_cat=C.cod_cat AND L.cod_man=M.cod_man;

--SELECT * FROM Luptatori
--SELECT * FROM LuptatoriiSponsorii

--numele salilor si numarul luptatorilor pentru fiecare sala care are cel putin un luptator
SELECT S.nume_sala,COUNT(cod_l) nr_luptatori FROM SalaDeProvenienta S
INNER JOIN Luptatori L ON S.cod_sala=L.cod_sala GROUP BY S.cod_sala,S.nume_sala;

--SELECT * FROM SalaDeProvenienta

--numele managerilor care reprezinta cel putin un luptator 
SELECT M.nume_man,COUNT(cod_l) nr_luptatori FROM Manageri M 
LEFT JOIN Luptatori L ON M.cod_man=L.cod_man GROUP BY M.cod_man,M.nume_man HAVING COUNT(cod_l)>0;

--SELECT * FROM Categorie
--SELECT * FROM Luptatori

--INSERT INTO Luptatori(nume_l,descriere_l,cod_cat,cod_style,cod_sala,cod_man) values ('Tai Tuivasa','record 15-2-0',8,1,2,7);
--INSERT INTO LuptatoriiSponsorii(cod_l,cod_s) values(12,2);
--INSERT INTO LuptatoriiSponsorii(cod_l,cod_s) values(12,4);

--numele si stilul de lupta al luptatorilor care lupta la categoria grea si au cel putin 4 sponsori
SELECT L.nume_l,F.tip_style,COUNT(cod_s) nr_sponsori FROM Luptatori L 
INNER JOIN FightingStyle F ON F.cod_style=L.cod_style
INNER JOIN LuptatoriiSponsorii LS ON L.cod_l=LS.cod_l  AND L.cod_cat=8 GROUP BY L.cod_l,L.nume_l,F.tip_style HAVING COUNT(cod_s)>3;

--USE LAB1v2

--numele luptatorilor,numele sponsorilor si categoriile luptatorilor
SELECT L.nume_l,S.nume_spon,C.tip_cat FROM Luptatori L INNER JOIN 
LuptatoriiSponsorii LS ON L.cod_l=LS.cod_l INNER JOIN Sponsori S ON LS.cod_s=S.cod_spon INNER JOIN Categorie C ON L.cod_cat=C.cod_cat;

--cod meci si numele arbitrilor care arbitreaza meciurile
SELECT M.cod_meci,A.nume_arb FROM Meciuri M INNER JOIN MeciuriiArbitrii MA
ON M.cod_meci=MA.cod_meci INNER JOIN Arbitrii A ON MA.cod_arb=A.cod_arb;

--categoria,luptator,stilul de lupta distincte in care luptatori au ca sponsor Crypto.com
SELECT DISTINCT C.tip_cat,L.nume_l,F.tip_style FROM Categorie C,Luptatori L,FightingStyle F
Where L.cod_l in(SELECT cod_l FROM LuptatoriiSponsorii LS WHERE LS.cod_s=5) and C.cod_cat=L.cod_cat and L.cod_style=F.cod_style; 

--luptator,stilul de lupta,manager unde manageri sa fie distincti
SELECT L.nume_l,F.tip_style,M.nume_man FROM Luptatori L,FightingStyle F,Manageri M
WHERE M.cod_man in(SELECT DISTINCT cod_man from Manageri M) and L.cod_man=M.cod_man and L.cod_style=F.cod_style; 