USE TiendaOnline; 
-- Obtén todos los clientes cuyo nombre sea "Juan Pérez".
SELECT * FROM Clientes WHERE Nombre LIKE 'Juan Perez';
-- Muestra todos los productos cuyo precio no sea igual a 100.
SELECT * FROM Productos WHERE Precio != 100;
-- Encuentra todos los pedidos cuyo total sea mayor a 500
SELECT * FROM Pedidos WHERE Total > 500;
-- Encuentra todos los productos con menos de 20 unidades en stock
SELECT * FROM Productos WHERE Stock < 20;
-- Muestra todos los clientes registrados después del 1 de enero de 2024
SELECT * FROM Clientes WHERE Fecha_Registro >= 2021-01-01;
-- Obtén todos los productos con un precio entre 100 y 500.
SELECT * FROM Productos WHERE Precio BETWEEN 100 AND 500;
-- Encuentra todos los pedidos cuyo total no esté entre 200 y 1000
SELECT * FROM Pedidos WHERE Total NOT BETWEEN 200 AND 1000;
-- Muestra todos los clientes cuyo ID_Cliente sea 1, 3, o 5.
SELECT * FROM Clientes WHERE ID_Cliente IN ( 1, 3 , 5);
-- Encuentra todos los productos cuyo ID_Producto no sea 2 ni 4
SELECT * FROM Productos WHERE ID_Producto NOT IN (2, 4);
--  Muestra todos los pedidos realizados en el año 2024
SELECT * FROM Pedidos WHERE Fecha_Pedido >= 2024-01-01;

--  Muestra todos los clientes y sus pedidos. 
SELECT 
    Clientes.Nombre AS Cliente, 
    Productos.Nombre AS Pedido
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

-- Obtén todos los pedidos junto con los nombres de los productos y la cantidad de cada producto en esos pedidos. 
SELECT Pedidos.ID_Pedido,
    Productos.Nombre AS Nombre_Producto,
    Pedidos_Productos.Cantidad
FROM Pedidos
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

-- Muestra el nombre de cada cliente y el número total de pedidos que ha realizado. **(usar COUNT, LEFT JOIN, GROUP BY)
SELECT Clientes.Nombre AS Nombre_Cliente, 
    COUNT(Pedidos.ID_Pedido) AS Total_Pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.Nombre;

-- Encuentra el nombre del cliente y el total gastado por cada uno. **(usar SUM, GROUP BY) 
SELECT Clientes.Nombre AS Nombre_Cliente,
SUM(Pedidos.Total) AS Total_Gastado
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.Nombre;

-- Obtén el nombre del cliente y el total de cada uno de sus pedidos realizados después del 1 de febrero de 2024
SELECT Clientes.Nombre AS Nombre_Cliente,
Pedidos.Total
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
WHERE Pedidos.Fecha_Pedido > 2024-02-01;

-- Encuentra todos los productos que nunca han sido vendidos. **(usar NOT IN con doble SELECT)  
SELECT Productos.Nombre
FROM Productos
JOIN (SELECT ID_Producto
FROM Productos
WHERE ID_Producto NOT IN ( SELECT ID_Producto 
FROM Pedidos_Productos)
) AS ProductosNoVendidos ON Productos.ID_Producto = ProductosNoVendidos.ID_Producto;

-- Muestra el nombre del cliente que ha realizado el pedido más caro. **(usar ORDER BY, DESC, LIMIT) 
SELECT Clientes.Nombre 
FROM Pedidos
JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente
ORDER BY Pedidos.Total DESC
LIMIT 1;

-- Encuentra el nombre de cada producto y la cantidad total vendida de ese producto. **(usar SUM, GROUP BY)
SELECT Productos.Nombre,
SUM(Pedidos_Productos.Cantidad)
AS Total_Vendido
FROM Productos
JOIN Pedidos_Productos ON Productos.ID_Producto = Pedidos_Productos.ID_Producto
GROUP BY Productos.Nombre;

-- Muestra el nombre y dirección de todos los clientes junto con sus pedidos realizados
SELECT Clientes.Nombre AS Nombre_Cliente, Direcciones.Calle, Direcciones.Ciudad, Direcciones.Estado, Direcciones.Codigo_Postal, Direcciones.Pais, Productos.Nombre 
AS Nombre_Producto, Pedidos_Productos.Cantidad
FROM Clientes
JOIN Direcciones ON Clientes.ID_Direccion = Direcciones.ID_Direccion
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
LEFT JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
LEFT JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

-- Muestra todos los productos cuyo nombre contiene la palabra "Sony". 
SELECT * FROM Productos WHERE Nombre LIKE 'Sony%';
 
















