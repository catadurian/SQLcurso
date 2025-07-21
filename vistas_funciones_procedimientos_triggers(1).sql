
-- VISTAS --

-- Vista para ver el stock bajo de repuestos (menor a 10 unidades)
CREATE VIEW vista_stock_bajo AS
SELECT r.descripcion, s.cantidad
FROM stock s
JOIN repuesto r ON s.id_repuesto = r.id_repuesto
WHERE s.cantidad < 10;

-- Vista para ver el historial de pedidos con cliente y total estimado
CREATE VIEW vista_historial_pedidos AS
SELECT p.id_pedido, c.nombre, c.apellido, p.fecha_pedido, p.estado
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id_cliente;


-- FUNCIONES --

-- Función para obtener el total facturado de un pedido
DELIMITER //
CREATE FUNCTION fn_total_factura_por_pedido(pedido_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(cantidad * precio_unitario)
    INTO total
    FROM detalle_pedido
    WHERE id_pedido = pedido_id;
    RETURN total;
END;
//
DELIMITER ;

-- Función para contar la cantidad de pedidos de un cliente
DELIMITER //
CREATE FUNCTION fn_cantidad_pedidos_por_cliente(cliente_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad FROM pedido WHERE id_cliente = cliente_id;
    RETURN cantidad;
END;
//
DELIMITER ;


-- STORED PROCEDURES --

-- Procedimiento para actualizar el estado de un pedido
DELIMITER //
CREATE PROCEDURE sp_actualizar_estado_pedido(IN pedido_id INT, IN nuevo_estado VARCHAR(30))
BEGIN
    UPDATE pedido SET estado = nuevo_estado WHERE id_pedido = pedido_id;
END;
//
DELIMITER ;

-- Procedimiento para insertar una nueva factura
DELIMITER //
CREATE PROCEDURE sp_insertar_factura(IN pedido_id INT, IN fecha DATE)
BEGIN
    DECLARE total DECIMAL(10,2);
    SET total = fn_total_factura_por_pedido(pedido_id);
    INSERT INTO factura (id_pedido, fecha_emision, total)
    VALUES (pedido_id, fecha, total);
END;
//
DELIMITER ;


-- TRIGGER --

-- Trigger para actualizar stock luego de insertar detalle de pedido
DELIMITER //
CREATE TRIGGER trg_actualizar_stock
AFTER INSERT ON detalle_pedido
FOR EACH ROW
BEGIN
    UPDATE stock
    SET cantidad = cantidad - NEW.cantidad
    WHERE id_repuesto = NEW.id_repuesto;
END;
//
DELIMITER ;
