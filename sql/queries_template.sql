USE goodreads;

--Muestra todos los títutlos de libros almacenados en una lista, a través de id de la lista

SELECT lib.titulo AS 'Titulo' FROM libro_almacenado AS l, libro lib WHERE l.id_lista = (SELECT list.id_lista FROM lista list WHERE list.id_lista = 'L-1');

-- Mostrar nombre tienda nombre libro y enlaces donde se pueda comprar un determinado libro

SELECT l.titulo, t.nombre, ct.enlace
FROM compra_tienda AS ct, tienda AS t, libro as l
WHERE ct.cod_tienda = (SELECT l.cod_tienda
                       FROM libro AS l
                       WHERE l.cod_tienda = "T-1");

-- Mostrar todas las tiendas donde se puedan comprar libros

SELECT t.cod_tienda, t.nombre, ct.enlace
FROM tienda AS t, compra_tienda AS ct
WHERE ct.cod_tienda = (SELECT lib.cod_tienda
                       FROM libro as lib
                       WHERE lib.cod_tienda IS NOT NULL);

-- Borra un usuario de la BD (comprobar que se borran listas y reseñas asociadas)
DELETE FROM `usuario` WHERE alias = 'manusito21';

--Mostrar todos los géneros asociados a todos los libros
SELECT DISTINCT l.titulo, g.nombre 
FROM libro l, genero g, libro_genero lg 
WHERE l.isbn IN (SELECT lg2.isbn
				FROM libro_genero lg2
			    WHERE lg2.cod_genero = g.cod_genero);