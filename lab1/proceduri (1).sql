
USE Lab1v2

--versiunea 1 oras_sala devine nvarchar
CREATE OR ALTER PROCEDURE V1
AS
BEGIN
ALTER TABLE SalaDeProvenienta
ALTER COLUMN oras_sala NVARCHAR(220);
END;

GO

--versiune 1 undo oras_sala devine inapoi varchar
CREATE OR ALTER PROCEDURE VUndo1
AS
BEGIN
ALTER TABLE SalaDeProvenienta
ALTER COLUMN oras_Sala VARCHAR(220);
END;

GO

--versiunea 2 se cream tabelul de antrenori
CREATE OR ALTER PROCEDURE V2
AS
BEGIN
CREATE TABLE Antrenori(cod_antr INT PRIMARY KEY,cod_sala INT);
END;

DROP PROCEDURE V2;

GO

--versiunea 2 se sterge tabelul de antrenori
CREATE OR ALTER PROCEDURE VUndo2
AS
BEGIN
DROP TABLE Antrenori
END;

GO

--versiunea 3 se adauga in tabelul de meciuri data
CREATE OR ALTER PROCEDURE V3
AS
BEGIN
ALTER TABLE Meciuri
ADD data_meci date;
END;

GO

--versiunea 3 undo se sterge din tabelul de meciuri data
CREATE OR ALTER PROCEDURE VUndo3
AS
BEGIN
ALTER TABLE Meciuri
DROP COLUMN data_meci;
END;

GO

--versiunea 4 se pune pentru data valoare implicita
CREATE OR ALTER PROCEDURE V4
AS
BEGIN
ALTER TABLE Meciuri
ADD CONSTRAINT df_data_meci DEFAULT GETDATE() FOR data_meci;
END;

GO

--versiunea 4 undo se sterge pentru data valoare implicita
CREATE OR ALTER PROCEDURE VUndo4
AS
BEGIN
ALTER TABLE Meciuri
DROP df_data_meci;
END;

GO

--versiunea 5 se pune in tabelul de antrenori un foreign key asociat sali de provenienta
CREATE OR ALTER PROCEDURE V5
AS
BEGIN
ALTER TABLE Antrenori
ADD CONSTRAINT fk_sala
FOREIGN KEY (cod_sala)
REFERENCES SalaDeProvenienta(cod_sala);
END;

DROP PROCEDURE V5;

GO;

DROP PROCEDURE VUndo5

--versiunea 5 se sterge din tabelul de antrenori un foreign key asociat sali de provenienta
CREATE OR ALTER PROCEDURE VUndo5
AS
BEGIN
ALTER TABLE Antrenori
DROP CONSTRAINT fk_sala;
END;

exec VUndo5

drop procedure VUndo5


CREATE TABLE Versiuni(
versiune int
);

ALTER TABLE Versiuni
add id_versiune int default 0;

INSERT INTO Versiuni(versiune) values(0);

CREATE OR ALTER PROCEDURE UpdateVersiune
@new_versiune int
AS
BEGIN
update Versiuni
set versiune=@new_versiune
where id_versiune=0;
end

go

exec UpdateVersiune 0;

select * from Versiuni;

CREATE OR ALTER PROCEDURE ModificaVersiune
@versiune int
AS
BEGIN
if(@versiune<0)
	throw 50005, 'alegeti o versiune intre 0 si 5',1;
if(@versiune>5)
	throw 50005, 'alegeti o versiune intre 0 si 5',1;
declare @versiune_actuala int;
select @versiune_actuala=versiune from Versiuni WHERE id_versiune=0;

while(@versiune_actuala>@versiune)
begin
	declare @comanda1 nvarchar(100);
	select @comanda1=concat('VUndo',@versiune_actuala);
	exec sp_executesql @comanda1;
	set @versiune_actuala=@versiune_actuala-1;
end

while(@versiune_actuala < @versiune)
begin
	set @versiune_actuala=@versiune_actuala+1;
	declare @comanda2 nvarchar(100);
	select @comanda2=concat('V',@versiune_actuala);
	exec sp_executesql @comanda2;
end

declare @update_versiune nvarchar(100);
set @update_versiune=N'exec UpdateVersiune @v';
exec sp_executesql @update_versiune,N'@v as int',@v=@versiune_actuala;
end

DROP PROCEDURE ModificaVersiune

exec ModificaVersiune 4;

SELECT * FROM Versiuni

exec ModificaVersiune 3;

select * from Versiuni

exec ModificaVersiune 0;

select * from Versiuni

exec ModificaVersiune 5;

exec UpdateVersiune 0

exec V2;
exec V5;

exec VUndo5

drop procedure V5;

select * from Antrenori

exec VUndo2

SELECT * FROM Versiuni

exec ModificaVersiune 3

exec ModificaVersiune 5

exec ModificaVersiune 2

exec ModificaVersiune 100

select * from Versiuni
