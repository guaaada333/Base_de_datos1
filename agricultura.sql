CREATE TABLE cliente(
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefono VARCHAR(20)
);

CREATE TABLE parcela(
    id_parcela SERIAL PRIMARY KEY,
    ubicacion VARCHAR(255) NOT NULL,
    area FLOAT NOT NULL,
    id_cliente INT,
    
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE cultivo(
    id_cultivo SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL
);

CREATE TABLE parcela_cultivo(
    id_parcela INT,
    id_cultivo INT,
    fecha_siembra DATE,
    fecha_cosecha DATE,

    PRIMARY KEY (id_parcela, id_cultivo),

    FOREIGN KEY (id_parcela) REFERENCES parcela(id_parcela),
    FOREIGN KEY (id_cultivo) REFERENCES cultivo(id_cultivo)
);

CREATE TABLE dron(
    id_dron SERIAL PRIMARY KEY,
    modelo VARCHAR(255) NOT NULL,
    fecha_adquisicion DATE NOT NULL
);

CREATE TABLE vuelo(
    id_vuelo SERIAL PRIMARY KEY,
    id_parcela INT,
    id_dron INT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    duracion FLOAT NOT NULL,

    FOREIGN KEY (id_dron) REFERENCES dron(id_dron),
    FOREIGN KEY (id_parcela) REFERENCES parcela(id_parcela)
);

CREATE TABLE sensor(
    id_sensor SERIAL PRIMARY KEY,
    tipo VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE sensor_dron(
    id_sensor INT,
    id_dron INT,

    PRIMARY KEY (id_sensor, id_dron),

    FOREIGN KEY (id_sensor) REFERENCES sensor(id_sensor),
    FOREIGN KEY (id_dron) REFERENCES dron(id_dron)
);

CREATE TABLE detalle_vuelo(
    id_detalle SERIAL PRIMARY KEY,
    id_vuelo INT,
    id_sensor INT,
    valor FLOAT NOT NULL,
    anomalias_detectadas VARCHAR(255),
    fecha_registro DATE NOT NULL,

    FOREIGN KEY (id_vuelo) REFERENCES vuelo(id_vuelo),
    FOREIGN KEY (id_sensor) REFERENCES sensor(id_sensor)
);