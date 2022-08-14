/*Creando base de datos*/
CREATE DATABASE veterinaria;
USE veterinaria;

/*Tabla Dueño*/
CREATE TABLE Dueno(
DNI INT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Telefono BIGINT NOT NULL,
Direccion VARCHAR(200) NOT NULL,

CONSTRAINT PK_dni PRIMARY KEY(DNI)

);

/*Tabla Perro*/
CREATE TABLE Perro(
ID_Perro INT NOT NULL,
Nombre_Perro VARCHAR(50) NOT NULL,
Fecha_nac DATE NOT NULL,
Sexo VARCHAR(6) NOT NULL,
DNI_dueno INT NOT NULL,

CONSTRAINT PK_idP PRIMARY KEY(ID_Perro),
CONSTRAINT FK_fdni FOREIGN KEY(DNI_dueno) REFERENCES Dueno(DNI)
);

/*Insertando datos en Dueño*/
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) 
VALUES
(38666999, "Aylen", "Gil", 3515776688, "Calle Falsa 123"),
(36914324, "Pedro", "Sanchez", 3516716872, "Av. Colón 2350"),
(37236435, "Juan", "Gómez", 113456445, "Duarte Quirós 360"),
(39342353, "Pedro", "Almeida", 3513453453, "Los pinos 1540");

SELECT * FROM Dueno;

/*Insertando datos en Perro*/
INSERT INTO Perro (ID_Perro, Nombre_Perro, Fecha_nac, Sexo, DNI_dueno)
VALUES
(001, "Azirafel", "2020-07-30", "Macho", 38666999),
(002, "Zara", "2020-07-30", "Hembra", 38666999),
(003, "Negro", "2017-03-13", "Macho", 36914324),
(004, "Lady", "2015-09-20", "Hembra", 37236435),
(005, "Almidón", "2019-02-09", "Hembra", 39342353),
(006, "Carnoso", "2016-05-04", "Macho", 39342353);

SELECT * FROM Perro;

/*Consultando qué perros tienen como dueño a alguien llamado Pedro (En este caso hay un "Pedro Sanchez" y un "Pedro Almeida")*/
SELECT ID_Perro, Nombre_Perro, Sexo, DNI_dueno, Nombre 
FROM Perro INNER JOIN Dueno ON Dueno.DNI=Perro.DNI_dueno
WHERE Nombre = "Pedro";