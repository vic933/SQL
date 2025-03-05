/* 1. Crea una base de datos llamada "MiBaseDeDatos"*/
CREATE TABLE IF NOT EXISTS usuarios (
id INT PRIMARY KEY,
nombre VARCHAR (255),
edad INT
)
/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "edad" (entero).*/
CREATE TABLE IF NOT EXISTS usuarios (
id INT PRIMARY KEY,
nombre VARCHAR (255),
edad INt
)
/* 3. Inserta dos registros en la tabla "Usuarios". */
INSERT INTO public.usuarios (id, nombre, edad)
VALUES (1,'Víctor',30)
INSERT INTO public.usuarios (id, nombre, edad)
VALUES (2,'Sonia',36) 
/*4. Actualiza la edad de un usuario en la tabla "Usuarios".*/
UPDATE public.usuarios
SET edad = 33
where id = 2
/* 5. Elimina un usuario de la tabla "Usuarios". */
DELETE FROM public.usuarios 
WHERE id = 2 
/*Nivel de dificultad: Moderado 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave primaria), "nombre" (texto) y "pais" (texto). */
CREATE TABLE IF NOT EXISTS Ciudades (
id INT PRIMARY KEY,
Nombre VARCHAR (255),
País VARCHAR (255)
) 
/*2. Inserta al menos tres registros en la tabla "Ciudades".*/
INSERT INTO Ciudades (id, nombre, país)
VALUES (1, 'Valladolid', 'España')
VALUES (2, 'Lisboa', 'Portugal')
VALUES (3, 'Londres', 'Reino Unido')
/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id" de la tabla "Ciudades".*/
ALTER TABLE usuarios
ADD COLUMN ciudad_id INTEGER;

ALTER TABLE usuarios
ADD CONSTRAINT fk_ciudad
FOREIGN KEY (ciudad_id) REFERENCES ciudades(id)
/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el nombre de su ciudad y país (utiliza un LEFT JOIN).*/
SELECT usuarios.nombre AS usuario_nombre,
       ciudades.nombre AS ciudad_nombre,
       ciudades.país AS ciudad_país
FROM usuarios
LEFT JOIN ciudades ON usuarios.ciudad_id = ciudades.id;

/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad asociada (utiliza un INNER JOIN).*/
SELECT usuarios.nombre AS usuario_nombre,
       ciudades.nombre AS ciudad_nombre,
       ciudades.país AS ciudad_país
FROM usuarios
INNER JOIN ciudades ON usuarios.ciudad_id = ciudades.id;
