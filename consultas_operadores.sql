USE TiendaOnline;

-- SELECT
/* descripcion: esta consulta obtiene todos los registros de la tabla Clientes, mostrando todos los campos: ID_Cliente, Nombre, Email, Telefon, Fecha_Registro y ID_Direccion*/
SELECT * FROM Clientes;

/*Descripción: Esta consulta devuelve todos los productos de la tabla Productos,

mostrando el Nombre del producto, su Precio, y la cantidad disponible en Stock*/

SELECT Nombre, Precio, Stock FROM Productos;

/*Descripción: Esta consulta obtiene todos los pedidos registrados en la tabla Pedidos, 
mostrando el ID_Pedido, la Fecha_Pedido, y el Total de cada pedido*/

SELECT ID_Pedido, Fecha_Pedido, Total FROM Pedidos;

-- WHERE

SELECT Nombre, Email, Fecha_Registro
FROM Clientes
WHERE Fecha_Registro > '2024-01-10';

/*
Descripción: Esta consulta devuelve todos los productos cuyo stock
es mayor que 10 unidades, mostrando el nombre, el precio, y la cantidad en stock.
*/
SELECT Nombre, Precio, Stock
FROM Productos
WHERE Stock > 10;

/*
Descripción: Esta consulta obtiene todos los pedidos cuyo total es mayor a $500,
mostrando el ID del pedido, la fecha en que se realizó y el total.
*/
SELECT ID_Pedido, Fecha_Pedido, Total
FROM Pedidos
WHERE Total > 500;

-- JOIN 

/* Descripción:
 JOIN conecta las tablas Clientes, Pedidos, Pedidos_Productos, y Productos.
La consulta devuelve el nombre del cliente, el nombre del producto que compró, la cantidad adquirida y la fecha en que se realizó el pedido.*/

SELECT
    Clientes.Nombre AS Cliente,
    Productos.Nombre AS Producto,
    Pedidos_Productos.Cantidad,
    Pedidos.Fecha_Pedido
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

/*
JOIN conecta las tablas Productos y Pedidos_Productos para asociar los productos con los pedidos en los que se han vendido.
La consulta usa SUM para calcular el total de unidades vendidas y el total de ingresos generados por cada producto.
GROUP BY agrupa los resultados por el nombre del producto, asegurando que obtengas el total de ventas y ganancias por producto.
*/

SELECT
    Productos.Nombre AS Producto,
    SUM(Pedidos_Productos.Cantidad) AS Total_Unidades_Vendidas,
    SUM(Pedidos_Productos.Cantidad * Pedidos_Productos.Precio_Unitario) AS Total_Ingresos
FROM Productos
JOIN Pedidos_Productos ON Productos.ID_Producto = Pedidos_Productos.ID_Producto
GROUP BY Productos.Nombre;

-- Principales Operadores Relacionales en MySQL

/* 
Igual a (=):
Compara si dos valores son iguales.
*/
SELECT * FROM Clientes WHERE ID_Cliente = 1;
-- Obtiene todos los registros donde el ID_Cliente es igual a 1.

/*
Distinto de (!= o <>):
Compara si dos valores son diferentes.
*/
SELECT * FROM Productos WHERE Precio != 100;
-- Devuelve todos los productos cuyo precio no es igual a 100.

-- Mayor que (>):

/*Compara si un valor es mayor que otro.*/

SELECT * FROM Pedidos WHERE Total > 500;

/*Devuelve todos los pedidos cuyo total es mayor que 500.*/

-- Menor que (<):
/*Compara si un valor es menor que otro.*/

SELECT * FROM Productos WHERE Stock < 20;

/*Devuelve todos los productos cuyo stock es menor que 20.*/

-- Mayor o igual que (>=):
/*Compara si un valor es mayor o igual que otro.*/

SELECT * FROM Pedidos WHERE Total >= 1000;
-- Devuelve todos los pedidos cuyo total es mayor o igual a 1000.

-- Menor o igual que (<=):
/*Compara si un valor es menor o igual que otro.*/

SELECT * FROM Clientes WHERE Fecha_Registro <= '2024-01-01';
-- Devuelve todos los clientes registrados hasta el 1 de enero de 2024.

-- BETWEEN:
/*Comprueba si un valor está dentro de un rango (inclusivo).*/

SELECT * FROM Productos WHERE Precio BETWEEN 100 AND 500;
-- Devuelve todos los productos cuyo precio está entre 100 y 500 (inclusive).
-- NOT BETWEEN:
-- Comprueba si un valor no está dentro de un rango.

SELECT * FROM Productos WHERE Precio NOT BETWEEN 100 AND 500;
-- Devuelve todos los productos cuyo precio no está en el rango de 100 a 500.

-- IN:
-- Comprueba si un valor está dentro de una lista de valores.

-- NOT IN: comprueba si un valor no està en una lista de valor
SELECT * FROM  Clientes WHERE ID_Cliente NOT IN (2, 4);
-- Devuelve todos los clientes cuyo ID_Cliente no sea 2 ni 4

 SELECT * FROM Clientes WHERE ID_Cliente IN (1, 3, 5);

-- IS NULL: comprueba si un valor es nulo
SELECT * FROM Direcciones WHERE Codigo_Postal IS NULL;

-- IS NOT NULL: comprueba si un valor no es nulo
SELECT * FROM Direcciones WHERE Codigo_Postal IS NOT NULL;
-- Devuelve todas las direcciones donde el codgo postal no sea nulo

-- LIKE:se utiliza para buscar un patron en una cadena de texto
SELECT * FROM Clientes WHERE Nombre LIKE 'Juan%';
-- Devuelve todos los clientes cuyos nombres cominezan con Juan
-- El simbolo % es un comodin que representa cualquier secuencia de caracteres

-- NOT LIKE: se utiliza para excluir un patron en una cadena de texto
SELECT * FROM Clientes WHERE Nombre NOT LIKE 'Juan%';
-- Devuelve todos los clientes cuyos nombres no comienzan con Juan




