
--Registra las eliminaciones de la tabla ventas
CREATE TRIGGER EliminacionesVentas ON VENTAS
FOR DELETE
AS
	DECLARE @ID INT
	DECLARE @FECHA DATE

	SELECT @ID = D.id_venta, @FECHA = GETDATE() FROM deleted D

	INSERT INTO VentasAud SELECT D.id_venta, D.total, D.id_cliente, D.id_producto, GETDATE()
	FROM deleted D
	PRINT('La venta con ID: ' + CAST(@ID AS NVARCHAR(255)) + ' fue eliminada en ' + CAST(@FECHA AS NVARCHAR(100)))

--Registra las eliminaciones de la tabla compras
CREATE TRIGGER EliminacionesCompras ON COMPRAS
FOR DELETE
AS
	DECLARE @ID INT
	DECLARE @FECHA DATE

	SELECT @ID = D.id_compra, @FECHA = GETDATE() FROM deleted D

	INSERT INTO ComprasAud SELECT D.id_compra, D.total, D.id_producto, D.id_proveedor, GETDATE()
	FROM deleted D
	PRINT('La compra con ID: ' + CAST(@ID AS NVARCHAR(255)) + ' fue eliminada en ' + CAST(@FECHA AS NVARCHAR(100)))