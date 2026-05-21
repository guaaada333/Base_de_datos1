
CREATE TABLE localidad(
    codigo_postal VARCHAR(100) PRIMARY KEY ,
    nombre_ciudad VARCHAR(255) NOT NULL

);
CREATE TABLE estudiante(
    id_estudiante VARCHAR(100) PRIMARY KEY ,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    codigo_postal VARCHAR(100) NOT NULL,
    FOREIGN KEY (codigo_postal) REFERENCES localidad(codigo_postal)
);
CREATE TABLE inscripcion(
    id_estudiante VARCHAR(100) NOT NULL,
    curso VARCHAR(255) NOT NULL,
    seccion VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_estudiante) REFERENCES estudiante(id_estudiante)
);

