
-- Inserción conceptual de marcas SOLO para datos de prueba en Entrega 2.
-- En Entrega 1 se solicitó no insertar datos en esta tabla.
INSERT INTO marca (nombre_marca) VALUES ('Toyota'), ('Ford'), ('Renault');

-- Inserción de proveedores
INSERT INTO proveedor (razon_social, cuit, telefono, direccion) VALUES
('Autopartes S.A.', '30-12345678-9', '1144556677', 'Av. Mitre 1234'),
('Motores SRL', '30-87654321-0', '1133221100', 'Calle Falsa 123');

-- Inserción de clientes
INSERT INTO cliente (nombre, apellido, email, telefono, direccion) VALUES
('Juan', 'Pérez', 'juanperez@gmail.com', '1112345678', 'Calle 1 N°123'),
('María', 'Gómez', 'mariagomez@gmail.com', '1123456789', 'Calle 2 N°456');

-- Inserción de repuestos
INSERT INTO repuesto (descripcion, precio_unitario, id_marca, id_proveedor) VALUES
('Filtro de aceite', 3500.00, 1, 1),
('Pastilla de freno', 7800.00, 2, 2),
('Bujía de encendido', 1200.00, 3, 1);

-- Inserción de stock
INSERT INTO stock (id_repuesto, cantidad) VALUES
(1, 15), (2, 5), (3, 20);

-- Inserción de pedidos
INSERT INTO pedido (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-07-20', 'Pendiente'),
(2, '2025-07-19', 'Entregado');

-- Inserción de detalle de pedidos
INSERT INTO detalle_pedido (id_pedido, id_repuesto, cantidad, precio_unitario) VALUES
(1, 1, 2, 3500.00),
(1, 2, 1, 7800.00),
(2, 3, 4, 1200.00);

-- Inserción de facturas
INSERT INTO factura (id_pedido, fecha_emision, total) VALUES
(1, '2025-07-21', 14800.00),
(2, '2025-07-20', 4800.00);

-- Inserción de servicios
INSERT INTO servicio (descripcion, id_marca, precio) VALUES
('Cambio de aceite', 1, 9000.00),
('Chequeo de frenos', 2, 11000.00);
