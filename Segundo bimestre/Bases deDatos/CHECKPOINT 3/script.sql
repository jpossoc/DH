/*checkpoint 3 
Grupo 14
Johan Sebastian Posso Castaño
Ximena Sastoque
Natalia Giraldo

/*1. Listar los servicios básicos de la habitación número 25*/
select habitacion.numero as numero_habitacion, servicio_basico.nombre as servicio from habitacion
join habitacion_x_servicio_basico
on habitacion.numero= habitacion_x_servicio_basico.habitacion_numero
join servicio_basico
on habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
where habitacion.numero = 25;
/*4 registros*/

/*2. Listar absolutamente todos los servicios básicos y la cantidad de habitaciones en
las que están instalados. Mostrar sólo el nombre del servicio básico y cantidad.*/
select servicio_basico.nombre as servicio, count(habitacion.numero) as cantidad_de_habitaciones from habitacion
join habitacion_x_servicio_basico
on habitacion.numero= habitacion_x_servicio_basico.habitacion_numero
join servicio_basico
on habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
group by servicio_basico.nombre;
/*10 registros*/

/*3. Listar todos los huéspedes que tengan tres o más check-in. Mostrar el número
de huésped, apellido y nombre separado por un espacio dentro de una misma
columna denominada "Cliente" y, la cantidad de check-in que posee.*/
select concat(huesped.id, " " ,huesped.apellido , " " , huesped.nombre) as cliente, count(checkin.huesped_id) as cantidad_checkin from huesped
join checkin
on huesped.id = checkin.huesped_id
group by checkin.huesped_id 
having cantidad_checkin >= 3;
/*23 registro*/

/*4. Listar todos los huéspedes que no tengan un check-in. Mostrar el número de
huésped, apellido y nombre en mayúsculas dentro de una misma columna
denominada "huésped sin check-in".*/
select upper(concat(huesped.id, " " ,huesped.apellido , " " , huesped.nombre)) as "huésped sin check-in" from huesped
left join checkin
on huesped.id = checkin.huesped_id
where checkin.huesped_id is null;
/*18 registro*/

/*5. Listar todos los huéspedes que tengan al menos un check-in que corresponda a
la habitación de clase 'Classic'. Se debe mostrar el número de huésped, apellido,
nombre, número de habitación y la clase.*/
select huesped.id as numero_huesped, huesped.apellido as apellido, huesped.nombre as nombre, habitacion.numero as numero_habitacion, clase.nombre as clase from huesped
join checkin
on huesped.id = checkin.huesped_id
join habitacion
on checkin.habitacion_numero = habitacion.numero
join clase
on habitacion.clase_id = clase.id
where clase.nombre = "classic";
/* 47 registros */

/*6. Listar los huéspedes que tengan una o más reservas y que en la segunda letra de
su apellido contenga una "u". Se debe mostrar el número de huésped, apellido,
nombre, nombre del servicio.*/
select huesped.id as numero_huesped, huesped.apellido as apellido, huesped.nombre as nombre, servicio_extra.nombre as nombre_servicio from huesped
join reserva
on huesped.id = reserva.huesped_id
join servicio_extra
on reserva.servicio_extra_id = servicio_extra.id
where huesped.apellido like "_u%";
/*10 registros*/

/*7. Listar absolutamente todos los países y la cantidad de huéspedes que tengan.*/
select pais.id, pais.nombre as pais, count(huesped.pais_id) as cantidad_huespedes from huesped
right join pais
on huesped.pais_id = pais.id
group by pais.nombre;
/*20 registros*/

/*8. Calcular el importe total y la cantidad de reservas realizadas en el mes de marzo
por cada huésped. Mostrar el apellido del huésped, importe total y cantidad de
reservas.*/
select huesped.apellido as apellido, sum(reserva.importe) as importe_total, count(huesped.id) as cantidad_reserva from reserva
join huesped
on reserva.huesped_id = huesped.id
where extract(month from reserva.fecha) = "03"
group by huesped.id;
/*9 registros*/

/*9. Calcular el importe total recaudado por mes (fecha de entrada) para la
habitación número 22. Mostrar el número de habitación, nombre de la
decoración, clase, nombre del mes y el importe total.*/
set lc_time_names = "es_ES";
select habitacion.numero as numero_habitacion, decoracion.nombre as decoracion, clase.nombre as clase, date_format(checkin.fecha_entrada, "%M") as mes, sum(checkin.importe) as importe_total from habitacion 
join clase 
on habitacion.clase_id = clase.id
join checkin
on checkin.habitacion_numero = habitacion.numero
join decoracion
on habitacion.decoracion_id = decoracion.id
where habitacion.numero = 22
group by extract(month from checkin.fecha_entrada);
/*3 registros*/

/*10. Determinar la recaudación total por país para las habitaciones número 5, 10 y
22. Mostrar nombre del país, número de habitación y el total recaudado.*/
select pais.nombre as pais, habitacion_numero, round(sum(importe)) as total_recaudado from checkin
join huesped 
on huesped.id = checkin.huesped_id
join pais 
on pais.id = huesped.pais_id
where habitacion_numero in (5,10,22)
group by pais.nombre, habitacion_numero;
/*8 registros*/

/*11. Calcular la recaudación total de cada forma de pago para las reservas. Mostrar la
forma de pago y el total.*/
select forma_pago.nombre as forma_pago, round(sum(importe),0) as total from forma_pago
join reserva
on forma_pago.id = reserva.forma_pago_id
group by forma_pago.id;
/*4 registros*/

/*12. Listar los empleados del sector 'administración' que su país de origen sea
'Argentina'. Mostrar el número de legajo, apellido, la primera inicial del primer
nombre y un punto, nombre de su país de origen y el nombre del sector.*/
select empleado.legajo as legajo, empleado.apellido as apellido, concat(substring(empleado.nombre, 1, 1) , ".") as nombre, pais.nombre as pais, sector.nombre as sector from empleado
join pais
on empleado.pais_id= pais.id
join sector
on empleado.sector_id = sector.id
where sector.nombre = "administracion" and pais.nombre = "argentina";
/*3 registros*/

/*13. Listar todos los servicios básicos que tienen las habitaciones (desde la 20 hasta
la 24) y su clase. Mostrar número de habitación, clase y el nombre de los
servicios básicos. Ordenar por número de habitación y servicio*/
select habitacion.numero as numero_habitacion, clase.nombre as clase, servicio_basico.nombre as servicio_basico from habitacion
join habitacion_x_servicio_basico
on habitacion.numero = habitacion_x_servicio_basico.habitacion_numero
join servicio_basico
on habitacion_x_servicio_basico.servicio_basico_id = servicio_basico.id
join clase
on habitacion.clase_id = clase.id
where habitacion.numero between 20 and 24
order by habitacion.numero , servicio_basico.id;
/* 28 registros*/

/*14. Listar las decoraciones que no están aplicadas en ninguna habitación.*/
select decoracion.* from decoracion
left join habitacion
on decoracion.id = habitacion.decoracion_id
where habitacion.decoracion_id is null;
/* 2 registros */

/*15. Listar todos los empleados categorizándolos por edad. Las categorías son:
'junior' (hasta 35 años), 'semi-senior' (entre 36 a 40 años) y 'senior' (más de 40).
Mostrar el apellido, nombre, edad, categoría y ordenar por edad.*/
select empleado.apellido as apellido, empleado.nombre as nombre, extract(year from now())-extract(year from empleado.fecha_nacimiento) as edad,
case 
	when extract(year from now())-extract(year from empleado.fecha_nacimiento) <= 35 then "junior"
	when extract(year from now())-extract(year from empleado.fecha_nacimiento) between 36 and 40 then "semi-senior"
	else "senior"
end as  categoria
from empleado
order by edad;
/*25 registros*/

/*16. Calcular la cantidad y el promedio de cada forma de pago para los check-in.
Mostrar la forma de pago, cantidad y el promedio formateado con dos
decimale*/
select forma_pago.nombre as forma_pago, sum(checkin.importe) as cantidad, round(avg(checkin.importe),2) as promedio from checkin 
join forma_pago
on checkin.forma_pago_id = forma_pago.id
group by forma_pago.id;
/* 4 registros*/

/*17. Calcular la edad de los empleados de Argentina. Mostrar el apellido, nombre y la
edad del empleado.*/
select empleado.apellido, empleado.nombre, extract(year from now())-extract(year from empleado.fecha_nacimiento) as edad from empleado
join pais
on empleado.pais_id = pais.id
where pais.nombre = "argentina";
/*17 registros*/

/*18. Calcular el importe total para los check-in realizados por el huésped 'Mercado
Joel'. Mostrar apellido, nombre, importe total y el país de origen.*/
select concat(huesped.apellido, " ", huesped.nombre) as nombre_completo, round(sum(checkin.importe)) as importe_total, pais.nombre as pais from checkin
join huesped
on checkin.huesped_id = huesped.id
join pais
on huesped.pais_id = pais.id
group by nombre_completo
having nombre_completo = "Mercado Joel";
/*1 registro*/

/*19. Listar la forma de pago empleada por cada servicio extra. Se debe mostrar el
nombre del servicio extra, nombre de la forma de pago y calcular la cantidad y
total recaudado */
select servicio_extra.nombre as nombre_servicio ,forma_pago.nombre as forma_de_pago, count(reserva.cantidad_hora) as cantidad_horas, round(sum(reserva.importe)) as total_recaudado from reserva
join forma_pago 
on forma_pago.id = reserva.forma_pago_id
join servicio_extra 
on servicio_extra.id = reserva.servicio_extra_id
group by forma_pago.nombre, servicio_extra.nombre;
/* 16 registros*/

/*20. Listar la forma de pago empleada para el servicio extra 'Sauna' y los huéspedes
correspondientes. Se debe mostrar el nombre del servicio extra, nombre de la
forma de pago, número del cliente e importe total.*/
select  servicio_extra.nombre as servicio_extra, forma_pago.nombre as forma_pago, huesped.id as numero_huesped, round(sum(reserva.importe)) as importe_total from servicio_extra
join reserva 
on servicio_extra.id = reserva.servicio_extra_id
join huesped
on reserva.huesped_id = huesped.id
join forma_pago
on reserva.forma_pago_id = forma_pago.id
where servicio_extra.nombre = "sauna"
group by huesped.id,forma_pago.nombre;
/* 24 registros*/