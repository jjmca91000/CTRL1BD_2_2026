-- Configurar el esquema
SET search_path TO estacionamientos;

-- 1. COMUNA (4 comunas)
INSERT INTO COMUNA (nombre_comuna) VALUES
    ('Santiago'), ('Providencia'),
    ('Las Condes'), ('Macul');

-- 2. MODELO (8 modelos de auto)
INSERT INTO MODELO (nombre_modelo) VALUES
    ('Toyota Yaris'), ('Chevrolet Sail'), ('Suzuki Swift'), ('Kia Rio'),
	('Hyundai Accent'), ('Mazda 3'), ('Nissan Versa'), ('Ford Fiesta');

-- 3. CLIENTE (20 clientes)
INSERT INTO CLIENTE (id_comuna, nombre) VALUES
    (1, 'Carlos Munoz'), (1, 'Maria Gonzalez'),
    (2, 'Juan Perez'), (2, 'Ana Rodriguez'), (2, 'Pedro Martinez'), (2, 'Luisa Fernandez'),
    (3, 'Diego Lopez'), (3, 'Camila Diaz'), (3, 'Javier Soto'), (3, 'Valentina Torres'), (3, 'Andres Ramirez'), (3, 'Fernanda Flores'),
    (4, 'Matias Espinoza'), (4, 'Francisca Valenzuela'), (4, 'Sebastian Castillo'), (4, 'Constanza Reyes'), (4, 'Nicolas Morales'), (4, 'Catalina Contreras'), (4, 'Felipe Silva'), (4, 'Daniela Vargas');

-- 4. EDIFICIO_ESTACIONAMIENTO (6 edificios)
INSERT INTO EDIFICIO_ESTACIONAMIENTO (id_comuna, nombre_edificio) VALUES
    (1, 'Edificio Santiago Centro'),
    (2, 'Edificio Providencia Plaza'),
    (3, 'Edificio Las Condes Norte'), (3, 'Edificio Las Condes Sur'),
    (4, 'Edificio Macul Oriente'), (4, 'Edificio Macul Poniente');

-- 5. VEHICULO (36 vehiculos)
INSERT INTO VEHICULO (patente_vehiculo, id_modelo) VALUES
    ('BCDF01', 1), ('BCDF02', 2), ('BCDF03', 3), ('BCDF04', 4), ('BCDF05', 5), ('BCDF06', 6),
    ('BCDF07', 7), ('BCDF08', 8), ('BCDF09', 1), ('BCDF10', 2), ('BCDF11', 3), ('BCDF12', 4),
	('BCDF13', 5), ('BCDF14', 6), ('BCDF15', 7), ('BCDF16', 8), ('BCDF17', 1), ('BCDF18', 2),
	('BCDF19', 3), ('BCDF20', 4), ('BCDF21', 5), ('BCDF22', 6), ('BCDF23', 7), ('BCDF24', 8),
	('BCDF25', 1), ('BCDF26', 2), ('BCDF27', 3), ('BCDF28', 4), ('BCDF29', 5), ('BCDF30', 6),
    ('BCDF31', 7), ('BCDF32', 8), ('BCDF33', 1), ('BCDF34', 2), ('BCDF35', 3), ('BCDF36', 4);

-- 6. EMPLEADO (20 empleados)
INSERT INTO EMPLEADO (id_edificio, id_comuna, nombre, tipo_empleado) VALUES
    (1, 1, 'Roberto Gomez', 'Jefe de edificio'),
    (2, 2, 'Patricia Herrera', 'Jefe de edificio'), (2, 2, 'Marcelo Castro', 'Guardia'),
    (3, 3, 'Claudia Medina', 'Jefe de edificio'), (3, 3, 'Ricardo Garrido', 'Guardia'), (3, 1, 'Lorena Cortes', 'Cajero'),
    (4, 3, 'Cristian Fuentes', 'Jefe de edificio'), (4, 3, 'Alejandra Vergara', 'Guardia'), (4, 2, 'Mauricio Sandoval', 'Guardia'), (4, 4, 'Paulina Miranda', 'Cajero'),
    (5, 4, 'Hector Bravo', 'Jefe de edificio'), (5, 4, 'Carolina Sepulveda', 'Guardia'), (5, 4, 'Rodrigo Figueroa', 'Guardia'), (5, 1, 'Natalia Bustos', 'Cajero'), (5, 2, 'Gonzalo Tapia', 'Operador'),
    (6, 4, 'Veronica Salazar', 'Jefe de edificio'), (6, 4, 'Eduardo Pizarro', 'Guardia'), (6, 3, 'Daniela Carrasco', 'Guardia'), (6, 2, 'Victor Alarcon', 'Cajero'), (6, 1, 'Soledad Vega', 'Operador');

-- 7. LUGAR (60 lugares)
INSERT INTO LUGAR (id_edificio, numero_lugar) VALUES
    (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10),
    (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
    (3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10),
	(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10),
    (5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 6), (5, 7), (5, 8), (5, 9), (5, 10),
    (6, 1), (6, 2), (6, 3), (6, 4), (6, 5), (6, 6), (6, 7), (6, 8), (6, 9), (6, 10);

-- 8. CLIENTE_VEHICULO (36 asociaciones)
INSERT INTO CLIENTE_VEHICULO (id_cliente, patente_vehiculo) VALUES
    (1, 'BCDF01'), (2, 'BCDF02'), (3, 'BCDF03'), (4, 'BCDF04'), (5, 'BCDF05'), (6, 'BCDF06'),
    (7, 'BCDF07'), (8, 'BCDF08'), (9, 'BCDF09'), (10, 'BCDF10'), (11, 'BCDF11'), (12, 'BCDF12'),
	(13, 'BCDF13'), (14, 'BCDF14'), (15, 'BCDF15'), (16, 'BCDF16'), (17, 'BCDF17'), (18, 'BCDF18'),
    (19, 'BCDF19'), (20, 'BCDF20'), (1, 'BCDF21'), (1, 'BCDF22'), (1, 'BCDF23'), (2, 'BCDF24'),
	(2, 'BCDF25'), (3, 'BCDF26'), (3, 'BCDF27'), (4, 'BCDF28'), (4, 'BCDF29'), (5, 'BCDF30'),
    (5, 'BCDF31'), (6, 'BCDF32'), (7, 'BCDF33'), (8, 'BCDF34'), (9, 'BCDF35'), (10, 'BCDF36');

-- 9. SUELDO (20 sueldos, 1 por cada empleado)
INSERT INTO SUELDO (id_empleado, monto_sueldo) VALUES
    (1, 1110000), (2, 1120000), (3, 595000), (4, 1140000), (5, 605000), (6, 710000), (7, 1170000), (8, 620000), (9, 625000), (10, 730000),
	(11, 1210000), (12, 640000), (13, 645000), (14, 750000), (15, 695000), (16, 1260000), (17, 665000), (18, 670000), (19, 775000), (20, 720000);

-- 10. LUGAR_CLIVEH (36 lugares actualmente utilizados)
INSERT INTO LUGAR_CLIVEH (id_lugar, id_cliente_vehiculo) VALUES
    (31, 1), (11, 2), (21, 3), (41, 4), (51, 5), (1, 6),
    (24, 7), (35, 8), (44, 9), (54, 10), (3, 11), (14, 12),
    (37, 13), (46, 14), (47, 15), (48, 16), (56, 17), (57, 18),
    (58, 19), (59, 20), (32, 21), (33, 22), (34, 23), (12, 24),
    (13, 25), (22, 26), (23, 27), (42, 28), (43, 29), (52, 30),
    (53, 31), (2, 32), (25, 33), (36, 34), (45, 35), (55, 36);

-- 11. CONTRATO (50 contratos, 36 'Activo' y 14 'Inactivo')
INSERT INTO CONTRATO (id_cliente_vehiculo, id_edificio, estado, id_lugar_cliveh) VALUES
    (1, 4, 'Activo', 1), (2, 2, 'Activo', 2), (3, 3, 'Activo', 3), (4, 5, 'Activo', 4), (5, 6, 'Activo', 5),
    (6, 1, 'Activo', 6), (7, 3, 'Activo', 7), (8, 4, 'Activo', 8), (9, 5, 'Activo', 9), (10, 6, 'Activo', 10),
    (11, 1, 'Activo', 11), (12, 2, 'Activo', 12), (13, 4, 'Activo', 13), (14, 5, 'Activo', 14), (15, 5, 'Activo', 15),
	(16, 5, 'Activo', 16), (17, 6, 'Activo', 17), (18, 6, 'Activo', 18), (19, 6, 'Activo', 19), (20, 6, 'Activo', 20),
    (21, 4, 'Activo', 21), (22, 4, 'Activo', 22), (23, 4, 'Activo', 23), (24, 2, 'Activo', 24), (25, 2, 'Activo', 25),
    (26, 3, 'Activo', 26), (27, 3, 'Activo', 27), (28, 5, 'Activo', 28), (29, 5, 'Activo', 29), (30, 6, 'Activo', 30),
    (31, 6, 'Activo', 31), (32, 1, 'Activo', 32), (33, 3, 'Activo', 33), (34, 4, 'Activo', 34), (35, 5, 'Activo', 35),
	(36, 6, 'Activo', 36), (11, 1, 'Inactivo', 6), (12, 1, 'Inactivo', 6), (13, 1, 'Inactivo', 6), (14, 2, 'Inactivo', 2),
    (15, 2, 'Inactivo', 2), (16, 3, 'Inactivo', 3), (17, 3, 'Inactivo', 3), (18, 4, 'Inactivo', 1), (19, 4, 'Inactivo', 1),
    (20, 5, 'Inactivo', 4), (1, 5, 'Inactivo', 4), (2, 6, 'Inactivo', 5), (3, 1, 'Inactivo', 11), (4, 2, 'Inactivo', 12);

-- 12. PAGO (50 pagos, 1 por cada contrato)
INSERT INTO PAGO (id_contrato, monto) VALUES
    (1, 50000), (2, 55000), (3, 60000), (4, 65000), (5, 45000),
    (6, 50000), (7, 55000), (8, 60000), (9, 65000), (10, 45000),
    (11, 50000), (12, 55000), (13, 60000), (14, 65000), (15, 45000),
    (16, 50000), (17, 55000), (18, 60000), (19, 65000), (20, 45000),
    (21, 50000), (22, 55000), (23, 60000), (24, 65000), (25, 45000),
    (26, 50000), (27, 55000), (28, 60000), (29, 65000), (30, 45000),
    (31, 50000), (32, 55000), (33, 60000), (34, 65000), (35, 45000),
    (36, 50000), (37, 55000), (38, 60000), (39, 65000), (40, 45000),
    (41, 50000), (42, 55000), (43, 60000), (44, 65000), (45, 45000),
    (46, 50000), (47, 55000), (48, 60000), (49, 65000), (50, 45000);