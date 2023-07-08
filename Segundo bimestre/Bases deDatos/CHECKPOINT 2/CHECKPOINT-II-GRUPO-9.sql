/*Grupo 9:
Natalia Giraldo
Johan Posso
Michelle Buvoli
María Celi*/

/*Punto 1*/
SELECT id AS "Numero de huesped", apellido, nombre FROM huesped
WHERE nombre LIKE "s%";

/*Punto 2*/
SELECT legajo FROM empleado
WHERE domicilio = "Av. Rosalind Franklin 600";

/*Punto 3*/
SELECT MAX(importe) AS "mayor importe" FROM reserva;

/*Punto 4*/
SELECT * FROM reserva
WHERE id in (15,19,21,35);

/*Punto 5 */
SELECT habitacion_numero AS "Numero de habitacion", SUM(importe) AS "importe total" FROM checkin
WHERE habitacion_numero = 40;

/*Punto 6*/
SELECT fecha_nacimiento AS "fecha de nacimiento" FROM empleado
WHERE sector_id != 3 AND (fecha_nacimiento > "1989-07-03" OR fecha_nacimiento = "1986-11-07");

/*Punto 7*/
SELECT * FROM reserva
WHERE importe BETWEEN 10499.50 AND 12000.00
ORDER BY importe DESC;

/*Punto 8*/
SELECT * FROM checkin
ORDER BY importe ASC 
LIMIT 1
OFFSET 4;

/*Punto 9*/

SELECT id AS "Numero de check-in", fecha_entrada AS "Fecha de entrada", importe AS "mayor importe" FROM checkin
ORDER BY importe DESC
LIMIT 1;

/*Punto 10*/
SELECT id AS "Numero de reserva", importe, servicio_extra_id AS "Numero de servicio" FROM reserva
ORDER BY importe ASC 
LIMIT 10;

/*Punto 11*/
SELECT * FROM reserva 
WHERE fecha BETWEEN "2021-07-14" AND "2021-08-15"
ORDER BY fecha;

/* Punto 12*/
SELECT * FROM checkin
WHERE importe >= 34125.00 AND fecha_salida < '2020-06-26'
ORDER BY id;

/*Punto 13*/
SELECT legajo, apellido, nombre, telefono_movil AS "telefono movil" FROM empleado
WHERE nombre LIKE "%ia";

/*Punto 14*/ 
SELECT AVG(importe) AS "Promedio reservas" FROM reserva
WHERE forma_pago_id = 1; /*el ID de efectivo es el 1*/

/*Punto 15*/
SELECT * FROM checkin
WHERE forma_pago_id = 3
ORDER BY importe DESC
LIMIT 1
OFFSET 2;

/*Punto 16*/
SELECT habitacion_numero AS "Habitacion", COUNT(id) AS "Cantidad" FROM checkin
WHERE habitacion_numero = 7;

/*Punto 17*/
SELECT * FROM huesped
WHERE domicilio LIKE "__n__";

/*Punto 18*/
SET SQL_SAFE_UPDATES = 0;
UPDATE decoracion
SET nombre = "Romana"
WHERE nombre = "Italiana";

/*Punto 19*/
INSERT INTO huesped(id, apellido, nombre, pasaporte, fecha_nacimiento, domicilio, pais_id, telefono_movil, email)
VALUES (DEFAULT, "Palermo Diaz", "Ricardo Omar", 28001555, "1980-01-05", "calle Av. Sarmiento 752 este", 1, "+542645667714", "pal1980sj@gmail.com");

/*Punto 20*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM servicio_basico
WHERE id = 5;