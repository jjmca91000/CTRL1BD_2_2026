-- Configurar el esquema
SET search_path TO estacionamientos;

-- 1. COMUNA
INSERT INTO COMUNA (nombre_comuna) VALUES 
('Santiago'),
('Providencia'),
('Las Condes'),
('Maipú'),
('Ñuñoa');

-- 2. MODELO
INSERT INTO MODELO (nombre_modelo) VALUES 
('Toyota Hilux'),
('Suzuki Swift'),
('Chevrolet Sail'),
('Nissan Versa'),
('Hyundai Tucson');

-- 3. CLIENTE
INSERT INTO CLIENTE (id_comuna, nombre) VALUES 
(3, 'Carlos Pérez'),
(3, 'María González'),
(2, 'Juan Soto'),
(2, 'Ana Muñoz'),
(1, 'Pedro Riquelme'),
(4, 'Claudia Alarcón'),
(5, 'Esteban Morales');

-- 4. EDIFICIO_ESTACIONAMIENTO
INSERT INTO EDIFICIO_ESTACIONAMIENTO (id_comuna, nombre_edificio) VALUES 
(3, 'Torre Titanium'),
(2, 'Edificio Apoquindo 3000'),
(1, 'Estacionamientos Centro Histórico'),
(4, 'Mall Arauco Maipú (Oficinas)');

-- 5. VEHICULO
INSERT INTO VEHICULO (patente_vehiculo, id_modelo) VALUES 
('ABCD12', 1),
('WXYZ34', 2),
('JKLM56', 3),
('RT4589', 4),
('PP8899', 5),
('ZX1122', 1),
('GH5566', 3);

-- 6. EMPLEADO
INSERT INTO EMPLEADO (id_edificio, id_comuna, nombre, tipo_empleado) VALUES 
(1, 3, 'Roberto Gómez', 'Conserje'),
(1, 3, 'Luis Tapia', 'Aseo'),
(2, 2, 'Marcos Díaz', 'Conserje'),
(3, 1, 'Sofía Valdés', 'Administrador'),
(4, 4, 'Jorge Rojas', 'Conserje');

-- 7. LUGAR
INSERT INTO LUGAR (id_edificio, numero_lugar) VALUES 
(1, 27),
(1, 32),
(2, 7),
(2, 102),
(3, 78),
(4, 67);

-- 8. CLIENTE_VEHICULO
INSERT INTO CLIENTE_VEHICULO (id_cliente, patente_vehiculo) VALUES 
(1, 'ABCD12'),
(2, 'WXYZ34'),
(3, 'JKLM56'),
(4, 'RT4589'),
(5, 'PP8899'),
(6, 'ZX1122'),
(7, 'GH5566');

-- 9. SUELDO
INSERT INTO SUELDO (id_empleado, monto_sueldo) VALUES 
(1, 650000),
(2, 480000),
(3, 620000),
(4, 850000),
(5, 500000);

-- 10. LUGAR_CLIVEH
INSERT INTO LUGAR_CLIVEH (id_lugar, id_cliente_vehiculo) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6);

-- 11. CONTRATO
INSERT INTO CONTRATO (id_cliente_vehiculo, id_edificio, estado, id_lugar_cliveh) VALUES 
(1, 1, 'Activo', 1),
(2, 1, 'Activo', 2),
(3, 2, 'Activo', 3),
(4, 2, 'Inactivo', 4),
(5, 3, 'Activo', 5),
(6, 4, 'Activo', 6);

-- 12. PAGO
INSERT INTO PAGO (id_contrato, monto) VALUES 
(1, 100000),
(2, 100000),
(3, 90000),
(4, 90000),
(5, 75000),
(6, 60000);