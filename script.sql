
CREATE DATABASE valoracionfinal;
USE valoracionfinal;


CREATE TABLE Dueno(
DNI INT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Teléfono INT NOT NULL,
Dirección VARCHAR(200) NOT NULL,

CONSTRAINT PK_dni PRIMARY KEY(DNI)

);


CREATE TABLE Perro(
ID_Perro INT NOT NULL,
Nombre_Perro VARCHAR(50) NOT NULL,
Fecha_nac DATE NOT NULL,
Sexo VARCHAR(6) NOT NULL,
DNI_dueno INT NOT NULL,

CONSTRAINT PK_idP PRIMARY KEY(ID_Perro),
CONSTRAINT FK_fdni FOREIGN KEY(DNI_dueno) REFERENCES Dueno(DNI)
ON DELETE CASCADE
ON UPDATE CASCADE
);

CREATE TABLE Historial(
ID_Historial INT NOT NULL AUTO_INCREMENT,
Fecha DATE NOT NULL,
Perro INT NOT NULL,
Descripción VARCHAR(50) NOT NULL,
Monto INT NOT NULL,

CONSTRAINT PK_idH PRIMARY KEY(ID_Historial),
CONSTRAINT FK_fidp FOREIGN KEY(Perro) REFERENCES Perro(ID_Perro)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO DUENO (DNI, Nombre, Apellido, Teléfono, Dirección)
VALUES 
	(18548755, "Olga", "Petrucci", 154634574, "Bolivar 154"),
	(38954785, "Carola", "Estevez", 153254874, "Ayacucho 895 PB A"),
	(45874568, "Rodrigo", "Acuña", 1548745214, "Colon 2005");


INSERT INTO PERRO (ID_Perro, Nombre_Perro, Fecha_nac, Sexo, DNI_dueno)
VALUES 
	(01, "Choco", '2016-05-12', "Macho", 18548755),
	(02, "Martina", '2020-02-25', "Hembra", 38954785),
	(03, "Manchita", '2018-01-02', "Macho", 45874568);

INSERT INTO HISTORIAL (ID_Historial, Fecha, Perro, Descripción, Monto)
VALUES 
	(01, '2022-02-26', 01, "Baño y Corte", 2000),
	(02, '2022-01-05', 02, "Baño y Cepillado", 4000),
	(03, '2020-07-23', 03, "Baño y Corte", 1500);

-- Punto 1) 

SELECT * FROM Dueno;

-- Punto 2)

INSERT INTO Dueno (DNI, Nombre, Apellido, Teléfono, Dirección)
VALUES 
	(29548632, "Mariana", "Colombo", 154875236, "27 de abril 458");

INSERT INTO Perro (ID_Perro, Nombre_Perro, Fecha_nac, Sexo, DNI_Dueno)
VALUES 
	(04, "Ambar", '2017-07-02', "Hembra", 29548632);
    
    
-- Punto 3)
-- Borre un animal que ya no va a ser atendido. 
-- Para ello consulte antes en el historial, algún animal que ya no sea atendido desde hace mucho tiempo.

SELECT * FROM Perro 
LEFT JOIN Historial
ON Perro.ID_Perro = Historial.Perro
ORDER BY Historial.Fecha; 


DELETE FROM Perro WHERE ID_Perro = 3;

SELECT * FROM Perro;
SELECT * FROM Historial;
