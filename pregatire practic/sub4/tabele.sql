CREATE DATABASE Sub4
GO

USE Sub4
Go

CREATE TABLE Oras(
cod_oras int PRIMARY KEY IDENTITY,
nume_oras varchar(100) not null
);

CREATE TABLE CentruSpa(
cod_spa int PRIMARY KEY IDENTITY,
nume_spa varchar(100) not null,
web_site varchar(100) not null,
cod_oras int FOREIGN KEY REFERENCES Oras(cod_oras)
);

CREATE TABLE ServiciuSpa(
cod_serv int PRIMARY KEY IDENTITY,
nume varchar(100) not null,
descriere varchar(100),
pret int not null,
recomandare varchar(100) not null,
cod_spa int FOREIGN KEY REFERENCES CentruSpa(cod_spa)
);

CREATE TABLE Client(
cod_client int PRIMARY KEY IDENTITY,
nume_client varchar(100) not null,
prenume_client varchar(100) not null,
ocupatie varchar(100) not null
);

CREATE TABLE Note(
nota int not null,
cod_serv int FOREIGN KEY REFERENCES ServiciuSpa(cod_serv),
cod_client int FOREIGN KEY REFERENCES Client(cod_client),
CONSTRAINT pk_Nota PRIMARY KEY(cod_serv,cod_client)
);
