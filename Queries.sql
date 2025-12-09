-- ------------------------------------------------------
-- Consultas SQL
-- ------------------------------------------------------
SELECT * FROM usuarios;
SELECT * FROM clientes;
SELECT * FROM info_cliente;
SELECT * FROM categoria;
SELECT * FROM subcategoria;
SELECT * FROM productos;
SELECT * FROM carrito;
SELECT * FROM items_carrito;
SELECT * FROM ventas;
SELECT * FROM nota_credito;
SELECT * FROM detalle_venta;
SELECT * FROM descuento;
SELECT * FROM descuentos_aplicados;

-- Suma total de los productos por rut
    SELECT rut_cliente, id_carrito, SUM(sub_total) AS total 
      FROM vista_carrito_cliente 
  GROUP BY id_carrito 
  ORDER BY id_carrito ASC;

-- Suma de las cantidades de productos en detalle venta
    SELECT ventas.rut_cliente, ventas.id_venta, SUM(vista_carrito_cliente.cantidad) 
        AS total_cantidad
      FROM ventas
INNER JOIN vista_carrito_cliente
        ON ventas.rut_cliente = vista_carrito_cliente.rut_cliente
  GROUP BY ventas.id_venta;
     
-- ------------------------------------------------------
-- Consultas SQL VISTAS
-- ------------------------------------------------------

-- revision de vista por categoria, subcategoria y productos
SELECT * FROM vista_stock_cat_sub_prod;

-- revision de vista que vincula los items del carritos con el cliente y sus productos
SELECT * FROM vista_carrito_cliente;

-- revision de vista ventas con su nota de credito si es que corresponde
SELECT * FROM vista_venta_nota;

-- revision de vista detalle cliente
SELECT * FROM vista_detalle_cliente;

-- revision de vista descuento aplicado
SELECT * FROM vista_descuento_aplicado;

-- se usa la vista para insertar datos a descuentos, provando id por id para ordenar datos
SELECT * FROM vista_detalle_cliente WHERE id_venta = 1;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 2;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 3;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 4;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 5;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 6;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 7;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 8;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 9;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 10;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 11;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 12;
SELECT * FROM vista_detalle_cliente WHERE id_venta = 13;

-- ------------------------------------------------------
-- Pruebas Check
-- ------------------------------------------------------
-- se intenta agregar con edad fuera del check para fallar, para probar el check
INSERT INTO clientes (rut, nickname_usuario, nombre, apellido, telefono, fecha_nacimiento, edad) VALUES ('21367596-6', null, 'Roberto', 'Azocar', +56923951147, '2009-12-11', 16);
-- no sube porque no tiene cliente anidado, por error check edad
INSERT INTO info_cliente (rut_cliente, direccion, ciudad, estado_region, pais, codigo_postal, es_principal) VALUES ('21367596-6', 'Springfield 1753', 'Talca', 'Region del Maule', 'Chile', 707452, 1);  


-- ------------------------------------------------------
-- Consultas SQL EJERCICIO
-- ------------------------------------------------------


-- ------------------------------------------------------
-- Búsqueda de productos por nombre y por categoría.
-- ------------------------------------------------------
SELECT * FROM vista_stock_cat_sub_prod;  
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_cat = 'Accesorios'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_cat = 'Cosmeticos'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_cat = 'Vestuario'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_subcat = 'Anillos'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_subcat = 'Ojos'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_subcat = 'Matrimonio'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_prod = 'Perfumes M'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_prod = 'Labial Magic'; 
SELECT * FROM vista_stock_cat_sub_prod WHERE nombre_prod = 'Corset Top'; 

-- ------------------------------------------------------
-- Top N productos por ventas (cantidad o monto)
-- ------------------------------------------------------
-- Top N productos por cantidad
SELECT nombre_prod, SUM(cantidad) AS producto_mas_vendido FROM vista_detalle_cliente GROUP BY nombre_prod ORDER BY producto_mas_vendido DESC;
-- Top N productos por monto
SELECT nombre_prod, SUM(sub_total) AS producto_subtotal FROM vista_detalle_cliente GROUP BY nombre_prod ORDER BY producto_subtotal DESC;

-- ------------------------------------------------------
-- Ventas por mes sumas
-- ------------------------------------------------------
SELECT MONTH(fecha_venta) AS mes, SUM(total) FROM ventas GROUP BY mes; 

-- ------------------------------------------------------
-- Ventas por por categoría conteos
-- ------------------------------------------------------
SELECT nombre_cat, COUNT(nombre_cat) AS ventas_categoria, SUM(total) FROM vista_detalle_venta_cat_subc_prod GROUP BY nombre_cat ORDER BY ventas_categoria DESC;

-- ------------------------------------------------------
-- Stock bajo (umbral configurable)
-- ------------------------------------------------------
-- Umbral configurado
SELECT id_prod, nombre_cat, nombre_subcat, nombre_prod, MIN(stock) AS stock, 5 AS umbral_minimo FROM vista_stock_cat_sub_prod GROUP BY id_prod HAVING stock<=umbral_minimo ORDER BY stock ASC;
-- Sin umbral y ordenado ascendente
SELECT id_prod, nombre_cat, nombre_subcat, nombre_prod, MIN(stock) AS stock FROM vista_stock_cat_sub_prod GROUP BY id_prod ORDER BY stock ASC;
-- Stock actual, descontando la cantidad de productos en ventas
SELECT p.id_prod, stock , max(p.stock) - IFNULL(sum(dv.cantidad),0) AS stock_disponible FROM productos p LEFT JOIN detalle_venta dv ON p.id_prod = dv.id_prod GROUP BY p.id_prod ORDER BY p.id_prod;

-- ------------------------------------------------------
-- Productos sin ventas por cantidad ventas
-- ------------------------------------------------------
SELECT p.id_prod, p.nombre_prod, COUNT(id_venta) AS cantidad_ventas FROM productos p LEFT JOIN detalle_venta dv ON p.id_prod = dv.id_prod GROUP BY id_prod ORDER BY cantidad_ventas DESC;

-- ------------------------------------------------------
-- Productos sin ventas por monto
-- ------------------------------------------------------
SELECT p.id_prod, p.nombre_prod, p.precio*IFNULL(sum(dv.cantidad),0) AS monto_ventas FROM productos p LEFT JOIN detalle_venta dv ON p.id_prod = dv.id_prod GROUP BY id_prod ORDER BY monto_ventas DESC;

-- ------------------------------------------------------
-- Cantidad de compras por cliente
-- ------------------------------------------------------
SELECT rut_cliente, COUNT(id_venta) AS cantidad_compras FROM ventas GROUP BY rut_cliente HAVING COUNT(id_venta)>=2 ORDER BY cantidad_compras DESC;

-- ------------------------------------------------------
-- Ventas promedio por clientes por mes
-- ------------------------------------------------------
-- Venta promedio descendente
SELECT rut_cliente, ROUND(AVG(total)) AS promedio_compras, MONTH(fecha_venta) AS mes FROM ventas GROUP BY rut_cliente, mes ORDER BY promedio_compras DESC;
-- Venta promedio mas alta de cliente
SELECT rut_cliente, ROUND(AVG(total)) AS promedio_compras, MONTH(fecha_venta) AS mes FROM ventas GROUP BY rut_cliente,mes ORDER BY promedio_compras DESC LIMIT 1;

-- ------------------------------------------------------
-- Transaccion
-- ------------------------------------------------------
-- Insertar una nueva compra para dos rut diferentes con todas sus tablas asociadas con savepoint, rollback y commit
BEGIN;
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('18461078-2', '2025-10-20 10:01:25');
INSERT INTO carrito (rut_cliente, fecha_creacion) VALUES ('18506502-K', '2025-10-29 00:14:38');
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (14,23,1);
INSERT INTO items_carrito (id_carrito, id_prod, cantidad) VALUES (15,31,2);
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('18461078-2', 6, 1836000, 'Credito', '2025-10-20 10:01:25'); 
INSERT INTO ventas (rut_cliente, direccion_envio, total, metodo_pago, fecha_venta) VALUES ('18506502-K', 8, 44900, 'Debito', '2025-10-29 00:14:38'); 
INSERT INTO nota_credito (id_venta) VALUES (14); 
INSERT INTO nota_credito (id_venta) VALUES (15); 
INSERT INTO detalle_venta ( id_venta , id_prod , cantidad ) VALUE (14, 23, 1);
INSERT INTO detalle_venta ( id_venta , id_prod , cantidad ) VALUE (15, 31, 2);

SAVEPOINT punto1;

UPDATE ventas
   SET estado = 'Cancelado', boleta_factura = 'Enviada'
 WHERE rut_cliente = '8340662-0';
 
 UPDATE nota_credito 
 SET reembolso = 1, devolucion = 1
 WHERE id_venta = 7;
 
ROLLBACK TO punto1;
COMMIT;