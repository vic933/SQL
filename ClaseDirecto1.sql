/*CREACIÓN DE TABLAS*/
CREATE TABLE Alumnos(
	id SERIAL PRIMARY KEY,
	nombre_alumno  VARCHAR (50),
	apellidos VARCHAR (50)
)
CREATE TABLE Cursos(
	id SERIAL PRIMARY KEY,
	nombre_curso  VARCHAR (50),
	duracion_semanas INTEGER,
	fecha_inicio DATE /*formato de fecha yyyy-mm-dd*/
);

CREATE TABLE Inscripciones(
	id SERIAL PRIMARY KEY,
	id_alumno INTEGER REFERENCES Alumnos(id),
	id_curso INTEGER REFERENCES Cursos(id)
	);

CREATE TABLE Participaciones(
	id SERIAL PRIMARY KEY,
	id_alumno INTEGER REFERENCES Alumnos(id),
	id_curso INTEGER REFERENCES Cursos(id),
	tipo VARCHAR (20) CHECK (tipo IN('Foro','Clase','Tareas')),
	fecha DATE
	)
ALTER TABLE Inscripciones
ADD COLUMN fecha DATE

/*Añado los valores*/

INSERT INTO Alumnos (nombre_alumno, apellidos)
VALUES
('Juan', 'Perez'),
('Maria', 'Gonzalez');

INSERT INTO Cursos (nombre_curso, duracion_semanas, fecha_inicio) 
VALUES
('Python', 12, '2023-01-15'),
('5QL', 8, '2023-02-01');

INSERT INTO Inscripciones (id_alumno, id_curso, fecha) 
VALUES
(5, 1, '2023-01-20'),
(6, 1, '2023-01-22');

INSERT INTO Participaciones (id_alumno, id_curso, tipo, fecha) 
VALUES
(5, 1, 'Foro', '2023-01-21'),
(6, 1, 'Clase', '2023-01-25');

/*Quieo investigar al alumno Juan Perez, que está accesible desde la tabla alumnos. Tiene el id 5* CONSULTA 1*/
SELECT alumnos.nombre_alumno , alumnos.apellidos, cursos.nombre_curso, inscripciones.fecha as fecha_inicio, participaciones.fecha as fecha_participacion, participaciones.tipo
FROM alumnos
INNER JOIN inscripciones ON alumnos.id = inscripciones.id_alumno
INNER JOIN participaciones ON alumnos.id = participaciones.id_alumno
INNER JOIN cursos ON cursos.id = participaciones.id_curso
WHERE alumnos.nombre_alumno = 'Juan' AND alumnos.apellidos = 'Perez'