
-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS autopartista;
USE autopartista;

-- Tabla: marcas
CREATE TABLE IF NOT EXISTS marcas (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nombre_marca VARCHAR(50) UNIQUE NOT NULL
);

-- Inserción de marcas
INSERT INTO marcas (nombre_marca) VALUES 
('Toyota'),
('Ford'),
('Renault');

-- Tabla: proveedores
CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    razon_social VARCHAR(150) NOT NULL,
    cuit VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Tabla: repuestos
CREATE TABLE IF NOT EXISTS repuestos (
    id_repuesto INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_marca INT NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

-- Tabla: stock
CREATE TABLE IF NOT EXISTS stock (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    id_repuesto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_repuesto) REFERENCES repuestos(id_repuesto)
);

-- Tabla: clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Tabla: pedidos
CREATE TABLE IF NOT EXISTS pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(30),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla: detalle_pedidos
CREATE TABLE IF NOT EXISTS detalle_pedidos (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_repuesto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_repuesto) REFERENCES repuestos(id_repuesto)
);

-- Tabla: facturas
CREATE TABLE IF NOT EXISTS facturas (
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    fecha_emision DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

-- Tabla: servicios
CREATE TABLE IF NOT EXISTS servicios (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    id_marca INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);
