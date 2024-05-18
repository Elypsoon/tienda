USE Proyecto

INSERT INTO Correos VALUES 
('juan.perez@example.com'),
('maria.lopez@example.com'),
('carlos.gomez@example.com'),
('ana.ruiz@example.com'),
('luis.martinez@example.com'),
('sara.jimenez@example.com'),
('david.hernandez@example.com'),
('laura.garcia@example.com'),
('oscar.fernandez@example.com'),
('teresa.gonzalez@example.com');

INSERT INTO Direcciones VALUES 
('Calle Benito Juárez', 123, 'Centro', '28001', 'Madrid'),
('Avenida Gómez', 456, 'Norte', '08001', 'Barcelona'),
('Calle Estrella', 789, 'Este', '50001', 'Zaragoza'),
('Avenida Díaz', 101, 'Sur', '41001', 'Sevilla'),
('Calle San Baltazar', 202, 'Oeste', '15001', 'A Coruña'),
('Avenida matemáticas', 303, 'Centro', '29001', 'Málaga'),
('Calle 13', 404, 'Norte', '46001', 'Valencia'),
('Avenida Lerdo de Tejada', 505, 'Este', '37001', 'Salamanca'),
('Calle Wan', 606, 'Sur', '33001', 'Oviedo'),
('Avenida Estación', 707, 'Oeste', '47001', 'Valladolid');

INSERT INTO Clientes VALUES 
('Juan', 'Perez', 'Gomez', 1, 1),
('Maria', 'Lopez', 'Ruiz', 2, 2),
('Carlos', 'Gomez', 'Martinez', 3, 3),
('Ana', 'Ruiz', 'Jimenez', 4, 4),
('Luis', 'Martinez', 'Hernandez', 5, 5),
('Sara', 'Jimenez', 'Garcia', 6, 6),
('David', 'Hernandez', 'Fernandez', 7, 7),
('Laura', 'Garcia', 'Gonzalez', 8, 8),
('Oscar', 'Fernandez', 'Lopez', 9, 9),
('Teresa', 'Gonzalez', 'Perez', 10, 10);

INSERT INTO Proveedores VALUES 
('Carlos', 'Gonzalez', 'Lopez'),
('Ana', 'Martinez', 'Perez'),
('José', 'Rodriguez', 'Sanchez'),
('María', 'Fernandez', 'Garcia'),
('David', 'Lopez', 'Martinez'),
('Sofía', 'Gomez', 'Ruiz'),
('Miguel', 'Diaz', 'Moreno'),
('Lucía', 'Morales', 'Jimenez'),
('Jorge', 'Ortiz', 'Hernandez'),
('Elena', 'Ramirez', 'Alvarez');

INSERT INTO Productos VALUES 
('Smartphone XYZ', 'Smartphone de última generación con 128GB de memoria', 899.99, 30),
('Jeans Azules', 'Jeans de talla mediana, color azul', 49.99, 100),
('Cereal de Avena', 'Caja de cereal de avena 500g', 5.99, 200),
('Silla de Oficina', 'Silla ergonómica ajustable', 129.99, 40),
('Muñeca Bailarina', 'Muñeca con vestido de bailarina y música', 24.99, 150),
('Novela de Misterio', 'Libro de misterio y suspense, 300 páginas', 19.99, 80),
('Balón de Fútbol', 'Balón oficial de tamaño y peso reglamentario', 34.99, 60),
('Set de Jardinería', 'Incluye pala, rastrillo y guantes', 29.99, 50),
('Microondas ABC', 'Microondas con grill y temporizador', 199.99, 25),
('Labial Rojo Pasión', 'Labial de larga duración, color rojo', 14.99, 120);

INSERT INTO Compras VALUES 
('2023-01-01', 1000.00, 1, 1),
('2023-01-02', 2000.00, 2, 2),
('2023-01-03', 3000.00, 3, 3),
('2023-01-04', 4000.00, 4, 4),
('2023-01-05', 5000.00, 5, 5),
('2023-01-06', 6000.00, 6, 6),
('2023-01-07', 7000.00, 7, 7),
('2023-01-08', 8000.00, 8, 8),
('2023-01-09', 9000.00, 9, 9),
('2023-01-10', 10000.00, 10, 10),
('2023-01-11', 1100.00, 1, 2),
('2023-01-12', 2200.00, 2, 3),
('2023-01-13', 3300.00, 3, 4),
('2023-01-14', 4400.00, 4, 5),
('2023-01-15', 5500.00, 5, 6),
('2023-01-16', 6600.00, 6, 7),
('2023-01-11', 7700.00, 7, 8),
('2023-01-12', 8800.00, 8, 9),
('2023-01-10', 9900.00, 9, 10),
('2023-01-2', 10100.00, 10, 1);

INSERT INTO Ventas VALUES 
('2023-01-01', 150.00, 1, 1),
('2023-01-02', 250.00, 2, 2),
('2023-01-03', 350.00, 3, 3),
('2023-01-04', 450.00, 4, 4),
('2023-01-05', 550.00, 5, 5),
('2023-01-06', 650.00, 6, 6),
('2023-01-07', 750.00, 7, 7),
('2023-01-08', 850.00, 8, 8),
('2023-01-09', 950.00, 9, 9),
('2023-01-10', 1050.00, 10, 10),
('2023-01-11', 1150.00, 1, 2),
('2023-01-13', 1250.00, 2, 3),
('2023-01-15', 1350.00, 3, 4),
('2023-01-10', 1450.00, 4, 5),
('2023-01-16', 1550.00, 5, 6),
('2023-01-11', 1650.00, 6, 7),
('2023-01-6', 1750.00, 7, 8),
('2023-01-10', 1850.00, 8, 9),
('2023-01-1', 1950.00, 9, 10),
('2023-01-3', 2050.00, 10, 1);
