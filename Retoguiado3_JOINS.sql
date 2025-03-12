/*2.1. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.*/
SELECT "first_name" AS "nombre",
		"last_name" AS "apellido",
		"st"."store_id" AS "id_tienda"
FROM "staff" AS "s"
CROSS JOIN "store" AS "st" /* tengo que poner un alias para poder indicar en store_id de que tabla quiero hacer referencia porque es un campo ambiguo ya que hay una columna que se llama store_id en las dos tablas*/
/*Si ahora quisiera saber qué empleados están en cada tienda*/
SELECT CONCAT("first_name", ' ', "last_name") AS "nombre",
		"st"."store_id" AS "id_tienda"
FROM "staff" AS "s"
INNER JOIN "store" AS "st"
ON "s"."staff_id" = "st"."manager_staff_id"

/*2.2. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.*/
SELECT "c"."customer_id" AS "id_cliente",
		CONCAT ("first_name", ' ', "last_name") AS "nombre_cliente",
		COUNT ("r"."inventory_id") AS "cantidad_alquileres" /*puedo usar inventory_id o rental_id, es igual*/
FROM "customer" AS "c"
LEFT JOIN "rental" AS "r"
ON "c"."customer_id" = "r"."customer_id"
GROUP BY "c"."customer_id" /*Tengo que agrupar porque he usado una función de agrupacióncon el count*/
ORDER BY "cantidad_alquileres" ASC

/*2.3. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.*/
SELECT "f"."title" AS 	"Titulo_Pelicula",
		COUNT ("i"."inventory_id") AS "Cantidad_Peliculas"
FROM "film" AS "f"
LEFT JOIN "inventory" AS "i"
ON "f"."film_id" = "i"."inventory_id"
GROUP BY "f"."title"
ORDER BY "Titulo_Pelicula"

/*2.4. Obtener los actores y el número de películas en las que ha actuado.*/
SELECT CONCAT("a"."first_name", '  ', "a"."last_name") AS "Nombre_Actor",
		COUNT ("fa"."film_id") AS "Numero_Peliculas"
FROM "film_actor" AS "fa"
RIGHT JOIN "actor" AS "a"
ON "a"."actor_id" = "fa"."actor_id"
GROUP BY "Nombre_Actor"

/*2.5. Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.*/
SELECT "f"."title" AS "Titulo_Pelicula",
		CONCAT("a"."first_name", '  ', "a"."last_name") AS "Nombre_Actor"
FROM "film" AS "f"
LEFT JOIN "film_actor" AS "fa"
ON "f"."film_id" = "fa"."film_id"
INNER JOIN "actor" AS "a"
ON "a"."actor_id" = "fa"."actor_id"
ORDER BY "Titulo_Pelicula"

/*2.6. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.*/ /*Como las relaciones son de varios a varios entre las dos tablas , tenemos que crear una tabla puente entre actor y película. En este cso ya existe y se llama film_actor. Por tnto, para hacer la union de film con actor nos hacen falta dos joins. Vamos a coger de film a la tabla film_actor con la unión de film_id y después cogemos la tabla film_actor y la unicmos con actor a través de actor_id*/

SELECT CONCAT("a"."first_name", ' ', "a"."last_name") AS "nombre_actor",
		"f"."title" AS "titulo_pelicula"
FROM "film" AS "f"
INNER JOIN "film_actor" AS "fa"
ON "f"."film_id" = "fa"."film_id"
LEFT JOIN "actor" AS "a"
ON "a"."actor_id" = "fa"."actor_id"


/*2.7. Obtener todas las películas que tenemos y todos los registros de alquiler.*/
SELECT "f"."title" AS "Título",
		"r"."rental_date" AS "Fecha_Alquiler"
FROM "film" AS "f"
INNER JOIN "inventory" AS "i"
ON "f"."film_id" = "i"."film_id"
FULL JOIN "rental" AS "r"
ON "i"."inventory_id" = "r"."inventory_id"
ORDER BY "Título"

/*2.8. Encuentra el título de las películas que son comedias y tienen una duración mayor a 180 minutos en la tabla film.*/

SELECT 		"f"."title" 	AS "título",
			"f"."length" 	AS "duración",
			"c"."name" 		AS "categoría"
FROM 		"category" 		AS "c"
INNER JOIN 	"film_category" AS "fc"
ON 			"c"."category_id" = "fc"."category_id"
INNER JOIN 	"film" 			AS "f"
ON 			"f"."film_id" = "fc"."film_id"
WHERE 		"c"."name" = 'Comedy'
	AND 	"f"."length" > 180
ORDER BY 	"f"."title" 

/*2.9. Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos y muestra el nombre de la categoría junto con el promedio de duración.*/
SELECT 	"c"."name"		 	AS "Nombre_Categoria",
		ROUND(AVG ("f"."length"),2)	AS "Media_Duración"
FROM 	"category"			AS "c"
INNER JOIN "film_category" 	AS "fc"
ON 		"c"."category_id" 	= "fc"."category_id"
INNER JOIN	"film" 			AS "f"
ON		"f"."film_id"		= "fc"."film_id"
GROUP BY "c"."name"
HAVING AVG ("f"."length") > 110

/*2.10. Obtén los 5 clientes que más dinero se hayan gastado con nosotros.*/
SELECT 	CONCAT("c"."first_name", ' ', "c"."last_name")  AS "Cliente",
		SUM ("p"."amount") AS "Dinero_Gastado"
FROM 	"customer" AS "c"
INNER JOIN "payment" AS "p"
ON "c"."customer_id" = "p"."customer_id"
GROUP BY "Cliente"
ORDER BY "Dinero_Gastado" DESC
LIMIT 5