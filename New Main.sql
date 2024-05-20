USE Proyecto

SELECT * FROM Clientes
SELECT * FROM Correos
SELECT * FROM Direcciones
SELECT * FROM Productos
SELECT * FROM Proveedores
SELECT * FROM Compras
SELECT * FROM Ventas

--Prueba de triggers
DELETE FROM Ventas WHERE id_venta = 3
SELECT * FROM VentasAud

DELETE FROM Compras WHERE id_compra = 1
SELECT * FROM ComprasAud

INSERT INTO Correos VALUES ('alex.gomezexample.com')

INSERT INTO Correos VALUES ('alex.gomez@example.com')