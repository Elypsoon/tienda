USE Proyecto
GO
--1. Buscar cliente

CREATE PROCEDURE BuscarCliente
    @parametro_busqueda NVARCHAR(255)
AS
BEGIN
    SELECT
        C.id_cliente,
        C.nombre,
        C.apellido_paterno,
        C.apellido_materno,
        D.calle,
        D.numero,
        D.colonia,
        D.codigo_postal,
        D.ciudad,
        Co.correo
    FROM
        Clientes C
    LEFT JOIN
        Direcciones D ON C.id_direccion = D.id_direccion
    LEFT JOIN
        Correos Co ON C.id_correo = Co.id_correo
    WHERE
        C.nombre LIKE '%' + @parametro_busqueda + '%' OR
        C.apellido_paterno LIKE '%' + @parametro_busqueda + '%' OR
        C.apellido_materno LIKE '%' + @parametro_busqueda + '%' OR
        D.calle LIKE '%' + @parametro_busqueda + '%' OR
        D.colonia LIKE '%' + @parametro_busqueda + '%' OR
        D.ciudad LIKE '%' + @parametro_busqueda + '%' OR
        Co.correo LIKE '%' + @parametro_busqueda + '%';
END
GO
--2. Registrar venta por unidad

CREATE PROCEDURE VentaRegistro
	@cantidad INT,
	@id_cliente INT,
	@id_producto INT
AS
BEGIN
   DECLARE @precio FLOAT
   SET @precio = (SELECT precio FROM Productos WHERE id_producto = @id_producto)

   DECLARE @fecha DATE
   SET @fecha = CAST(GETDATE() AS DATE)

   INSERT INTO Ventas (fecha, total, id_cliente, id_producto)
   VALUES (@fecha, (@cantidad*@precio), @id_cliente, @id_producto)

   UPDATE Productos
   SET stock = stock - @cantidad
   WHERE id_producto = @id_producto
END
GO
--3. Actualizar correo del cliente.

CREATE PROCEDURE ActualizarCorreoCliente
    @id_cliente INT,
    @nuevo_correo NVARCHAR(255)
AS
BEGIN
    UPDATE Correos
    SET correo = @nuevo_correo
    WHERE id_correo = (
        SELECT id_correo
        FROM Clientes
        WHERE id_cliente = @id_cliente
    )
END
GO
--4. Registrar venta por varias cantidades usando una función

CREATE PROCEDURE Registrar_Venta
    @cantidad INT,
    @id_cliente INT,
    @id_producto INT
AS
BEGIN
 -- Comprobar el stock del producto
 DECLARE @stock INT
 SET @stock = dbo.VerificarStockProducto(@id_producto)

 DECLARE @precio FLOAT
 SET @precio = (SELECT precio FROM Productos WHERE id_producto = @id_producto)

 DECLARE @fecha DATE
 SET @fecha = CAST(GETDATE() AS DATE)

 -- Si el stock es suficiente, proceder con la venta y actualizar el stock
 IF (@stock - @cantidad) > 0
 BEGIN
     INSERT INTO Ventas (fecha, total, id_cliente, id_producto)
     VALUES (@fecha, (@cantidad*@precio), @id_cliente, @id_producto)

     UPDATE Productos
     SET stock = stock - @cantidad
     WHERE id_producto = @id_producto
 END
 -- Si el stock no es suficiente, enviar un mensaje
 ELSE
 BEGIN
     PRINT 'No hay suficiente stock para el producto.'
 END
END
GO
--5. Búsqueda dinámica.
CREATE PROCEDURE BusquedaAvanzada
    @Tabla NVARCHAR(50),
    @Col1 NVARCHAR(50),
    @Op1 NVARCHAR(2),
    @Val1 NVARCHAR(50),
    @Col2 NVARCHAR(50) = NULL,
    @Op2 NVARCHAR(2) = NULL,
    @Val2 NVARCHAR(50) = NULL
AS
BEGIN
    DECLARE @Query NVARCHAR(MAX)
    DECLARE @Param NVARCHAR(MAX)

    -- Construir la consulta dinámica con múltiples condiciones
    SET @Query = N'SELECT * FROM ' + @Tabla + ' WHERE ' + @Col1 + ' ' + @Op1 + ' @Val1'

    IF @Col2 IS NOT NULL AND @Op2 IS NOT NULL AND @Val2 IS NOT NULL
    BEGIN
        SET @Query = @Query + N' AND ' + @Col2 + ' ' + @Op2 + ' @Val2'
    END

    SET @Param = N'@Val1 NVARCHAR(50), @Val2 NVARCHAR(50)'

    -- Ejecutar la consulta dinámica
    EXEC sp_executesql @Query, @Param, @Val1 = @Val1, @Val2 = @Val2
END
GO