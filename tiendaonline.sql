-- crear la base de datos
CREATE DATABASE TiendaOnline;

-- usar l la base de datos
USE TiendaOnline;

-- crear la tabla Direcciones (relacion 1:1 con Clientes)
CREATE TABLE Direcciones (
ID_Direccion INT AUTO_INCREMENT PRIMARY KEY, -- clave primaria de la direccion
Calle VARCHAR(255) NOT NULL,         -- calle de la direccion
Ciudad VARCHAR(100) NOT NULL,         -- ciudad
Estado VARCHAR(100) NOT NULL,  -- estado
Codigo_Postal VARCHAR(10) NOT NULL,  -- codigo postal
Pais VARCHAR(100) NOT NULL -- pais
);


CREATE TABLE Clientes (
ID_Clientes INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE,
Telefono VARCHAR(15),
Fecha_Registro DATE,
ID_Direccion INT UNIQUE, 
FOREIGN KEY (ID_Direccion) REFERENCES Direcciones(ID_Direccion)
);