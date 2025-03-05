/* ## EJERCICIO 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto). */
CREATE TABLE IF NOT EXISTS clientes(
	id SERIAL PRIMARY KEY,
	name VARCHAR (250),
	email VARCHAR (250)
)
/* Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y email=" juan@example.com". */
INSERT INTO public.clientes (name, email)
VALUES 	('Juan', 'juan@example.com')
/* Actualizar el email del cliente con id=1 a " juan@gmail.com". */ 
UPDATE public.clientes 
SET email = 'juan@gmail.com'
WHERE id=1
/* Eliminar el cliente con id=1 de la tabla "Clientes". */ 
DELETE FROM public.clientes 
WHERE id=1
/*Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero). */
CREATE TABLE IF NOT EXISTS pedidos(
	id SERIAL PRIMARY KEY,
	producto VARCHAR (255),
	cantidad INT, 
	cliente_id INT,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES clientes(id)
)
/*Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2.*/
INSERT INTO public.pedidos (cliente_id, producto, cantidad)
VALUES (2, 'Camiseta',2)
/*Actualizar la cantidad del pedido con id=1 a 3.*/
UPDATE public.pedidos 
SET cantidad = 3
WHERE id=2
/*Eliminar el pedido con id=1 de la tabla "Pedidos".Borro toda la tabla porque solo tenía un registro*/ 
DELETE FROM public.pedidos 

/*Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal).*/
CREATE TABLE IF NOT EXISTS productos(
	id INT PRIMARY KEY,
	nombre VARCHAR (255),
	precio DECIMAL)
/*Insertar varios productos en la tabla "Productos" con diferentes valores.*/
INSERT INTO public.productos (id, nombre, precio)
VALUES (1, 'Camiseta', 15)
INSERT INTO public.productos (id, nombre, precio)
VALUES (2, 'Gorra', 13.99)
INSERT INTO public.productos (id, nombre, precio)
VALUES (3, 'Pantalón', 25.99)
INSERT INTO public.productos (id, nombre, precio)
VALUES (4, 'Reloj', 98.99)

/*Consultar todos los clientes de la tabla "Clientes".*/
SELECT * FROM public.clientes
/*Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes.*/
SELECT c.id as id,
c.name as name,
p.producto as producto,
p.cantidad as cantidad
FROM public.clientes c
LEFT JOIN public.pedidos p
ON c.id = p.cliente_id
/*Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50*/
SELECT * FROM public.productos
WHERE precio > 50
/*Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5*/
SELECT * FROM public.pedidos
WHERE cantidad >= 5
/*Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A".*/
SELECT * FROM public.clientes
WHERE name ILIKE 'A%'
/*Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente.*/
SELECT clientes.name, 
COUNT (pedidos.cantidad) AS numero 
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.name

/*Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto.*/
SELECT productos.nombre, 
SUM (pedidos.cantidad) AS cuenta 
FROM productos
LEFT JOIN pedidos ON productos.nombre = pedidos.producto
GROUP BY productos.nombre

/*Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/
ALTER TABLE public.pedidos
ADD fecha DATE

/*Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto".*/
/*NO SE RESOLVER ESTA CUESTIÓN*/

/*Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades de los pedidos donde coincida la clave externa.*/ /*COMO NO ESTÁ HECHA LA CLAVE EXTERNA ANTERIOR, NO PUEDO REALIZALO.*/

