CREATE TABLE entrenador(
    id_entrenador SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE atleta(
    id_atleta SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    entrenador_id INT,
    FOREIGN KEY (entrenador_id) REFERENCES entrenador(id_entrenador)
);
CREATE TABLE categoria(
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
CREATE TABLE atleta_categoria(
    id_atleta INT,
    id_categoria INT,
    PRIMARY KEY (id_atleta, id_categoria),
    FOREIGN KEY (id_atleta) REFERENCES atleta(id_atleta),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
CREATE TABLE carrera(
    id_carrera SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    distancia_km FLOAT NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    tiempo_total FLOAT NOT NULL,
    fecha DATE NOT NULL
);
CREATE TABLE atleta_carrera(
    id_atleta INT,
    id_carrera INT,
    PRIMARY KEY (id_atleta, id_carrera),
    FOREIGN KEY (id_atleta) REFERENCES atleta(id_atleta),
    FOREIGN KEY (id_carrera) REFERENCES carrera(id_carrera)
);  
CREATE TABLE entrenamiento(
    id_entrenamiento SERIAL PRIMARY KEY,
    fecha DATE NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    atleta_id INT,
    FOREIGN KEY (atleta_id) REFERENCES atleta(id_atleta)
);

CREATE TABLE registro(
    id_registro SERIAL PRIMARY KEY,
    id_entrenamiento INT,
    series INT NOT NULL,
    repeticiones INT NOT NULL,
    peso_kg FLOAT NOT NULL,
    FOREIGN KEY (id_entrenamiento) REFERENCES entrenamiento(id_entrenamiento)
);