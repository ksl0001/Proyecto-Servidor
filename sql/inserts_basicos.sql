USE myshelf;
INSERT INTO usuario VALUES("manu@gmail.com","manusito21","1234","Manuel","Vázquez Del Pino");
INSERT INTO usuario VALUES("manu2@gmail.com","pepe","1234","Pepe","Casablanca");

/* Estos deberían ser creados PREVIAMENTE a que existan usuarios (que exista al menos 1) */

INSERT INTO `libro` (`isbn`, `titulo`, `autor`, `portada` , `descripcion`, `f_publicacion`) VALUES ('ISBN1', 'Harry Potter', 'JK.TERFA', null, 'Harry Potter noseque', '2000-01-01');
INSERT INTO `libro` (`isbn`, `titulo`, `autor`, `portada` , `descripcion`, `f_publicacion`) VALUES ('ISBN2', 'Las montañas de la locura', 'Lovecraft', null, 'Lovecraft haciendo movidas', '2001-02-03');


INSERT INTO `tienda` (`cod_tienda`, `nombre`) VALUES ('T-1', 'Tienda 1');

INSERT INTO `compra_tienda` (`isbn`,`cod_tienda`, `enlace`) VALUES ('ISBN1','T-1', 'https://www.amazon.es/s/ref=x_gr_w_bb_sin?tag=x_gr_w_bb_es-21&index=books&keyword=Harry+Potter+and+the+Sorcerer%27s+Stone');

INSERT INTO `genero` (`cod_genero`, `nombre`) VALUES ('G-1', 'Terror'), ('G-2', 'Fantasia'),  ('G-3', 'Ciencia Ficción');

INSERT INTO editorial VALUES ("CIF-1","Editorial 1", "678712459","Sevilla","Dos Hermanas");

/* Fin INSERTS obligatorios */


INSERT INTO libro_genero
(cod_genero, isbn)
VALUES('G-1', 'ISBN1');

INSERT INTO libro_genero
(cod_genero, isbn)
VALUES('G-2', 'ISBN1');

INSERT INTO libro_genero
(cod_genero, isbn)
VALUES('G-3', 'ISBN2');

INSERT INTO `libro_editorial` (`isbn`,`cif`) VALUES ('ISBN1','CIF-1');

INSERT INTO `lista` (`id_lista`,`email`, `alias_user`, `nombre_lista`, `fecha_creacion`) VALUES ('L-1','manu@gmail.com' ,'manusito21', 'Lista 1', CURDATE());

INSERT INTO `lista` (`id_lista`,`email`, `alias_user`, `nombre_lista`, `fecha_creacion`) VALUES ('L-2','manu@gmail.com' ,'manusito21', 'Lista 2', CURDATE());

INSERT INTO `lista_creada` (`alias`, `email`, `id_lista`) VALUES ('manusito21', 'manu@gmail.com', 'L-1'), ('pepe', 'manu2@gmail.com', 'L-2');
INSERT INTO `lista_creada` (`alias`, `email`, `id_lista`) VALUES ('manusito21', 'manu@gmail.com', 'L-2');

INSERT INTO `libro_almacenado` (`cod_almacenado`, `id_lista`, `isbn`, `fecha_adicion`) VALUES (NULL, 'L-1', 'ISBN1', '2022-01-17'), (NULL, 'L-1', 'ISBN1', '2022-01-17');

/* El alias del usuario debería venir de Sesión */
INSERT INTO `reseña` (`id_reseña`, `isbn`, `email`, `alias_user`, `puntuacion`, `opinion`, `fecha`) VALUES ('res1', 'ISBN1', 'manu@gmail.com', 'manusito21', '5', 'Mierda de libro', CURDATE());