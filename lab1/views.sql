USE Lab1v2
GO



CREATE TABLE TSala(
cod_sala INT PRIMARY KEY IDENTITY,
nume_sala VARCHAR(100) NOT NULL,
oras_sala VARCHAR(220) NOT NULL
);

CREATE TABLE TLuptatori(
cod_l INT PRIMARY KEY IDENTITY,
nume_l VARCHAR(100) NOT NULL,
descriere_l VARCHAR(100) NOT NULL,
cod_sala INT FOREIGN KEY REFERENCES TSala(cod_sala) NOT NULL,
cod_cat INT FOREIGN KEY REFERENCES Categorie(cod_cat) NOT NULL,
cod_style INT FOREIGN KEY REFERENCES FightingStyle(cod_style) NOT NULL,
cod_man INT FOREIGN KEY REFERENCES Manageri(cod_man) NOT NULL
);

CREATE TABLE TSponsori(
cod_spon INT PRIMARY KEY IDENTITY,
nume_spon VARCHAR(100) NOT NULL
);

CREATE TABLE TLuptatoriiSponsori(
cod_l INT FOREIGN KEY REFERENCES TLuptatori(cod_l),
cod_s INT FOREIGN KEY REFERENCES TSponsori(cod_spon),
CONSTRAINT pk_TLuptatoriiSponsorii PRIMARY KEY(cod_l,cod_s)
);

--VIEWS
DROP VIEW LuptatoriSponsori
DROP VIEW NumarLuptatoriSala
DROP VIEW LuptatoriSponsoriSala
GO


CREATE VIEW LuptatoriSponsori AS SELECT LS.cod_l,LS.cod_s from TLuptatoriiSponsori LS
GO


--2 tabele
GO
CREATE VIEW NumarLuptatoriSala AS SELECT S.cod_sala, COUNT(L.cod_l) as [nr luptatori] FROM TSala S
INNER JOIN TLuptatori L on L.cod_sala=S.cod_sala GROUP BY S.cod_sala

GO
--group by
--numarul luptatorilor care au mai mult de 3 sponsori grupati dupa sala
CREATE VIEW LuptatoriSponsoriSala AS SELECT S.cod_sala,S.nume_sala,COUNT(L.cod_l) as [nr luptatori] FROM TSala S
INNER JOIN TLuptatori L on L.cod_sala=S.cod_sala
WHERE(SELECT COUNT(LS.cod_s) FROM TLuptatoriiSponsori LS
INNER JOIN TLuptatori L on L.cod_l=LS.cod_l 
)>3
GROUP BY S.cod_sala,S.nume_sala;


