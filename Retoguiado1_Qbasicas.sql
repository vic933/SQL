/*3.1. Crea el esquema de la BBDD de sakila. Entity Relationship Diafram (ERD)*/
/*Para resolver esta parte, hay que tomar en cuenta todas las tablas y las diferentes relaciones y conexiones que hay entre ellas.*/

/*3.2. Selecciona todos los nombres de las películas úncos.*/
SELECT DISTINCT ("title") AS "título"
FROM "film"

/*3.3. Crea una columna con el nombre y apellidos de todos los actores y actrices.*/
SELECT DISTINCT (CONCAT("first_name",' ',"last_name")) AS "nombre_completo"
FROM "actor"

/*3.4. Muestra los nombres de todas las películas con una clasificación por edades de "R".*/
SELECT "title" AS "título"
FROM "film"
WHERE "rating" = 'R'
-----
SELECT "title" AS "título",
		"rating" AS "clasificación"
FROM "film"
WHERE "rating" = 'R'

/*3.5. Obtén las películas que tenemos cuyo idioma conicide con el idioma original.*/
SELECT "title" AS "título"		
FROM "film"
WHERE "language_id" = "original_language_id"
/*Esta query no va a funciona porque el campo original_language_id solamente contiene datos null*/

/*3.6. Encuentra el nombre y apellido de los actores que tengan "Allen" en su apellido.*/
SELECT CONCAT("first_name" , ' ', "last_name") AS "nombre_Completo"
FROM "actor"
WHERE "last_name" ILIKE '%allen%'
--------
SELECT CONCAT("first_name" , ' ', "last_name") AS "nombre_Completo"
FROM "actor"
WHERE "last_name" = 'ALLEN'

/*3.7. Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.*/
SELECT "title" AS "título",
		"length" AS "duración"
FROM "film"
WHERE "length" > '180'

/*3.8. Encuentra los nombres de los actores que tengan un actor_id entre 30 y 40.*/
SELECT "first_name" AS "nombre",
		"actor_id"
FROM "actor"
WHERE "actor_id" BETWEEN 30 AND 40

/*3.9. Encuentra el título de las películas en la tabla film que no sean ni "NC-17" ni "G" en cuanto a su clasificación.*/
SELECT "title" AS "título"
FROM "film"
WHERE NOT "rating" = 'NC-17' 
AND NOT "rating" = 'G'
------
SELECT "title" AS "título"
FROM "film"
WHERE "rating" <> 'NC-17' 
AND NOT "rating" <> 'G' -- <> significa que es distinto a 

/*3.10. Encuentra el título de todas las películas que son "PG-13" o tienen una duración mayor a 3 horas en la tabla film.*/
SELECT "title" AS "título",
		"rating",
		"length" AS "duración"
FROM "film"
WHERE "rating" = 'PG-13' 
OR "length" > '180'

/*3.11. Encuentra la mayor y menor duracion de una película de nuestra BBDD*/
SELECT MAX ("length") AS "mayor_duración",
		MIN ("length") AS "menor_duración"
FROM "film"

/*3.12. ¿Cuántas películas distintas tenemos?*/
SELECT COUNT (DISTINCT("film_id")) AS "Recuento_películas"
FROM "film"

/*3.13. ¿Cuánto dinero ha generado en total la empresa?*/
SELECT SUM ("amount") AS "Cantidad_total"
FROM "payment"

/*3.14. ¿Cuál es la media de duración del alquiler de las películas?*/
SELECT ROUND(AVG ("rental_duration"),2) AS "Media_Duración_Alquiler"
FROM "film"

/*3.15. Encuentra la variabilidad de los que costaría reemplazar las películas.*/
SELECT ROUND (STDDEV_SAMP ("replacement_cost"),2) AS "Coste_Reemplazo"
FROM "film"
