USE Proyecto
GO
--1. Venta por fecha

CREATE FUNCTION ObtenerTotalVentasPorFecha
(
	@fecha DATE
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    RETURN (SELECT SUM(total) FROM Ventas WHERE fecha = @fecha)
END
GO

--2. Venta por mes

CREATE FUNCTION ObtenerVentasPorMes
(
    @Anio INT,
    @Mes INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        id_venta,
        fecha,
        total,
        id_cliente,
        id_producto
    FROM
        Ventas
    WHERE
        YEAR(fecha) = @Anio AND
        MONTH(fecha) = @Mes
)
GO

--3. Compras a proveedor.

CREATE FUNCTION ContarComprasProveedor
(
    @id_provedor INT
)
RETURNS INT
AS
BEGIN
    RETURN (
        SELECT COUNT(*)
        FROM Compras
        WHERE id_proveedor = @id_provedor
    )
END
GO

--4. Verificar stock

CREATE FUNCTION VerificarStockProducto (@id_producto INT)
RETURNS INT
AS
BEGIN
    RETURN (
		SELECT stock
		FROM Productos
		WHERE id_producto = @id_producto
	)
END
GO