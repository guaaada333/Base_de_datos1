INSERT INTO localidad(codigo_postal, nombre_ciudad) VALUES
('28001', 'Concepcion'),
('08001', 'Aguilares'),
('28002', 'Monteros'),
('41001', 'Jujuy');
INSERT INTO estudiante(id_estudiante,nombre,apellido,direccion,codigo_postal)VALUES
('2100','Juan','Perez','Calle 1','28001'),
('1100','Ana','Garcia','Calle 2','08001'),
('1801','Pedro','Perez','Calle 3','28002'),
('1401','Maria','Rodriguez','Calle 4','41001');
INSERT INTO inscripcion(id_estudiante,curso,seccion) VALUES
('2100','Quimica','A'),
('2100','Matematica','A'),
('2100','Biologia','A'),
('1100','Fisica','B'),
('1100','Quimica','B'),
('1801','Quimica','A'),
('1801','Matematica','A'),
('1401','Matematica','B');
