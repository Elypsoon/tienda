USE Proyecto

--Los datos de todas las tablas son los siguientes:

SELECT * FROM Clientes
SELECT * FROM Correos
SELECT * FROM Direcciones
SELECT * FROM Productos
SELECT * FROM Proveedores
SELECT * FROM Compras
SELECT * FROM Ventas

--Funciones.

--1. Venta por fecha
SELECT DBO.ObtenerTotalVentasPorFecha('2023-01-06') AS "Total Ventas Dia"

--2. Venta por mes
SELECT * FROM ObtenerVentasPorMes(2023, 1)

--3. Compras a proveedor.
SELECT dbo.ContarComprasProveedor(1) AS "Compras a Provedor"

--4. Verificar stock
SELECT dbo.VerificarStockProducto(6)

--Procedimientos.

--1. Buscar cliente
EXEC BuscarCliente @parametro_busqueda = 'Luis'
EXEC BuscarCliente @parametro_busqueda = '@example.com'
EXEC BuscarCliente @parametro_busqueda = 'Wan'

--2. Registrar venta por unidad
EXEC VentaRegistro
	@cantidad = 1,
	@id_cliente =  1,
	@id_producto = 5

EXEC VentaRegistro
	@cantidad = 2,
	@id_cliente =  2,
	@id_producto = 6

--3. Actualizar correo del cliente.
EXEC ActualizarCorreoCliente
@id_cliente = 1,
@nuevo_correo = 'juan.perez@gmail.org'

EXEC ActualizarCorreoCliente
@id_cliente = 2,
@nuevo_correo = 'ana.ruiz@outlook.net'

SELECT * FROM Correos

--4. Registrar venta usando una función que verifica stock
EXEC Registrar_Venta
	@cantidad = 4,
	@id_cliente =  2,
	@id_producto = 6

SELECT * FROM Ventas

--Vistas.

--1. Clientes y los datos de contacto.
SELECT * FROM dbo.Contacto_clientes

--2. Relación de compras a proveedores en general
SELECT * FROM dbo.Compras_proveedores

--3. Relación de compras y ventas por fecha.
SELECT * FROM dbo.Compras_ventas

--4. Relacion clientes y sus compras.
SELECT * FROM dbo.Ventas_clientes
