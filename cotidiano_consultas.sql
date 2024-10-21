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

