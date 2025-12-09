-- ------------------------------------------------------
-- Crear base de datos
-- ------------------------------------------------------
CREATE DATABASE Ecommerce_BD_M3;

-- ------------------------------------------------------
-- Crear tablas
-- ------------------------------------------------------
CREATE TABLE usuarios (
    nickname VARCHAR(100) PRIMARY KEY,
    password VARCHAR(255) NOT NULL, 
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_registro DATETIME
);
CREATE TABLE clientes (
    rut VARCHAR(12) PRIMARY KEY, 
    nickname_usuario VARCHAR(100) NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    edad INT NOT NULL,
    CONSTRAINT chk_edad CHECK (EDAD >= 18),
    FOREIGN KEY (nickname_usuario) REFERENCES usuarios(nickname) ON DELETE CASCADE
);
CREATE TABLE info_cliente (
    id_direccion INT AUTO_INCREMENT PRIMARY KEY,
    rut_cliente VARCHAR(12),
    direccion VARCHAR(260) NOT NULL,
    ciudad VARCHAR(100) NOT NULL,
    estado_region VARCHAR(100) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    codigo_postal VARCHAR(20) NOT NULL,
    es_principal BOOLEAN,
    FOREIGN KEY (rut_cliente) REFERENCES clientes(rut) ON DELETE CASCADE
);
CREATE TABLE categoria (
    id_cat INT AUTO_INCREMENT PRIMARY KEY,
    nombre_cat VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE subcategoria (
    id_subc INT AUTO_INCREMENT PRIMARY KEY,
    id_cat INT, 
    nombre_subcat VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_cat) REFERENCES categoria(id_cat) ON DELETE CASCADE
);
CREATE TABLE productos (
    id_prod INT AUTO_INCREMENT PRIMARY KEY,
    id_subc INT, 
    nombre_prod VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 0) NOT NULL,
    stock INT NOT NULL DEFAULT 0, 
    FOREIGN KEY (id_subc) REFERENCES subcategoria(id_subc) ON DELETE CASCADE
);
CREATE TABLE carrito (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    rut_cliente VARCHAR(12),
    fecha_creacion DATETIME,
    FOREIGN KEY (rut_cliente) REFERENCES clientes(rut) ON DELETE CASCADE
);
CREATE TABLE items_carrito (
    id_carrito INT, 
    id_prod INT, 
    cantidad INT NOT NULL CHECK (cantidad > 0),
    PRIMARY KEY (id_carrito, id_prod),
    FOREIGN KEY (id_carrito) REFERENCES carrito(id_carrito) ON DELETE CASCADE,
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod) ON DELETE CASCADE
);
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    rut_cliente VARCHAR(12), 
    direccion_envio INT, 
    total DECIMAL(20,0) NOT NULL CHECK (total >= 0),
	metodo_pago ENUM('Credito', 'Debito', 'Transferencia') NOT NULL, 
    estado ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado') DEFAULT 'pendiente',
    boleta_factura ENUM('Por_enviar', 'Enviada') NOT NULL DEFAULT 'por_enviar', 
    fecha_venta DATETIME,
    FOREIGN KEY (rut_cliente) REFERENCES clientes(rut) ON DELETE CASCADE,
    FOREIGN KEY (direccion_envio) REFERENCES info_cliente(id_direccion) ON DELETE CASCADE
);
CREATE TABLE nota_credito (
	id_notac INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    reembolso BOOLEAN DEFAULT FALSE,
    devolucion BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta) ON DELETE CASCADE
);
CREATE TABLE detalle_venta (
    id_venta INT, 
    id_prod INT, 
    cantidad INT NOT NULL CHECK (cantidad > 0),
    PRIMARY KEY (id_venta, id_prod),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_prod) REFERENCES productos(id_prod) ON DELETE CASCADE
);
CREATE TABLE descuento (
    id_dsct INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL,
    tipo ENUM('Porcentaje', 'Monto_fijo') NOT NULL,
    valor DECIMAL(10, 2) NOT NULL CHECK (valor >= 0),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE, 
    activo BOOLEAN NOT NULL
);
CREATE TABLE descuentos_aplicados (
    id_venta INT,
    id_dsct INT, 
    monto_descontado DECIMAL(10, 2) NOT NULL CHECK (monto_descontado >= 0),
    PRIMARY KEY (id_venta, id_dsct),
    FOREIGN KEY (id_venta) REFERENCES ventas(id_venta) ON DELETE CASCADE,
    FOREIGN KEY (id_dsct) REFERENCES descuento(id_dsct) ON DELETE CASCADE
);

-- ------------------------------------------------------
-- Procedimiento para crear vistas
-- ------------------------------------------------------
DELIMITER //
CREATE PROCEDURE crear_vistas()
BEGIN
-- ------------------------------------------------------
-- Crear vista de productos con subcategoria y categoria
-- ------------------------------------------------------
CREATE VIEW vista_stock_cat_sub_prod
  AS SELECT id_prod ,categoria.nombre_cat, subcategoria.nombre_subcat, nombre_prod, stock
       FROM productos
 INNER JOIN subcategoria
		 ON productos.id_subc = subcategoria.id_subc
 INNER JOIN categoria
		 ON subcategoria.id_cat = categoria.id_cat;
-- ------------------------------------------------------ 
-- Uso DDL vista de carritos, sus productos, precio, por cliente
-- ------------------------------------------------------
CREATE VIEW vista_carrito_cliente 
  AS SELECT carrito.rut_cliente, items_carrito.id_carrito, productos.id_prod, productos.nombre_prod, productos.precio, cantidad, productos.precio*cantidad 
		 AS sub_total 
	   FROM items_carrito 
 INNER JOIN productos 
		 ON items_carrito.id_prod = productos.id_prod
 INNER JOIN carrito
		 ON items_carrito.id_carrito = carrito.id_carrito
   ORDER BY id_carrito ASC;
-- ------------------------------------------------------
-- Uso DDL vista de ventas con direccion completa para envio y nota de credito
-- ------------------------------------------------------
CREATE VIEW vista_venta_nota
  AS SELECT ventas.id_venta, ventas.rut_cliente, total, metodo_pago, fecha_venta, info_cliente.direccion, info_cliente.ciudad, info_cliente.estado_region, info_cliente.pais, info_cliente.codigo_postal, info_cliente.es_principal, estado, boleta_factura, nota_credito.reembolso, nota_credito.devolucion 
	   FROM ventas 
 INNER JOIN info_cliente
		 ON ventas.direccion_envio = info_cliente.id_direccion
 INNER JOIN nota_credito 
		 ON ventas.id_venta = nota_credito.id_venta ;
-- ------------------------------------------------------
-- Se crea vista que contiene rut cliente, nombre de los productos
-- ------------------------------------------------------
CREATE VIEW vista_detalle_cliente
  AS SELECT ventas.rut_cliente, id_venta, vista_carrito_cliente.id_prod, vista_carrito_cliente.nombre_prod, vista_carrito_cliente.cantidad, vista_carrito_cliente.precio, vista_carrito_cliente.sub_total
	   FROM ventas
 INNER JOIN vista_carrito_cliente
		 ON ventas.rut_cliente = vista_carrito_cliente.rut_cliente
   ORDER BY ventas.id_venta;
-- ------------------------------------------------------
-- Se crea vista detalle de ventas por categoria con stock, cantidad, precio, total y fecha
-- ------------------------------------------------------
CREATE VIEW vista_detalle_venta_cat_subc_prod	 
  AS SELECT vdc.rut_cliente, vdc.id_venta, vscsp.nombre_cat, vscsp.nombre_subcat, vscsp.id_prod, vscsp.nombre_prod, vscsp.stock, vdc.cantidad, vdc.precio, vdc.sub_total, v.total, v.metodo_pago, v.fecha_venta  
	   FROM vista_stock_cat_sub_prod vscsp
 INNER JOIN vista_detalle_cliente vdc
		 ON vscsp.id_prod = vdc.id_prod
 INNER JOIN ventas v
		 ON v.id_venta = vdc.id_venta
   ORDER BY vdc.id_venta;
-- ------------------------------------------------------
-- Se crea vista detalle de descuentos aplicados
-- ------------------------------------------------------
CREATE VIEW vista_descuento_aplicado
  AS SELECT v.id_venta, da.id_dsct, v.total, d.codigo, d.tipo, d.valor, round(da.monto_descontado) AS descuento, round(v.total*d.valor) AS total_final
	   FROM ventas v
 INNER JOIN descuentos_aplicados da
         ON v.id_venta = da.id_venta
 INNER JOIN descuento d
		 ON da.id_dsct = d.id_dsct;
END//
DELIMITER ;
CALL crear_vistas();

-- ------------------------------------------------------
-- Creacion de indices
-- ------------------------------------------------------
CREATE INDEX index_productos ON  productos(id_prod, id_subc, nombre_prod, precio, stock);
SHOW INDEX FROM productos;
CREATE INDEX index_ventas ON ventas(id_venta, rut_cliente, direccion_envio, total, metodo_pago, estado, boleta_factura, fecha_venta);
SHOW INDEX FROM ventas;
CREATE INDEX index_cliente ON clientes(rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad);
SHOW INDEX FROM clientes;