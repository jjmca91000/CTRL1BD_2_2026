DROP SCHEMA IF EXISTS estacionamientos CASCADE;
CREATE SCHEMA estacionamientos;
SET search_path TO estacionamientos;

CREATE TABLE COMUNA (
    id_comuna SERIAL PRIMARY KEY,
    nombre_comuna VARCHAR(20) NOT NULL
);

CREATE TABLE MODELO (
    id_modelo SERIAL PRIMARY KEY,
    nombre_modelo VARCHAR(80) NOT NULL
);

CREATE TABLE CLIENTE (
    id_cliente SERIAL PRIMARY KEY,
    id_comuna INT NOT NULL
        REFERENCES COMUNA(id_comuna),
    nombre VARCHAR(80) NOT NULL
);

CREATE TABLE EDIFICIO_ESTACIONAMIENTO (
    id_edificio SERIAL PRIMARY KEY,
    id_comuna INT NOT NULL
        REFERENCES COMUNA(id_comuna),
    nombre_edificio VARCHAR(80) NOT NULL
);

CREATE TABLE VEHICULO (
    patente_vehiculo VARCHAR(6) PRIMARY KEY,
    id_modelo INT NOT NULL
        REFERENCES MODELO(id_modelo)
);

CREATE TABLE EMPLEADO (
    id_empleado SERIAL PRIMARY KEY,
    id_edificio INT NOT NULL
        REFERENCES EDIFICIO_ESTACIONAMIENTO(id_edificio),
    id_comuna INT NOT NULL
        REFERENCES COMUNA(id_comuna),
    nombre VARCHAR(80) NOT NULL,
    tipo_empleado VARCHAR(30) NOT NULL
);

CREATE TABLE LUGAR (
    id_lugar SERIAL PRIMARY KEY,
    id_edificio INT NOT NULL
        REFERENCES EDIFICIO_ESTACIONAMIENTO(id_edificio),
    numero_lugar INT NOT NULL
);

CREATE TABLE CLIENTE_VEHICULO (
    id_cliente_vehiculo SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL
        REFERENCES CLIENTE(id_cliente),
    patente_vehiculo VARCHAR(6) NOT NULL
        REFERENCES VEHICULO(patente_vehiculo)
);

CREATE TABLE SUELDO (
    id_sueldo SERIAL PRIMARY KEY,
    id_empleado INT NOT NULL
        REFERENCES EMPLEADO(id_empleado),
    monto_sueldo INTEGER NOT NULL
);

CREATE TABLE LUGAR_CLIVEH (
    id_lugar_cliveh SERIAL PRIMARY KEY,
    id_lugar INT NOT NULL
        REFERENCES LUGAR(id_lugar),
    id_cliente_vehiculo INT NOT NULL
        REFERENCES CLIENTE_VEHICULO(id_cliente_vehiculo)
);

CREATE TABLE CONTRATO (
    id_contrato SERIAL PRIMARY KEY,
    id_cliente_vehiculo INT NOT NULL
        REFERENCES CLIENTE_VEHICULO(id_cliente_vehiculo),
    id_edificio INT NOT NULL
        REFERENCES EDIFICIO_ESTACIONAMIENTO(id_edificio),
    estado VARCHAR(10) NOT NULL,
    id_lugar_cliveh INT NOT NULL
        REFERENCES LUGAR_CLIVEH(id_lugar_cliveh)
);

CREATE TABLE PAGO (
    id_pago SERIAL PRIMARY KEY,
    id_contrato INT NOT NULL
        REFERENCES CONTRATO(id_contrato),
    monto INTEGER NOT NULL
);




