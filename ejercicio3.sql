/*NIVEL DIFICIL*/

/*1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "precio" (numérico).*/
CREATE TABLE IF NOT EXISTS Productos (
id INT PRIMARY KEY,
nombre VARCHAR (255),
precio DECIMAL
)
/* 2. Inserta al menos cinco registros en la tabla "Productos".*/
INSERT INTO productos (id, nombre, precio)
VALUES
    (1, 'Producto 1', 5.99),
    (2, 'Producto 2', 9.99),
    (3, 'Producto 3', 15),
    (4, 'Producto 4', 19.99),
    (5, 'Producto 5', 45.99);

/* 3. Actualiza el precio de un producto en la tabla "Productos".*/
UPDATE productos 
SET precio = 25.5
where id = 4

/* 4. Elimina un producto de la tabla "Productos".*/
DELETE FROM productos 
where id = 2

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos que han comprado (utiliza un INNER JOIN con la tabla "Productos").*/
CREATE TABLE compras (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    producto_id INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

INSERT INTO compras (usuario_id, producto_id)
VALUES
    (1, 3),
    (3, 1)

SELECT usuarios.nombre AS usuarios_nombre,
	productos.nombre AS productos_nombre
FROM compras
INNER JOIN usuarios ON compras.usuario_id = usuarios.id
INNER JOIN productos ON compras.producto_id = productos.id

