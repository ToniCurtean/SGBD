USE Lab1v2
Go

CREATE VIEW NumeArbitriiScorMeci AS SELECT TMA.cod_meci,TA.nume_arb,TMA.score FROM TArbitrii TA INNER JOIN TMeciuriArbitri TMA ON TA.cod_arb=TMA.cod_arb; 
go

CREATE VIEW NumeArbitruNumarMeciuri as Select TA.nume_arb,COUNT(TMA.cod_arb) as [nr meciuri arbitrate] from TArbitrii TA INNER JOIN TMeciuriArbitri TMA on TMA.cod_arb=TA.cod_arb GROUP BY TA.nume_arb;
go
SELECT * FROM NumeArbitriiScorMeci

Select * from NumeArbitruNumarMeciuri

go
DROP VIEW NumeArbitruNumarMeciuri


CREATE UNIQUE INDEX TArbitri_nume_asc ON TArbitrii(cod_arb ASC) INCLUDE (nume_arb) WITH(IGNORE_DUP_KEY=ON)
GO


CREATE UNIQUE INDEX TMeciuriArbitri_meci_arb_asc ON TMeciuriArbitri(cod_arb ASC,cod_meci ASC) INCLUDE (score) WITH(IGNORE_DUP_KEY=ON)
GO

SELECT * FROM Luptatori
SELECT * FROM TMeciuri
exec AdaugaMeci 1,2
exec AdaugaMeci 3,4
exec AdaugaMeci 5,6
exec AdaugaMeci 7,8
exec AdaugaMeci 9,11

Select * FROM Arbitrii

exec AdaugaArbitri 'toni'
exec AdaugaArbitri 'alex'
exec AdaugaArbitri 'david'
exec AdaugaArbitri 'george'
exec AdaugaArbitri 'serban'
exec AdaugaArbitri 'stefan'
exec AdaugaArbitri 'edi'
exec AdaugaArbitri 'raul'

Select * from TMeciuri
select * from TArbitrii

Select * from TMeciuriArbitri

exec AdaugaMeciuriArbitri 3,3,'30-27'
exec AdaugaMeciuriArbitri 3,5,'29-28'
exec AdaugaMeciuriArbitri 3,6,'30-27'

exec AdaugaMeciuriArbitri 4,5,'30-27'
exec AdaugaMeciuriArbitri 4,6,'29-28'
exec AdaugaMeciuriArbitri 4,7,'29-28'

exec AdaugaMeciuriArbitri 5,6,'28-28'
exec AdaugaMeciuriArbitri 5,7,'28-28'
exec AdaugaMeciuriArbitri 5,8,'27-27'

exec AdaugaMeciuriArbitri 6,8,'30-27'
exec AdaugaMeciuriArbitri 6,9,'29-28'
exec AdaugaMeciuriArbitri 6,11,'27-27'

exec AdaugaMeciuriArbitri 7,3,'30-27'
exec AdaugaMeciuriArbitri 7,6,'28-28'
exec AdaugaMeciuriArbitri 7,9,'29-29'

select * from NumeArbitriiScorMeci
go
select * from NumeArbitruNumarMeciuri

select * from TArbitrii

exec AdaugaArbitri 'denis';
exec UpdateArbitri 3,'darius'
exec CautaArbitri 'raul'
exec StergeArbitri  'denis'

select * from TMeciuri
select * from Luptatori

exec AdaugaMeci 2,3
exec UpdateMeci 8,4,5
exec CautaMeci 4,5
exec StergeMeci 8

select * from TMeciuri
select * from TArbitrii
select * from TMeciuriArbitri

exec AdaugaMeciuriArbitri 3,11,'30-27'
exec UpdateMeciuriArbitri 3,11,'29-28'
exec CautaMeciuriArbitri 3,11
exec StergeMeciuriArbitri 3,11