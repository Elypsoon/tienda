USE Proyecto

SELECT * FROM Clientes
SELECT * FROM Correos
SELECT * FROM Direcciones
SELECT * FROM Productos
SELECT * FROM Proveedores
EXEC BusquedaAvanzada 'Ventas', 'total', '>', '0'
EXEC BusquedaAvanzada 'Compras', 'total', '>', '0'

--Revisión de usuarios

EXECUTE AS USER = 'Usuario1'

SELECT * 
FROM fn_my_permissions('dbo.Clientes', 'OBJECT') 
WHERE permission_name IN ('SELECT')
SELECT * 
FROM fn_my_permissions('dbo.Ventas', 'OBJECT') 
WHERE permission_name IN ('SELECT')

REVERT

EXECUTE AS USER = 'Admin1'

SELECT * 
FROM fn_my_permissions('dbo.Clientes', 'OBJECT')
WHERE permission_name IN ('INSERT', 'UPDATE')

SELECT * 
FROM fn_my_permissions(NULL, 'DATABASE') 
WHERE permission_name IN ('CREATE TABLE', 'ALTER')

REVERT

EXECUTE AS USER = 'Sup1'

SELECT * 
FROM fn_my_permissions('dbo.Clientes', 'OBJECT') 
WHERE permission_name IN ('INSERT', 'UPDATE')

SELECT * 
FROM fn_my_permissions(NULL, 'DATABASE') 
WHERE permission_name IN ('CREATE TABLE', 'ALTER')

REVERT

--Prueba de triggers							 
DELETE FROM Ventas WHERE id_venta = 3			 
SELECT * FROM VentasAud
												 
DELETE FROM Compras WHERE id_compra = 2
SELECT * FROM ComprasAud

INSERT INTO Correos VALUES ('alex.gomezexample.com')

INSERT INTO Correos VALUES ('alex.gomez@example.com')

--Prueba de notificaciones con correo electrónico

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'Notificaciones',
    @recipients = 'angel.gtz.pc.527@gmail.com',
    @body = 'El perfil de correo funciona correctamente.',
    @subject = 'Prueba'


--Manejo de tablas temporales.
CREATE TABLE ##TotalVentasPorProducto (
    id_producto INT,
    total_ventas DECIMAL(10, 2)
)

INSERT INTO ##TotalVentasPorProducto
SELECT id_producto, SUM(total) total_ventas
FROM Ventas
WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY id_producto

SELECT * FROM ##TotalVentasPorProducto


CREATE TABLE ##ReporteVentasPorCliente (
    id_cliente INT,
    nombre NVARCHAR(255),
    apellido_paterno NVARCHAR(255),
    total_ventas DECIMAL(10, 2)
)

INSERT INTO ##ReporteVentasPorCliente
SELECT c.id_cliente, c.nombre, c.apellido_paterno, SUM(v.total) AS total_ventas
FROM Clientes c
JOIN Ventas v ON c.id_cliente = v.id_cliente
WHERE v.fecha BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.id_cliente, c.nombre, c.apellido_paterno

SELECT * FROM ##ReporteVentasPorCliente

