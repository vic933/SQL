/*2.1. Ordena las películas por duración de forma ascendente*/
SELECT "title" AS "Película",
		"length" AS "Duración"
FROM "film"
ORDER BY "Duración" ASC
/*2.2. Muestra los 10 clientes con mayor valor de id*/
SELECT CONCAT ("first_name", ' ' , "last_name") AS "nombre",
		"customer_id" AS "id"
FROM "customer"
ORDER BY "customer_id" DESC
LIMIT 20

/*2.3. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.*/
SELECT "amount" AS "Cantidad"
FROM "payment"
ORDER BY "payment_date" DESC
OFFSET 2
LIMIT 1


/*2.4. Qué películas se alquilan por encima del precio medio. Para este ejercicio tendrás que generar dos queries diferentes. Una primera para calcular la media y la segunda para obtener las películas que se alquilan por encima de ese valor.*/
-- precio medio--
SELECT ROUND (AVG("rental_rate"),2) AS "Precio_Medio"
FROM "film"

SELECT "title" AS "Título",
		"rental_rate" AS "Precio_Alquiler"
 FROM "film"
 WHERE "rental_rate" > 2.98 /*Este es el precio medio 2.98*/
 ORDER BY "rental_rate" ASC 

/*5. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.*/
SELECT COUNT(DISTINCT("title")) AS "Cantidad",
			"rating" AS "Clasificación"			
FROM "film"
GROUP BY "Clasificación"
 

/*2.6. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.*/
SELECT "rating" AS "Clasificaciones",
	ROUND(AVG("length"),0) AS "Media_Duración"
FROM "film"
GROUP BY "rating"
ORDER BY "Media_Duración"

/*2.7. Números de alquiler por día. Ordenados por cantidad de alquiler de forma descendente.*/
SELECT DATE("rental_date") AS "Día",
		COUNT("rental_id") AS "Alquileres"
FROM "rental"
GROUP BY DATE ("rental_date") 
ORDER BY "Alquileres" DESC
--OTRA FORMA--
SELECT CONCAT(EXTRACT(DAY FROM "payment_date"), '-', EXTRACT(MONTH FROM "payment_date"), '-', EXTRACT(YEAR FROM "payment_date")) AS "Fecha_alquiler",
		COUNT ("payment_id") AS "Número_Pedidos"
FROM "payment"
GROUP BY "Fecha_alquiler"
ORDER BY "Número_Pedidos" DESC
/*2.8. Averigua el número de alquileres registrados por mes.*/
SELECT COUNT (rental_id) AS "Alquileres",
		EXTRACT(MONTH FROM "rental_date") AS "Mes"
FROM "rental"
GROUP BY "Mes"
ORDER BY "Mes"

/*2.9. Número de películas por categoría estrenadas en 2006*/
SELECT COUNT(DISTINCT ("title")) AS "Num_Películas_2006",
		"rating" AS "Clasificación"
FROM "film"
WHERE "release_year" = 2006 --Usamos Where porque es una condición de los datos, no de la agrupación--
GROUP BY "rating"

/*2.10. Muestra el id de los actores que hayan participado en más de 40 películas.*/
SELECT "actor_id",
		COUNT(DISTINCT("film_id")) AS "Num_Peliculas"		
FROM "film_actor"
GROUP BY "actor_id"
HAVING COUNT(DISTINCT("film_id")) > 40 /* Uso having porque la condición va sobre lo que tengo agrupado*/