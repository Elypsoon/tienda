CREATE DATABASE Proyecto
ON PRIMARY (
			NAME = 'Proyecto',
			FILENAME = 'D:\Bases de datos\ProyectoBD\Proyecto.mdf',
			SIZE = 5MB,
			FILEGROWTH = 2MB
			),
			FILEGROUP Secundario
			(
			NAME = 'Proyecto2',
			FILENAME = 'D:\Bases de datos\ProyectoBD\Proyecto2.ndf',
			SIZE = 5MB,
			FILEGROWTH = 2MB
			)
LOG ON
			(
			NAME = 'Proyecto_log',
			FILENAME = 'D:\Bases de datos\ProyectoBD\Proyecto_log.ldf',
			SIZE = 2MB,
			FILEGROWTH = 10%
			),
			(
			NAME = 'Proyecto_log2',
			FILENAME = 'D:\Bases de datos\ProyectoBD\Proyecto_log2.ldf',
			SIZE = 2MB,
			FILEGROWTH = 10%,
			)
GO
USE Proyecto


-- Tabla de Correos
CREATE TABLE Correos (
  id_correo INT NOT NULL IDENTITY(1,1),
  correo NVARCHAR(255) UNIQUE,
  CONSTRAINT PK_ID_correo PRIMARY KEY (id_correo)
)

-- Tabla de Direcciones
CREATE TABLE Direcciones (
  id_direccion INT NOT NULL IDENTITY(1,1),
  calle NVARCHAR(255),
  numero INT,
  colonia NVARCHAR(255),
  codigo_postal NVARCHAR(50),
  ciudad NVARCHAR(255),
  CONSTRAINT PK_ID_direccion PRIMARY KEY (id_direccion)
)

-- Tabla de Clientes
CREATE TABLE Clientes (
  id_cliente INT NOT NULL IDENTITY(1,1),
  nombre NVARCHAR(255),
  apellido_paterno NVARCHAR(255),
  apellido_materno NVARCHAR(255),
  id_direccion INT,
  id_correo INT,
  CONSTRAINT PK_ID_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT FK_ID_direccion FOREIGN KEY (id_direccion) REFERENCES Direcciones(id_direccion),
  CONSTRAINT FK_ID_correo FOREIGN KEY (id_correo) REFERENCES Correos(id_correo)
)

-- Tabla de Provedores
CREATE TABLE Proveedores (
  id_proveedor INT NOT NULL IDENTITY(1,1),
  nombre NVARCHAR(255),
  apellido_paterno NVARCHAR(255),
  apellido_materno NVARCHAR(255),
  CONSTRAINT PK_ID_proveedor PRIMARY KEY (id_proveedor)
)

-- Tabla de Productos
CREATE TABLE Productos (
  id_producto INT NOT NULL IDENTITY(1,1),
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  precio DECIMAL(10, 2),
  stock INT,
  CONSTRAINT PK_ID_producto PRIMARY KEY (id_producto)
)

-- Tabla de Compras
CREATE TABLE Compras (
  id_compra INT NOT NULL IDENTITY(1,1),
  fecha DATE,
  total DECIMAL(10, 2),
  id_producto INT,
  id_proveedor INT,
  CONSTRAINT PK_ID_transaccion_compras PRIMARY KEY (id_compra),
  CONSTRAINT FK_ID_producto_compras FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
  CONSTRAINT FK_ID_proveedor FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor)
)

-- Tabla de Ventas
CREATE TABLE Ventas (
  id_venta INT NOT NULL IDENTITY(1,1),
  fecha DATE,
  total DECIMAL(10, 2),
  id_cliente INT,
  id_producto INT,
  CONSTRAINT PK_ID_transaccion_ventas PRIMARY KEY (id_venta),
  CONSTRAINT FK_ID_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
  CONSTRAINT FK_ID_producto_ventas FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
)

--Tabla para el control de eliminaciones de ventas
CREATE TABLE VentasAud (
  id_venta INT NOT NULL,
  total DECIMAL(10, 2),
  id_cliente INT,
  id_producto INT,
  fecha DATE
)

--Tabla para el control de eliminaciones de compras
CREATE TABLE ComprasAud (
  id_compra INT NOT NULL,
  total DECIMAL(10, 2),
  id_producto INT,
  id_proveedor INT,
  fecha DATE
)

--Índices.

CREATE INDEX nom_cli ON Clientes(nombre)
CREATE INDEX ap_cli ON Clientes(apellido_paterno)

CREATE INDEX nom_pro ON Proveedores(nombre)
CREATE INDEX ap_pro ON Proveedores(apellido_paterno)

CREATE INDEX nom_produc ON Productos(nombre)