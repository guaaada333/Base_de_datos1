CREATE TABLE cliente(
    id_cliente INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL
);
CREATE TABLE producto(
    id_producto INTEGER PRIMARY KEY,
    precio DECIMAL(10, 2) NOT NULL,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE pedido(
    id_pedido VARCHAR(50) PRIMARY KEY,
    cantidad INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    id_cliente INTEGER NOT NULL,

    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);