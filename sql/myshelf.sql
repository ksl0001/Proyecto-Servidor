DROP DATABASE IF EXISTS myshelf;

CREATE DATABASE myshelf;

USE myshelf;

CREATE TABLE usuario( -- TODO: índices con usuario para con listas?
    email VARCHAR(35) UNIQUE CHECK (email <> ''), -- max 15 caracteres? controlar en cliente
    alias VARCHAR(15) UNIQUE CHECK (alias <> ''), -- controlar hash caracteres password
    password VARCHAR(256) NOT NULL CHECK (password <> ''),
    nombre VARCHAR(20) NOT NULL CHECK (password <> ''), -- nom, ape controlar en cliente
    apellidos VARCHAR(30),
    biografia VARCHAR(650),
    PRIMARY KEY (email,alias)
);

ALTER TABLE `usuario` ADD INDEX(`alias`);

CREATE TABLE lista(
    id_lista VARCHAR(20),
    email VARCHAR(35) NOT NULL,
    alias_user VARCHAR(15) NOT NULL,
    nombre_lista VARCHAR(20) NOT NULL,
    fecha_creacion DATE NOT NULL,
    PRIMARY KEY (id_lista),
    FOREIGN KEY (alias_user)
        REFERENCES usuario(alias)
        ON DELETE CASCADE
);

CREATE TABLE genero(
  cod_genero varchar(10) NOT NULL,
  nombre varchar(25) NOT NULL,
  PRIMARY KEY (cod_genero)
);

CREATE TABLE editorial(
    cif VARCHAR(15),
    nombre VARCHAR(20),
    telefono VARCHAR(9),
    provincia VARCHAR(15),
    poblacion VARCHAR(15),
    PRIMARY KEY(cif)
);

CREATE TABLE libro(
    isbn VARCHAR(13) UNIQUE CHECK (isbn <> ''),
    titulo VARCHAR(30) NOT NULL UNIQUE CHECK (titulo <> ''),
    autor VARCHAR(50),
    portada LONGBLOB,
    descripcion VARCHAR(500),
    f_publicacion DATE,
    PRIMARY KEY (isbn)
);

/* Relaciona libro con editorial, la clave primaria es autoincremental (se omite en el insert) */
CREATE TABLE libro_editorial(
    cod INT AUTO_INCREMENT,
    isbn VARCHAR(13) NOT NULL,
    cif VARCHAR(15) NOT NULL,
    PRIMARY KEY (cod),
    FOREIGN KEY (isbn)
        REFERENCES libro(isbn),
    FOREIGN KEY (cif)
        REFERENCES editorial(cif)
);

/* Contiene la relación de cod_genero - ISBN */
CREATE TABLE libro_genero(
  cod int(11) AUTO_INCREMENT,
  cod_genero VARCHAR(10) NOT NULL,
  isbn VARCHAR(13) NOT NULL CHECK (isbn <> ''),
  PRIMARY KEY (cod),
  FOREIGN KEY (cod_genero) 
    REFERENCES genero(cod_genero) ON DELETE CASCADE,
  FOREIGN KEY (isbn) 
    REFERENCES libro(isbn) ON DELETE CASCADE
);

/* Tabla que contiene las reseñas de todos los usuarios en un determinado libro */
CREATE TABLE reseña(
    id_reseña VARCHAR(20),
    isbn VARCHAR(13) NOT NULL CHECK (isbn <> ''),
    email VARCHAR(35) NOT NULL CHECK (email <> ''),
    alias_user VARCHAR(15) NOT NULL CHECK (alias_user <> ''),
    puntuacion DECIMAL(10.2),
    opinion VARCHAR(600),
    fecha DATE,
    PRIMARY KEY(id_reseña),
    CONSTRAINT fk_email FOREIGN KEY(email)
        REFERENCES usuario(email)
        ON DELETE CASCADE,
    FOREIGN KEY (isbn)
        REFERENCES libro(isbn)
        ON DELETE CASCADE,
    CONSTRAINT fk_alias FOREIGN KEY (alias_user)
        REFERENCES usuario(alias)
        ON DELETE CASCADE
);
/* Tabla que contiene tanto el código de una tienda, como en nombre que la identifica*/
CREATE TABLE tienda(
    cod_tienda VARCHAR(20) CHECK (cod_tienda <> ''),
    nombre VARCHAR(20) CHECK (nombre <> ''),
    PRIMARY KEY (cod_tienda, nombre)
);
/* Tabla que relaciona las tiendas con los libros, y contiene los enlaces para cada ISBN-Tienda*/
CREATE TABLE compra_tienda(
    cod INT AUTO_INCREMENT,
    isbn VARCHAR(13) NOT NULL,
    cod_tienda VARCHAR(20) NOT NULL,
    enlace VARCHAR(200) NOT NULL,
    PRIMARY KEY (cod),
        FOREIGN KEY (isbn)
        REFERENCES libro(isbn),
    FOREIGN KEY (cod_tienda)
        REFERENCES tienda(cod_tienda)
);

/* Tabla que relaciona cada lista con el usuario que la ha creado */
CREATE TABLE lista_creada(
    alias VARCHAR(15) CHECK (alias <> ''),
    email VARCHAR(35) CHECK (email <> ''),
    id_lista VARCHAR(20),
    PRIMARY KEY (alias,email,id_lista),
    FOREIGN KEY (id_lista)
        REFERENCES lista(id_lista)
        ON DELETE CASCADE
);
/* Tabla que relaciona cada libro almacenado en una determinada lista */ 
CREATE TABLE libro_almacenado(
    cod_almacenado INT AUTO_INCREMENT,
    id_lista VARCHAR(20) CHECK (id_lista <> ''),
    isbn VARCHAR(13),
    fecha_adicion DATE,
    PRIMARY KEY(cod_almacenado),
    FOREIGN KEY (id_lista)
        REFERENCES lista(id_lista)
        ON DELETE CASCADE,
    FOREIGN KEY (isbn)
        REFERENCES libro(isbn)
);
