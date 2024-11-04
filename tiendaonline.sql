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
ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL UNIQUE,
Telefono VARCHAR(15),
Fecha_Registro DATE,
ID_Direccion INT UNIQUE, 
FOREIGN KEY (ID_Direccion) REFERENCES Direcciones(ID_Direccion)
);  


CREATE TABLE Productos(
ID_Producto INT AUTO_INCREMENT PRIMARY KEY, 
Nombre VARCHAR(100) NOT NULL,
Descripcion TEXT, -- grandes volumenes de texto 
Precio DECIMAL (10,2) NOT NULL,
Stock INT NOT NULL,
Fecha_Agregado DATE 
);
-- Relacion 1:N
CREATE TABLE Pedidos(
ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
ID_Cliente INT,
Fecha_Pedido DATE NOT NULL,
Estado VARCHAR(50),
Total DECIMAL(10,2),
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente)
);

-- relacion N:M
CREATE TABLE Pedidos_Productos(
ID_Pedido INT,
ID_Producto INT,
Cantidad INT NOT NULL,
Precio_Unitario DECIMAL (10,2) NOT NULL,
PRIMARY KEY (ID_Pedido, ID_Producto),
FOREIGN KEY (ID_Pedido) REFERENCES Pedidos (ID_Pedido),
FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto)
);







