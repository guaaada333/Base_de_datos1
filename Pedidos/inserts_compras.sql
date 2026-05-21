INSERT INTO cliente(id_cliente,nombre,direccion) VALUES
(1,'Juan Perez','Calle 1 Concepcion Tucuman'),
(2,'Ana Garcia','Calle 2 Aguilares Tucuman'),
(3,'Pedro Perez','Calle 3 Monteros Tucuman');

INSERT INTO producto(id_producto,precio,nombre) VALUES
(0,10,'Libro'),
(1,1,'Lapiz'),
(2,3,'Cuaderno'),
(3,2,'Boligrafo');

INSERT INTO pedido(id_pedido,cantidad,id_producto,id_cliente) VALUES
('001',2,0,1),
('002',5,1,1),
('003',3,2,2),
('004',1,0,3),
('005',2,3,3);

