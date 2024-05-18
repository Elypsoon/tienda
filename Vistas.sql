USE Proyecto

--1. Clientes y los datos de contacto.

CREATE VIEW Contacto_clientes AS
	SELECT A.nombre, A.apellido_paterno, A.apellido_materno, B.correo, C.calle, C.numero, C.codigo_postal, C.ciudad
	FROM Clientes A JOIN Correos B 
	ON A.id_correo = B.id_correo
	JOIN Direcciones C ON C.id_direccion = A.id_direccion

--2. Relación de compras a proveedores en general

CREATE VIEW Compras_proveedores AS
	SELECT A.nombre, A.apellido_paterno, A.apellido_materno, SUM(B.total) Total 
	FROM Proveedores A JOIN Compras B
	ON A.id_proveedor = B.id_proveedor
	GROUP BY A.nombre, A.apellido_paterno, A.apellido_materno

--3. Compras y ventas por fecha.

CREATE VIEW Compras_ventas AS
	SELECT A.fecha, SUM(A.total) Ventas, SUM(B.total) Compras 
	FROM Ventas A JOIN Compras B 
	ON A.fecha = B.fecha
	GROUP BY A.fecha

--4. Relacion clientes y sus compras.

CREATE VIEW Ventas_clientes AS
	SELECT A.id_cliente, A.nombre, A.apellido_paterno, A.apellido_materno, B.fecha, C.nombre Producto, B.total
	FROM Clientes A JOIN Ventas B 
	ON A.id_cliente = B.id_cliente 
	JOIN Productos C ON B.id_producto = C.id_producto
