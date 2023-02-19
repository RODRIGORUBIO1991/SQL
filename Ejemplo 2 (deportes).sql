---Aquí te presento cuatro tablas diferentes relacionadas con datos deportivos, junto con una columna que las relaciona

CREATE TABLE Equipos (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  fundacion DATE NOT NULL,
  ciudad VARCHAR(50) NOT NULL
);

INSERT INTO Equipos (id, nombre, fundacion, ciudad) VALUES
(1, 'FC Barcelona', '1899-11-29', 'Barcelona'),
(2, 'Juventus FC', '1897-11-01', 'Turin'),
(3, 'Paris Saint-Germain', '1970-08-12', 'Paris'),
(4, 'Manchester City FC', '1880-04-16', 'Manchester'),
(5, 'Liverpool FC', '1892-06-03', 'Liverpool');

CREATE TABLE Jugadores (
  id INT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  edad INT NOT NULL,
  equipo_id INT NOT NULL,
  FOREIGN KEY (equipo_id) REFERENCES Equipos(id)
);

INSERT INTO Jugadores (id, nombre, edad, equipo_id) VALUES
(1, 'Lionel Messi', 34, 1),
(2, 'Cristiano Ronaldo', 37, 2),
(3, 'Neymar Jr.', 29, 1),
(4, 'Kylian Mbappé', 23, 3),
(5, 'Kevin De Bruyne', 30, 4),
(6, 'Mohamed Salah', 29, 5);

CREATE TABLE Partidos (
  id INT PRIMARY KEY,
  fecha DATE NOT NULL,
  equipo_local_id INT NOT NULL,
  equipo_visitante_id INT NOT NULL,
  resultado_local INT NOT NULL,
  resultado_visitante INT NOT NULL,
  FOREIGN KEY (equipo_local_id) REFERENCES Equipos(id),
  FOREIGN KEY (equipo_visitante_id) REFERENCES Equipos(id)
);

INSERT INTO Partidos (id, fecha, equipo_local_id, equipo_visitante_id, resultado_local, resultado_visitante) VALUES
(1, '2022-01-01', 1, 2, 2, 1),
(2, '2022-02-01', 3, 4, 3, 0),
(3, '2022-02-14', 5, 1, 1, 1),
(4, '2022-03-05', 2, 4, 0, 2);

CREATE TABLE Goles (
  id INT PRIMARY KEY,
  jugador_id INT NOT NULL,
  partido_id INT NOT NULL,
  minuto INT NOT NULL,
  FOREIGN KEY (jugador_id) REFERENCES Jugadores(id),
  FOREIGN KEY (partido_id) REFERENCES Partidos(id)
);

INSERT INTO Goles (id, jugador_id, partido_id, minuto) VALUES
(1, 1, 1, 23),
(2, 2, 1, 65),
(3, 1, 2, 10),
(4, 3, 2, 40),
(5, 6, 3, 30),
(6, 1, 3, 60),
(7, 4, 4, 20),
(8, 5, 4, 85);


---Por ejemplo, si deseas mostrar los goles que ha marcado cada jugador, puedes ejecutar la siguiente consulta

SELECT Jugadores.nombre AS Jugador, Equipos.nombre AS Equipo, Partidos.fecha, Goles.minuto
FROM Jugadores
INNER JOIN Equipos ON Jugadores.equipo_id = Equipos.id
INNER JOIN Goles ON Jugadores.id = Goles.jugador_id
INNER JOIN Partidos ON Goles.partido_id = Partidos.id;





