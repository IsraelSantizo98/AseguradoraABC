CREATE DATABASE SegurosABC
USE SegurosABC;
/*Conductor*/
CREATE TABLE conductor(
	numero_carne int IDENTITY(1,1),
	nombre varchar (45) NOT NULL,
	direccion varchar (50) NOT NULL,
	PRIMARY KEY (numero_carne)
);
/*Carro*/
CREATE TABLE coche(
	matricula int IDENTITY (1,1),
	modelo varchar (45) NOT NULL,
	anio varchar (45) NOT NULL,
	PRIMARY KEY (matricula)
);
ALTER TABLE coche
ADD numero_carne int;

ALTER TABLE coche
ADD FOREIGN KEY (numero_carne)
REFERENCES dbo.conductor (numero_carne);
SELECT * FROM coche;
/*Accidente*/
CREATE TABLE accidente(
	numero_parte int IDENTITY (1,1),
	fecha varchar (45) NOT NULL,
	lugar varchar (45),
	PRIMARY KEY (numero_parte)
);
/*Posee*/
CREATE TABLE posee(
	id_posee int IDENTITY (1,1),
	numero_carnet int NOT NULL,
	matricula int NOT NULL,
	PRIMARY KEY (id_posee),
	FOREIGN KEY (numero_carnet) REFERENCES dbo.conductor(numero_carne),
	FOREIGN KEY (matricula) REFERENCES dbo.coche(matricula)
);
/*Participo*/
CREATE TABLE participo(
	id_participo int IDENTITY (1,1),
	importe_danios varchar (45),
	numero_carnet int NOT NULL,
	coche int NOT NULL,
	numero_parte int NOT NULL,
	PRIMARY KEY (id_participo),
	FOREIGN KEY (numero_carnet) REFERENCES dbo.conductor(numero_carne),
	FOREIGN KEY (coche) REFERENCES dbo.coche(matricula),
	FOREIGN KEY (numero_parte) REFERENCES dbo.accidente(numero_parte)
);
SELECT * FROM accidente AS acc, conductor AS con 
WHERE fecha = 2005 ;

INSERT INTO dbo.accidente (fecha, lugar)
VALUES ('2005', 'Guatemala');
/*1.- Determinar el número total de personas cuyos coches se hayan visto involucrados en un accidente
en 2005*/
SELECT COUNT(numero_parte) AS 'TOTAL Accidentes'
FROM accidente
WHERE fecha LIKE '%2005';
/*2.- Añadir 15 nuevos accidentes a la base de datos; supóngase cualquier valor para los atributos
necesarios*/
INSERT INTO dbo.accidente (fecha, lugar)
VALUES ('2005', 'Guatemala'),
('2005', 'Guatemala'),
('2010', 'Guatemala'),
('2012', 'Guatemala'),
('2015', 'Guatemala'),
('2008', 'Guatemala'),
('2009', 'Guatemala'),
('2007', 'Guatemala');
/*Insertar Tabla Conductor*/
SELECT * FROM conductor
INSERT INTO dbo.conductor (nombre, direccion)
VALUES ('Martin Gomez', 'Guatemala'),
('Jorge Ovalos', 'Guatemala'),
('Jorge Guerra', 'Guatemala'),
('Jose Lopez', 'Guatemala'),
('Jose Boch', 'Guatemala'),
('Jose Guerra', 'Guatemala'),
('Jorge Santizo', 'Guatemala'),
('Israel Mendez', 'Guatemala'),
('Jorge Juanito', 'Guatemala'),
('Jose Enrique', 'Guatemala'),
('Jorge Bryan', 'Guatemala'),
('Bryan Lopez', 'Guatemala'),
('Israel Bicho', 'Guatemala'),
('Andy Pandy', 'Guatemala'),
('Barry Allen', 'Guatemala');
/*Insertar Tabla Coche*/
SELECT * FROM coche;
INSERT INTO dbo.coche(modelo, anio, numero_carne)
VALUES ('Mazda', '2015', 1),
('Ferrari', '2020', 2),
('Paggani', '2019', 3),
('Porche', '2015', 4),
('Tesla', '2018', 5),
('Jeepeta', '2008', 6),
('Dodge', '2010', 7),
('Toyota', '2015', 8),
('Alfa Romeo', '2000', 9),
('Nissan', '2004', 10),
('KIA', '2017', 11),
('Fiat', '2001', 12),
('Mazda', '2009', 13),
('BMW', '2003', 14),
('Mercedez', '2021', 15)
;
/*Insertar Tabla Accidentes*/
SELECT * FROM accidente;
INSERT INTO dbo.accidente(fecha, lugar, matricula)
VALUES ('12-02-2005', 'Zona 05, Guatemala, Guatemala', 15),
('13-03-2001', 'Zona 01, Guatemala, Guatemala', 2),
('15-06-2019', 'Zona 10, Guatemala, Guatemala', 3),
('17-08-2020', 'Zona 09, Guatemala, Guatemala', 4),
('21-12-2003', 'Zona 11, Guatemala, Guatemala', 5),
('22-03-2010', 'Zona 12, Guatemala, Guatemala', 6),
('25-06-2011', 'Zona 13, Guatemala, Guatemala', 7),
('10-09-2012', 'Zona 21, Guatemala, Guatemala', 8),
('14-08-2013', 'Zona 18, Guatemala, Guatemala', 9),
('11-02-2020', 'Zona 10, Guatemala, Guatemala', 10),
('15-03-2018', 'Zona 16, Guatemala, Guatemala', 11),
('17-10-2020', 'Zona 10, Guatemala, Guatemala', 12),
('01-02-2003', 'Zona 15, Guatemala, Guatemala', 13),
('03-08-2020', 'Zona 09, Guatemala, Guatemala', 14),
('06-10-2018', 'Zona 07, Guatemala, Guatemala', 15)
;
/*9. Borrar el Mazda de “Martín Gómez”. *//*DELETE FROM coche WHERE numero_carne = 13;*//*10.-  Obtener el número total de conductores cuyo nombre contenga el apellido Perez. */SELECT COUNT(cond.nombre)FROM conductor AS condWHERE cond.nombre LIKE '%Perez%';/*11.- Obtener todos los accidentes cuyo numeroCarne incie con 0025. */SELECT * FROM accidenteWHERE numero_parte LIKE '%0025';/*12.-  Actualizar el campo matricula con el valor “Obsoleto” a aquellos vehículos cuyo año sea igual o
menor a 2002*/
UPDATE coche 
SET matricula = 'Obsoleto'
WHERE anio <= '2002';