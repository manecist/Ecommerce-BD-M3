-- ------------------------------------------------------
-- Procedimiento para insertar datos
-- ------------------------------------------------------
DELIMITER //
CREATE PROCEDURE insertar_datos()
BEGIN
-- ------------------------------------------------------
-- insertar datos en usuarios
-- ------------------------------------------------------
INSERT INTO usuarios (nickname, password, email, fecha_registro) VALUES ('Coengeim', 'Clous.5820', 'Kdelriom@gmail.com', '2025-10-08 14:30:00');
INSERT INTO usuarios (nickname, password, email, fecha_registro) VALUES ('MikeGp', 'Pepin457', 'MikeGpPlay@gmail.com', '2025-10-12 11:05:40');
INSERT INTO usuarios (nickname, password, email, fecha_registro) VALUES ('Vlunaria', 'Inuyasha2701', 'Vbastiasa@gmail.com', '2025-11-24 17:49:09');
INSERT INTO usuarios (nickname, password, email, fecha_registro) VALUES ('Arianes', 'Atopi1410.', 'ArianesD@gmail.com', '2025-12-08 20:13:18');
-- ------------------------------------------------------
-- insertar datos en clientes
-- ------------------------------------------------------
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('11460321-0', null, 'Carla', 'Soto', +56941956230, '1983-02-05', 42);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('13870096-8', null, 'Samantha', 'Guzman', +56931343705, '1989-08-12', 36);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('15043365-7', null, 'Mario', 'Peñailillo', +56974790123, '1990-06-30', 35);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('18461078-2', 'Coengeim', 'Kevin', 'Del Rio', +56949127692, '1994-01-19', 31);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('22657001-2', null, 'Macarena', 'Escobar', +56923951147, '2002-01-17', 23);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('18506502-K', 'MikeGp', 'Michael', 'Guerra', +56987517943, '1992-11-26', 33);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('8340662-0', null, 'Gabriel', 'Diaz', +56985261809, '1957-07-22', 67);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('9478123-1', null, 'Ignacia', 'Fuentes', +56923951147, '1963-10-03', 62);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('18402136-4', 'Vlunaria', 'Viviana', 'Bastias', +56989461802, '1993-08-22', 32);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('15758871-K', null, 'Daniela', 'Poque', +56974592651, '1992-11-24', 33);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('20174314-1', null, 'Nicolas', 'Figueroa', +56941495207, '2007-03-01', 18);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('18573614-K', 'Arianes', 'Maria', 'Cisterna', +56989548456, '1994-01-10', 31);
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('10370613-0', null, 'Leon', 'Pecopon', +56941475689, '1980-10-31', 45);
-- ------------------------------------------------------
-- insertar datos en info_cliente
-- ------------------------------------------------------
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('11460321-0', 'Arenzana Oriente 283', 'Santiago', 'Region Metropolitana', 'Chile', 295146, 0);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('11460321-0', 'Uruñuela 292', 'Santiago', 'Region Metropolitana', 'Chile', 295153, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('13870096-8', 'Camilo Henrriquez 102', 'Iquique', 'Region de Tarapaca', 'Chile', 145987, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('15043365-7', 'Ohiggins 498', 'Coquimbo', 'Coquimbo', 'Chile', 567840, 0);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('15043365-7', 'Las lilas 687', 'La Serena', 'Coquimbo', 'Chile', 542354, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('18461078-2', 'Del Rodeo 310', 'Quilicura', 'Region Metropolitana', 'Chile', 276283, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('22657001-2', 'Lautaro 109', 'Concepcion', 'Region del Biobio', 'Chile', 4137056, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('18506502-K', 'Diez de Julio', 'Temuco', 'Region de la araucania', 'Chile', 694105, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('8340662-0', 'Patria Vieja 102', 'Hualpen', 'Region del Biobio', 'Chile', 437145, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('9478123-1', 'Patria nueva 3606', 'Hualpen', 'Region del Biobio', 'Chile', 434000, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('18402136-4', 'Avenida Simpson 1126', 'Valdivia', 'Region de los Rios', 'Chile', 81962, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('15758871-K', 'Los lirios 87', 'Frutillar', 'Region de los Lagos', 'Chile', 961807, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('20174314-1', 'Janequeo 345', 'Chillan', 'Region de Ñuble', 'Chile', 335681, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('18573614-K', 'Santa clara 365', 'Concepcion', 'Region del Biobio', 'Chile', 403000, 1);
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('10370613-0', 'Calle Feudal 2384', 'Cañete', 'Region del Biobio', 'Chile', 504879, 1);
-- ------------------------------------------------------
-- insertar datos en categoria
-- ------------------------------------------------------
INSERT INTO categoria (nombre_cat) VALUE ('Accesorios');
INSERT INTO categoria (nombre_cat) VALUE ('Cosmeticos');
INSERT INTO categoria (nombre_cat) VALUE ('Vestuario');
-- ------------------------------------------------------
-- insertar datos en subcategoria
-- ------------------------------------------------------
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (1, 'Anillos');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (1, 'Aros');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (1, 'Carteras');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (1, 'Cosmetiqueros');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (1, 'Perfumes');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (1, 'Relojes');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (2, 'Rostro');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (2, 'Ojos');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (2, 'Labios');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (2, 'Herramientas');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (3, 'Polera');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (3, 'Pantalones');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (3, 'Conjunto');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (3, 'Vestido');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (3, 'Matrimonio');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (3, 'Abrigos');
INSERT INTO subcategoria (id_cat, nombre_subcat) VALUE (3, 'Calzado');
-- ------------------------------------------------------
-- insertar datos en productos
-- ------------------------------------------------------
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (1, 'Anillo Magic', 1800000, 6);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (1, 'Anillo Sailor', 800000, 13);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (1, 'Anillo Ali', 200000, 45);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (1, 'Anillo Magic', 450000, 20);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (2, 'Aros Sailor', 15000, 66);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (2, 'Aros Saku', 22000, 66);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (2, 'Diges Sailor', 10000, 23);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (2, 'Diges Saku', 12000, 23);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (3, 'Cartera Sailor', 32000, 18);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (3, 'Cartera Magic', 41000, 9);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (3, 'Cartera Cel', 37000, 14);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (3, 'Cartera Moon', 28000, 24);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (4, 'Cosmetiquero 01', 16000, 31);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (4, 'Cosmetiquero 02', 10000, 40);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (4, 'Cosmetiquero 03', 10000, 40);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (4, 'Cosmetiquero 04', 9000, 47);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (5, 'Perfume R', 18000, 66);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (5, 'Perfume S', 20000, 54);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (5, 'Perfumes M', 27000, 44);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (5, 'Perfumes C', 18000, 66);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (6, 'Reloj Mag', 45000, 22);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (6, 'Reloj Hom', 45000, 22);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (6, 'Reloj Sak', 33000, 30);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (6, 'Reloj Dar', 33000, 30);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (7, 'Bases Col', 18750, 50);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (7, 'Conturn Mag', 11990, 43);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (7, 'Corrector M', 10870, 60);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (7, 'Polvo Mag', 14550, 50);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (8, 'Delineadores', 8430, 71);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (8, 'Rimel Mag', 10990, 71);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (8, 'Sombra Ojos', 29380, 55);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (8, 'Sombra Gel', 9000, 71);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (9, 'Labial Magic', 13000, 57);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (9, 'Labial Sail', 7000, 74);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (9, 'Labial Sak', 7000, 74);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (9, 'Labial Lapiz', 11000, 42);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (10, 'Cepillo Mag', 11670, 44);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (10, 'Mascarilla Fac', 1000, 78);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (10, 'Secador Pelo', 28990, 26);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (10, 'Risador Mag', 4800, 44);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (11, 'Blusa Corta', 19900, 51);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (11, 'Top', 12650, 51);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (11, 'Corset Top', 17420, 51);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (11, 'Blusa Larga', 21900, 31);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (12, 'Jeans Estampado', 22740, 47);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (12, 'Falda Magical', 17000, 47);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (12, 'Pantalon de Tela', 33760, 11);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (12, 'Jeans Flare', 22400, 47);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (13, 'Conjunto Lila', 41300, 18);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (13, 'Conjunto Magical', 72400, 5);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (13, 'Pijama', 22900, 24);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (13, 'Traje de Baño', 22000, 13);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (14, 'Vestido Ajustado', 17900, 51);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (14, 'Vestido Blangro', 23000, 17);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (14, 'Vestido Lilrose', 25900, 35);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (14, 'Vestido Magical', 28000, 35);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (15, 'Traje de Hombre', 118000, 10);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (15, 'Vestido Lilmagic', 142000, 10);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (15, 'Vestido Princes', 345000, 8);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (15, 'Hombre Princes', 345000, 8);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (16, 'Chaqueta', 31400, 16);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (16, 'Blazer', 44700, 12);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (16, 'Abrigos', 73490, 5);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (16, 'Abrigo Largo', 73490, 5);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (17, 'Zap Magic', 82600, 20);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (17, 'Zap Sailor', 79000, 20);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (17, 'Zap Magical H', 81990, 20);
INSERT INTO productos (id_subc, nombre_prod, precio, stock) VALUE (17, 'Zapatillas', 41580, 20);
-- ------------------------------------------------------
-- insertar datos en carrito
-- ------------------------------------------------------
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('11460321-0', '2025-10-01 17:04:48');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('13870096-8', '2025-10-01 19:00:26');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('15043365-7', '2025-10-07 11:30:00');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('18461078-2', '2025-10-08 14:50:25');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('22657001-2', '2025-10-10 22:14:11');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('18506502-K', '2025-10-12 11:26:38');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('8340662-0', '2025-10-21 09:56:04');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('9478123-1', '2025-11-01 14:30:00');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('18402136-4', '2025-11-24 17:52:01');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('15758871-K', '2025-11-24 17:17:37');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('20174314-1', '2025-12-06 21:35:58');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('18573614-K', '2025-12-08 20:29:37');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('10370613-0', '2025-12-08 23:14:02');
-- ------------------------------------------------------
-- insertar datos en items_carrito
-- ------------------------------------------------------
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (1,1,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (1,12,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (1,15,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (2,6,2);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (2,8,2);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (3,10,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (3,15,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (3,7,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (3,35,2);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (4,8,3);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (4,1,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (5,23,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (5,25,2);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (5,31,2);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (6,51,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (6,52,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (7,61,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (7,62,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (7,38,2);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (8,55,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (8,56,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (9,17,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (9,23,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (9,27,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (10,39,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (10,40,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (11,43,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (11,44,2);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (11,45,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (12,59,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (12,60,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (13,25,5);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (13,26,5);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (13,30,5);
-- ------------------------------------------------------
-- insertar datos en ventas
-- ------------------------------------------------------
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('11460321-0', 2, 1838000, 'Debito', '2025-10-01 17:40:48');
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('13870096-8', 3, 68000, 'Debito', '2025-10-01 19:12:26');
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('15043365-7', 5, 75000, 'Debito', '2025-10-07 11:43:00'); 
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('18461078-2', 6, 1836000, 'Credito', '2025-10-08 15:01:25'); 
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('22657001-2', 7, 129260, 'Credito', '2025-10-10 22:28:11');
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('18506502-K', 8, 44900, 'Debito', '2025-10-12 11:33:38'); 
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('8340662-0', 9, 78100, 'Transferencia', '2025-10-21 10:09:04');
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('9478123-1', 10, 53900, 'Transferencia', '2025-11-01 14:44:00');
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('18402136-4', 11, 61870, 'Debito', '2025-11-24 18:17:01'); 
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('15758871-K', 12, 33790, 'Transferencia', '2025-11-24 17:22:37');
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('20174314-1', 13, 428960, 'Credito', '2025-12-06 21:55:58');
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('18573614-K', 14, 345000, 'Credito', '2025-12-08 20:57:37'); 
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('10370613-0', 14, 208650, 'Credito', '2025-12-08 23:25:44'); 
-- ------------------------------------------------------
-- insertar datos en nota_credito
-- ------------------------------------------------------
INSERT INTO nota_credito (id_venta) VALUES (1); 
INSERT INTO nota_credito (id_venta) VALUES (2); 
INSERT INTO nota_credito (id_venta) VALUES (3); 
INSERT INTO nota_credito (id_venta) VALUES (4); 
INSERT INTO nota_credito (id_venta) VALUES (5); 
INSERT INTO nota_credito (id_venta) VALUES (6); 
INSERT INTO nota_credito (id_venta) VALUES (7); 
INSERT INTO nota_credito (id_venta) VALUES (8); 
INSERT INTO nota_credito (id_venta) VALUES (9); 
INSERT INTO nota_credito (id_venta) VALUES (10); 
INSERT INTO nota_credito (id_venta) VALUES (11); 
INSERT INTO nota_credito (id_venta) VALUES (12); 
INSERT INTO nota_credito (id_venta, reembolso, devolucion) VALUES (13, 1, 1); 
-- ------------------------------------------------------
-- Se insertaron datos usando la vista_carrito_cliente asociado a venta
-- ------------------------------------------------------
INSERT INTO detalle_venta ( id_venta , id_prod , cantidad ) SELECT id_venta, vista_carrito_cliente.id_prod, vista_carrito_cliente.cantidad FROM ventas INNER JOIN vista_carrito_cliente ON ventas.rut_cliente = vista_carrito_cliente.rut_cliente;
-- ------------------------------------------------------
-- insertar datos en descuento
-- ------------------------------------------------------
INSERT INTO descuento (codigo, tipo, valor, fecha_inicio, fecha_fin, activo) VALUES ('Hallowen25', 'porcentaje', 0.75, '2025-10-29', '2025-11-01', 0);
INSERT INTO descuento (codigo, tipo, valor, fecha_inicio, fecha_fin, activo) VALUES ('Black_Friday_Dic25', 'porcentaje', 0.85, '2025-12-05', '2025-12-08', 0);
-- ------------------------------------------------------
-- insertar datos en descuentos_aplicados
-- ------------------------------------------------------
INSERT INTO descuentos_aplicados ( id_venta, id_dsct, monto_descontado) VALUES (1,1,(1800000*0.25));
INSERT INTO descuentos_aplicados ( id_venta, id_dsct, monto_descontado) VALUES (2,1,(44000*0.25+24000*0.25));
INSERT INTO descuentos_aplicados ( id_venta, id_dsct, monto_descontado) VALUES (3,2,(41000*0.15));
INSERT INTO descuentos_aplicados ( id_venta, id_dsct, monto_descontado) VALUES (4,1,(1800000*0.25+36000*0.25));
INSERT INTO descuentos_aplicados ( id_venta, id_dsct, monto_descontado) VALUES (5,1,(33000*0.25));
INSERT INTO descuentos_aplicados ( id_venta, id_dsct, monto_descontado) VALUES (6,2,(22000*0.15));
INSERT INTO descuentos_aplicados ( id_venta, id_dsct, monto_descontado) VALUES (9,2,(33000*0.25));
END //
DELIMITER ;
CALL insertar_datos();

-- ------------------------------------------------------
-- DDL
-- ------------------------------------------------------
-- uso de DML UPDATE para actualizar dato
UPDATE ventas
SET estado = 'Cancelado', boleta_factura = 'Enviada'
WHERE rut_cliente = '10370613-0';
