/*  Listar todos los huespesdes cuyo nombre empiece con la letra "S" 
mostrando el id como "numero de huesped", apellido y nombre  */
SELECT id AS "Numero de huesped" , apellido, nombre FROM huesped
WHERE nombre LIKE "s%";

/*Mostrar el numero de legajo del empleado cuyo domiciolo "Av. Rosalind Franklin 600"   */
SELECT legajo FROM empleado
WHERE domicilio = "Av. Rosalind Franklin 600";

/*se requiere saber cual es el mayor importe registrado en las reservas    */ 
SELECT MAX(importe) AS "Mayor importe" FROM reserva;

/* Listar las reservas ralizada con numero 15,19,21,35   */ 
SELECT * FROM reserva
WHERE id ="15" OR id = "19" OR id = "21" OR id = "35";

/* Calcular el importe total recaudado para la habitacion numero 40. el reporte debe
tener dos columnas deniminadas "numero de habitacion" e "importe total"   */ 
SELECT habitacion_numero AS "Numero de habitacion", SUM(importe) AS "Importe total" FROM checkin
WHERE habitacion_numero = 40;

/* Listar de manera ordenada (fecha de nacimiento), los empleados que no pertenezcan al sector 3 
y que la fecha de nacimiento sea mayor que 3/9/1989/ o igual a 7/11/1986*/
SELECT * FROM empleado
WHERE sector_id != 3 AND (fecha_nacimiento > '1989-09-03' OR fecha_nacimiento = '1986-11-07')
ORDER BY legajo DESC;

/* Listar los importes de las reservas con valor entre $10499.50 a $12000.00
 (ordenados por el importe de mayor a menor) */
 SELECT importe FROM reserva
 WHERE importe BETWEEN 10499.50  AND 12000.00
 ORDER BY importe DESC;
 
 /* Mostrar el quinto importe del check-in realizado con menor valor  */
 SELECT importe FROM checkin
 ORDER BY importe ASC
 LIMIT 1
 OFFSET 4;
 
 /* Mostrar el check-in con mayor importe. este reporte debe contener
 el numero del check-in fecha de entrada y el importe*/
 SELECT id AS "Numero de check-in", fecha_entrada AS "Fecha de entrada", MAX(importe) as importe  FROM checkin;
 
 /* mostrar las 10 reservas con menor importe. este reporte debe 
 contener el numero de reserva, importe y el numero del servicio*/
 
 SELECT id AS "Numero de reserva", importe, servicio_extra_id AS "Numero del servicio" FROM reserva
 ORDER BY importe ASC 
 LIMIT 10;
 
 /*Listar las reservas regiustrada entre 14/07/2021 y 15/08/2021 ordenados por fecha*/
 SELECT * FROM reserva
 WHERE fecha BETWEEN '2021-07-14' AND '2021-08-15'
 ORDER BY fecha;
 
 /*Listar en forma ordenada los check-in que tengan un importe superior o igual a $34215
 y con fecha de salida inferior a 26/06/2020*/
 SELECT * FROM checkin
 WHERE importe >= 34125 AND fecha_salida < '2020-6-26'
 ORDER BY id;
 
 /*Listar todos los empleados cuyo nombre termine con los "ia"
 se debe mostrar el legajo, apellido, nombre, telefono movil */
 SELECT legajo, apellido, nombre, telefono_movil AS "telefono movil" FROM empleado
 WHERE nombre LIKE "%ia";
 
 /* se desea conocer cual es el importe promedio de las reservas que se hayan pagado en efectivo*/
 SELECT AVG(importe) AS "importe promedio" FROM  reserva 
 WHERE forma_pago_id = 1;
 
 /* mostrar el tercer check-in con mayor importe pagado con tarjeta de credito*/
 SELECT * FROM checkin
 WHERE forma_pago_id = 3
 ORDER BY importe DESC
 LIMIT 1
 OFFSET 2;
 
 /*calcular la cantidad de check in que tiene la habitacion numero siete,
 el reporte debe tener dos columnas denominada "habitacion" y "cantidad"*/
 SELECT habitacion_numero AS "habitacion", COUNT(id) AS "cantidad" FROM checkin
 WHERE habitacion_numero = 7;
 
 /* mostrar todos los domicilios de los huespedes que contengan una palabra de
 cinco caracteres pero el tercer caracter debe ser igual a "n"*/
 SELECT domicilio FROM huesped
 WHERE CONTAINS (domicilio, "__n__" ) ;
 
 /*Modificar el tipo de decoracion italiana por romana*/
 UPDATE decoracion
 SET nombre = "Romana"
 WHERE id = 3;
  SELECT 
 /*Agregar al huesped Palermo Diaz Ricardo Omar cuyo pasaporte es 28001555 y fecha de nacimiento 5/1/1980 domiciliado en 
 calle Av. Sarmiento 752 este - Argentina, telefono movil +542645667714 y el correo electronico es pal1980sj@gmail.com */
INSERT INTO huesped (id, apellido, nombre, pasaporte, fecha_nacimiento, domicilio, pais_id, telefono_movil, email)
VALUES(DEFAULT, 'Palermo Diaz','Ricardo Omar',28001555,'1980-01-05','calle Av. Sarmiento 752 este', 1, '+542645667714','pal1980sj@gmail.com');

/*Eliminar el registro del servicio basico numero 5*/
DELETE FROM servicio_basico WHERE id=5;

 
 