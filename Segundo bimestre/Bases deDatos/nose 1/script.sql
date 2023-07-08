/*Crear una vista con los siguientes datos de los clientes: ID, contacto, y el
Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
ejemplo: “TEL: (01) 123-4567”.*/
create view consulta1 as 
select ClienteID, Contacto, Fax,
case 
	when Fax = "" then concat("TEL: ", Telefono)
    else Fax 
end as tel
from clientes;
	
/*Se necesita listar los números de teléfono de los clientes que no tengan
fax. Hacerlo de dos formas distintas:
a. Consultando la tabla de clientes.
b. Consultando la vista de clientes*/

select ClienteID, Contacto, Telefono from clientes
where Fax = "" ;

select ClienteID, Contacto, tel from consulta1
where Fax = "";

/*Crear una vista con los siguientes datos de los proveedores: ID,
contacto, compañía y dirección. Para la dirección tomar la dirección,
ciudad, código postal y país.*/
create view vista_proveedores as
select ProveedorID, Contacto, Compania, concat(Direccion," ",Ciudad," ",CodigoPostal," ",Pais) as Direccion from proveedores;

/*Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo
de dos formas distintas:
a. Consultando la tabla de proveedores.
b. Consultando la vista de proveedores.*/

select Contacto, Compania  from proveedores
where Pais like "brazil" and Direccion like "%Americanas%";

select Contacto, Compania  from vista_proveedores
where Direccion like "%Americanas%";

/*Crear una vista de productos que se usará para control de stock. Incluir el ID
y nombre del producto, el precio unitario redondeado sin decimales, las
unidades en stock y las unidades pedidas. Incluir además una nueva
columna PRIORIDAD con los siguientes valores:
■ BAJA: si las unidades pedidas son cero.
■ MEDIA: si las unidades pedidas son menores que las unidades
en stock.
■ URGENTE: si las unidades pedidas no duplican el número de
unidades.
■ SUPER URGENTE: si las unidades pedidas duplican el número
de unidades en caso contrario.*/
create view vista_prioridad as
select ProductoID, ProductoNombre, round(PrecioUnitario,0) as PrecioUnitario, UnidadesStock, UnidadesPedidas,
case 
	when UnidadesPedidas like 0 then "BAJA"
    when UnidadesPedidas < UnidadesStock then "MEDIA"
    when (2*UnidadesPedidas) < UnidadesStock then "URGENTE"
    when (2*UnidadesPedidas) > UnidadesStock then "SUPERURGENTE"
end as Prioridad
from Productos;

/*Se necesita un reporte de productos para identificar problemas de stock.
Para cada prioridad indicar cuántos productos hay y su precio promedio.
No incluir las prioridades para las que haya menos de 5 productos.*/


