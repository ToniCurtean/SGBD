CREATE DATABASE Sub3
go
Use Sub3
go

CREATE TABLE Florarie(
cod_florarie int PRIMARY KEY IDENTITY,
nume_florararie varchar(100) not null,
telefon varchar(100) not null,
adresa varchar(100) not null
);

CREATE TABLE CategorieAranjament(
cod_cat int PRIMARY KEY IDENTITY,
nume_cat varchar(100) not null
);

CREATE TABLE AranjamentFlorar(
cod_aranj int PRIMARY KEY IDENTITY,
nume_aranj varchar(100) not null,
pret int not null,
descriere varchar(100) not null,
inaltime int not null,
cod_cat int FOREIGN KEY REFERENCES CategorieAranjament(cod_cat),
cod_florarie int FOREIGN KEY REFERENCES Florarie(cod_florarie)
);

CREATE TABLE Planta(
cod_p int PRIMARY KEY IDENTITY,
nume_p varchar(100) not null,
descriere varchar(100) not null
);

CREATE TABLE AranjamentPlanta(
nr_exemplare int not null,
cod_aranj int FOREIGN KEY REFERENCES AranjamentFlorar(cod_aranj),
cod_p int FOREIGN KEY REFERENCES Planta(cod_p),
CONSTRAINT pk_AranjPlanta PRIMARY KEY(cod_aranj,cod_p)
);

DROP TABLE AranjamentPlanta