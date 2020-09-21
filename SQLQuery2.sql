CREATE DATABASE AseguradoraABC2;
USE AseguradoraABC2;
/*Creacion de tabla conductor*/
CREATE TABLE conductor (
	numero_carne int IDENTITY(1,1),
	nombre varchar (45) NOT NULL, 
	direccion varchar (50) NOT NULL,
	PRIMARY KEY (numero_carne)
);
/*Insertar datos en conductor*/
INSERT INTO dbo.conductor (nombre, direccion)
VALUES ('Jose Perez', 'Guatemala, Guatemala'),
('Joshua Perez', 'Guatemala, Guatemala'),
('Juilia Santos', 'Guatemala, Guatemala');
SELECT * FROM conductor;
/*Creacion de tabla coche*/
CREATE TABLE coche (
	matricula int IDENTITY (1,1),
	modelo varchar (45) NOT NULL,
	anio int NOT NULL,
	numero_carne int NOT NULL,
	PRIMARY KEY (matricula),
	FOREIGN KEY (numero_carne) REFERENCES dbo.conductor (numero_carne)
);
/*Creacion de tabla accidente*/
CREATE TABLE accidente(
	numero_parte int IDENTITY(1,1),
	fecha varchar (45) NOT NULL, 
	lugar varchar (45) NOT NULL,
	matricula int NOT NULL,
	PRIMARY KEY (numero_parte),
	FOREIGN KEY (matricula) REFERENCES dbo.coche (matricula)
);
/*6. Determinar el número total de personas cuyos coches se hayan visto involucrados en un accidente
en 2005. */
SELECT COUNT(numero_parte) AS 'TOTAL Accidentes'
FROM accidente
WHERE fecha LIKE '%2005';
SELECT * FROM accidente;
/*7. Añadir 15 nuevos accidentes a la base de datos; supóngase cualquier valor para los atributos
necesarios. */
INSERT INTO dbo.accidente (fecha, lugar, matricula)
VALUES ('16-02-2005', 'Zona 1 Guatemala', 1),
('20-03-2005', 'Zona 10 Guatemala', 3),
('16-02-2020','Zona 18, Guatemala', 2),
('17-06-2018','Zona 15, Guatemala', 5),
('18-06-2017','Zona 17, Guatemala', 1),
('19-05-2010','Zona 16, Guatemala', 3),
('17-04-2005','Zona 18, Guatemala', 6),
('15-09-2010','Zona 12, Guatemala', 5),
('16-12-2016','Zona 18, Guatemala', 2),
('14-11-2006','Zona 11, Guatemala', 1),
('13-10-2001','Zona 18, Guatemala', 4),
('12-08-2002','Zona 15, Guatemala', 5),
('11-04-2003','Zona 19, Guatemala', 6),
('10-02-2018','Zona 17, Guatemala', 3),
('09-01-2015','Zona 16, Guatemala', 1);
SELECT * FROM accidente;
SELECT * FROM conductor;
/*8. Añadir 8 coches (vehículos) a la base de datos, supóngase cualquier valor para los atributos
necesarios.*/
INSERT INTO dbo.coche (modelo, anio, numero_carne)
VALUES ('Toyota Corrolla', 2020, 1),
('Mazda', 2018, 3),
('Ferrari 488 GTB', 2019, 2),
('Ferrari 812 GTS', 2019, 1),
('Bugatti Chiron Sport', 2019, 6),
('MCLaren Speedtail', 2016, 5),
('Jaguar Type R', 2010, 4),
('Maserati GranTurismo', 2019, 3);
SELECT * FROM coche;
/*9. Borrar el Mazda de “Martín Gómez”.*/
/*
SELECT 
FROM conductor AS con
INNER JOIN coche AS co ON con.numero_carne = co.numero_carne
WHERE */
INSERT INTO dbo.coche (modelo, anio, numero_carne)
VALUES ('Mazda', 2020, 3),
('Mazda', 2018, 2);
DELETE FROM coche WHERE numero_carne = 3 (SELECT modelo FROM coche WHERE modelo = 'Mazda');

DELETE coche
FROM coche AS co join conductor AS con
ON co.numero_carne = con.numero_carne
WHERE co.modelo = 'Mazda' AND con.numero_carne = 3;
SELECT * FROM coche;
SELECT * FROM conductor;
/*10. Obtener el número total de conductores cuyo nombre contenga el apellido Perez*/
SELECT COUNT(cond.nombre) AS 'Cantidad de conductores'FROM conductor AS condWHERE cond.nombre LIKE '%Perez%';/*11. Obtener todos los accidentes cuyo numeroCarne incie con 0025.*/SELECT * FROM accidenteWHERE numero_parte LIKE '%0025';/*12. Actualizar el campo matricula con el valor “Obsoleto” a aquellos vehículos cuyo año sea igual o
menor a 2002*/
UPDATE coche
SET matricula = 'Obsoleto'
WHERE anio <= 2002;