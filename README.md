# Ecommerce-BD-M3
Mi primer repositorio del proyecto


# Link directo a mi repositorio    https://github.com/manecist/Ecommerce-BD-M3


Se sube la base de datos al GITHUB

Se creo una BD en base a mi misma pagina creada anteriormente

Cuento con un word tipo tipeo donde ordene las ideas de lo que deseaba hacer antes de comenzar la database

Se modificaron incontables veces el diagrama ER, el modelo logico y las tablas dentro del database

Se buscaron algunos comando para hacer funcionar mejor las consultas como es el caso de uso de funciones, usar el heving como un where para dar condicion sin errores a la consulta

Se ordena la database dejando agrupado por titulo los pasos para mi BD

Se agregaron tablas como usuraio que en mi pagina esta el icono pero aun no existe formulario anidado porque no era necesario en ese momento, pero ya se considera en BD, ademas de otras tablas para mejorar el rendimiento de las consultas como las tablas intermedias y de esa forma evitar las relaciones N:M como lo son detalle_venta, descuento_aplicados e items_carrito

Se habia creado tabla de descuento relacionado con categoria, subcategoria y productos con tablas intermedias, pero como los descuentos no se aplicaban directamente en ellas decidi dejar de forma mas simple la tabla donde solo existe descuento asociado a venta mediante descuento_aplicado, ya que el descuento se aplica al final de la venta

En un inicio me genero conflictos ciertas condiciones que aplique a las tablas como los UNIQUE Y NOT NULL por lo cual se modifico para simplicar la elminacion y modificacion de tablas.

Se agregan check a la creacion de tablas y se prueba con el valor de edad minima requerida para comprar

Se hicieron vistas, e index para mejorar consultas 


Se realiza ingeneria inversa para crear un modelo ER dentro de mysql para ver de mejor manera las relaciones y la logica de las tablas, la cual se sube tambien al repositorio


