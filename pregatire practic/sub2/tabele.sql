CREATE DATABASE Sub2
Go
Use Sub2
GO

CREATE TABLE SoiStruguri(
cod_soi int PRIMARY KEY IDENTITY,
nume_soi varchar(100) not null,
calitate varchar(100) not null
);

CREATE TABLE Tara(
cod_t int PRIMARY KEY IDENTITY,
nume_t varchar(100) not null
);

CREATE TABLE Vin(
cod_v int PRIMARY KEY IDENTITY,
nume_v varchar(100) not null,
descriere varchar(100) not null,
an int not null,
cod_t int FOREIGN KEY REFERENCES Tara(cod_t),
cod_soi int FOREIGN KEY REFERENCES SoiStruguri(cod_soi)
);

CREATE TABLE Somelier(
cod_som int PRIMARY KEY IDENTITY,
nume_som varchar(100) not null,
tel varchar(100) not null,
email varchar(100) not null
);

CREATE TABLE Comentariu(
comentariu varchar(100) not null,
cod_vin int FOREIGN KEY REFERENCES Vin(cod_v),
cod_som int FOREIGN KEY REFERENCES Somelier(cod_som),
CONSTRAINT pk_Comentariu PRIMARY KEY(cod_vin,cod_som)
);