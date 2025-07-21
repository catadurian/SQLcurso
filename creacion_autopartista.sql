
-- Base de datos
DROP DATABASE IF EXISTS autopartista;
CREATE DATABASE autopartista;
USE autopartista;

-- Tabla: marca
CREATE TABLE marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nombre_marca VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla: proveedor
CREATE TABLE proveedor (
    id_proveedor INT PRIMARY KEY AUTO_INCREMENT,
    razon_social VARCHAR(150) NOT NULL,
    cuit VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Tabla: repuesto
CREATE TABLE repuesto (
    id_repuesto INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_marca INT NOT NULL,
    id_proveedor INT NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca),
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Tabla: stock
CREATE TABLE stock (
    id_stock INT PRIMARY KEY AUTO_INCREMENT,
    id_repuesto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_repuesto) REFERENCES repuesto(id_repuesto)
);

-- Tabla: cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Tabla: pedido
CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(30),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabla: detalle_pedido
CREATE TABLE detalle_pedido (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_repuesto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_repuesto) REFERENCES repuesto(id_repuesto)
);

-- Tabla: factura
CREATE TABLE factura (
    id_factura INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    fecha_emision DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

-- Tabla: servicio
CREATE TABLE servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(255) NOT NULL,
    id_marca INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_marca) REFERENCES marca(id_marca)
);
