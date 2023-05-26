CREATE DATABASE Sub1
go
USE Sub1
go

CREATE TABLE TipRestaurant(
cod_tip int PRIMARY KEY IDENTITY,
nume_r varchar(100) not null,
descriere varchar(100) not null
)

CREATE TABLE Oras(
cod_oras int PRIMARY KEY IDENTITY,
nume_o varchar(100) not null
)

DROP TABLE TipRestaurant

DROP TABLE Oras

CREATE TABLE Utilizator(
cod_u int PRIMARY KEY IDENTITY,
nume_u varchar(100) not null,
email varchar(100) not null,
parola varchar(100) not null
);

CREATE TABLE Restaurant(
cod_r int PRIMARY KEY IDENTITY,
nume_r varchar(100) not null,
tel varchar(100) not null,
cod_tip int FOREIGN KEY REFERENCES TipRestaurant(cod_tip),
cod_oras int FOREIGN KEY REFERENCES Oras(cod_oras)
);

CREATE TABLE Note(
nota int not null,
cod_r int FOREIGN KEY REFERENCES Restaurant(cod_r),
cod_u int FOREIGN KEY REFERENCES Utilizator(cod_u),
CONSTRAINT pk_Note PRIMARY KEY(cod_r,cod_u)
);

