USE Proyecto
GO

--Usuario que solo puede consultar
CREATE LOGIN user1 WITH PASSWORD = 'alfa123', DEFAULT_DATABASE = Proyecto
GO

CREATE SCHEMA us
GO

CREATE USER Usuario1 FOR LOGIN user1
WITH DEFAULT_SCHEMA = us
GO

GRANT SELECT ON SCHEMA::us TO Usuario1

--Agregamos permisos sobre tablas ya existentes que tienen otro esquema
GRANT SELECT ON Clientes TO Usuario1
GRANT SELECT ON Proveedores TO Usuario1
GRANT SELECT ON Productos TO Usuario1
GRANT SELECT ON Compras TO Usuario1
GRANT SELECT ON Ventas TO Usuario1

--Administrador que puede insertar y actualizar, pero no eliminar
CREATE LOGIN admin1 WITH PASSWORD = 'gamma123', DEFAULT_DATABASE = Proyecto
GO

CREATE SCHEMA ad
GO

CREATE USER Admin1 FOR LOGIN admin1
WITH DEFAULT_SCHEMA = ad
GO

GRANT SELECT ON SCHEMA::ad TO Admin1
GO

GRANT SELECT, INSERT, UPDATE ON Clientes TO Admin1
GRANT SELECT, INSERT, UPDATE ON Direcciones TO Admin1
GRANT SELECT, INSERT, UPDATE ON Proveedores TO Admin1
GRANT SELECT, INSERT, UPDATE ON Productos TO Admin1
GRANT SELECT, INSERT, UPDATE ON Compras TO Admin1
GRANT SELECT, INSERT, UPDATE ON Ventas TO Admin1
GO

--Supervisor que puede modificar la base de datos

CREATE LOGIN sup1 WITH PASSWORD = 'omega123', DEFAULT_DATABASE = Proyecto
GO

CREATE SCHEMA sup
GO

CREATE USER Sup1 FOR LOGIN sup1
WITH DEFAULT_SCHEMA = sup
GO

--Le agregamos permisos al esquema
GRANT INSERT, UPDATE, DELETE ON SCHEMA::sup TO Sup1 

GRANT SELECT, INSERT, UPDATE, DELETE ON Clientes TO Sup1
GRANT SELECT, INSERT, UPDATE, DELETE ON Direcciones TO Sup1
GRANT SELECT, INSERT, UPDATE, DELETE ON Proveedores TO Sup1
GRANT SELECT, INSERT, UPDATE, DELETE ON Productos TO Sup1
GRANT SELECT, INSERT, UPDATE, DELETE ON Compras TO Sup1
GRANT SELECT, INSERT, UPDATE, DELETE ON Ventas TO Sup1

--Damos permisos de creación y modificación de tablas
GRANT CREATE TABLE TO Sup1
GRANT ALTER ON DATABASE::Proyecto TO Sup1
