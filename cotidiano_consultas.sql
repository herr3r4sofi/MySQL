USE TiendaOnline;
SELECT * FROM Clientes WHERE Nombre LIKE 'Juan%';
SELECT * FROM Productos WHERE Precio != 100;
SELECT * FROM Pedidos WHERE Total > 500;
SELECT * FROM Productos WHERE Stock < 20;
SELECT * FROM Clientes WHERE Fecha_Registro >= '2024-01-01';
SELECT * FROM Productos WHERE Precio BETWEEN 100 AND 500;
SELECT * FROM Productos WHERE Precio NOT BETWEEN 200 AND 1000;
SELECT * FROM Clientes WHERE ID_Cliente IN (1, 3, 5);
SELECT * FROM Clientes WHERE ID_Cliente NOT IN (2, 4);
SELECT * FROM Pedidos WHERE Fecha_Pedido >= '2024-01-01';

-- 11. Muestra todos los clientes y sus pedidos. 
SELECT 
    Clientes.Nombre AS Cliente, 
    Productos.Nombre AS Pedido
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

-- 12. Obtén todos los pedidos junto con los nombres de los productos y la cantidad de cada producto en esos pedidos. 
SELECT Pedidos.ID_Pedido,
    Productos.Nombre AS Nombre_Producto,
    Pedidos_Productos.Cantidad
FROM Pedidos
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

-- 13. Muestra el nombre de cada cliente y el número total de pedidos que ha realizado. **(usar COUNT, LEFT JOIN, GROUP BY)
SELECT Clientes.Nombre AS Nombre_Cliente, 
    COUNT(Pedidos.ID_Pedido) AS Total_Pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.Nombre;

-- 14. Encuentra el nombre del cliente y el total gastado por cada uno. **(usar SUM, GROUP BY) 
SELECT 
    Clientes.Nombre AS Nombre_Cliente, 
    SUM(Pedidos.Total) AS Total_Gastado
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.Nombre;

-- 15. Obtén el nombre del cliente y el total de cada uno de sus pedidos realizados después del 1 de febrero de 2024.  
SELECT Clientes.Nombre AS Nombre_Cliente,
    Pedidos.Total
FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
WHERE Pedidos.Fecha_Pedido > '2024-02-01';

-- 16. Encuentra todos los productos que nunca han sido vendidos. **(usar NOT IN con doble SELECT) 
SELECT Clientes.Nombre 
FROM Pedidos
JOIN Clientes ON Pedidos.ID_Cliente = Clientes.ID_Cliente
ORDER BY Pedidos.Total DESC
LIMIT 1;

-- 17. Muestra el nombre del cliente que ha realizado el pedido más caro. **(usar ORDER BY, DESC, LIMIT) 
SELECT Productos.Nombre, SUM(Pedidos_Productos.Cantidad) AS Total_Vendido
FROM Pedidos_Productos
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto
GROUP BY Productos.Nombre;

-- 18. Encuentra el nombre de cada producto y la cantidad total vendida de ese producto. **(usar SUM, GROUP BY) 
SELECT 
    Productos.Nombre AS Producto,
    Pedidos_Productos.Cantidad
FROM Pedidos
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

-- 19. Muestra el nombre y dirección de todos los clientes junto con sus pedidos realizados.  
SELECT Clientes.Nombre AS Nombre_Cliente, Direcciones.Calle, Direcciones.Ciudad, Direcciones.Estado, Direcciones.Codigo_Postal, Direcciones.Pais, Pedidos.ID_Pedido, Pedidos.Fecha_Pedido, Pedidos.Total
FROM Clientes
JOIN Direcciones ON Clientes.ID_Direccion = Direcciones.ID_Direccion
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;

-- 20. Muestra todos los productos cuyo nombre contiene la palabra "Sony". 
SELECT * FROM Clientes WHERE Nombre LIKE 'Sony%';
