SET search_path TO estacionamientos;

-- 1. Clientes que más gastan por edificio (top 3)
SELECT e.nombre_edificio, t.cliente, t.total_gastado
FROM EDIFICIO_ESTACIONAMIENTO e
CROSS JOIN LATERAL (
    SELECT cl.nombre AS cliente, SUM(p.monto) AS total_gastado
    FROM PAGO p
    JOIN CONTRATO ct ON ct.id_contrato = p.id_contrato
    JOIN CLIENTE_VEHICULO cv ON cv.id_cliente_vehiculo = ct.id_cliente_vehiculo
    JOIN CLIENTE cl ON cl.id_cliente = cv.id_cliente
    WHERE ct.id_edificio = e.id_edificio
    GROUP BY cl.id_cliente, cl.nombre
    ORDER BY total_gastado DESC
    LIMIT 3
) t
ORDER BY e.nombre_edificio, t.total_gastado DESC;

-- 2. Modelos menos recurrentes por edificio (top 3)
SELECT e.nombre_edificio, t.nombre_modelo, t.cantidad_vehiculos
FROM EDIFICIO_ESTACIONAMIENTO e
CROSS JOIN LATERAL (
    SELECT m.nombre_modelo, COUNT(DISTINCT cv.patente_vehiculo) AS cantidad_vehiculos
    FROM CONTRATO ct
    JOIN CLIENTE_VEHICULO cv ON cv.id_cliente_vehiculo = ct.id_cliente_vehiculo
    JOIN VEHICULO v ON v.patente_vehiculo = cv.patente_vehiculo
    JOIN MODELO m ON m.id_modelo = v.id_modelo
    WHERE ct.id_edificio = e.id_edificio AND ct.estado = 'Activo'
    GROUP BY m.id_modelo, m.nombre_modelo
    ORDER BY cantidad_vehiculos ASC
    LIMIT 3
) t
ORDER BY e.nombre_edificio, t.cantidad_vehiculos ASC;

-- 3. Empleados con mayor y menor sueldo por edificio
SELECT e.nombre_edificio, emp.nombre, emp.tipo_empleado, s.monto_sueldo
FROM EMPLEADO emp
JOIN SUELDO s ON s.id_empleado = emp.id_empleado
JOIN EDIFICIO_ESTACIONAMIENTO e ON e.id_edificio = emp.id_edificio
WHERE s.monto_sueldo = (SELECT MAX(s2.monto_sueldo)
                        FROM SUELDO s2
                        JOIN EMPLEADO emp2 ON emp2.id_empleado = s2.id_empleado
                        WHERE emp2.id_edificio = emp.id_edificio)
   OR s.monto_sueldo = (SELECT MIN(s3.monto_sueldo)
                        FROM SUELDO s3
                        JOIN EMPLEADO emp3 ON emp3.id_empleado = s3.id_empleado
                        WHERE emp3.id_edificio = emp.id_edificio)
ORDER BY e.nombre_edificio, s.monto_sueldo DESC;

-- 4. Comunas con la cantidad de clientes
SELECT co.nombre_comuna, COUNT(cl.id_cliente) AS cantidad_clientes
FROM COMUNA co
LEFT JOIN CLIENTE cl ON cl.id_comuna = co.id_comuna
GROUP BY co.id_comuna, co.nombre_comuna
ORDER BY cantidad_clientes DESC;

-- 5. Edificios con más lugares disponibles (top 3)
SELECT e.nombre_edificio, COUNT(l.id_lugar) AS lugares_disponibles
FROM EDIFICIO_ESTACIONAMIENTO e
LEFT JOIN LUGAR l
       ON l.id_edificio = e.id_edificio
      AND l.id_lugar NOT IN (SELECT lc.id_lugar
                             FROM LUGAR_CLIVEH lc
                             JOIN CONTRATO ct ON ct.id_lugar_cliveh = lc.id_lugar_cliveh
							 WHERE ct.estado = 'Activo')
GROUP BY e.id_edificio, e.nombre_edificio
ORDER BY lugares_disponibles DESC
LIMIT 3;

-- 6. Edificios con menos lugares disponibles (top 3)
SELECT e.nombre_edificio, COUNT(l.id_lugar) AS lugares_disponibles
FROM EDIFICIO_ESTACIONAMIENTO e
LEFT JOIN LUGAR l
       ON l.id_edificio = e.id_edificio
      AND l.id_lugar NOT IN (SELECT lc.id_lugar
                             FROM LUGAR_CLIVEH lc
                             JOIN CONTRATO ct ON ct.id_lugar_cliveh = lc.id_lugar_cliveh
							 WHERE ct.estado = 'Activo')
GROUP BY e.id_edificio, e.nombre_edificio
ORDER BY lugares_disponibles ASC
LIMIT 3;

-- 7. Clientes con más autos por edificio (top 3)
SELECT e.nombre_edificio, t.cliente, t.cantidad_autos
FROM EDIFICIO_ESTACIONAMIENTO e
CROSS JOIN LATERAL (
    SELECT cl.nombre AS cliente, COUNT(DISTINCT cv.patente_vehiculo) AS cantidad_autos
    FROM CONTRATO ct
    JOIN CLIENTE_VEHICULO cv ON cv.id_cliente_vehiculo = ct.id_cliente_vehiculo
    JOIN CLIENTE cl ON cl.id_cliente = cv.id_cliente
    WHERE ct.id_edificio = e.id_edificio
    GROUP BY cl.id_cliente, cl.nombre
    ORDER BY cantidad_autos DESC
    LIMIT 3
) t
ORDER BY e.nombre_edificio, t.cantidad_autos DESC;

-- 8. Lugar más usado por edificio (top 1)
SELECT e.nombre_edificio, t.numero_lugar, t.veces_usado
FROM EDIFICIO_ESTACIONAMIENTO e
CROSS JOIN LATERAL (
    SELECT l.numero_lugar, COUNT(ct.id_contrato) AS veces_usado
    FROM LUGAR l
    JOIN LUGAR_CLIVEH lc ON lc.id_lugar = l.id_lugar
    JOIN CONTRATO ct ON ct.id_lugar_cliveh = lc.id_lugar_cliveh
    WHERE l.id_edificio = e.id_edificio
    GROUP BY l.id_lugar, l.numero_lugar
    ORDER BY veces_usado DESC
    LIMIT 1
) t
ORDER BY e.nombre_edificio;

-- 9. Edificio con más empleados
SELECT e.nombre_edificio, COUNT(emp.id_empleado) AS numero_empleados
FROM EMPLEADO emp
JOIN EDIFICIO_ESTACIONAMIENTO e ON e.id_edificio = emp.id_edificio
GROUP BY e.id_edificio, e.nombre_edificio
ORDER BY numero_empleados DESC
LIMIT 1;

-- 10. Sueldos por tipo de empleado, por edificio (comuna del edificio destacada)
SELECT UPPER(co.nombre_comuna) AS comuna_edificio,
       e.nombre_edificio,
       emp.tipo_empleado,
       emp.nombre AS empleado,
       s.monto_sueldo
FROM EMPLEADO emp
JOIN SUELDO s ON s.id_empleado = emp.id_empleado
JOIN EDIFICIO_ESTACIONAMIENTO e ON e.id_edificio = emp.id_edificio
JOIN COMUNA co ON co.id_comuna = e.id_comuna
ORDER BY co.nombre_comuna, e.nombre_edificio, emp.tipo_empleado, s.monto_sueldo DESC;
