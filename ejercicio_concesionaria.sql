DROP TABLE IF EXISTS detalle_venta CASCADE;
DROP TABLE IF EXISTS venta CASCADE;
DROP TABLE IF EXISTS automovil CASCADE;
DROP TABLE IF EXISTS vendedor CASCADE;
DROP TABLE IF EXISTS servicio_oficial CASCADE;
DROP TABLE IF EXISTS version_equipamiento CASCADE;
DROP TABLE IF EXISTS equipamiento CASCADE;
DROP TABLE IF EXISTS version CASCADE;
DROP TABLE IF EXISTS modelo CASCADE;
DROP TABLE IF EXISTS marca_concesionario CASCADE;
DROP TABLE IF EXISTS marca CASCADE;
DROP TABLE IF EXISTS concesionario CASCADE;
CREATE TABLE concesionario(
    id_concesionario INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    cuit INTEGER NOT NULL   
);

CREATE TABLE marca(
    id_marca INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE marca_concesionario(
    id_concesionario INTEGER NOT NULL,
    id_marca INTEGER NOT NULL,

    PRIMARY KEY (id_concesionario, id_marca),

    FOREIGN KEY (id_concesionario) REFERENCES concesionario(id_concesionario),
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

CREATE TABLE modelo(
    id_modelo INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_marca INTEGER NOT NULL,

    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);

CREATE TABLE version(
    id_version INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_modelo INTEGER NOT NULL,
    precio_base DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_modelo) REFERENCES modelo(id_modelo)
);

CREATE TABLE equipamiento(
    id_equipamiento INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio_extra DECIMAL(10,2) NOT NULL
);

CREATE TABLE version_equipamiento(
    id_version INTEGER NOT NULL,
    id_equipamiento INTEGER NOT NULL,

    PRIMARY KEY (id_version, id_equipamiento),

    FOREIGN KEY (id_version) REFERENCES version(id_version),
    FOREIGN KEY (id_equipamiento) REFERENCES equipamiento(id_equipamiento)
);

CREATE TABLE servicio_oficial(
    id_servicio INTEGER PRIMARY KEY,
    id_concesionario INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    cuit INTEGER NOT NULL,

    FOREIGN KEY (id_concesionario) REFERENCES concesionario(id_concesionario)
);

CREATE TABLE vendedor(
    id_vendedor INTEGER PRIMARY KEY,
    id_concesionario INTEGER NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    cuit INTEGER NOT NULL,

    FOREIGN KEY (id_concesionario) REFERENCES concesionario(id_concesionario)
);

CREATE TABLE automovil(
    id_automovil INTEGER PRIMARY KEY,
    id_version INTEGER NOT NULL,
    id_concesionario INTEGER NOT NULL,
    id_servicio INTEGER NOT NULL,

    FOREIGN KEY (id_version) REFERENCES version(id_version),
    FOREIGN KEY (id_concesionario) REFERENCES concesionario(id_concesionario),
    FOREIGN KEY (id_servicio) REFERENCES servicio_oficial(id_servicio)
);

CREATE TABLE venta(
    id_venta INTEGER PRIMARY KEY,
    id_automovil INTEGER NOT NULL,
    id_vendedor INTEGER NOT NULL,
    fecha DATE NOT NULL,
    precio_final DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_automovil) REFERENCES automovil(id_automovil),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);

CREATE TABLE detalle_venta(
    id_detalle INTEGER PRIMARY KEY,
    id_venta INTEGER NOT NULL,
    id_equipamiento INTEGER NOT NULL,
    precio_cobrado DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_equipamiento) REFERENCES equipamiento(id_equipamiento)
);