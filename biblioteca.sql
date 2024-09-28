CREATE TABLE IF NOT EXISTS libros(
    ISBN VARCHAR PRIMARY KEY,
    titulo VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS autores(
    autor_id INT PRIMARY KEY,
    nombre VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS categoria(
    categoria_id INT PRIMARY KEY,
    nombre VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS lectores(
    lector_id INT PRIMARY KEY,
    nombre VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS prestamos(
    prestamos_id INT PRIMARY KEY,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion_esperada DATE NOT NULL,
    ISBN VARCHAR REFERENCES libros(ISBN) ON DELETE CASCADE,
    lector_id INT REFERENCES lectores(lector_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS autores_libros(
    autor_id INT REFERENCES autores(autor_id) ON DELETE CASCADE,
    ISBN VARCHAR REFERENCES libros(ISBN) ON DELETE CASCADE,
    PRIMARY KEY (autor_id ,ISBN)
);

CREATE TABLE IF NOT EXISTS libros_categoria(
    ISBN VARCHAR REFERENCES libros(ISBN) ON DELETE CASCADE,
    categoria_id INT REFERENCES categoria(categoria_id) ON DELETE CASCADE,
    PRIMARY KEY( ISBN, categoria_id)
)

-- Insertar datos en la tabla 'autores'
INSERT INTO autores (autor_id, nombre) VALUES (1, 'Gabriel García Márquez');
INSERT INTO autores (autor_id, nombre) VALUES (2, 'J.K. Rowling');
INSERT INTO autores (autor_id, nombre) VALUES (3, 'J.R.R. Tolkien');
select * from autores

-- Insertar datos en la tabla 'categoria'
INSERT INTO categoria (categoria_id, nombre) VALUES (1, 'Ficción');
INSERT INTO categoria (categoria_id, nombre) VALUES (2, 'Fantástico');
INSERT INTO categoria (categoria_id, nombre) VALUES (3, 'No Ficción');
select * from categoria

-- Insertar datos en la tabla 'libros'
INSERT INTO libros (ISBN, titulo) VALUES ('978-3-16-148410-0', 'Cien años de soledad');
INSERT INTO libros (ISBN, titulo) VALUES ('978-0-545-01022-1', 'Harry Potter y la piedra filosofal');
INSERT INTO libros (ISBN, titulo) VALUES ('978-0-261-10221-5', 'El señor de los anillos');
select * from libros

-- Insertar datos en la tabla 'lectores'
INSERT INTO lectores (lector_id, nombre) VALUES (1, 'Juan Pérez');
INSERT INTO lectores (lector_id, nombre) VALUES (2, 'Ana Gómez');
INSERT INTO lectores (lector_id, nombre) VALUES (3, 'Carlos López');
select * from lectores

-- Insertar datos en la tabla 'prestamos'
INSERT INTO prestamos (prestamos_id, fecha_prestamo, fecha_devolucion_esperada, ISBN, lector_id) 
VALUES (1, '2023-09-01', '2023-09-15', '978-3-16-148410-0', 1);
INSERT INTO prestamos (prestamos_id, fecha_prestamo, fecha_devolucion_esperada, ISBN, lector_id) 
VALUES (2, '2023-09-05', '2023-09-20', '978-0-545-01022-1', 2);
select * from prestamos

-- Insertar datos en la tabla 'autores_libros'
INSERT INTO autores_libros (autor_id, ISBN) VALUES (1, '978-3-16-148410-0');
INSERT INTO autores_libros (autor_id, ISBN) VALUES (2, '978-0-545-01022-1');
INSERT INTO autores_libros (autor_id, ISBN) VALUES (3, '978-0-261-10221-5');
select * from autores_libros

-- Insertar datos en la tabla 'libros_categoria'
INSERT INTO libros_categoria (ISBN, categoria_id) VALUES ('978-3-16-148410-0', 1);
INSERT INTO libros_categoria (ISBN, categoria_id) VALUES ('978-0-545-01022-1', 2);
INSERT INTO libros_categoria (ISBN, categoria_id) VALUES ('978-0-261-10221-5', 1);
select * from libros_categoria