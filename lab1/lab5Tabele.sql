USE Lab1v2
GO

CREATE TABLE TArbitrii(
cod_arb int PRIMARY KEY IDENTITY,
nume_arb varchar(100) not null
);

CREATE TABLE TMeciuri(
cod_meci int PRIMARY KEY IDENTITY,
cod_l1 int FOREIGN KEY REFERENCES Luptatori(cod_l),
cod_l2 int FOREIGN KEY REFERENCES Luptatori(cod_l)
);

CREATE TABLE TMeciuriArbitri(
cod_arb int FOREIGN KEY REFERENCES TArbitrii(cod_arb),
cod_meci int FOREIGN KEY REFERENCES TMeciuri(cod_meci),
CONSTRAINT pk_TMeciuriArbitri PRIMARY KEY(cod_arb,cod_meci)
);
GO	

ALTER TABLE TMeciuriArbitri
ADD score varchar(100);